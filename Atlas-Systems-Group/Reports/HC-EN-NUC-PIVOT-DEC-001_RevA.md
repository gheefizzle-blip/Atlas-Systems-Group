# HC-EN-NUC-PIVOT-DEC-001 Rev A
# Heber Campus Nuclear Technology Pivot Justification
# Pivot: NuScale LWR SMR -> Pebble-Bed HTGR (Xe-100 class) for Heber + OSY-E Commonality

Document Control
- Program: Heber Autonomous Campus / Magnetic Rail Gun Launch System
- Date: 2025-12-16
- Author: Sam (ChatGPT)
- Routing: ATB (SYS-SAFE, ICS-SEC, RELIAB, HFX, STRUCT), ARCHITECT, MECHWORK, HYDRATEK, LOADBAL, AIRFLOW, LEDGER, QUANTUM
- Status: FOR ATB REVIEW - DECISION MEMO + MASTER PLAN CHANGE REQUEST (MPC-001)

## 1. Executive Summary (No fluff)
The current Heber Campus master plan assumes NuScale LWR SMR baseload (3 x 77 MWe) integrated later in Phase 3. This report recommends a pivot of the nuclear baseload concept to a pebble-bed high temperature gas-cooled reactor (HTGR) class (Xe-100 class) as the primary nuclear architecture.

The pivot makes sense because:
- It aligns Heber's terrestrial nuclear plant with the reactor class we expect to operate at OSY-E (high temperature helium primary + TRISO fuel), maximizing real-world operational learning before orbital deployment.
- HTGR-class reactors provide higher temperature heat than LWRs, which is directly useful to our campus process stack (SOEC hydrogen, ammonia synthesis/cracking, thermal integration) and mirrors the industrial heat-driven operations we will run in space.
- It reduces "technology split-brain" across Earth and orbit: one nuclear doctrine, one fuel form (TRISO/HALEU), one helium-based thermal management philosophy, one controls and maintenance playbook.

This pivot will require a revised Heber Campus Master Plan (v0.4 -> v0.5) including: nuclear island concept, heat integration, balance-of-plant options, licensing path, and risk posture (fuel supply and NRC schedule).

ATB action requested:
- Approve the pivot as the new baseline for nuclear island engineering, with NuScale retained as a documented fallback option until licensing and fuel supply gates are cleared.
- Approve Master Plan Change Request MPC-001 to replace "NuScale SMR x3" with "HTGR (Xe-100 class) nuclear block" and to add a Brayton conversion test skid to explicitly train the OSY-E power conversion stack.

## 2. Current Baseline (What we are changing)
Heber master plan v0.4 calls for a 220 MW power system including solar, BESS, SOEC hydrogen/oxygen, ammonia synthesis and storage, ammonia-oxygen turbines with HRSG, and "NuScale SMR baseload (3 x 77 MW)" integrated later per licensing path in Phase 3. (See Master Plan v0.4 Executive Summary and Power Core block.)

This report changes ONLY the nuclear island baseline. Everything else (solar, BESS, SOEC, NH3, turbines, campus thermal integration) remains aligned, but gains a higher-grade heat source and a better learning transfer path to OSY-E.

## 3. Decision Statement (Baseline selection)
Adopt Pebble-Bed HTGR (Xe-100 class) as the Heber nuclear island baseline, structured in phases:

- Phase N0 (paper): Master Plan revision + siting and interface definition (ICDs).
- Phase N1 (pilot module): 1 HTGR module training plant (controls, maintenance, helium/SG operations).
- Phase N2 (campus baseload): Scale to 3 modules to match or exceed the NuScale 3 x 77 MWe planning intent.
- Phase N3 (OSY-E readiness): Add a Brayton (or sCO2) power conversion test skid and radiator-emulation heat rejection loop to mirror OSY-E realities.

NuScale remains as a fallback path until:
- HTGR licensing schedule is credible at the site, and
- HALEU/TRISO supply is contractually secured.

## 4. Why the pivot makes sense (technical and program logic)

### 4.1 OSY-E transfer learning is the whole point
If we intend to deploy 4 reactor units in space, we must not "learn nuclear operations" for the first time in orbit. Earth is where we earn operational maturity.

Heber is the training plant for:
- startup/shutdown sequencing
- thermal transient handling
- power conversion control loops
- leak detection and confinement discipline
- maintenance intervals and spares strategy
- instrumentation drift, alarm philosophy, and operator training
- integrated process heat dispatch (steam/heat to SOEC, NH3, turbines, district cooling)

The closer the terrestrial technology is to the orbital technology, the higher the learning transfer.

### 4.2 HTGR process heat is structurally more valuable to our campus
HTGRs are built to deliver high temperature heat for electricity and industrial applications. That is a direct match to a campus centered on hydrogen and ammonia process systems, and later, OSY-E fuel production.

Our master plan already assumes deep thermal integration ("HRSG and SMR waste heat to absorption chillers and district heating loops"). Replacing an LWR heat source with a higher-temperature HTGR heat source expands what we can do efficiently (not just low-grade heat recovery).

### 4.3 Xe-100 class steam output is not vague - it is defined
For a Xe-100 class HTGR module, published design information indicates:
- Superheated steam: 565 C, 16.5 MPa
- Main steam flow: about 78.47 kg/s (about 282.5 metric tons/hour)
- Electrical output class: 80 MWe module, scalable to a four-pack 320 MWe plant

This matters because it anchors our thermal corridor sizing (steam headers, PRVs, condensate return, heat exchangers) and lets us quantify process integration.

#### 4.3.1 Steam output scaling table (Xe-100 class)
Assuming the above per-module steam conditions and flow:
- 1 module: 78.47 kg/s = 282.5 t/h
- 3 modules (Heber baseline match): 235.41 kg/s = 847.5 t/h
- 4 modules (candidate future expansion): 313.88 kg/s = 1,130.0 t/h

These are first-order planning numbers for pipe sizing, drum capacities, and thermal integration envelopes. Final values will be vendor-validated during ICD finalization.

### 4.4 Space reality check: Rankine steam in microgravity is painful
OSY-E power conversion should not depend on a two-phase boiling/condensing loop unless we choose to accept the complexity of microgravity two-phase management (phase separation, flow instabilities, dryout control, condensation management, start/stop behavior).

NASA literature consistently treats two-phase processes in reduced gravity as a special engineering problem. Brayton-class closed cycles avoid that entire failure mode category.

This report therefore recommends:
- Heber: Steam is acceptable and financially useful for grid + industrial heat.
- OSY-E: Plan for helium Brayton (or sCO2 Brayton) conversion. Use Heber to validate the conversion stack on Earth.

### 4.5 Space reality check: pebble movement needs gravity (do not ignore this)
A classic pebble-bed reactor depends on pebbles moving downward under gravity for fuel handling and core behavior. That is a direct mismatch with microgravity unless we:
- Put the reactor in a rotating (spin gravity) module of OSY-E, or
- Use a "static pebble core" architecture (pebbles restrained, no online recirculation), or
- Shift to a prismatic TRISO HTGR in space while preserving the same fuel form and helium primary loop.

This is a gating issue. The pivot still makes sense for Heber because:
- It develops the helium/HTGR doctrine and the high-temperature process integration experience we need.
- It allows us to solve the orbital gravity problem deliberately (instead of discovering it late).

## 5. NuScale vs HTGR (straight comparison)

### 5.1 NuScale strengths (why it was a good baseline)
- LWR technology family is mature and well understood.
- NRC has completed review activities for NuScale's 77 MWe US460 SDA as of May 2025 (licensing maturity advantage).
- Fuel is standard LWR fuel (no HALEU dependency).

### 5.2 NuScale limitations for our specific architecture
- Lower temperature heat than HTGR. It supports steam and some heat recovery, but it is not optimized for high-grade industrial heat integration.
- It does not train us on helium primary systems or TRISO fuel operations, which are more relevant to the OSY-E concept we are driving toward.

### 5.3 HTGR strengths (why it is a better long-term fit)
- Designed explicitly for high temperature heat plus electricity, which aligns to SOEC and industrial processes.
- Technology alignment with an OSY-E nuclear architecture where high-grade heat and compact, closed-cycle conversion are the primary goals.

### 5.4 HTGR risks (what we must manage, not hand-wave)
- HALEU supply risk is real at the national level. We must secure fuel supply early.
- Licensing path: Xe-100 is in the NRC pre-application / construction permit pipeline. This is less mature than NuScale's SDA position.
- Orbital deployment is not "copy-paste": pebble motion and microgravity require a deliberate design decision (spin gravity module, static pebble, or prismatic).

## 6. Master Plan impacts (what must change in Heber v0.5)

### 6.1 Master plan text and diagrams
Replace:
- "NuScale SMR baseload (3 x 77 MW)" and "NuScale SMR x3 (77 MW each) below-grade, integrated later per licensing path"

With:
- "HTGR nuclear block (Xe-100 class) baseline: 3 x 80 MWe module-equivalent, scalable to 4+ modules"
- "Heber N3 includes Brayton conversion test skid for OSY-E readiness"

### 6.2 Nuclear island block changes (layout and utilities)
Expect these revisions:
- Helium primary loop equipment spaces (circulators, IHX / steam generator, purification, leak monitoring)
- Steam generator + main steam header routing to:
  - turbine-generator island and condenser
  - process steam users (SOEC preheat, NH3 cracking, district heating/cooling)
- Heat rejection and cooling infrastructure updates
- Updated hazardous analysis set (helium is inert, but high-pressure systems, hot surfaces, and turbine hall risks still drive design)

### 6.3 Thermal corridor and process integration updates
New work products:
- Thermal ICD: define steam grades (pressure levels), condensate return, feedwater chemistry, blowdown handling
- SOEC integration ICD: define steam delivery and temperature targets for HTSE coupling
- Absorption chiller tie-in: re-evaluate waste heat sources and temperature levels

### 6.4 Controls and cyber posture
- MECSAI logic will need a nuclear dispatch mode that respects reactor ramp limits and thermal inertia.
- ICS-SEC must treat the nuclear island as a separate security zone with strict interfaces.

## 7. Risk register (top items and mitigations)

R1 - HALEU / TRISO fuel availability
- Mitigation: lock supply path early, track DOE allocation programs, pre-buy lead-time, dual-source where possible.

R2 - Licensing schedule uncertainty for HTGR at our site
- Mitigation: maintain NuScale as fallback until HTGR schedule gates are cleared; begin early NRC engagement on siting and emergency planning assumptions.

R3 - OSY-E microgravity mismatch for pebble motion
- Mitigation: formalize an OSY-E reactor placement decision:
  - Option A: spin gravity reactor module
  - Option B: static pebble core (no online refuel)
  - Option C: prismatic TRISO HTGR in orbit
Choose one before ORR-level space deployment planning.

R4 - Integration complexity (steam, process heat, dispatch)
- Mitigation: publish ICDs now (power, thermal, fluids), and run a controls simulation of load-following with SOEC and turbines.

## 8. Recommended ATB decisions and next actions

### 8.1 ATB Decisions Requested
D1 - Approve HTGR (Xe-100 class) as the baseline nuclear island architecture for Heber and OSY-E doctrine alignment.
D2 - Approve MPC-001 to revise the Heber Campus Master Plan to v0.5 reflecting the pivot.
D3 - Direct MECHWORK + HYDRATEK + LOADBAL + AIRFLOW to produce updated block layouts and ICDs for the HTGR nuclear island.

### 8.2 Immediate Work Packages (execute after ATB concurrence)
WP-NUC-01 - Master Plan v0.5 update (ARCHITECT)
WP-NUC-02 - Nuclear island block layout update (MECHWORK)
WP-NUC-03 - Thermal ICD (AIRFLOW + HYDRATEK)
WP-NUC-04 - Electrical ICD and dispatch model (LOADBAL + MECSAI)
WP-NUC-05 - Licensing path memo (CODEWRITE + SYS-SAFE)
WP-NUC-06 - Fuel supply risk and procurement plan (QUANTUM + LEDGER)

## 9. Source notes (for ATB evidence pack)
This report uses publicly available vendor, NRC, and DOE information. Include these links in the ATB package binder.

SOURCES (copy/paste)
- X-energy Xe-100 overview: https://x-energy.com/reactors/xe-100
- NRC (Xe-100 inclusive content, steam conditions 565 C / 16.5 MPa): https://www.nrc.gov/docs/ML2121/ML21217A086.pdf
- INL deck (Xe-100 main steam flow 78.47 kg/s): https://dice.inl.gov/content/uploads/3/2024/11/Harlan-Bowers_X-Energy.pdf
- NuScale Power Module overview: https://www.nuscalepower.com/products/nuscale-power-module
- NRC NuScale US460 SDA project page (77 MWe module, May 2025 review completion): https://www.nrc.gov/reactors/new-reactors/advanced/who-were-working-with/applicant-projects/nuscale-us460
- DOE Nuclear 101 HTGR explainer: https://www.energy.gov/ne/articles/nuclear-101-what-high-temperature-gas-reactor
- DOE HALEU availability note (Aug 2025): https://www.energy.gov/articles/us-department-energy-distribute-next-round-haleu-us-nuclear-industry
- NASA NTRS (microgravity conditions / thermal management context): https://ntrs.nasa.gov/api/citations/20000004785/downloads/20000004785.pdf
- OSTI (pebble flow under gravity note): https://www.osti.gov/servlets/purl/2584165

End of document.
