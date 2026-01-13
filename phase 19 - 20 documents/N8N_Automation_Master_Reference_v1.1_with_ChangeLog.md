# N8N Automation Development & Debugging Master Reference
*(Rolling Technical Chronicle — Project Emberbound, Autonomous House, and SDC & COMMS)*

---

## 1. Purpose & Scope
This living technical reference consolidates all n8n automation research, testing, and production implementations performed under Spear Enterprise, LLC. It serves as both a chronological record of configuration work and a continuity bridge across chat sessions, projects, and environments.

Version **1.1** expands on the previous document, adding detailed test logs, outcome-based decision trees, and procedural clarity for future scaling to autonomous workflows and agent-managed execution environments.

---

## 2. Architectural Overview

| Component | Description | Integration Role |
|------------|--------------|------------------|
| **n8n** | Self-hosted automation platform (Windows 11, GSA-1000) | Central orchestrator for all file I/O and webhook automation |
| **Google Drive** | Cloud synchronization layer | Public-facing mirror for autonomous GPT Agents |
| **WD My Cloud EX4100 NAS** | Local storage, 1 Gb LAN | Primary on-prem file system for large binary and CAD files |
| **ChatGPT (Custom GPT Agents)** | User-facing AI editors and controllers | Generates requests to n8n via REST webhooks |
| **PowerShell & JSON APIs** | Local diagnostic/test suite | Verifies endpoints and executes structured tests |
| **Fusion 360 & Media Exports** | Heavy binary test load | Validates pipeline performance and throughput |

---

## 3. Major Development Phases

### Phase 1 — Google Drive Workflow (Stable Baseline)
**Workflow:** `Emberbound Complete File Management debugging copy`  
**Version:** v23  
**Webhook:** `https://n8n.garyspearagency.com/webhook/emberbound-drive-api`

**Capabilities**
- Operations: `search`, `upload`, `update`, `read`, `binary upload`
- Directory auto-mapping: `VirtualMemory`, `Notes`, `Text`, `Images`, `AGENT_EDITOR`, `Indexes`
- Handles text, JSON, images (PNG/JPEG), and DOCX binaries
- Supports GPT integration with consistent JSON schema
- Full CORS configuration for ChatGPT

---

### Phase 2 — SMB2 NAS Integration (Failed Path)
**Objective:** Direct file interaction with NAS via SMB2 shares (`\\10.10.10.45\Emberbound`)

| Attempt | Result | Root Cause |
|----------|---------|------------|
| Mapped drive (`M:`) | ❌ “File not found” | n8n service context lost mapped drives |
| UNC path (`\\10.10.10.45\Emberbound`) | ❌ Authentication loop | NTLM/GUI session binding |
| Credential mount via PowerShell | ⚠ Partial success | Non-persistent session |
| “List Files in Directory” node | ⚠ Inconsistent | Path parsing and permission isolation |
| Binary transfer test | ❌ Fail | SMB2 timeout / credential cache invalid |

**Conclusion:** SMB2 unsuitable for headless n8n automation. Pivot to SFTP integration.

---

### Phase 3 — SFTP Integration (Proposed Successor)
**Benefits**
- Higher throughput (~40 % over SMB2)
- Secure, resumable transfers (SSH-based)
- No drive mapping required
- Ideal for autonomous binary operations

**Next steps**
- Enable NAS SFTP access  
- Use key-based authentication  
- Build n8n dual-path workflow (Drive ↔ NAS)

---

## 4. Agent Integration — GPT + n8n
| Agent | Function | Integration Endpoint |
|--------|-----------|----------------------|
| **AGENT EDITOR** | Upload manuscripts to Drive | `/webhook/emberbound-drive-api` |
| **MECSAI** | Monitors workflow telemetry | Custom schema |
| **Autonomous House Agent** | Manages dual NAS/Drive sync | Planned |

**Protocols**
- Startup Protocol → Load virtual memory, verify Drive  
- End-of-Day Protocol → Archive and sync logs  
- Schema → JSON fields: `artifact`, `subdirectory`, `mimeType`, `text`, etc.

---

## 5. Successes, Failures & Lessons

| Category | Success | Failure | Lessons |
|-----------|----------|----------|----------|
| Google Drive | ✅ Full stability | — | Schema uniformity critical |
| NAS SMB2 | — | ❌ Automation failed | Avoid session-tied mounts |
| Binary Uploads | ✅ Base64 verified | ⚠ Empty payload edge case | Pre-validate inputs |
| Gmail Approval Node | ✅ Response captured | ⚠ Data loss pre-merge | Use Code node normalization |
| n8n Runtime | ✅ Docker persistent | ⚠ Windows SMB context loss | Use system service credentials |

---

## 6. Next Development Goals

| Phase | Goal | Tech | Status |
|--------|------|------|--------|
| SFTP Workflow | Replace SMB2 | n8n SFTP node | Planned |
| Cross-Project Schema | Standardize JSON ops | AgentKit/Codex | In progress |
| Prometheus Metrics | Workflow telemetry | Docker | Planned |
| Automated Backups | NAS↔Drive sync | n8n Scheduler | Draft |
| AgentKit Migration | AI orchestration | OpenAI AgentKit | Pending |

---

## 7. Future Use
- Append daily logs and new node configs  
- Include PowerShell / webhook validation output  
- Maintain revision history and paths  
- Sync NAS + Drive copies  

---

## 8. Summary

| Category | Status | Confidence |
|-----------|---------|------------|
| Google Drive Workflow | ✅ Operational | 100 % |
| NAS SMB2 Automation | ❌ Not viable | 0 % |
| SFTP Integration | 🧪 Planned | 80 % |
| GPT Agent Integration | ✅ Stable | 100 % |
| Documentation | 🟩 Ongoing | 95 % |

---

## 9. Change Log (Rolling Updates)

| Date | Version | Author | Summary of Changes | Notes |
|------|----------|---------|--------------------|-------|
| 2025-10-14 | 1.1 | Gary Spear / ChatGPT (Sam) | Added Gmail Approval Workflow and Normalize logic | Workflow stable |
| 2025-10-15 | 1.2 | — | — | — |
| 2025-10-16 | 1.3 | — | — | — |

---

### Update Protocol
1. Add a row for each workflow/schema update  
2. Increment version number (e.g., 1.2 → 1.3)  
3. Summarize key node changes  
4. Sync file to Google Drive + NAS  
5. Export weekly PDF snapshot (`N8N_Automation_Master_Reference_vX.X.pdf`)