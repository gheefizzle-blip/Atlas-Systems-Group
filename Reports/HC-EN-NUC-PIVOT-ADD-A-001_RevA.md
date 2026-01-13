# HC-EN-NUC-PIVOT-ADD-A-001 Rev A
# Addendum A: OSY-E Reactor Fuel Handling in Microgravity
# Topic: Pebble movement, refueling strategy, and spent fuel handling options

Document Control
- Program: Heber Autonomous Campus / OSY-E
- Date: 2025-12-16
- Author: Sam (ChatGPT)
- Routing: ATB, ARCHITECT, PHYSCORE, MECHWORK, HYDRATEK, SYS-SAFE, RELIAB, HFX
- Status: FOR ATB REVIEW

## 1. Purpose
This addendum resolves a critical gating issue raised by the HTGR pivot:
- A classic pebble-bed reactor assumes gravity-driven granular flow and/or gravity-driven pebble recirculation.
- OSY-E baseline environment is microgravity, which breaks that assumption.

We must baseline an orbital fuel-handling architecture that:
- preserves the value of HTGR/TRISO doctrine,
- is mechanically reliable with minimal crew intervention,
- closes the loop on spent fuel handling as an asset (shielding mass) rather than a liability.

## 2. Non-negotiable physics constraint (do not hand-wave)
Many pebble-bed reactor concepts assume continuous, gravity-driven circulation of fuel pebbles through the core and discharge chutes. This is embedded in power-shaping, burnup history, and core behavior modeling. See example references describing gravity-driven circulation and granular flow behavior.

Implication:
- In microgravity, "pebbles drain downward" is not a given.
- Any design that depends on that behavior must introduce an equivalent effective gravity or a mechanical transport mechanism.

## 3. Options (OSY-E fuel handling architectures)

### Option A - Spin-gravity pebble-bed module (true moving pebbles)
Concept:
- Place the reactor in a rotating module (ring or centrifuge arm) so the pebble bed experiences a steady effective gravity (g_eff).
- Use g_eff to drive:
  - downward pebble motion,
  - controlled discharge into a collection channel,
  - recirculation or packaging.

Pros:
- Preserves the primary pebble-bed advantage: online or semi-online refueling.
- Preserves core physics assumptions tied to pebble circulation.
- Potentially simplest spent-fuel routing (gravity-assisted chutes).

Cons:
- Structural and dynamics penalty: rotating mass + shielding is heavy and creates vibration/imbalance sensitivities.
- Adds integration constraints to OSY-E: bearings, spin-up/spin-down, docking constraints, crew access safety.
- More failure modes (rotating interfaces, seals, balance management) than a static module.

Where it fits:
- Only if OSY-E already needs spin gravity for humans or other systems.
- Otherwise it is likely an over-build for early OSY-E.

### Option B - Static pebble core (no online recirculation)
Concept:
- Use TRISO pebbles as a packed bed, but treat the reactor as a "campaign" core:
  - pebbles are loaded and restrained,
  - no continuous recirculation,
  - core is replaced on a planned maintenance schedule.

Pros:
- Eliminates microgravity pebble transport mechanisms (major reliability win).
- Keeps TRISO + helium primary doctrine.
- Simplifies controls and reduces moving parts.

Cons:
- Refueling is batch: you swap a shielded module or cartridge, not trickle-refuel.
- Requires planned downtime or redundant reactor modules for continuous power.
- Core burnup and power profile management differs from a circulating pebble concept.

Where it fits:
- Best baseline for early OSY-E where reliability and simplicity dominate.

### Option C - Prismatic TRISO HTGR (TRISO fuel, no pebbles)
Concept:
- Use TRISO fuel in prismatic blocks (or other fixed geometry) with a helium primary loop.
- No pebble transport at all.

Pros:
- Preserves the best parts of HTGR doctrine (high temperature helium primary, TRISO fuel).
- Avoids granular-flow / pebble-handling entirely.
- Mature path for tight mechanical packaging and predictable fuel geometry.

Cons:
- Refueling is batch and more akin to conventional core maintenance.
- Manufacturing/supply chain differs from pebble fabrication and handling.

Where it fits:
- Strong baseline candidate for OSY-E if we want HTGR benefits without microgravity pebble logistics.

### Option D - Mechanical pebble transport in microgravity (conveyors/augers/pushers)
Concept:
- Force pebble motion through the bed using mechanical devices, gas-driven transport, or buoyancy tricks.

Pros:
- Preserves a version of "moving pebbles" without requiring spin gravity.

Cons (major):
- Reliability trap: high temperature + radiation + dust + wear + jam risk.
- Hard to inspect/repair in orbit.
- Control complexity and failure consequences are large.

Where it fits:
- Only as a later upgrade after extensive ground test data, or if Option A is rejected and online refueling is still mandatory.

## 4. Recommendation (baseline and upgrade path)
Baseline for OSY-E (Rev A):
- Option C (Prismatic TRISO HTGR) OR Option B (Static pebble campaign core)
- Primary loop: helium.
- Power conversion: closed Brayton (dynamic) as baseline to avoid two-phase microgravity complexities (see Addendum B and NASA references on two-phase behavior in microgravity).

Upgrade path (conditional):
- Option A (Spin-gravity moving pebbles) only if OSY-E adopts spin gravity for broader reasons, and we can justify the structural and dynamics penalties.

Explicitly NOT baseline:
- Option D mechanical recirculation in microgravity (too many failure modes).

## 5. Spent fuel handling - treat it as an asset
Spent pebbles/blocks are not "trash". They are:
- radiation shielding mass,
- ballast mass,
- potentially a feedstock for future reprocessing concepts (policy dependent).

Baseline handling concept:
- Package spent fuel into shielded casks.
- Store casks in a dedicated "nuclear yard" zone of OSY-E with:
  - known geometry,
  - remote handling,
  - passive heat rejection,
  - clear keep-out zones and dosimetry.

Optional uses:
- Integrate casks into a shielding berm around high-value equipment (computing, crew areas), with verified radiation transport analysis and strict structural restraints.

Avoid baselining "dispose to Jupiter":
- Energetically expensive and slow.
- Provides little operational value compared to controlled on-orbit storage and shield utilization.
- If deep-space disposal is ever chosen, it should be a separate policy and mission design decision, not a reactor ops baseline.

## 6. Interfaces (ICD impacts)
New/updated ICDs required:
- NUC-FUEL-ICD-001: Fuel module geometry, handling fixtures, docking/robot interface, cask standards.
- NUC-RAD-ICD-001: Shielding requirements, keep-out zones, dosimetry points, radiation transport model assumptions.
- NUC-THERM-ICD-001: Decay heat rejection interface (cask heat paths, radiator coupling if required).
- NUC-OPS-ICD-001: Refueling cadence, redundancy policy, downtime policy, spares and tooling.

## 7. Risks and mitigations (top)
R-A1 - Microgravity invalidates pebble flow assumptions
- Mitigation: baseline Option B/C; treat Option A as upgrade.

R-A2 - Decay heat management for stored spent fuel
- Mitigation: passive thermal design, cask heat paths, validated heat rejection.

R-A3 - Robotic handling complexity
- Mitigation: standardize lifting points, capture features, and alignment guides; ground-test the end-to-end handling path at Heber.

R-A4 - Regulatory/policy constraints for nuclear material in orbit
- Mitigation: begin compliance track early (SYS-SAFE + CODEWRITE), define containment philosophy and accident analysis.

## 8. Next work packages
WP-A-01 (PHYSCORE) - g_eff sizing study for Option A (spin gravity) including dynamics and vibration budget.
WP-A-02 (MECHWORK) - CAD envelope for Option B/C fuel module and cask storage rack.
WP-A-03 (RELIAB) - FMEA comparing Options A/B/C/D (jam risk, single point failures, maintainability).
WP-A-04 (SYS-SAFE) - containment and accident analysis outline for orbital nuclear operations.

## 9. Evidence pack - sources
- ORNL report noting "continuous gravity-driven circulation of fuel pebbles" (core behavior modeling context):
  https://info.ornl.gov/sites/publications/Files/Pub150728.pdf
- APS granular flow analysis in pebble-bed reactors (granular behavior and slow drainage context):
  https://link.aps.org/doi/10.1103/PhysRevE.74.021306
- NRC appendix on gas and pebble bed reactors and fuels (spent fuel considerations context):
  https://www.nrc.gov/docs/ml1204/ml12045a014.pdf
- NASA microgravity two-phase processes overview (why we avoid two-phase Rankine baselines in orbit):
  https://ntrs.nasa.gov/api/citations/20210023352/downloads/KhusidBoris_Two_Phase_Processes_Whitepaper_110121.pdf
- NASA microgravity liquid-gas two-phase flow report (phase separation and component behavior in 0-g):
  https://ntrs.nasa.gov/api/citations/20190001795/downloads/20190001795.pdf

End of addendum.
