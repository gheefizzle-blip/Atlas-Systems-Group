# Phase 15B — Quick Recovery Guide

**Spear Enterprise LLC — MCP Stack**  
**Document ID**: PHASE15B-QRG-001  
**Version**: 1.0 FINAL  
**Date**: 2025-11-28  
**Status**: VALIDATED ✅

---

## Purpose

This guide provides rapid recovery steps if the Phase 15B SFTP transport layer fails. Follow these steps in order until the issue is resolved.

---

## 🔥 QUICK DIAGNOSTIC

Run this first to identify the problem:

```powershell
# Check if container is running
docker ps | Select-String mcp-router-io

# Check SFTP environment variables
docker exec mcp-router-io env | Select-String SFTP

# Check if correct code is loaded
docker exec mcp-router-io grep "password=SFTP_PASSWORD" /app/sftp_utils.py

# Test SFTP endpoint
Invoke-RestMethod -Uri "http://localhost:8090/sftp/list" `
  -Method POST `
  -ContentType "application/json" `
  -Body '{"path":"/mnt/HD/HD_a2/SPEAR_MCP"}'
```

---

## 🔧 RECOVERY STEPS

### Step 1: Confirm NAS SSH Access

```powershell
ssh sshd@10.10.10.45
```

**Password**: `Lgs5551212$`

| Result | Action |
|--------|--------|
| ✅ Login succeeds | NAS is fine, proceed to Step 2 |
| ❌ Connection refused | Toggle SSH in WD UI (OFF → wait 5s → ON) |
| ❌ Password rejected | Verify you're using the WD dashboard password |

---

### Step 2: Validate Environment Variables

```powershell
docker exec mcp-router-io env | Select-String SFTP
```

**Expected Output**:
```
SFTP_USER=sshd
SFTP_PORT=22
SFTP_HOST=10.10.10.45
SFTP_PASSWORD=Lgs5551212$
SFTP_AUTH_MODE=password
```

| Problem | Fix |
|---------|-----|
| `SFTP_USER` is not `sshd` | Edit `docker-compose.yml`, set `SFTP_USER=sshd` |
| `SFTP_PASSWORD` is wrong/missing | Edit `docker-compose.yml`, set `SFTP_PASSWORD=Lgs5551212$$` |
| Password shows truncated | The `$` wasn't escaped — use `$$` in compose file |

After fixing, restart:
```powershell
docker compose down
docker compose up -d
```

---

### Step 3: Verify Correct sftp_utils.py is Running

```powershell
docker exec mcp-router-io cat /app/sftp_utils.py | Select-String password
```

**Must Show**:
```python
transport.connect(username=SFTP_USER, password=SFTP_PASSWORD)
```

**If It Shows**:
```python
transport.connect(username=SFTP_USER, pkey=key)
```
→ **Wrong file loaded!** Proceed to Step 4.

---

### Step 4: Fix Build Context and Rebuild

The correct `sftp_utils.py` must be in the Docker build context:

```powershell
# Copy correct file to build context
Copy-Item "C:\Users\Gary\Downloads\sftp_utils.py" `
          "C:\Users\Gary\MCP-Stack\build\mcp-core\app\sftp_utils.py" -Force

# Rebuild container from scratch
cd C:\Users\Gary\MCP-Stack
docker compose down
docker compose build --no-cache
docker compose up -d
```

Then verify again (Step 3).

---

### Step 5: Test SFTP Endpoint

```powershell
Invoke-RestMethod -Uri "http://localhost:8090/sftp/list" `
  -Method POST `
  -ContentType "application/json" `
  -Body '{"path":"/mnt/HD/HD_a2/SPEAR_MCP"}'
```

**Expected**:
```
status: ok
path: /mnt/HD/HD_a2/SPEAR_MCP
items: {Heber_Campus_MCP, _governance, _continuity, _incoming}
continuity_entry: CR_YYYYMMDD_HHMMSS_COMMSIO_CMD
```

---

## ⚠️ WD EX4100 GOTCHAS

Remember these firmware limitations:

| Behavior | Impact |
|----------|--------|
| WD wipes `/root/.ssh` on reboot | SSH keys are lost |
| WD wipes `/etc/ssh/sshd_config` on SSH toggle | Custom config lost |
| Only `sshd` user can authenticate via SSH/SFTP | Don't use `automation` user |
| `automation` user **CANNOT** log in via PAM | SMB/CIFS only |
| `killall sshd` kills WD wrapper | SSH breaks until UI toggle |

---

## 🔑 KEY FILES & PATHS

| File | Location | Purpose |
|------|----------|---------|
| docker-compose.yml | `C:\Users\Gary\MCP-Stack\` | Container config |
| Dockerfile | `C:\Users\Gary\MCP-Stack\build\mcp-core\` | Image definition |
| sftp_utils.py | `C:\Users\Gary\MCP-Stack\build\mcp-core\app\` | SFTP implementation |
| requirements.txt | `C:\Users\Gary\MCP-Stack\build\mcp-core\` | Python dependencies |

---

## 🚨 EMERGENCY: Complete Rebuild

If nothing else works:

```powershell
cd C:\Users\Gary\MCP-Stack

# Stop and remove everything
docker compose down -v

# Remove old images
docker rmi mcp-router-io:phase15b

# Ensure correct sftp_utils.py
Copy-Item "C:\Users\Gary\Downloads\sftp_utils.py" `
          "C:\Users\Gary\MCP-Stack\build\mcp-core\app\sftp_utils.py" -Force

# Full rebuild
docker compose build --no-cache
docker compose up -d

# Verify
docker exec mcp-router-io grep "password=SFTP_PASSWORD" /app/sftp_utils.py
```

---

## 📋 QUICK REFERENCE CARD

### Required Credentials

| Service | User | Password |
|---------|------|----------|
| NAS SSH | `sshd` | `Lgs5551212$` |
| NAS SFTP | `sshd` | `Lgs5551212$` |
| CIFS Mount | `gary_spear` | `Lgs5551212$` |

### Required Environment Variables

```yaml
SFTP_HOST=10.10.10.45
SFTP_PORT=22
SFTP_USER=sshd
SFTP_PASSWORD=Lgs5551212$$   # Note: $$ in compose file
SFTP_AUTH_MODE=password
```

### Test Commands

```powershell
# Container running?
docker ps | Select-String mcp-router-io

# Env vars correct?
docker exec mcp-router-io env | Select-String SFTP

# Right code?
docker exec mcp-router-io grep "password=SFTP_PASSWORD" /app/sftp_utils.py

# SFTP working?
Invoke-RestMethod -Uri "http://localhost:8090/sftp/list" -Method POST -ContentType "application/json" -Body '{"path":"/mnt/HD/HD_a2/SPEAR_MCP"}'
```

---

## VALIDATION RECORD

| Field | Value |
|-------|-------|
| Document Status | **VALIDATED** ✅ |
| Drafted By | Agent A (ChatGPT) |
| Validated By | Agent B (Claude) |
| Validation Date | 2025-11-28 |
| Protocol | D-AVP-001 Rev A |
| Consensus | **ACHIEVED** |

---

**END OF DOCUMENT**

**File Location**: `Z:\SPEAR_MCP\_governance\Phase15\Phase_15B_Quick_Recovery.md`
