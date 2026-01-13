# Atomic NAS-to-n8n File Transfer Framework

This document describes a simple, robust way to make large file
transfers between a NAS and n8n agents **atomic and self-healing**,
using a JSON "transaction ledger" that records each operation, verifies
checksums, and commits only when safe.

------------------------------------------------------------------------

## Why This Helps

-   **No partial writes:** Transfers complete only when fully verified.
-   **Integrity guaranteed:** Checksums ensure identical source and
    destination files.
-   **Auto-retry:** Failed transfers are re-queued automatically.
-   **Auditable:** Every operation is logged with metadata for
    traceability.

------------------------------------------------------------------------

## Ledger Format

Each entry is stored as a single line JSON record in
`/Project_Ransome/_ledger/file_ledger.jsonl`.

``` json
{"id":"2025-10-18T12:00:01Z-0001","op":"COPY","src":"\\10.10.10.45\Emberbound\Stems\track1.zip","dst":"X:\Emberbound\Stems\track1.zip","alg":"sha256","src_hash":null,"dst_hash":null,"status":"INIT","attempts":0,"created_at":"2025-10-18T12:00:01Z","updated_at":"2025-10-18T12:00:01Z","agent":"n8n-node-01","meta":{"size":null}}
```

------------------------------------------------------------------------

## n8n Flow Overview

1.  **INIT log entry**\
2.  **Transfer to temporary file** (`.partial` extension)\
3.  **Verify checksums**\
4.  **Rename atomically** (commit) or retry on failure

### Recommended Nodes

-   **Code (JS)** -- create INIT entry\
-   **Execute Command** -- perform `robocopy` or `rsync`\
-   **Code (JS)** -- compute and compare SHA256\
-   **IF Node** -- conditional rename or cleanup\
-   **Wait/Queue** -- retry with exponential backoff

------------------------------------------------------------------------

## Atomic Rename

Copy files to a temporary name first, e.g.:\
`X:\Emberbound\Stems\.partial_track1.zip`\
Then rename to finalize:\
`X:\Emberbound\Stems\track1.zip`\
Most filesystems guarantee same-volume renames are atomic.

------------------------------------------------------------------------

## Windows Commands

### Copy

``` bat
robocopy "\\10.10.10.45\Emberbound\Stems" "X:\Emberbound\Stems" "track1.zip" /Z /R:3 /W:5 /TEE /NFL /NDL
```

### Hash Verification (PowerShell)

``` powershell
$srcHash = (Get-FileHash -Path $src -Algorithm SHA256).Hash.ToLower()
$dstHash = (Get-FileHash -Path $dst -Algorithm SHA256).Hash.ToLower()
```

### Atomic Rename

``` powershell
Rename-Item -Path "X:\Emberbound\Stems\.partial_track1.zip" -NewName "track1.zip"
```

### Ledger Append

``` powershell
$line = @{ id=$id; status="COMMITTED"; src_hash=$srcHash; dst_hash=$dstHash } | ConvertTo-Json -Compress
Add-Content "X:\Project_Ransome\_ledger\file_ledger.jsonl" $line
```

------------------------------------------------------------------------

## Node.js Helper (Optional)

``` js
const fs = require('fs');
const crypto = require('crypto');
async function sha256(p){
  return new Promise((res,rej)=>{
    const h=crypto.createHash('sha256');
    const s=fs.createReadStream(p);
    s.on('data',d=>h.update(d));
    s.on('end',()=>res(h.digest('hex')));
    s.on('error',rej);
  });
}
function appendJSONL(path,obj){
  fs.appendFileSync(path, JSON.stringify(obj)+'\n');
}
```

------------------------------------------------------------------------

## Operational Policy

  Parameter         Value
  ----------------- ------------------------------------
  Max Attempts      5
  Backoff           2m → 10m → 1h → 6h → 24h
  File Size Check   Compare byte counts before hash
  Lock File         `file_ledger.lock` during writes
  Rotation          Daily JSONL rotation
  Hash Algorithm    SHA256 for masters, CRC32 optional

------------------------------------------------------------------------

## Directory Structure

    X:\Project_Ransome\_ledger\
    X:\Project_Ransome\_staging\
    X:\Project_Ransome\_quarantine\

------------------------------------------------------------------------

## Quick Setup Checklist

1.  Create ledger, staging, and quarantine folders.
2.  Deploy n8n workflow.
3.  Point all AgentKit file operations through the atomic pattern.
4.  Trigger GoodSync or downstream sync **after** commit.
