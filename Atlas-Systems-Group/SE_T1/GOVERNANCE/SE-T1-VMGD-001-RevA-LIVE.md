
SE-T1-VMGD-001 Rev A (LIVE)

Virtual Memory Governance Document (VMGD) - Spear Enterprise LLC Tier 1

Document ID: SE-T1-VMGD-001
Revision: A (LIVE / Append-Only)
Status: ACTIVE
Authority: Gary Spear (Final Decision Authority)
Scope: Spear Enterprise LLC Tier-1 (SPEAR_MCP share)
Effective Date: 2026-01-07
Distribution: Controlled - Spear Enterprise Internal
Classification: Company Confidential

0. Core Rule

If it is not in this document (or explicitly referenced by controlling documents), it is not true for operations.

This VMGD replaces "chat memory" as the system-of-record for continuity, phase status, and execution law.

Append-only: do not retro-edit content. Changes append to Section 15.

1. Purpose

This VMGD is the single canonical anchor for:

Tier-1 governance rules and operational constraints

Canonical directory truth and retrieval priority

Phase 19 / Phase 20 status and completion gates

Agent role boundaries (ChatGPT vs Codex vs SDK agents)

Approved architecture baselines and controlling documents

Open items (explicitly tagged PENDING)

2. Controlling Documents (Superseding Authority)

The following documents control and supersede any conflicting content in this VMGD:

2.1 Joint Governance and Dual-Agent Protocol

JOA-001 Rev A (Joint Operations Agreement)

D-AVP-001 Rev A (Dual-Agent Verification Protocol)

D-AVP-001-TC-004 LIVE (Living Continuity Framework)

2.2 Tier-1 NAS Directory Law (Hard Law)

NF-ICD-001 Rev A (NAS Directory Architecture and COMMS I/O Interface Control)

NF-ICD-001 is the controlling NAS law for Tier-1 structure, naming conventions, atomic writes, and continuity registry integration.

2.3 Agent Ecosystem Operating Law (Controlling)

SE-T1-GUIDE-AGENT-ECOSYSTEM-001 Rev A (Controlling operating law for the agent ecosystem and governance discipline)

2.4 Phase 20 Technical Baseline (ATB Approved)

SE-T1-MCP-ARCH-020 Rev B (Phase 20 Database and Metadata Indexing Architecture)

SE-T1-MCP-ARCH-020 RevB is the Phase 20 baseline specification. It is not optional.

2.5 Phase 19 Logging and Retention Law (Mandatory)

Phase 19 and 20 Planning Summary and Handoff (Three-tier logging and retention policy)

3. Governing Doctrine

3.1 Core Doctrine

ChatGPT agents think (Digital Twin).

SDK agents do (Production Swarm).

NAS canon remembers (System of Record).

3.2 Separation Doctrine

AI generates intent. Deterministic code executes.

No AI agent writes directly to Tier-1 storage.

Execution must be boring, deterministic, governed, and auditable.

3.3 Phase Intent

Phase 19: lock identity boundaries, provenance, atomic writes, idempotency, auditability, and eliminate exploit paths.

Phase 20: introduce database-backed governance (identity/state/authorization/audit) without breaking working Phase 19 workflows.

4. Authority, Roles, and Agent Classes

4.1 Human Authority

Gary Spear is the sole final decision authority for Tier-1.

4.2 Agent Classes (Tier-1)
A) ChatGPT / Custom GPT (Digital Twin)

Role: planning, drafting, analysis, checklists, validation of outputs

Not a system principal

No AgentID

No autonomous execution

No autonomous NAS writes

B) Codex CLI (Execution Tooling)

Role: toolsmith and local execution surface on GSA-1000

Not autonomous, not persistent, not a background service

No AgentID

Executes only via explicit operator invocation and approval gates

C) SDK Agents (Production Swarm) - Phase 20+

Role: first-class system principals

Must have immutable AgentIDs and enforced write scopes

May execute autonomously once Phase 20 gates are satisfied

D) INDEXER Agent (PENDING)

Role: catalog stewardship and governance file hygiene

No self-approval

Any governance diffs must be validated by Agent B (or dual-agent protocol)

Status: PENDING (Phase 19 Track C deliverable)

5. Canonical Directory Truth (NAS Reality and Targets)

5.1 Current Spear_MCP Share Root (Observed Reality)
SPEAR_MCP root (Z:) currently contains:

_continuity

_governance

_incoming

Heber_Campus_MCP

phase 19 - 20 documents

SE_T1

This is a mixed state (platform + transitional roots). This is allowed during transition, but canonical truth rules apply below.

5.2 Canonical Tier-1 Root (Truth)
Canonical Tier-1 truth for governance and future retrieval is:

Z:\SE_T1\

All Tier-1 canon, governance, infra, templates, queue, and future DB infrastructure must anchor under SE_T1 (unless explicitly defined otherwise by controlling documents).

5.3 Transitional Roots (Non-Canonical by Default)
The following roots are transitional and NOT canonical truth by default:

Z:_governance\

Z:_incoming\

Z:_continuity\

Z:\Heber_Campus_MCP\

Z:\phase 19 - 20 documents\

Rule: transitional roots may contain valid artifacts, but they are not canonical FINAL unless:

Migrated into canonical structure (SE_T1 or SE_PROJECTS), OR

Explicitly blessed by a VMGD continuity log entry referencing doc_id + reason + effective date.

5.4 Platform vs Tenant Model (SE_T1 and SE_PROJECTS)

SE_T1 = platform root (agents, templates, governance, shared infra)

SE_PROJECTS = tenant/project root (project-level artifacts, isolated per project)

SE_PROJECTS Status: PENDING (Phase 19 Track C deliverable)

5.5 Heber Campus Placement Decision

Z:\Heber_Campus_MCP\ is TRANSITIONAL.

Target migration destination (once SE_PROJECTS exists):
Z:\SE_PROJECTS\SPEAR\PRJ-SPEAR-2025-HC01\

Until migration, Heber_Campus_MCP may operate as a legacy island, but is not canonical for Phase 20 indexing unless explicitly registered in the master registry (Phase 20).

6. Lifecycle Lanes and Retrieval Priority (Anti-Fragmentation)

6.1 Lifecycle Lanes (Mandatory for Canonical Tier-1)

SOURCE: raw imports, vendor docs, dumps

WORKING: drafts, in-flight analysis

FINAL: decision-grade truth

ARCHIVE: superseded finals

6.2 Retrieval Priority Rule (For Agents / RAG)

FINAL first

WORKING only if FINAL has no hits

SOURCE as evidence only (not narrative truth)

This rule exists to eliminate RAG contradictions and hallucinations from mixed drafts.

6.3 Stable Artifact IDs

Each artifact must have a stable artifact_id independent of filename and folder.

Only one current FINAL per artifact_id.

7. Naming, ASCII, and Revision Rules

7.1 ASCII Enforcement

Canonical promoted artifacts must be ASCII-only (filename and core headers).

This is required for multi-LLM portability.

7.2 Revision Discipline

Promote only with explicit revision tags (RevA, RevB, etc.).

Do not rename legacy files during initial import; enforce naming only on promotion to FINAL.

8. Atomic Write Contract (Non-Negotiable)

All Tier-1 writes must follow:

Write to .partial

SHA-256 compute

Verification

Atomic rename commit

Append JSONL ledger entry

No partial files are ever visible as final outputs.

9. Continuity Registry and Audit

9.1 Continuity Registry

Continuity is append-only JSONL.

Every Tier-1 write operation generates a continuity registry entry.

TC-004 LIVE is the doctrinal pattern for living continuity logs.

9.2 Dual Record Strategy (Phase 20)

Phase 19: JSONL and filesystem logs are primary

Phase 20: database becomes authoritative for indexing and querying; JSONL remains immutable mirrored record

10. Phase 19 Law (Hardening, Not Autonomy)

10.1 Phase 19 Objective

Establish trust, structure, and auditability prior to autonomy.

10.2 Phase 19 Must Enforce

Identity boundaries (blocking anonymous execution)

Atomic writes and idempotency

Logging discipline and retention quotas

No public-facing attack surface

No uncontrolled persistence

Human-in-the-loop approval for execution

10.3 Phase 19 Must Not Do

No autonomous SDK agent deployment

No self-triggering autonomous workflows

No uncontrolled write access

No background execution masquerading as autonomy

11. Phase 19 Logging and Retention Policy (Mandatory)

Three-tier logging model:

Tier 1 - Security and Control Logs

Auth events, permission changes, workflow activation, NAS writes, config changes

Retention: 90 days hot, 1 year cold (compressed)

Append-only, immutable after rotation

Tier 2 - Operational Health Logs

Workflow success/fail counts, queue depth, thresholds

Retention: 7 to 14 days rolling

Aggregated metrics only

Tier 3 - Debug and Trace Logs

Disabled by default

Manual enable only

Auto-expire within hours

Never written to permanent NAS

Persisting debug logs beyond incident window is a violation

Failure to enforce logging discipline blocks Phase 20.

12. Phase 20 Baseline (Database and Metadata Governance)

12.1 Phase 20 Principle (Wrap-and-Govern)

Files remain the source of truth for artifacts.

Database becomes source of truth for identity, state, authorization, and audit.

Critical rule:

No file may exist without a DB record (or tombstone/quarantine record).

No DB record may exist without a file or tombstone.

12.2 Baseline Architecture (ATB Approved)
SE-T1-MCP-ARCH-020 RevB is the Phase 20 implementation baseline:

SQL catalogs per NAS share

Master registry DB

Hardened Metadata Index Service as the sole access layer

Agents never touch SQL directly

Catalogs rebuildable from NAS

No agent-triggered recursive scans

No agent-driven schema modifications

Prepared statements only

RBAC + network isolation

DELETE prohibited in the service

13. Context Architecture (Multi-LLM Virtual Memory)

Purpose: provide portable, deterministic memory across LLMs and sessions.

13.1 Artifacts
A) Context Anchor

<PROJECT>-CTX-001.md

Non-negotiable truth: phases, constraints, scope, authority, rules

B) Project Reference Index

<PROJECT>-PRI-001.md

Operational memory: file tree pointers, current status, links to canon artifacts

C) Machine Manifest

<PROJECT>-MANIFEST-001.json

SDK swarm routing: machine-readable project definitions, IDs, paths, permissions, workflow hooks

13.2 Template Location (Observed)
Templates exist under:

Z:\SE_T1\TEMPLATES\

Z:\SE_T1\TEMPLATES\SCHEMAS\

These templates are to be used to standardize multi-LLM continuity and SDK execution.

14. Schemas (Deployed)

Schema artifacts are deployed at:

Z:\SE_T1\TEMPLATES\SCHEMAS\

Deployed items include:

SE-SCHEMA-PROJECT-INTAKE-001.json

SE-SCHEMA-PROJECT-PROVISION-REQUEST-001.json

SE-SCHEMA-PROJECT-PROVISION-RESPONSE-001.json

SE-SCHEMA-PROJECT-READY-EVENT-001.json

SE-N8N-FUNCTION-NODES-PSEUDOCODE-001.txt

These are the machine contracts for structured intake and provisioning flows.

15. Operational Continuity Log (Append-Only)

RULE: Every change to governance, directory law, phase status, or execution boundaries appends below.

Entry format:

Timestamp (local)

Change summary

Reason

Approved by

References (doc IDs)

Affected paths

Status (APPROVED / APPROVED_WITH_MODS / etc.)

15.1 Entry - 2026-01-07
Summary:

Activated SE-T1-VMGD-001 Rev A (LIVE) as the Tier-1 virtual memory anchor.

Declared Z:\SE_T1\ as canonical Tier-1 truth root.

Declared SE_PROJECTS root as PENDING (Phase 19 Track C).

Declared Z:\Heber_Campus_MCP\ as TRANSITIONAL pending migration to SE_PROJECTS target.

Affirmed NF-ICD-001 Rev A as Tier-1 NAS law.

Affirmed SE-T1-MCP-ARCH-020 RevB as Phase 20 baseline.

Locked Phase 19 three-tier logging and retention policy.

Reason:

OpenAI project memory constraints require explicit, portable continuity.

Prevent drift and hallucination by grounding operations in canonical documents and NAS truth.

Align Phase 19/20 execution with ratified governance and ATB baselines.

Approved by:

Gary Spear (Authority)

References:

NF-ICD-001 Rev A

SE-T1-MCP-ARCH-020 RevB

JOA-001 Rev A

D-AVP-001 Rev A

D-AVP-001-TC-004 LIVE

Phase 19/20 Planning Summary and Handoff

SE-T1-GUIDE-AGENT-OPS-019-022 Rev A

Affected paths:

Z:\SE_T1\

Z:\Heber_Campus_MCP\

Z:_governance\

Z:_incoming\

Z:\phase 19 - 20 documents\

Z:\SE_T1\TEMPLATES\

Z:\SE_T1\TEMPLATES\SCHEMAS\

Status:

APPROVED

END OF DOCUMENT

15.2 Entry - 2026-01-07
Summary:
- Added End-of-Session Update Protocol (EOS-UP) to prevent drift and maintain VMGD as authoritative memory.

Reason:
- OpenAI platform constraints require deterministic, repeatable session closure and state capture.
- This protocol ensures all progress is recorded, all pending items are explicit, and no assumptions leak across sessions.

Approved by:
- Gary Spear (Authority)

Status:
- APPROVED

END-OF-SESSION UPDATE PROTOCOL (EOS-UP)

Rule:
Every working session that produces decisions, artifacts, status changes, or new open items MUST end with an EOS-UP update.

EOS-UP has two layers:
A) Minimal update (mandatory)
B) Full update (required when any governance/phase/architecture changes occurred)

A) MINIMAL EOS-UP (MANDATORY EVERY SESSION)
At end of session, append a short EOS-UP block to Section 15:
1) Timestamp (local and/or UTC)
2) What changed today (1-5 bullets)
3) What is now true (1-5 bullets)
4) Open items created or changed (explicit list; mark PENDING/ACTIVE/BLOCKED)
5) Next action (single highest-priority step)

B) FULL EOS-UP (REQUIRED WHEN ANY OF THESE OCCUR)
Trigger conditions:
- Any governance change
- Any phase gate progress or completion claim
- Any new directory law decision (canonical vs transitional)
- Any new agent role/authority rule
- Any identity/permission/logging change
- Any new artifact promoted to FINAL/LIVE
- Any change to DB architecture baselines

Full EOS-UP must include:
1) Phase Status Block (Phase 19/20): NOT STARTED / ACTIVE / BLOCKED / COMPLETE
2) Gate Status: list each gate with PASS/FAIL and evidence pointer (path + hash if available)
3) New/Updated Artifacts:
   - doc_id
   - revision
   - status (WORKING/FINAL/LIVE)
   - canonical path
   - sha256 (if computed)
4) Directory Impacts:
   - any folder moved, newly created, or declared canonical/transitional
5) Logging/Retention Impacts:
   - any config changes, quotas, retention changes, debug logging enablement
6) Continuity Registry Note:
   - confirm entries appended for Tier-1 writes executed in the session

SKIP CONDITION:
EOS-UP may be abbreviated to a single "No changes" note ONLY if:
- Session was purely exploratory with no binding decisions
- No phase, governance, or structure changes occurred
- Commander explicitly declares "no VMGD update required"
If in doubt, write the Minimal EOS-UP.

CROSS-PLATFORM SYNC (after Full EOS-UP):
- Claude Project: Update Session Quick Start if major changes
- ChatGPT Project: Ensure VMGD reference is current
- NAS: Z:\SE_T1\GOVERNANCE\ copy is authoritative

EOS-UP OUTPUT LOCATION RULE
EOS-UP updates live ONLY inside this VMGD (Section 15 append log).
Do NOT store EOS-UP as separate files unless explicitly directed by Gary.

EOS-UP STYLE RULES
- ASCII-only
- No speculation
- No implied completion
- If evidence is missing, mark as BLOCKED and name the missing evidence

END EOS-UP PROTOCOL

15.3 Entry - 2026-01-07
EOS-UP (MINIMAL)

Timestamp (UTC):
- 2026-01-07T08:03:02Z

What changed today:
- VMGD promoted to LIVE at Z:\SE_T1\GOVERNANCE\
- continuity_registry.jsonl updated with PROMOTE_GOVERNANCE entry and SHA-256
- EOS-UP protocol appended to VMGD and logged with UPDATE_GOVERNANCE entry and SHA-256

What is now true:
- VMGD is the authoritative Tier-1 virtual memory anchor
- EOS-UP is mandatory for all future sessions with defined triggers and content requirements
- Canonical Tier-1 root remains Z:\SE_T1\

Open items (PENDING/ACTIVE/BLOCKED):
- PENDING: Create SE_PROJECTS root (Phase 19 Track C)
- PENDING: Define INDEXER agent charter (Phase 19 Track C)
- ACTIVE: Phase 19 Identity Materialization gate (agent roster + workflow identity enforcement)
- PENDING: Heber_Campus_MCP migration plan (deferred until SE_PROJECTS exists)

Next action:
- Phase 19 Identity Materialization: create canonical agent roster + enforce "no anonymous execution" at workflow gate
