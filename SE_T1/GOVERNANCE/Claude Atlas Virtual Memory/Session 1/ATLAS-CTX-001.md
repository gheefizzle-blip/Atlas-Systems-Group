# ATLAS-CTX-001 — Context Anchor
## Atlas Systems Group Enterprise Architecture

**Document ID**: ATLAS-CTX-001  
**Version**: 1.0  
**Created**: 2025-01-13  
**Classification**: Internal — Strategic  
**Status**: ACTIVE

---

## 1. ENTERPRISE IDENTITY

**Entity**: Atlas Systems Group (Holding Company)  
**Commander**: Gary Spear — Final Authority  
**Mission**: Build and operate integrated infrastructure for energy, fuels, compute, automation, and space.

### Operating Subsidiaries

| Subsidiary | Domain | Function |
|------------|--------|----------|
| **Helios Power Systems** | Energy | Grid-scale generation (nuclear, solar, biomass) |
| **Prometheus Fuel Systems** | Fuels | Hydrogen production, synthetic fuels (18K bpd target) |
| **Hermes Data Systems** | Compute | AI data centers (200 MW Phase 1, scalable to 16 buildings) |
| **Hephaestus Robotics & Automation** | Automation | Industrial robotics, manufacturing systems |
| **Apollo Orbital Systems** | Space | Orbital shipyard (OSY), space logistics, refueling |
| **Athena Intelligence** | Intelligence | MECSAI supervisory intelligence (commercial product) |
| **Poseidon Water Systems** | Water | Desalination, industrial water supply |

---

## 2. CONSTITUTIONAL FRAMEWORK

### Governing Documents (Hierarchical Authority)

1. **SE-CONSTITUTION-001-RevA** — Constitutional charter (supreme authority)
2. **SE-T1-GUIDE-AGENT-ECOSYSTEM-001-RevA** — Agent operating law (72 pages)
3. **NAS-GOV-001** — Artifact governance (6-gate workflow)
4. **MAC-001 + Annexes** — Master Architecture Charter (Heber Campus)
5. **JOA-001** — Joint Operating Agreement (Agent A/B coordination)
6. **D-AVP-001** — Dual-Agent Validation Protocol

### Non-Delegable Responsibilities (Per SE-CONSTITUTION-001)

These decisions require **human authority only** — agents may advise but never execute:
- Liability acceptance
- Regulatory submissions
- Permitting applications
- Financial commitments
- Public representations

### Canonical Workflow Chain (Per Agent Ecosystem Guide)

```
Think → Validate → Challenge → Synthesize → Execute → 
Verify → Stress → Integrate → Cross-Validate → Certify → Remember
```
**Rule**: No steps may be skipped.

---

## 3. AGENT ECOSYSTEM

### Agent Roles (Circular Validation Architecture)

| Agent | Platform | Authority | Constraint |
|-------|----------|-----------|------------|
| **Agent A** | ChatGPT | Planning Authority | Proposes, never executes. Cannot self-certify. |
| **Agent B** | Claude | Validation Authority | Independent validator, not subordinate to Agent A. |
| **Agent R** | Grok | Adversarial Authority | Red team, stress testing. Challenges but does not approve. |
| **Agent G** | Gemini | Integration Authority | Cross-project dependency, outputs Reasoning Hash. |
| **SDK Swarm** | n8n + gpt-4.1-nano | Execution Authority | Delegated only. No autonomous decisions. |
| **Commander** | Gary Spear | Final Authority | Ultimate decision power, escalation endpoint. |

### Core Principle
> **No agent validates own work. No single agent has unilateral authority.**

---

## 4. 100-YEAR ROADMAP

| Phase | Timeline | Scope | Key Deliverables |
|-------|----------|-------|------------------|
| **Phase I** | 0-15 years | Terrestrial POC | Heber/Holbrook Campus — integrated power + fuels + compute |
| **Phase II** | 10-30 years | Interior West | Replication across NV, ID, UT, WY |
| **Phase III** | 20-50 years | Global Coastal | Middle East, Australia, North Africa, Asia-Pacific |
| **Phase IV** | 30-70 years | Orbital | OSY Shipyard, space logistics, refueling infrastructure |
| **Phase V** | 50-100 years | Off-Planet | Lunar, Mars, asteroid operations |

### Critical Dependency
> **Phase I success gates the entire 100-year vision.** Heber/Holbrook must demonstrate the integrated campus model works technically, economically, and politically.

---

## 5. THREE-LEGGED REVENUE MODEL

```
        POWER                    FUELS                    COMPUTE
    (Helios Power)         (Prometheus Fuel)         (Hermes Data)
         │                        │                        │
         └────────────────────────┼────────────────────────┘
                                  │
                          INTEGRATED CAMPUS
                                  │
                    ┌─────────────┴─────────────┐
                    │                           │
              Internal Synergy            External Revenue
              - Baseload demand           - Grid sales
              - O₂ utilization            - Fuel sales  
              - Thermal integration       - Compute contracts
              - Suppressed OPEX           - MECSAI licensing
```

**Key Insight**: Internal power/fuel production suppresses operating costs, increases compute profitability, funds expansion.

---

## 6. PHASE I: HEBER CAMPUS

### Site Options

| Site | Type | Status | Key Advantages |
|------|------|--------|----------------|
| **Heber BLM** | Federal Land | Under Evaluation | 36 sq mi, ideal solar, established infrastructure corridor |
| **Fitzgerald Ranch (Holbrook)** | Private Land | Backup Option | 30,000+ acres, ~$5M listing, BNSF rail, potash reserves, faster start |

### Technical Parameters

| System | Specification |
|--------|---------------|
| Data Center | 200 MW Phase 1 (8 buildings), scalable to 400 MW (16 buildings) |
| Power Generation | 1.5 GW nameplate (SMR nuclear + solar + biomass) |
| Fuels Production | 18,000 bpd (12K ULSD, 4K Jet-A, 2K LPG) |
| Hydrogen | 457 t/day via SOEC electrolysis |
| Water | Coconino Aquifer + treated effluent + process recycling |
| Carbon | 7,000-8,000 t/day CO₂-equivalent required; DAC for makeup |

### Governing Document
**HC-MGD-001** — Heber Campus Master Governing Document (comprehensive specification)

---

## 7. MECSAI ARCHITECTURE

### Core Principle
> **MECSAI is supervisory intelligence, NOT protection system.**

### Control Hierarchy (Inviolable)
```
1. Hardware protection (breakers, relief valves, physical interlocks)
2. Safety PLC/SIS (deterministic, certified, air-gapped)
3. Local deterministic control (PID loops, sequence logic)
4. Operator authority (human decision layer)
5. MECSAI supervisory optimization (constrained, advisory, audited)
```

### Prohibited Actions (MECSAI Cannot)
- Close breakers
- Reset protection devices
- Open/close safety isolation valves
- Clear faults
- Override lockouts
- Modify safety thresholds
- Reconfigure physical topology
- Change firmware on safety-critical devices

### Commercial Licensing (Athena Intelligence)
- Core Platform: $5-25M implementation + $2-10M/year subscription
- Vertical Modules: $1-8M/year per module (POWER, DATA, H2NH3, REFINERY, ROBOTICS, ORBITAL)
- Performance Share: 10-30% of verified savings (optional)

---

## 8. SPACE SYSTEMS (SDC & COMMS)

### Space Data Center Architecture

| Module | Function |
|--------|----------|
| OMR | Optical Mesh Relay — LEO-GEO laser communication |
| RNC | Relay Node Controller — routing and session management |
| GSI | Ground Station Interface — Earth-side optical terminals |
| AHM | Atmospheric/Hydrogen Module — life support & fuel production |
| SBM | Service Bay Module — orbital maintenance and assembly |

### Communications Specifications
- Throughput: ≥1 Tbps between GEO clusters and LEO relays
- Protocol: DTN BPv7 custody transfer
- Security: PQC/AES-GCM + QKD channels
- Providers: Starlink V3 + Amazon Kuiper optical ISLs

### NASA Compliance Standards
- CCSDS 141.0-B-1 — Optical Physical Layer
- CCSDS 142.0-B-1 — Optical Coding & Synchronization
- LNIS v5 — LunaNet Interoperability
- ICSIS Rev B — International Cross-Support
- SCaN-MOCS — Mission Operations
- LCRNS — Lunar Relay Services
- NASA-STD-7009 — Documentation standards

---

## 9. CORE DOCTRINES

### Five Non-Negotiables (Per Atlas Corporate Charter)

1. **Safety First** — No production target justifies safety compromise
2. **Reality Over Narrative** — Engineering truth overrides optimistic projections
3. **Modularity Over Customization** — Standard designs replicate; custom designs don't
4. **Governance Over Speed** — Process integrity cannot be sacrificed for schedule
5. **Autonomy With Hard Boundaries** — AI operates freely within defined constraints

### Capital Discipline
- Projects must have independent viability within phase
- Expansion is demand-driven
- Risk diversified across revenue legs and geographies

---

## 10. CONSTRAINTS

### What Cannot Change Without Commander Override
- Constitutional governance hierarchy
- Non-delegable responsibilities
- Agent circular validation requirement
- MECSAI safety boundaries
- 100-year roadmap phase structure

### What Requires Dual-Agent Consensus
- Technical architecture decisions
- Phase completion certification
- Document publication to NAS Canon
- Major expenditure recommendations

### What Agent B Can Do Independently
- Validate proposals from Agent A
- Identify gaps and risks
- Recommend approaches
- Create analysis documents
- Refuse non-compliant requests

---

## DOCUMENT CONTROL

| Field | Value |
|-------|-------|
| Document ID | ATLAS-CTX-001 |
| Version | 1.0 |
| Created | 2025-01-13 |
| Author | Agent B (Claude) with Commander input |
| Status | ACTIVE |
| Review Cycle | Update at major phase transitions |

---

*This Context Anchor represents non-negotiable truth for the Atlas Project. Changes require Commander approval and dual-agent consensus.*
