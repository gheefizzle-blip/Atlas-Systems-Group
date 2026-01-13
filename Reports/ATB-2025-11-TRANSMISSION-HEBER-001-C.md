# ATB TECHNICAL REPORT  
## TRANSMISSION-ASSET EVALUATION – HEBER NORTH PARCEL (PART C)  
### Document ID: ATB-2025-11-TRANSMISSION-HEBER-001-C  
### Classification: INTERNAL – ATB / SDC-COMMS  
### Revision: A (Initial Release)  
### Date: 2025-11-22  

---

# ROUTING & APPROVAL HEADER  

**Prepared For:**  
Advanced Technology Board (ATB)  
Spear Enterprise LLC – SDC-COMMS / Autonomous House Programs  

**Prepared By:**  
Sam / GPT (Agent A – ARCHITECT Role)  

**Reviewed By:**  
(To Be Completed) – ARCHITECT / MECHWORK / MECSAI / SYS-SAFE / LOADBAL  

**Distribution:**  
ATB Board, ARCHITECT, MECSAI, MECHWORK, MCP-NAS Repository  

**Document Status:**  
Part C of 4 – *Interconnection Strategy & MECSAI Integration Model*  

---

# 1. PURPOSE  

Part C defines the **grid interconnection strategy and MECSAI integration model** for the Heber North  
15,360-acre campus, covering:

- How the 220 MW starter plant, and later 500 MW and 1.0–1.5 GW expansions, will tie into the regional  
  high-voltage transmission system.  
- How MECSAI will coordinate solar, electrolyzers, hydrogen storage, fuel cells, and campus loads to  
  maintain **stable, dispatchable, and resilient power** under both grid-connected and islanded modes.  
- How the system will behave during curtailment, outages, and black-start scenarios.  

This document is intended as a **systems architecture reference** for ATB, MECHWORK, LOADBAL, and MECSAI.

---

# 2. DESIGN ASSUMPTIONS  

1. **Transmission Line:**  
   - Adjacent HV corridor is assumed to be 115–230 kV class in early phases, with the option to extend  
     to 345 kV for 1.0–1.5 GW export in later phases (see Part B).  

2. **Solar Generation Phasing:**  
   - Phase 1: 220 MW DC/AC class solar farm, primarily TOPCon bifacial plus test blocks (First Solar CdTe).  
   - Phase 2: ~500 MW cumulative capacity.  
   - Phase 3: 1.0–1.5 GW cumulative capacity, with multiple independently controlled fields.  

3. **Hydrogen System:**  
   - Electrolyzer blocks in 5–20 MW modules.  
   - Hydrogen storage sized for multi-day operation of fuel cells at 20–80 MW baseload.  

4. **MECSAI Role:**  
   - Central supervisory AI/controller, not hard real-time PLC.  
   - Issues setpoints and schedules to plant-level PLCs and inverters, receives telemetry at sub-minute resolution.  

5. **Redundancy:**  
   - At least **N+1** for critical power-conversion equipment.  
   - Dual-ended substation topology is preferred for long-term design.  

---

# 3. HIGH-LEVEL INTERCONNECTION ARCHITECTURE  

## 3.1 Conceptual Topology  

At a high level, the power system is organized in **three buses**:

1. **DC Generation Bus** – PV arrays, DC-coupled batteries, DC-side of electrolyzers.  
2. **AC Medium-Voltage Campus Bus (13.8–34.5 kV)** – Collects inverter outputs, fuel cells, and major campus loads.  
3. **AC High-Voltage Export Bus (115–230–345 kV)** – Step-up side of GSUs, connected to the regional transmission line.  

A simplified conceptual stack:

```text
[PV Fields] ----[Fuel Cells] ----> Inverters/Transformers -> MV Campus Bus -> GSU -> HV Export Bus -> Grid
[Battery] -----/
                      |
                  Electrolyzers
                      |
                H2 Storage Banks
                      |
                 Fuel Cell Blocks
```

MECSAI supervises **all three buses**, but its control leverage is through:

- Setpoints on PV inverters (P/Q control, ramp rates).  
- Dispatch levels on electrolyzers (variable load sink).  
- Dispatch levels on fuel cells (controllable generation source).  
- Battery charge/discharge profiles (fast-response buffer).  

---

# 4. PHASED EXPORT STRATEGY (220 MW → 1.5 GW)  

## 4.1 Phase 1 – 220 MW Starter Plant  

- One primary substation near the HV line:  
  - MV collection (34.5 kV typical) from PV and fuel cells.  
  - One or two 34.5 → 115/230 kV GSUs (Generator Step-Up transformers).  
- Export Strategy:  
  - Continuous export of surplus power to the grid when hydrogen storage is nominal/full.  
  - Import capability for start-up and rare extended low-solar / low-storage events.  

### MECSAI Responsibilities in Phase 1  

- Maintain **stable export** within interconnection limits.  
- Avoid backfeeding into a weak grid during low local demand by:  
  - Increasing electrolyzer consumption.  
  - Charging batteries.  
  - Curtailing PV only as last resort.  
- Maintain hydrogen inventory levels sufficient for **nighttime and outage baseload**.  

## 4.2 Phase 2 – ~500 MW  

- Substation upgrades:  
  - Possibly add a second transformer bank and additional feeders.  
  - Consider 230 kV as the standard export level.  
- MECSAI extends coordination to multiple solar blocks and additional hydrogen units:  
  - Implements **block-wise ramping** to avoid step changes on the HV system.  
  - Can operate subsets of arrays as “swing capacity” to follow grid dispatch requests.  

## 4.3 Phase 3 – 1.0–1.5 GW  

- Likely requires:  
  - 230 kV bus with multiple GSUs, or  
  - New 345 kV intertie and substation if regional planning supports it.  
- Plant behaves less like “a solar farm” and more like a **renewable baseload station** with:  
  - Large hydrogen storage.  
  - 50–100 MW fuel cell baseload.  
  - Substantial frequency/voltage support capability.  

MECSAI at this stage becomes a **regional player**, interacting with:

- Utility EMS/SCADA.  
- Neighboring solar mega-farms (Snowflake corridor).  
- Grid operators for ancillary services (if contracted).  

---

# 5. MECSAI CONTROL ARCHITECTURE  

## 5.1 Control Layers  

1. **Plant Layer (PLC / Hard Real-Time):**  
   - Protection, interlocks, trips, breaker status.  
   - Fast-response load shedding, fault handling.  

2. **Supervisory Layer (MECSAI):**  
   - Forecast-aware scheduling (solar, load, hydrogen production).  
   - Setpoint control:  
     - PV plant power limits and Q control.  
     - Electrolyzer load curves.  
     - Fuel cell dispatch schedule.  
     - Battery charge/discharge windows.  

3. **Market/Policy Layer (Optional):**  
   - Economic dispatch based on PPA terms or market prices.  
   - Prioritization of hydrogen vs export vs internal loads.  

## 5.2 Primary Objectives  

- Maintain **N-1 reliability** at the campus level.  
- Provide **firm output** over agreed delivery windows (e.g., 10–50 MW baseload firm product, even overnight).  
- Optimize internal energy flows to minimize curtailment and maximize hydrogen production.  
- Ensure safety margins and never override plant-layer protective relays.  

---

# 6. OPERATING MODES  

## 6.1 Grid-Parallel Normal Operation  

- PV output is maximized within plant-level ratings and interconnection limits.  
- Electrolyzers absorb variable surplus to convert into hydrogen.  
- Fuel cells and batteries provide smoothing and targeted export firmness.  
- MECSAI tracks:  
  - Grid frequency / voltage.  
  - Interconnection contract limits.  
  - Hydrogen storage state-of-charge.  

## 6.2 Islanded Operation (Grid Outage)  

During a regional outage or utility-ordered islanding:

- The HV export breaker opens (intentional or unintentional).  
- The campus transitions to internal stability mode:  
  - Fuel cells become primary source.  
  - PV is constrained to satisfy internal loads and electrolyzer operation, governed by MECSAI.  
  - Electrolyzers may be throttled or shut down to conserve power, depending on hydrogen inventory.  
- MECSAI ensures:  
  - Frequency and voltage regulation via fuel cell inverters and batteries.  
  - Priority of critical loads (MECSAI core, data center, safety systems, life support for any habitat modules).  

## 6.3 Black-Start Scenario  

Black-start capability is a differentiator vs pure solar farms.

Sequence (conceptual):

1. Use stored hydrogen and fuel cells to energize:  
   - Internal LV/MV bus.  
   - MECSAI core systems.  
   - Critical auxiliaries.  

2. Re-energize MV collection systems and station service.  

3. Gradually bring PV inverters online in controlled fashion.  

4. Once stable, reclose HV connection per utility instructions.  

MECSAI coordinates all steps within constraints enforced by PLCs and protection relays.

---

# 7. CURTAILMENT MANAGEMENT  

Curtailment is both an economic and operational concern. MECSAI mitigates it by:

1. **Prioritizing Internal Utilization:**  
   - Divert surplus PV to electrolyzers and batteries whenever feasible.  

2. **Configuring Dynamic Hydrogen Production:**  
   - Ramp electrolyzer load up during high-solar, low-demand intervals.  
   - Lower electrolyzer load when grid is strained or when hydrogen storage is full.  

3. **Last-Resort PV Curtailment:**  
   - If both hydrogen storage and battery capacity are constrained and export is limited, MECSAI will curtail PV field by field, with a documented priority order.  

---

# 8. REACTIVE POWER & VOLTAGE CONTROL  

To behave like a good grid citizen, the campus must participate in Q/V regulation.

- PV inverters, fuel cell inverters, and STATCOM (if installed) can generate or absorb reactive power.  
- MECSAI will:  
  - Respect interconnection Q/V requirements.  
  - Maintain local voltage within target band at the MV bus.  
  - Avoid stressed operating points that risk instability.  

In island mode, MECSAI ensures that **voltage and frequency remain within campus standards** by coordinating reactive power sources and fast-acting assets.

---

# 9. HYDROGEN-FIRMED BASELOAD MODEL  

One of the central strategic benefits:

- Converting intermittent PV into hydrogen allows the plant to **offer firm baseload power**.  

MECSAI will:  

- Maintain hydrogen inventory targets (e.g., X days of full baseload at Y MW).  
- Control electrolyzer runtime and intensity seasonally:  
  - Heavier in high-irradiance months.  
  - Balanced with winter generation constraints.  
- Schedule fuel cells to:  
  - Run at expected baseload for contracted windows.  
  - Increase output during grid emergencies or pricing events (if market-integrated).  

Baseload examples:  

- 20 MW 24/7 fuel cell block as “anchor product,” with PV covering the production of that hydrogen.  
- 50–80 MW during critical periods to support regional reliability.

---

# 10. DATA LOGGING, OBSERVABILITY & MECSAI FEEDBACK  

For ATB, regulators, utilities, and future partners, **visibility** is crucial.

MECSAI will log at high resolution:

- PV plant output and setpoints (per block/string as feasible).  
- Electrolyzer consumption and hydrogen production rates.  
- Hydrogen storage levels and pressure/temperature.  
- Fuel cell outputs and states.  
- Battery state-of-charge, charge/discharge cycles.  
- HV export/import real and reactive power.  
- Event logs for curtailment, trips, islanding, and black-start operations.  

All major decisions (e.g., curtailment, mode changes) will be logged with:

- Timestamp  
- Triggering condition  
- Decision path  
- Safety margin at the time  

This supports:

- Alpha Protocol traceability.  
- Post-event analysis.  
- Model refining and autonomous operation upgrades.  

---

# 11. KEY FINDINGS (PART C)  

1. The Heber North campus can be architected to function as a **grid-parallel, hydrogen-firmed baseload plant**, not merely a solar farm.  
2. Phased interconnection from 220 MW to 1.0–1.5 GW is feasible with staged upgrades from 115/230 kV to potentially 345 kV.  
3. MECSAI, operating above hard real-time PLCs, will orchestrate solar, electrolyzers, hydrogen storage, fuel cells, and batteries to:  
   - Minimize curtailment.  
   - Maintain hydrogen reserves.  
   - Provide firm output.  
   - Support grid stability.  
4. Islanding and black-start capabilities give this plant a **strategic advantage** over conventional PV sites.  
5. The observability and logging framework ensures Alpha Protocol compliance and long-term system optimization.  

---

# END OF PART C  

Part D will cover:  
**Risk Register, NEPA/Tribal/FAA Review, and ATB Action Plan**  
Document ID: ATB-2025-11-TRANSMISSION-HEBER-001-D.md  

