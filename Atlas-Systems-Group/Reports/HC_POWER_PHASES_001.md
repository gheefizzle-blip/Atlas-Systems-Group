# HEBER CAMPUS POWER ARCHITECTURE – PHASE 1, 2, 3 MASTER REPORT

## 1. INTRODUCTION
This document defines the baseline load architecture, generation requirements, and phased expansion plan for the Heber Campus, including internal consumption, launch systems, data centers, hydrogen/ammonia production, and future growth.

Scope includes:
- Phase 1: 220 MW plant
- Phase 2: 1.0 GW plant
- Phase 3: 1.5 GW plant
- Launch Tower v1 (4-barrel, 1-ton pods)
- Launch Tower v2 placeholder (future heavier pods, higher velocity)
- Data Center #1 and #2
- Full internal load envelopes (average + peak)
- MECSAI priority stack

## 2. DESIGN REFERENCES
### 2.1 Launch Tower v1 Baseline
- 4 chambers
- 10-minute cycle per chamber
- Operational cadence: 24 launches/hour
- Pod mass: 1,000 kg
- Apogee: 350–400 km
- Exit velocity: ~2 km/s
- Electrical per launch: ~3 MWh
- Total Tower v1 Load: ~90 MW continuous

### 2.2 Data Center / MECSAI
- Data Center #1: 50 MW IT, 60 MW facility
- Data Center #2: identical for Phase 2/3
- MECSAI Core: <1 MW, Tier 00

### 2.3 H2/O2/NH3 System
- Phase 1 SOEC: 20–30 MW daytime
- NH3 synthesis: 4 MW
- O2 compression: 1.5 MW
- Total: 25–35 MW

### 2.4 Campus Operations
- Baseline: 10–15 MW
- Peak: 15–20 MW

## 3. PHASE 1 – 220 MW GENERATION
### 3.1 Internal Load Envelope
- Tower v1: 0–90 MW
- DC #1: 20–60 MW
- MECSAI: <1 MW
- SOEC/NH3: 0–35 MW
- Campus: 10–15 MW
- Thermal: 3–5 MW
- Full theoretical max: ~210 MW

### 3.2 Operating Modes
**Mode L – Launch Priority**
~154 MW → ~65 MW margin

**Mode C – Compute/Chemistry**
~110 MW → ~110 MW margin

**Mode G – Grid Revenue**
~95 MW → ~125 MW export

## 4. PHASE 2 – 1.0 GW GENERATION
- Add SMRs, DC #2, expanded chemistry
- Internal heavy load: ~340 MW
- Margin: ~660 MW

## 5. PHASE 3 – 1.5 GW GENERATION
### Launch Tower v2
- Mass: 2–5 tons
- Energy per launch: 6–9 MWh
- Cadence: 24/h
- Tower v2 Load: ~200 MW design placeholder

### Internal heavy load
~660–710 MW → ~800 MW margin

## 6. MECSAI PRIORITY STACK
1. Tier 00 – MECSAI
2. Tier 0 – Life Safety
3. Tier 1A – Launch Tower
4. Tier 1B – DC SLA Floor
5. Tier 2 – Industrial/Chemistry
6. Tier 3 – Deferrable

## 7. SUMMARY BY PHASE
**Phase 1:** 220 MW, supports Tower v1 + DC #1  
**Phase 2:** 1.0 GW, adds DC #2, huge surplus  
**Phase 3:** 1.5 GW, Tower v2 enabled, massive margin

## 8. NEXT STEPS
- Parametric launch equations
- MECSAI dispatch curves
- ATB routing and review
