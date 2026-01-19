# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Purpose

This is the canonical GitHub repository for Atlas Systems Group engineering, governance, and MCP Tier-1 documentation. This repository serves as the authoritative source for governance documents and smaller technical artifacts, mirroring key content from the NAS system-of-record.

## NAS Infrastructure (Mega Project)

Three NAS shares comprise the Mega Project storage infrastructure:

### Z:\ (Spear_MCP) - Tier-1 Governance & Platform
Primary system-of-record for governance and Tier-1 artifacts.
- `SE_T1/` - Canonical Tier-1 root (governance, templates, schemas)
- `_continuity/` - Continuity registry and audit logs
- `_governance/` - Transitional governance files
- `_incoming/` - Staging for incoming materials
- `Heber_Campus_MCP/` - Heber Campus project files
- `phase 19 - 20 documents/` - Phase transition documentation

### U:\ (SDC-Comms) - Space Data Center & Communications
Technical artifacts for SDC & COMMS optical communications program.
- `_audit/`, `_continuity/`, `_governance/`, `_metadata/` - Governance infrastructure
- `_incoming/` - Staging area
- `Agent Profiles/` - Agent configuration and identity files
- `Agent Swarm Progress reports/` - Swarm status reporting
- `Claude Files/` - Claude-specific working files
- `Grok - Red Team VM/` - Red team validation artifacts
- `OSY/` - Orbital Systems documentation
- `Reports/` - Technical reports and ATB submissions

### L:\ (N8N) - Workflow Automation & Projects
N8N workflow automation and project working directories.
- `Mega Project/` - Mega Project coordination files
- `SDC & COMMS/` - SDC-COMMS workflow artifacts
- `Autonomous House/` - Autonomous House energy R&D
- `Emberbound/` - Emberbound project files
- `Project Ransome/` - Project Ransome files
- `AUTONOMY_TEST/` - Autonomy testing artifacts
- N8N workflow configs (`.json` files)

## GitHub Repository Structure

### Canonical Tier-1 Root
`SE_T1/` is the canonical truth root for all Tier-1 governance, infrastructure, templates, and future database architecture.

Key subdirectories:
- `SE_T1/GOVERNANCE/` - Governance documents, charters, agent ecosystem guides
- `SE_T1/TEMPLATES/` - Document templates (CTX, PRI, MANIFEST)
- `SE_T1/TEMPLATES/SCHEMAS/` - JSON schemas for intake and provisioning flows
- `SE_T1/DIGITAL_SYSTEMS/` - Digital systems documentation
- `SE_T1/INFRASTRUCTURE_CORE/` - Core infrastructure docs

### Transitional Roots (Not Canonical by Default)
These directories contain valid artifacts but are not canonical FINAL unless migrated to SE_T1 or explicitly blessed in the VMGD:
- `_governance/`
- `_incoming/` - Staging for incoming materials
- `Heber_Campus_MCP/` - Transitional, pending migration to SE_PROJECTS
- `phase 19 - 20 documents/`
- `Reports/`

### Project-Level Artifacts
`SE_PROJECTS/` (PENDING) will serve as the tenant/project root for project-level artifacts isolated per project.

## Document Naming Conventions

### Standard Pattern
`[PROJECT_PREFIX]-[DOC_TYPE]-[NUMBER]_Rev[REVISION]`

Examples:
- `SE-T1-VMGD-001-RevA` - Virtual Memory Governance Document
- `HC-MGD-001` - Heber Campus Master Governance Document
- `ATB-2025-10-SDC-COMMS-INTEGRATION-01` - ATB submission with date stamp
- `NF-ICD-001` - NAS Interface Control Document

### Project Prefixes
- `SE` - Spear Enterprise / Systems Engineering
- `HC` - Heber Campus
- `SDC` - Space Data Center
- `ATB` - Advanced Technology Baseline submissions
- `NF` - NAS Framework

### Revision Discipline
- Promote only with explicit revision tags (RevA, RevB, etc.)
- ASCII-only filenames and core headers for promoted artifacts (multi-LLM portability)
- Do not rename legacy files during initial import; enforce naming only on promotion to FINAL

## Artifact Lifecycle and Retrieval Priority

### Lifecycle Lanes
1. **SOURCE** - Raw imports, vendor docs, dumps
2. **WORKING** - Drafts, in-flight analysis
3. **FINAL** - Decision-grade truth
4. **ARCHIVE** - Superseded finals

### Retrieval Priority (for RAG/Agent queries)
1. FINAL first
2. WORKING only if FINAL has no hits
3. SOURCE as evidence only (not narrative truth)

## Key Controlling Documents

These documents supersede any conflicting content (in order of authority):
1. `JOA-001 Rev A` - Joint Operations Agreement
2. `D-AVP-001 Rev A` - Dual-Agent Verification Protocol
3. `NF-ICD-001 Rev A` - NAS Directory Architecture and COMMS I/O Interface Control
4. `SE-T1-GUIDE-AGENT-ECOSYSTEM-001 Rev A` - Agent ecosystem operating law
5. `SE-T1-MCP-ARCH-020 Rev B` - Phase 20 Database and Metadata Indexing Architecture
6. `SE-T1-VMGD-001-RevA-LIVE` - Virtual Memory Governance Document (living document)

## Phase System

The project follows a phased development approach:
- **Phase 19**: Hardening - identity boundaries, atomic writes, idempotency, auditability, human-in-the-loop approval
- **Phase 20**: Database-backed governance (identity/state/authorization/audit)

Phase gates must be satisfied before advancing.

## Agent Interaction Rules

When working with this repository as an AI agent:

1. **Session Rules**
   - The VMGD (`SE_T1/GOVERNANCE/SE-T1-VMGD-001-RevA-LIVE.md`) should be referenced at session start
   - No assumptions outside canonical documents are valid
   - Phase MUST be declared before any task
   - All numbers MUST trace to canonical sources

2. **Work Order Rules**
   - Work orders MUST reference PRI-001 section(s)
   - Work orders MUST cite files to be read/modified
   - Work orders MUST include validation requirements

3. **Modification Rules**
   - Section changes require INDEXER proposal
   - Diffs require Agent B validation
   - All changes logged in continuity log

## Core Doctrine

- **ChatGPT agents think** (Digital Twin)
- **SDK agents do** (Production Swarm)
- **NAS canon remembers** (System of Record)

AI generates intent; deterministic code executes. No AI agent writes directly to Tier-1 storage without governance.
