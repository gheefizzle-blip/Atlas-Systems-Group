# n8n + NAS (Windows + Docker): What Actually Works

**Core idea:** Keep n8n's binary files on a real filesystem your host
can see. Avoid network "UNC" paths inside the container; bind‑mount a
local path the host already mounted.

------------------------------------------------------------------------

## 1) Map the NAS on the host (not inside the container)

-   On Windows, map your NAS share to a drive letter (e.g., `X:`).
-   On Linux hosts, mount the share with CIFS to a local folder (e.g.,
    `/mnt/nas`).

### Windows (PowerShell, persistent drive)

``` powershell
# Run PowerShell as Admin
$User = "NAS_USERNAME"
$Pass = "NAS_PASSWORD" | ConvertTo-SecureString -AsPlainText -Force
$Cred = New-Object System.Management.Automation.PSCredential($User,$Pass)
New-PSDrive -Name "X" -PSProvider FileSystem -Root "\\10.10.10.45\Project_Ransome" -Persist -Credential $Cred
```

> **Why:** Docker for Windows can bind‑mount `X:\…` into the container,
> but **not** `\\10.10.10.45\…` directly (UNC paths are flaky in
> containers).

------------------------------------------------------------------------

## 2) Tell n8n to use the filesystem for binaries

Add this env var so large files aren't shoved into the SQLite DB:

    N8N_DEFAULT_BINARY_DATA_MODE=filesystem

Recommended companions:

    N8N_BINARY_DATA_TTL=168           # optional: auto‑clean binaries older than 168h (7d)
    N8N_ENCRYPTION_KEY=your-long-key   # enable at-rest encryption for creds

------------------------------------------------------------------------

## 3) Bind‑mount volumes the simple way

**docker‑compose.yml**

``` yaml
version: "3.8"
services:
  n8n:
    image: n8nio/n8n:latest
    restart: unless-stopped
    environment:
      - N8N_DEFAULT_BINARY_DATA_MODE=filesystem
      - N8N_ENCRYPTION_KEY=${N8N_ENCRYPTION_KEY}
      - TZ=UTC
    ports:
      - "5678:5678"
    volumes:
      - n8n_data:/home/node/.n8n
      - X:/Emberbound:/data/Emberbound
      - X:/Stems:/data/Stems
      - X:/Exports:/data/Exports
volumes:
  n8n_data:
```

> In your workflows, read/write files under `/data/...` (which is really
> your NAS).

------------------------------------------------------------------------

## 4) Use the right node

-   **Read/Write Files from Disk** (self‑hosted only): reads/writes on
    the **machine running n8n**. Perfect once the NAS is bind‑mounted.
-   For very large assets, prefer the Files from Disk node + filesystem
    mode above.

------------------------------------------------------------------------

## When SMB is annoying: use SFTP instead

If SMB auth is stubborn (credentials caching, multi‑user quirks): -
Enable **SFTP** on your NAS (or host), create a dedicated `n8n` user. -
Use the **SFTP node** in n8n for uploads/downloads --- no container
mounts needed. - Keep creds in n8n Credentials; rotate regularly.

**Tip:** SFTP is also great end‑to‑end (e.g., ingest from one box,
deliver to another).

------------------------------------------------------------------------

## Common Gotchas (and Quick Fixes)

  ---------------------------------------------------------------------------------------------------
  Problem                        Cause                    Fix
  ------------------------------ ------------------------ -------------------------------------------
  `UNC path` in volumes          Docker can't handle it   Map to drive letter first

  Permissions error              Wrong user mapping       Ensure r/w access on NAS

  Huge DB file                   Binary mode not set      Add
                                                          `N8N_DEFAULT_BINARY_DATA_MODE=filesystem`

  Path confusion                 Using `X:\` inside       Use `/data/...` instead
                                 container                
  ---------------------------------------------------------------------------------------------------

------------------------------------------------------------------------

## Quick Test

1.  Drop a small test file on `X:\Emberbound\hello.txt`\
2.  Create workflow in n8n:
    -   **Read Binary File** → `/data/Emberbound/hello.txt`\
    -   **Write Binary File** → `/data/Exports/hello_copy.txt`\
3.  Execute workflow → verify `hello_copy.txt` exists on NAS.

------------------------------------------------------------------------

## Security & Reliability

-   Give n8n its own NAS account with least privilege.\
-   Use encrypted credentials (`N8N_ENCRYPTION_KEY`).\
-   Nightly GoodSync/rsync backups.\
-   Auto‑cleanup binaries with TTL or cron job.

------------------------------------------------------------------------
