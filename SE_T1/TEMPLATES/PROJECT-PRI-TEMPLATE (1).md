# [PROJECT_ID]-PRI-001 - Project Reference Index
<!-- TEMPLATE: Replace [PROJECT_ID] with project prefix (e.g., HC, SDC, SE) -->

**Document ID**: [PROJECT_ID]-PRI-001  
**Revision**: A  
**Version**: 1.0  
**Effective Date**: [YYYY-MM-DD]  
**Last Updated**: [YYYY-MM-DD]  
**Owner**: INDEXER (SDK Agent)  
**Authority**: Operational memory for [PROJECT_NAME]. Truth anchor: [PROJECT_ID]-CTX-001.

---

## 1. PROJECT SNAPSHOT

| Field | Value |
|-------|-------|
| Project | [PROJECT_NAME] |
| Active Phase(s) | [PHASE_NUMBER(S)] |
| Engineering Maturity | [CONCEPT/FEED/DETAILED/CONSTRUCTION] |
| Last WO Applied | [WO-ID] |
| Last DEP Certified | [DEP-ID] |

---

## 2. FILE TREE MAP

<!-- Canonical directory structure. Update on every artifact publish. -->

```
/[PROJECT_ID]/
├── /Governance/
│   ├── [PROJECT_ID]-CTX-001.md
│   ├── [PROJECT_ID]-PRI-001.md
│   ├── [PROJECT_ID]-MANIFEST-001.json
│   └── [PROJECT_ID]-MGD-001.docx
│
├── /[SUBSYSTEM_1]/
│   ├── [DOC_ID].docx
│   └── [DOC_ID].pdf
│
├── /[SUBSYSTEM_2]/
│   ├── [DOC_ID].docx
│   └── [DOC_ID].xlsx
│
├── /[SUBSYSTEM_3]/
│   └── [DOC_ID].docx
│
├── /WO_Archive/
│   └── [WO-YYYY-NNNN]/
│
└── /Exports/
    └── [YYYY-MM-DD]/
```

---

## 3. SUBSYSTEM INDEX

<!-- Status and canonical document for each major subsystem -->

### 3.1 [SUBSYSTEM_1_NAME]

| Field | Value |
|-------|-------|
| Status | [CONCEPT/FEED/DETAILED/COMPLETE] |
| Canonical Doc | [DOC_ID] |
| Last Updated | [YYYY-MM-DD] |
| SHA-256 | [HASH_FIRST_8_CHARS]... |

**Supporting Documents**:
- [DOC_ID] - [DESCRIPTION]
- [DOC_ID] - [DESCRIPTION]

**Open Items**:
- [ ] [OPEN_ITEM_1]
- [ ] [OPEN_ITEM_2]

---

### 3.2 [SUBSYSTEM_2_NAME]

| Field | Value |
|-------|-------|
| Status | [CONCEPT/FEED/DETAILED/COMPLETE] |
| Canonical Doc | [DOC_ID] |
| Last Updated | [YYYY-MM-DD] |
| SHA-256 | [HASH_FIRST_8_CHARS]... |

**Supporting Documents**:
- [DOC_ID] - [DESCRIPTION]

**Open Items**:
- [ ] [OPEN_ITEM_1]

---

### 3.3 [SUBSYSTEM_3_NAME]

| Field | Value |
|-------|-------|
| Status | [CONCEPT/FEED/DETAILED/COMPLETE] |
| Canonical Doc | [DOC_ID] |
| Last Updated | [YYYY-MM-DD] |
| SHA-256 | [HASH_FIRST_8_CHARS]... |

**Supporting Documents**:
- [DOC_ID] - [DESCRIPTION]

**Open Items**:
- [ ] [OPEN_ITEM_1]

---

## 4. WORK STATUS

### 4.1 Completed Work (Locked)

<!-- These analyses are done. Do not repeat. -->

| WO/DEP ID | Description | Completion Date | Output Doc |
|-----------|-------------|-----------------|------------|
| [ID] | [DESCRIPTION] | [DATE] | [DOC_ID] |

### 4.2 In-Progress Work

<!-- Currently active work orders -->

| WO ID | Description | Assigned Agent(s) | Target Date |
|-------|-------------|-------------------|-------------|
| [ID] | [DESCRIPTION] | [AGENT(S)] | [DATE] |

### 4.3 Deferred Work

<!-- Explicitly postponed. Include reason. -->

| Item | Reason | Revisit Trigger |
|------|--------|-----------------|
| [ITEM] | [REASON] | [TRIGGER] |

### 4.4 Deprecated Artifacts

<!-- These documents are superseded. Do not use. -->

| Doc ID | Superseded By | Deprecation Date | Reason |
|--------|---------------|------------------|--------|
| [OLD_DOC] | [NEW_DOC] | [DATE] | [REASON] |

---

## 5. INTERFACE CONTROL

<!-- Cross-subsystem dependencies -->

| Interface | From | To | ICD Doc | Status |
|-----------|------|-----|---------|--------|
| [INTERFACE_NAME] | [SUBSYSTEM] | [SUBSYSTEM] | [ICD_ID] | [DRAFT/ACTIVE] |

---

## 6. COMPLIANCE DOMAINS

<!-- Applicable codes and standards -->

| Domain | Standards | Validator |
|--------|-----------|-----------|
| [DOMAIN_1] | [CODES] | [AGENT_OR_HUMAN] |
| [DOMAIN_2] | [CODES] | [AGENT_OR_HUMAN] |

---

## 7. WORK ORDER VALIDATION RULES

<!-- Router enforces these before WO execution -->

### 7.1 Mandatory Checks

1. WO must reference at least one Section 3 subsystem
2. If subsystem status = COMPLETE, WO must justify reopen
3. WO must not duplicate Section 4.1 completed work
4. WO must cite specific docs from file tree (Section 2)

### 7.2 Agent Assignment Rules

| WO Type | Required Agents | Validation |
|---------|-----------------|------------|
| New analysis | Agent A + Agent B | Standard |
| Security-related | Agent A + Agent B + Agent R | Mandatory R |
| Integration | Agent A + Agent B + Agent G | Reasoning Hash |
| Index update | INDEXER + Agent B | Diff validation |

---

## 8. CHANGE LOG

<!-- INDEXER maintains this automatically -->

| Version | Date | Change Summary | Trigger | Validated By |
|---------|------|----------------|---------|--------------|
| 1.0 | [DATE] | Initial index | Manual | [COMMANDER] |

---

## 9. VALIDATION BLOCK

```yaml
validation:
  auto_update_triggers:
    - wo_closure
    - dep_certification
    - artifact_publish
  indexer_authority:
    - section_2_file_tree
    - section_3_status
    - section_4_work_status
    - section_8_change_log
  agent_b_validates:
    - all_proposed_diffs
  continuity_code_required: true
```

---

**END OF TEMPLATE**

<!--
USAGE INSTRUCTIONS:
1. Copy this template
2. Replace all [BRACKETED] placeholders
3. Remove instruction comments
4. Save as [PROJECT_ID]-PRI-001.md
5. Generate initial SHA-256 hash
6. Register in MANIFEST-001.json
7. Configure INDEXER triggers
-->
