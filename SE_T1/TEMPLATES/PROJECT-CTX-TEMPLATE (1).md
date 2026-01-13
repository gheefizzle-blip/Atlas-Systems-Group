# [PROJECT_ID]-CTX-001 - Context Anchor
<!-- TEMPLATE: Replace [PROJECT_ID] with project prefix (e.g., HC, SDC, SE) -->

**Document ID**: [PROJECT_ID]-CTX-001  
**Revision**: A  
**Version**: 1.0  
**Effective Date**: [YYYY-MM-DD]  
**Last Updated**: [YYYY-MM-DD]  
**Owner**: [OWNER_ROLE]  
**Authority**: This document is the authoritative truth for [PROJECT_NAME].

---

## 1. PROJECT IDENTITY

| Field | Value |
|-------|-------|
| Project Name | [FULL_PROJECT_NAME] |
| Project Code | [PROJECT_ID] |
| Location | [LOCATION_OR_NA] |
| Time Horizon | [YEARS_OR_PERPETUAL] |
| Governing Document | [PROJECT_ID]-MGD-001 |

### 1.1 Purpose Statement
<!-- One paragraph maximum. What does this project deliver? -->

[PURPOSE_STATEMENT]

### 1.2 Governing Authority Documents
<!-- List documents that supersede this anchor if conflict arises -->

| Document ID | Title | Authority Level |
|-------------|-------|-----------------|
| [DOC_ID] | [TITLE] | [PRIMARY/SECONDARY] |

---

## 2. PHASE DEFINITIONS

<!-- Numbers only. No engineering detail. This is the scaling contract. -->

### Phase 1: [PHASE_1_NAME]
| Parameter | Target | Unit |
|-----------|--------|------|
| [PARAM_1] | [VALUE] | [UNIT] |
| [PARAM_2] | [VALUE] | [UNIT] |

**Gate Criteria**: [CRITERIA]

### Phase 2: [PHASE_2_NAME]
| Parameter | Target | Unit |
|-----------|--------|------|
| [PARAM_1] | [VALUE] | [UNIT] |
| [PARAM_2] | [VALUE] | [UNIT] |

**Gate Criteria**: [CRITERIA]

### Phase 3: [PHASE_3_NAME]
| Parameter | Target | Unit |
|-----------|--------|------|
| [PARAM_1] | [VALUE] | [UNIT] |
| [PARAM_2] | [VALUE] | [UNIT] |

**Gate Criteria**: [CRITERIA]

---

## 3. HARD CONSTRAINTS

<!-- These are absolute. Violation = project failure. -->

### 3.1 Non-Negotiable Requirements

| ID | Constraint | Rationale | Source |
|----|------------|-----------|--------|
| HC-01 | [CONSTRAINT] | [WHY] | [DOC_REF] |
| HC-02 | [CONSTRAINT] | [WHY] | [DOC_REF] |
| HC-03 | [CONSTRAINT] | [WHY] | [DOC_REF] |

### 3.2 Regulatory Constraints

| Domain | Requirement | Authority |
|--------|-------------|-----------|
| [DOMAIN] | [REQUIREMENT] | [AGENCY/CODE] |

### 3.3 Worst-Case Assumptions

<!-- Design basis for resilience -->

| Scenario | Assumption | Duration |
|----------|------------|----------|
| [SCENARIO] | [ASSUMPTION] | [HOURS/DAYS] |

---

## 4. ARCHITECTURE SUMMARY

<!-- Single page maximum. Relationships only, not details. -->

### 4.1 Major Subsystems

| Subsystem | Function | Canonical Doc |
|-----------|----------|---------------|
| [SUBSYSTEM_1] | [FUNCTION] | [DOC_ID] |
| [SUBSYSTEM_2] | [FUNCTION] | [DOC_ID] |
| [SUBSYSTEM_3] | [FUNCTION] | [DOC_ID] |

### 4.2 Energy/Material Flows
<!-- Text description or simple ASCII diagram -->

```
[INPUT] --> [PROCESS_1] --> [PROCESS_2] --> [OUTPUT]
                |               |
                v               v
           [BYPRODUCT]    [BYPRODUCT]
```

### 4.3 Control Philosophy

[BRIEF_DESCRIPTION_OF_CONTROL_APPROACH]

---

## 5. RULES OF ENGAGEMENT

<!-- How AI agents interact with this project -->

### 5.1 Session Rules

1. This anchor MUST be attached at session start
2. No assumptions outside this document are valid
3. Phase MUST be declared before any task
4. All numbers MUST trace to Section 2 or 3

### 5.2 Work Order Rules

1. WO MUST reference PRI-001 section(s)
2. WO MUST cite files to be read/modified
3. WO MUST include validation requirements block
4. Blind WOs are rejected by Router

### 5.3 Modification Rules

1. Sections 2-4 changes require INDEXER proposal
2. INDEXER diffs require Agent B validation
3. All changes logged in Section 6
4. Reasoning Hash required for production number changes

---

## 6. CHANGE LOG

<!-- Every update must have provenance -->

| Version | Date | Change Summary | WO/DEP ID | Approved By |
|---------|------|----------------|-----------|-------------|
| 1.0 | [DATE] | Initial baseline | N/A | [COMMANDER] |

---

## 7. VALIDATION BLOCK

<!-- Machine-readable validation hooks -->

```yaml
validation:
  agent_b_required: true
  agent_r_required_for:
    - section_3_changes
    - security_constraints
  reasoning_hash_required_for:
    - section_2_changes
    - production_numbers
  continuity_code_required: true
```

---

**END OF TEMPLATE**

<!-- 
USAGE INSTRUCTIONS:
1. Copy this template
2. Replace all [BRACKETED] placeholders
3. Remove instruction comments
4. Save as [PROJECT_ID]-CTX-001.md
5. Generate initial SHA-256 hash
6. Register in MANIFEST-001.json
-->
