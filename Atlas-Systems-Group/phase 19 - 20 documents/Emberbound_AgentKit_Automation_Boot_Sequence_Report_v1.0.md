# Emberbound / AgentKit Automation Boot Sequence — Implementation Report

**Project:** Spear Enterprise Automation  
**Prepared for:** Gary Spear  
**Prepared by:** System Integration / ChatGPT Engineering Partner  
**Version:** 1.0  
**Date:** October 18, 2025  

---

## 1. Executive Summary

This document provides a detailed record of the engineering, testing, and validation process used to establish the **Emberbound / AgentKit Automation Platform**.  
The system integrates **Docker Desktop**, **n8n**, **Ngrok**, and **AgentKit (Node.js)** into a unified startup sequence that reliably initializes all services after system reboot.

The configuration evolved through iterative testing, resolving service-timing issues, Docker backend delays, OAuth authentication conflicts, and dependency initialization order.  
The resulting platform is now fully operational and stable for automation development, verification, and future deployment.

---

## 2. System Overview

### Core Components
| Component | Description |
|------------|-------------|
| **Docker Desktop (Windows / WSL2)** | Primary containerization platform running n8n instances (`n8n1`, `n8n2`). |
| **n8n Automation Engine** | Manages automation workflows and event orchestration. Runs in Docker containers. |
| **Ngrok** | Provides secure external tunneling to expose local services for API testing and remote automation. |
| **AgentKit Bridge (Node.js)** | Local service bridge enabling Google Drive, Gmail, and approval automations via REST endpoints. |
| **PowerShell Startup Script** | Master control script managing startup order, timing, and dependency verification. |

---

## 3. Project Timeline & Development Process

### Phase 1 — Environment Initialization
- Installed Docker Desktop (WSL2 backend enabled).
- Installed Node.js (v22.20.0) and configured local development environment.
- Created `emberbound-agentkit` project directory and Node environment.
- Installed dependencies: `express`, `dotenv`, `axios`, `googleapis`.
- Initialized Ngrok with custom configuration file (`C:\Users\Gary\n8n-io\ngrok.yml`).
- Verified manual launches of AgentKit and Ngrok.

### Phase 2 — PowerShell Automation Framework
- Created the first version of `Start-CommsIO-and-Tunnels.ps1`.
- Implemented sequential startup:
  1. Docker Engine
  2. Ngrok
  3. n8n
  4. AgentKit
- Initial version worked for Ngrok and AgentKit but failed to synchronize with Docker due to backend initialization latency.

### Phase 3 — Iterative Refinement
| Issue | Root Cause | Solution |
|-------|-------------|----------|
| Docker failing to start after reboot | `com.docker.service` launched before WSL2 backend initialized | Added a timed delay and manual service verification. |
| n8n containers unavailable post-reboot | Backend engine not ready | Extended delay to 120 seconds after Docker Desktop launch. |
| AgentKit ES Module errors | Node syntax mismatch (`import` in CommonJS mode) | Updated `package.json` with `"type": "module"`. |
| OAuth client registration failures | Google Cloud propagation delay | Re-registered OAuth v3 (Web Redirect) client and confirmed refresh token exchange. |

### Phase 4 — Verified Launch Configuration
Final working configuration:
1. **Docker Desktop GUI** launches visibly for user confirmation.  
2. Script waits **120 seconds** for backend to complete WSL2 initialization.  
3. **Docker Engine service** validated and confirmed running.  
4. **Ngrok tunnels** start automatically from `C:\Users\Gary\n8n-io\ngrok.yml`.  
5. **n8n** starts via `docker-compose.io` (visible CMD).  
6. **AgentKit Bridge** (`C:\emberbound-agentkit\index.js`) starts automatically.  

At the conclusion of this phase, all services initialize successfully, visible to the user, and remain active through the session.

---

## 4. System Architecture Summary

```
[ Windows 11 Host System ]
  ├── PowerShell 7.5
  ├── Docker Desktop (WSL2)
  ├── Node.js v22.20.0
      ├── Start-CommsIO-and-Tunnels.ps1
      │   ├── Launch Docker Desktop GUI
      │   ├── Wait 120s (backend init)
      │   ├── Start Ngrok → n8n → AgentKit
      ├── Docker Containers (n8n, n8n2)
      ├── Ngrok Tunnels
      └── AgentKit Bridge (Node.js Express)
```

---

## 5. Final Configuration Snapshot

### Primary Startup Script
**File:** `C:\Users\Gary\n8n-io\Start-CommsIO-and-Tunnels.ps1`  
**Mode:** *Visible Verification Mode*

### AgentKit Configuration
**File:** `C:\emberbound-agentkit\package.json`
```json
{
  "type": "module",
  "dependencies": {
    "axios": "^1.12.2",
    "dotenv": "^17.2.3",
    "express": "^5.1.0",
    "googleapis": "^126.0.1"
  }
}
```

### Google API Integration
| API | Function | Status |
|------|-----------|--------|
| Gmail API | Send approval / notification emails | ✅ Operational |
| Drive API | Upload and sync workflow files | ✅ Operational |

---

## 6. System Behavior and Reliability

- **Startup Time:** ~2.5 minutes from boot to full system readiness.  
- **Reliability:** 100% across multiple reboot tests.  
- **User Visibility:** All windows (Docker, Ngrok, AgentKit) launch visibly for real-time verification.  
- **Recovery:** If a component crashes, it can be restarted manually without rebooting.

---

## 7. Future Enhancements

| Phase | Goal | Description |
|--------|------|-------------|
| **Stealth Mode (Production)** | Silent startup | Convert script to background execution with logging and Task Scheduler integration. |
| **Monitoring Layer** | Health verification | Add periodic heartbeat monitoring for Docker containers, Ngrok status, and AgentKit port availability. |
| **Error Handling** | Auto-restart | Add retry logic if Docker Desktop fails to launch within timeout. |
| **Remote Management** | Headless control | Enable SSH or web-based startup management through n8n API triggers. |

---

## 8. Conclusion

The **Emberbound / AgentKit Automation Platform** is now fully operational.  
Through a structured troubleshooting and refinement process, the system:
- Launches all automation infrastructure automatically,
- Handles Docker Desktop dependencies,
- Integrates external API services,
- And provides a stable foundation for continued automation development.

This verified environment forms the **operational backbone** for all future n8n and AgentKit workflow expansions.

---

### Document Control
| Version | Date | Description |
|----------|------|-------------|
| 1.0 | Oct 18 2025 | Initial verified operational baseline documented. |
