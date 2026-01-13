
SE-T1-AGENT-ROSTER-019 Rev A
Tier-1 Agent Identity Roster (Phase 19 - Identity Materialization)

Document ID: SE-T1-AGENT-ROSTER-019
Revision: A
Status: WORKING
Authority: Gary Spear (Final Decision Authority)
Effective (UTC): 2026-01-07T08:10:00Z
Scope: Tier-1 (SPEAR_MCP / SE_T1)

1. Purpose
This roster materializes agent identity for Phase 19. It exists to enforce:
- No anonymous execution
- Identity precedes intelligence
- Phase 19 writes require human approval

This roster is NOT an autonomy enablement mechanism. SDK autonomy remains Phase 20+ only.

2. Governing References
- JOA-001 Rev A
- D-AVP-001 Rev A
- NF-ICD-001 Rev A
- SE-T1-VMGD-001 Rev A (LIVE)

3. Rules (Phase 19)
3.1 No Anonymous Execution
Any Tier-1 write-capable workflow must reject any request lacking a recognized agent_id.

3.2 Phase 19 Human Approval Required
All Tier-1 writes must remain human-approved in Phase 19. Identity is logged; it does not grant autonomy.

3.3 Scope Enforcement
An agent_id is only valid for the exact write_scope paths defined here. Any out-of-scope write attempt must hard fail.

4. Agent Roster (Phase 19)
4.1 PHASE19-BOOTSTRAP
- Type: bootstrap
- Enabled: TRUE
- Allowed actions: LIST, READ, WRITE, CHECK_QUEUE
- Write scope:
  - Z:\SE_T1\SPECIAL_PROJECTS\TEST_LAB\
  - Z:\SE_T1\QUEUE\
- Notes:
  Temporary commissioning identity for Phase 19 only. Disable at Phase 19 closeout.

4.2 CHATGPT-DIGITAL-TWIN
- Type: advisory
- Enabled: TRUE
- Allowed actions: ADVISE
- Write scope: NONE
- Notes:
  Planning/drafting only. No autonomous writes. Not a system principal.

4.3 CODEX-CLI
- Type: tooling
- Enabled: TRUE
- Allowed actions: GENERATE_SCRIPTS
- Write scope: NONE
- Notes:
  Toolsmith only. Execution occurs only by operator command under Windows identity.

4.4 AGENT-A-PROPOSER
- Type: proposer
- Enabled: TRUE
- Allowed actions: PROPOSE, DRAFT
- Write scope: NONE
- Notes:
  Role definition for Agent A per JOA-001. No autonomous writes.

4.5 AGENT-B-VALIDATOR
- Type: validator
- Enabled: TRUE
- Allowed actions: VALIDATE, AUDIT
- Write scope: NONE
- Notes:
  Role definition for Agent B per D-AVP-001. No autonomous writes.

5. Pass/Fail Criteria (Gate 19B)
PASS requires:
- This roster exists at the canonical path (MD + JSON)
- Identity gate rejects missing agent_id (hard fail)
- Identity gate rejects unknown agent_id (hard fail)
- Identity gate rejects out-of-scope path (hard fail)
- Continuity entries for Tier-1 writes include agent_id
- A rejection test is executed and logged as evidence

6. Change Control
- Updates require atomic write, new hash, and continuity registry entry.
- Do not retro-edit; promote updated versions using the Phase 19 atomic process.

END OF DOCUMENT

