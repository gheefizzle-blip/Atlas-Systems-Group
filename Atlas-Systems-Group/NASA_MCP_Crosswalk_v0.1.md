# NASA MCP Crosswalk v0.1
*(LNIS v5, ICSIS Rev B, SCaN-MOCS, LCRNS) → SDC & COMMS Alignment*

## 1) Purpose
Clause-by-clause mapping between NASA/partner interoperability baselines and our SDC & COMMS subsystems to assess alignment, gaps, and actions.

## 2) Subsystems Covered
- Optical Mesh Router (OMR)
- Relay Node Controller (RNC)
- Ground Station Interface (GSI)
- DTN Core (BPv7/CSP, custody, convergence layers)
- PNT/Timing (AFS, time distribution, time-tagging)

## 3) RAG Scale
- ✅ Aligned: Complies as designed or trivially verifiable
- ⚠️ Partial: Needs test or minor interface work
- 🚧 Gap: Non-compliant or TBD design element

## 4) Crosswalk Matrix (excerpt v0.1)
| Spec | Section | Requirement Theme | Subsystem(s) | Alignment | Notes / Actions |
|---|---|---|---|---|---|
| LNIS v5 | §5.2.4 Optical Links & Routing | Adaptive optical link, reroute on fade; LNSP service interface | OMR, RNC | ⚠️ | Verify LNSP handshake timing and failure modes under eclipse/plume; add telemetry hooks for link-state QoS |
| LNIS v5 | §7.3 DTN Usage | BPv7 support, custody transfer, bundle security | DTN Core | ✅ | Confirm convergence-layer parameters for optical/RF dual-homing; include priority classes |
| LNIS v5 | §8 PNT & AFS | Time transfer accuracy and AFS reception paths | PNT/Timing | 🚧 | Add AFS downlink receiver plan; define PPS distribution and holdover disciplining |
| ICSIS Rev B | §4.6 Interoperable Relay Interface | Multi-provider relay service semantics | OMR, RNC, GSI | ⚠️ | Map relay service catalog to routing policy; validate cross-provider session continuity |
| ICSIS Rev B | §5.4 Timing & Messaging | Cross-agency timing integrity and message formats | PNT/Timing, DTN Core | ⚠️ | Add timing sanity checks in DTN node; log skew and drift metrics to MECSAI |
| SCaN-MOCS | §3 Service Tiers | Ground scheduling, service-level definitions | GSI | ⚠️ | Implement service-tier negotiation; add outage/scheduling events into ops timeline |
| SCaN-MOCS | §5 Spectrum Mgmt Refs | Frequency coordination & policy refs | OMR, GSI | 🚧 | Create spectrum policy artifact links; add band-plan validation to preflight checks |
| LCRNS | Testbed Validation | Interop validation targets for LunaNet | OMR, RNC, PNT | ⚠️ | Plan remote test sessions; prepare KPIs for optical acquisition time, DTN custody success |
| LCRNS | Nav/Time Services | LANS/AFS broadcast expectations | PNT/Timing | 🚧 | Prototype AFS receiver emulation; verify time-tag precision across hops |

> Full clause mapping will be expanded to include clause IDs and exact citations in v0.2.

## 5) Derived Engineering Actions
1. **LNSP Timing Harness**: add synthetic fade/eclipse scenarios, measure handshake retries, and DTN re-route latency.
2. **Dual-Homing Policy**: codify RF fallback thresholds and hysteresis; expose to MECSAI.
3. **AFS Integration Plan**: component selection, antenna/optics path, and PPS/10 MHz distribution in OMR/RNC cabinets.
4. **Ground Tier Negotiation**: implement SCaN service-tier descriptors; schedule-aware routing.
5. **Spectrum Checklist**: band-plan JSON; preflight validator; storage of coordination artifacts in MCP.
6. **LCRNS Readiness**: KPI pack: PAT time, closed-loop tracking stability, DTN custody success rate, time-tag RMS.

## 6) Data Products
- Crosswalk JSON (machine-readable)
- RAG Dashboard for MECSAI
- ICD Reference Pack (clause excerpts with IDs)

## 7) Next Steps
- Expand matrix to full clause coverage
- Import baseline citations and SHA checksums
- Run first alignment audit on Optical Mesh Router
