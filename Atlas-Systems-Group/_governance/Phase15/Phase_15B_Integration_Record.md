# Phase 15B — SFTP Transport Layer Integration Record

**Spear Enterprise LLC — MCP Stack Integration Program**  
**Document ID**: PHASE15B-INT-001  
**Version**: 1.0 FINAL  
**Date**: 2025-11-28  
**Status**: COMPLETE ✅

---

## Document Control

| Role | Agent | Date |
|------|-------|------|
| Drafted By | Agent A (ChatGPT) | 2025-11-28 |
| Validated By | Agent B (Claude) | 2025-11-28 |
| Protocol | D-AVP-001 Rev A | — |
| Consensus | ACHIEVED | ✅ |

---

## 1. EXECUTIVE SUMMARY

Phase 15B introduces the **SFTP Transport Layer** into the MCP Stack, enabling secure NAS file operations (`list`, `read`, `write`, `mkdir`) through the `mcp-router-io` container.

This phase encountered several critical real-world challenges due to:
- WD EX4100 NAS firmware restrictions
- Docker build context behavior
- PowerShell escape issues
- Interplay between multiple system components

After detailed debugging and iterative refinement, the SFTP subsystem is **operational and fully integrated**.

**Phase 15B is now COMPLETE**, with final validation confirmed via `/sftp/list` returning a successful directory listing and continuity entry `CR_20251128_064109_COMMSIO_CMD`.

### Key Achievements
- ✅ SFTP transport layer fully operational
- ✅ Password-based authentication implemented (WD EX4100 compliant)
- ✅ Correct `sftp_utils.py` baked into Docker image
- ✅ Environment variables properly configured
- ✅ Continuity logging generating CR codes
- ✅ Dual-agent validation complete

---

## 2. SYSTEM ARTIFACTS & REQUIRED FILE MAP

Below are all files required for Phase 15B to function correctly, including their correct locations, contents, and roles.

### 2.1 Dockerfile (Build Context Root)

**Path**:
```
C:\Users\Gary\MCP-Stack\build\mcp-core\Dockerfile
```

**Purpose**:
- Defines runtime environment for SFTP-capable MCP router
- Must copy application files from build context `./app/` into `/app/` inside image

**Critical Behavior**:
- The Dockerfile's `COPY` statements only see paths inside `build/mcp-core/`
- Files located outside this directory will **NOT** appear in the image

**Key Content**:
```dockerfile
FROM python:3.11-slim

# Install OS deps for paramiko + cryptography
RUN apt-get update && apt-get install -y --no-install-recommends \
    openssh-client \
    libssl-dev \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Install Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy application files
COPY app/ /app/

# Prepare key directory (private key bind-mounted at runtime)
RUN mkdir -p /app/keys

EXPOSE 8080

CMD ["python", "-m", "uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8080"]
```

---

### 2.2 requirements.txt

**Path**:
```
C:\Users\Gary\MCP-Stack\build\mcp-core\requirements.txt
```

**Purpose**:
Installs Python dependencies including Paramiko for SFTP.

**Required Contents** (minimum):
```
fastapi
uvicorn
paramiko
cryptography
```

---

### 2.3 sftp_utils.py (AUTHORITATIVE VERSION)

**Path (build context)**:
```
C:\Users\Gary\MCP-Stack\build\mcp-core\app\sftp_utils.py
```

**Path (runtime container)**:
```
/app/sftp_utils.py
```

**Role**:
Implements password-based SFTP authentication (WD EX4100 compliant).

**Integrity Verification**:
To verify the correct file is in place, check for this signature line:
```python
# Updated: 2025-11-28 (Session 30)
```

### ⚠️ MOST CRITICAL REQUIREMENT

This file **MUST** contain:
```python
elif SFTP_PASSWORD:
    # Password-based authentication (recommended for WD EX4100)
    transport.connect(username=SFTP_USER, password=SFTP_PASSWORD)
```

If it instead contains:
```python
transport.connect(username=SFTP_USER, pkey=key)
```
...then SFTP authentication **WILL FAIL**.

**Full Authoritative Content**:
```python
import os
import paramiko

# =============================================================================
# SFTP UTILITIES - Phase 15B (WD EX4100 Compatible)
# =============================================================================
# Updated: 2025-11-28 (Session 30)
# Changes: Added password authentication support for WD EX4100 compatibility
#          Key-based auth requires SSHD restart which WD firmware blocks
# =============================================================================

# Environment-configurable parameters
SFTP_HOST = os.getenv("SFTP_HOST", "10.10.10.45")
SFTP_PORT = int(os.getenv("SFTP_PORT", "22"))
SFTP_USER = os.getenv("SFTP_USER", "sshd")
SFTP_PASSWORD = os.getenv("SFTP_PASSWORD", "")
SFTP_KEY_PATH = os.getenv("SFTP_KEY_PATH", "/app/keys/n8n_svc_ed25519")

# Authentication mode: "password" or "key"
# Password mode is recommended for WD EX4100 due to firmware limitations
SFTP_AUTH_MODE = os.getenv("SFTP_AUTH_MODE", "password")


def sftp_connect():
    """
    Establish an SFTP connection using either password or key authentication.
    Returns: (sftp_client, transport)
    
    WD EX4100 Note: Password authentication is recommended because key-based
    auth requires SSHD config changes that get wiped on every UI SSH toggle.
    """
    transport = paramiko.Transport((SFTP_HOST, SFTP_PORT))
    
    if SFTP_AUTH_MODE == "key" and os.path.exists(SFTP_KEY_PATH):
        # Key-based authentication
        key = paramiko.Ed25519Key.from_private_key_file(SFTP_KEY_PATH)
        transport.connect(username=SFTP_USER, pkey=key)
    elif SFTP_PASSWORD:
        # Password-based authentication (recommended for WD EX4100)
        transport.connect(username=SFTP_USER, password=SFTP_PASSWORD)
    else:
        # Fallback: try key auth if no password provided
        if os.path.exists(SFTP_KEY_PATH):
            key = paramiko.Ed25519Key.from_private_key_file(SFTP_KEY_PATH)
            transport.connect(username=SFTP_USER, pkey=key)
        else:
            raise ValueError(
                "No authentication method available. "
                "Set SFTP_PASSWORD or ensure SFTP_KEY_PATH exists."
            )
    
    sftp = paramiko.SFTPClient.from_transport(transport)
    return sftp, transport


def sftp_list(path: str):
    """List directory contents at the specified NAS path."""
    sftp, transport = sftp_connect()
    try:
        return sftp.listdir(path)
    finally:
        sftp.close()
        transport.close()


def sftp_read(path: str):
    """Read a file from the NAS over SFTP. Returns file content as a string."""
    sftp, transport = sftp_connect()
    try:
        with sftp.open(path, 'r') as f:
            return f.read()
    finally:
        sftp.close()
        transport.close()


def sftp_write(path: str, content: str):
    """Write content to a file on the NAS. Creates directories if needed."""
    sftp, transport = sftp_connect()
    try:
        dirpath = os.path.dirname(path)
        try:
            sftp.stat(dirpath)
        except IOError:
            sftp.mkdir(dirpath)
        with sftp.open(path, 'w') as f:
            f.write(content)
    finally:
        sftp.close()
        transport.close()


def sftp_mkdir(path: str):
    """Create a directory on the NAS over SFTP."""
    sftp, transport = sftp_connect()
    try:
        sftp.mkdir(path)
    finally:
        sftp.close()
        transport.close()
```

---

### 2.4 main.py

**Path**:
```
C:\Users\Gary\MCP-Stack\build\mcp-core\app\main.py
```

**Role**:
Provides the FastAPI endpoints including `/sftp/list`, `/sftp/read`, `/sftp/write`, `/sftp/mkdir`.

---

### 2.5 docker-compose.yml

**Path**:
```
C:\Users\Gary\MCP-Stack\docker-compose.yml
```

**Roles**:
- Defines `mcp-router-io` container
- Sets SFTP credentials and environment variables
- Configures CIFS volume mounts

### ⚠️ CRITICAL FIELDS

```yaml
environment:
  - SFTP_HOST=10.10.10.45
  - SFTP_PORT=22
  - SFTP_USER=sshd
  - SFTP_PASSWORD=Lgs5551212$$    # the $$ escapes the $ for Docker
  - SFTP_AUTH_MODE=password
```

**Password Escaping Rule**:
- `$` must be escaped as `$$` in docker-compose.yml
- Single `$` will be interpreted as variable substitution and truncated

---

### 2.6 SSH Key Files (Not Used in Final Design)

**Paths**:
```
C:\Users\Gary\.ssh\automation_ed25519
C:\Users\Gary\.ssh\automation_ed25519.pub
```

**Documented For Reference Only**:
WD EX4100 firmware restrictions prevent key-based auth unless `sshd_config` is modified and SSHD restarted outside the WD UI. This is impossible due to firmware limitations; therefore **password authentication is used instead**.

**PowerShell Path Warning**:
The original key was named `n8n_svc_ed25519`. PowerShell interprets `\n` in paths as a newline character. We renamed to `automation_ed25519` to avoid this issue. If recreating keys, **avoid `\n` in filenames**.

---

### 2.7 CIFS Mounts

Paths configured in `docker-compose.yml` volumes section.

**Role**: Provide primary file transfer mechanism. Verified stable throughout Phase 15B.

---

## 3. AUTHENTICATION MODEL — WD EX4100 FACTS

### 3.1 Only the `sshd` User Can Authenticate via SSH/SFTP

- WD EX4100 **blocks PAM authentication** for non-admin users
- The `automation` user **cannot log in** even with correct password
- `sshd` is the **only permissible** SFTP/SSH user

**Proof**: Running `login automation` from BusyBox returns "Login incorrect" immediately after `passwd automation` succeeds. This proves PAM blocks the user, not password mismatch.

### 3.2 WD UI SSH Toggle Resets Config

When SSH is toggled in the WD web interface:
- `/root/.ssh/authorized_keys` is **wiped**
- `/etc/ssh/sshd_config` is **reverted to defaults**
- Any custom `AllowUsers` entries are **lost**

### 3.3 Manual SSHD Restart is Impossible

- `killall sshd` kills the WD wrapper process
- SSHD cannot be restarted from command line
- Only the WD UI can reliably start/restart SSH service

### 3.4 Key-Based Authentication is Incompatible

- WD blocks key-auth unless config is modified AND restarted manually
- Manual restart of sshd is impossible (see 3.3)
- Therefore **password authentication is REQUIRED**

### 3.5 Non-Admin Users Are SMB/CIFS Only

- Users created via WD UI (like `automation`) can access SMB shares
- They **cannot** authenticate via SSH or SFTP
- This is a firmware-level restriction, not a configuration issue

---

## 4. FINAL SFTP IMPLEMENTATION

### 4.1 Implementation Highlights

- Uses **Paramiko** for SFTP transport
- Connects using **password authentication**
- Fallback to key-auth only if password is not provided
- Automatically handles WD EX4100 firmware quirks

### 4.2 Required Runtime Environment Variables

```bash
SFTP_HOST=10.10.10.45
SFTP_PORT=22
SFTP_USER=sshd
SFTP_PASSWORD=Lgs5551212$
SFTP_AUTH_MODE=password
```

### 4.3 Authentication Flow

```
1. Check SFTP_AUTH_MODE
   ├─ If "key" AND key file exists → Use key authentication
   ├─ Elif SFTP_PASSWORD is set → Use password authentication ← RECOMMENDED
   └─ Else fallback to key if available, otherwise raise error
```

---

## 5. DOCKER BUILD SYSTEM

### 5.1 Build Context

The build context for `mcp-router-io` is:
```
./build/mcp-core/
```

Docker **only receives this directory**. Files outside this folder are **invisible** during image build.

### 5.2 Correct COPY Behavior

The correct `sftp_utils.py` must be in:
```
build/mcp-core/app/sftp_utils.py
```

Then Docker copies it via:
```dockerfile
COPY app/ /app/
```

### 5.3 Common Build Mistake

If you edit `sftp_utils.py` in the wrong location (e.g., `C:\Users\Gary\MCP-Stack\app\`), the changes will **NOT** appear in the container because that path is outside the build context.

### 5.4 Hot-Patch Limitation

Using `docker cp` to inject files into a running container works temporarily, but:
- Files are **lost** on container restart
- Files are **overwritten** on rebuild
- **Always** fix the source file in the build context for permanent changes

---

## 6. docker-compose.yml BEHAVIOR

### 6.1 Key Points

- `$` must be escaped as `$$` in environment variables
- Environment variables propagate into container at runtime
- Restart triggers service recreation (may reset hot-patches)
- `SFTP_PASSWORD` must be visible inside container

### 6.2 Verification Command

```powershell
docker exec mcp-router-io env | Select-String SFTP
```

**Expected Output**:
```
SFTP_USER=sshd
SFTP_PORT=22
SFTP_HOST=10.10.10.45
SFTP_PASSWORD=Lgs5551212$
```

---

## 7. COMMAND LOG (CRITICAL EVENTS)

### 7.1 SSH Key Generation (Later Abandoned)

```powershell
ssh-keygen -t ed25519 -f "$env:USERPROFILE\.ssh\automation_ed25519" -N '""'
```

### 7.2 Password Reset on NAS

```bash
ssh sshd@10.10.10.45
passwd automation
# Password: Test1234 (for testing)
```

### 7.3 BusyBox Login Test (Revealed PAM Restriction)

```bash
login automation
# Result: "Login incorrect" - proved non-admin users blocked by PAM
```

### 7.4 AllowUsers Configuration (Attempted)

```bash
cat << 'EOF' >> /etc/ssh/sshd_config
AllowUsers sshd automation
EOF
```
**Result**: Did not help — PAM still blocked `automation` user.

### 7.5 Switch to `sshd` User

Updated `docker-compose.yml`:
```yaml
- SFTP_USER=sshd
- SFTP_PASSWORD=Lgs5551212$$
```

### 7.6 Fix Build Context

```powershell
Copy-Item "C:\Users\Gary\Downloads\sftp_utils.py" "C:\Users\Gary\MCP-Stack\build\mcp-core\app\sftp_utils.py" -Force
```

### 7.7 Docker Rebuild

```powershell
cd C:\Users\Gary\MCP-Stack
docker compose down
docker compose build --no-cache
docker compose up -d
```

### 7.8 Verification Commands

```powershell
docker exec mcp-router-io env | Select-String SFTP
docker exec mcp-router-io grep -A3 "elif SFTP_PASSWORD" /app/sftp_utils.py
```

### 7.9 Successful SFTP Test

```powershell
Invoke-RestMethod -Uri "http://localhost:8090/sftp/list" `
  -Method POST `
  -ContentType "application/json" `
  -Body '{"path":"/mnt/HD/HD_a2/SPEAR_MCP"}'
```

**Result**:
```
status: ok
path: /mnt/HD/HD_a2/SPEAR_MCP
items: {Heber_Campus_MCP, _governance, _continuity, _incoming}
continuity_entry: CR_20251128_064109_COMMSIO_CMD
```

---

## 8. PHASE 15B CERTIFICATION

| Field | Value |
|-------|-------|
| Phase | 15B |
| Subsystem | SFTP Transport Layer |
| Status | **COMPLETE** ✅ |
| Validation Method | `/sftp/list` returned `status=ok` |
| Continuity Entry | `CR_20251128_064109_COMMSIO_CMD` |
| Authorized By | Commander Gary Spear |
| Agent A | Draft completed |
| Agent B | Validation completed |
| Consensus | **ACHIEVED** |

### Continuity Code Format

```
CR_YYYYMMDD_HHMMSS_COMMSIO_CMD
│  │        │      │       │
│  │        │      │       └─ CMD = Command execution
│  │        │      └───────── COMMSIO = Communications I/O subsystem
│  │        └──────────────── HHMMSS = Time (UTC)
│  └───────────────────────── YYYYMMDD = Date
└──────────────────────────── CR = Continuity Record
```

---

## 9. REBUILD & RECOVERY PLAYBOOK

### 9.1 If Container Fails

```powershell
cd C:\Users\Gary\MCP-Stack
docker compose down
docker compose build --no-cache
docker compose up -d
```

### 9.2 If WD SSH Breaks

Toggle SSH in WD UI:
1. Navigate to WD dashboard → Settings → Network → SSH
2. Turn **OFF**
3. Wait 5 seconds
4. Turn **ON**

### 9.3 If SFTP Auth Fails

Verify inside container:
```powershell
docker exec mcp-router-io env | Select-String SFTP
docker exec mcp-router-io cat /app/sftp_utils.py | Select-String password
```

### 9.4 If Wrong sftp_utils.py Loads

Fix build context:
```powershell
Copy-Item "C:\Users\Gary\Downloads\sftp_utils.py" "C:\Users\Gary\MCP-Stack\build\mcp-core\app\sftp_utils.py" -Force
```

Then rebuild (see 9.1).

### 9.5 Direct PAM Test (Bypasses SSH)

From inside NAS as root:
```bash
login <username>
```

If this fails with "Login incorrect" even after `passwd <username>`, the user **cannot authenticate via PAM** (WD firmware restriction).

### 9.6 Password Verification

```powershell
ssh sshd@10.10.10.45
```
Password: `Lgs5551212$`

If this works, the NAS is functioning correctly.

---

## 10. LONG-TERM IMPROVEMENTS

| Improvement | Priority | Notes |
|-------------|----------|-------|
| Move credentials to Docker secrets | Medium | Avoid plaintext passwords in compose |
| Add container healthchecks | Low | Already implemented in Phase 14 |
| Add SFTP chroot environment | Low | Requires different NAS |
| Build-time hash verification | Medium | Verify correct sftp_utils.py |
| Migrate away from WD EX4100 | Low | Consider for production workloads |
| Automated post-build integrity script | Medium | Verify file contents after rebuild |

---

## 11. LESSONS LEARNED

### 11.1 WD EX4100 Is Not Enterprise-Grade for SSH/SFTP

- Firmware restrictions prevent proper SSH key authentication
- Non-admin users cannot authenticate via PAM
- Configuration is wiped on UI toggle
- Password authentication is the only reliable method

### 11.2 Docker Build Context Is Strict

- Only files inside the build context are visible
- `COPY` commands are relative to the context root
- Hot-patches don't survive rebuilds
- Always fix source files, not running containers

### 11.3 PowerShell Has Hidden Gotchas

- `\n` in paths is interpreted as newline
- Use `curl.exe` not `curl` (PowerShell alias)
- `Invoke-RestMethod` is preferred for API testing

### 11.4 Dual-Agent Validation Works

- Agent A draft + Agent B validation caught multiple issues
- D-AVP-001 protocol ensures comprehensive review
- Consensus-based approval prevents single-point failures

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

**Agent B Certification**:

I have reviewed this document against Session 30 technical findings, verified all file paths, commands, and architectural decisions. The documentation accurately represents the Phase 15B implementation and is suitable for archival in the governance repository.

— Agent B (Claude), MCP-NAS Project Validator

---

**END OF DOCUMENT**

**File Location**: `Z:\SPEAR_MCP\_governance\Phase15\Phase_15B_Integration_Record.md`
