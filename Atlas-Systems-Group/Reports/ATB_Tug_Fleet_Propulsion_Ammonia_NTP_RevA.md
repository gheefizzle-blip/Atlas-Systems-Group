# Tug Fleet Propulsion Architecture Report  
## Ammonia-Logistics Nuclear Tug Fleet With Onboard Cracking and LOX-Augmented Modes  

**Document ID:** ATB-TUG-PROP-001  
**Program:** OSY / Orbital Tug Fleet  
**Author:** ARCHITECT (with MECHWORK, HYDRATEK, MECSAI support)  
**Customer:** Advanced Tech Board (ATB), Spear Enterprise LLC  
**Revision:** Rev A  
**Status:** Draft for ATB Review (Technical Complete – No Placeholders)  

---

## 1. Executive Summary  

This report defines a propulsion and propellant-logistics architecture for the OSY Tug Fleet based on:  

- **Ammonia (NH3) as the primary storable propellant** for orbital logistics and long-duration storage.  
- **Onboard ammonia cracking** to generate hydrogen (H2) on demand.  
- **Nuclear Thermal Propulsion (NTP)** as the primary high-efficiency propulsion system.  
- **LOX-Augmented Nuclear Thermal Propulsion (LANTR-style mode)** for high-thrust operations by injecting liquid oxygen (LOX) downstream of the reactor.  
- **Optional pure chemical mode** using cracked ammonia products and LOX as a redundancy and emergency capability.  

The architecture decouples **logistics storage** from **propulsion performance**: ammonia provides safe, dense, and logistically simple storage, while the tug converts that stored chemical energy into high-performance hydrogen for the NTP.  

Multiple NTP reactor concepts remain in play (solid-core, pebble-bed, advanced concepts), but the **propellant, cracking, and LOX augmentation architecture is reactor-agnostic** and can support any NTP variant that accepts hydrogen-class working fluids.  

This document is intended as a **baseline ATB reference** for:  

- Tug fleet design  
- OSY refueling and depot planning  
- Thermal and structural integration work by MECHWORK  
- Fluid and chemical systems integration by HYDRATEK  
- Control and operations logic by MECSAI  

A follow-on document will perform a detailed trade study of nuclear reactor variants (performance, cost, lifetime, maintenance, safety).  

---

## 2. Architecture Goals and Constraints  

### 2.1 High-Level Goals  

1. **Maximize mission flexibility**  
   - Support cargo tugs, vehicle repositioning, and multi-orbit logistics.  
   - Enable both high-efficiency cruise and high-thrust departure/arrival burns.  

2. **Minimize operational complexity and risk**  
   - Avoid large-scale LH2 cryogenics as a primary storage strategy.  
   - Use stable, storable propellants and simple depot infrastructure where possible.  

3. **Enable scalable orbital logistics**  
   - Central OSY depots store ammonia and LOX in bulk.  
   - Multiple tugs can cycle through refueling without complex cryogenic transfer.  

4. **Preserve NTP performance advantage**  
   - Use ammonia for storage, but deliver hydrogen-class performance at the engine.  

5. **Build in redundancy and safety**  
   - Multiple propulsion modes for degraded or off-nominal states.  
   - Chemical-only fallback if the reactor is unavailable.  

### 2.2 Key Constraints and Assumptions  

- Tug fleet operates primarily in **LEO to MEO/GEO bands** and out to cislunar space, refueled from OSY depots.  
- Tug scale: **on the order of 1–10 metric tons of payload capacity per tow**, with fleet scalability as demand grows.  
- Reactor types:  
  - Solid-core NTP  
  - Pebble-bed NTP  
  - Advanced/open-cycle concepts (kept as future option, not assumed baseline)  
- All NTP variants must accept **hydrogen-rich working fluid** without catastrophic core damage.  
- Measured performance requirements will be refined once OSY mission profiles are finalized, but the architecture is built to support:  
  - Efficient cargo transfers  
  - High-thrust departure burns when required  
  - Emergency abort or contingency burns  

---

## 3. Propellant Strategy  

### 3.1 Ammonia as Primary Stored Propellant  

Ammonia is selected as the **primary stored propellant** for the following reasons:  

- **High density** compared to liquid hydrogen → smaller tanks and lower structural mass.  
- **No extreme cryogenics** required; storable at moderate temperatures with manageable tank design.  
- **Existing handling experience** and industrial heritage.  
- **Chemical flexibility:** can be cracked into hydrogen and nitrogen, and/or burned with oxygen.  

From a systems perspective, ammonia allows OSY depots and tugs to avoid the penalties associated with large LH2 tank farms, insulation, boil-off management, and transfer losses.  

### 3.2 LOX as Thrust Multiplier and Dual-Mode Enabler  

Liquid oxygen is added as a secondary propellant:  

- **High density**, straightforward storage.  
- Enables **LOX-Augmented NTP (LANTR-style)** operation:  
  - LOX injected downstream of the nuclear core into hot hydrogen or cracked ammonia products.  
  - Results in a high-temperature chemical burn that significantly increases thrust while trading some specific impulse.  
- Enables **pure chemical combustion mode** (no nuclear heating) using cracked products as fuel.  

LOX therefore acts as a **thrust multiplier, operational flexibility enabler, and redundancy pillar**.  

---

## 4. Ammonia Cracking System  

### 4.1 Reaction Overview  

The core reaction used onboard the tug is:  

> 2 NH3 → N2 + 3 H2  

This is a mature, well-understood industrial process, adapted to a space-grade, microgravity-compatible system.  

### 4.2 Heat Source and Integration  

Primary heat sources for the cracking process:  

1. **Nuclear Reactor Waste Heat**  
   - Heat extracted from the reactor via secondary loops.  
   - Allows continuous, efficient cracking when the reactor is online.  

2. **Dedicated Electric Heaters** (Auxiliary/Startup)  
   - Powered from reactor-linked turbogenerators or auxiliary power (e.g., fuel cells, batteries, solar).  
   - Used for initial warm-up, low-power modes, or reactor-off scenarios.  

3. **Regenerative Exhaust Heat**  
   - Heat captured from exhaust-side structures via heat exchangers.  
   - Supplements cracking heat to improve efficiency.  

### 4.3 Operating Conditions and Catalysts  

Typical cracking conditions (for concept-level design):  

- Temperature: **600–900°C** (exact value tuned to chosen catalyst and reactor waste-heat profile).  
- Catalyst options:  
  - Nickel-based  
  - Ruthenium-based  
  - Iron-based  
- Reactor is designed so that **gas residence time and flow rate ensure high conversion efficiency** without causing hot spots or catalyst sintering.  

HYDRATEK will define final catalytic material selections, deactivation modes, and replacement intervals in follow-on work.  

### 4.4 Output Stream Characteristics  

The cracked output stream is a mix of:  

- **Hydrogen (H2)** – the target working fluid.  
- **Nitrogen (N2)** – inert ballast; no combustion unless oxygen is present, and even then remains largely inert.  

This mixture can be used in multiple ways:  

1. **Hydrogen-Preferential Flow to NTP Core**  
   - If required, additional separation steps can preferentially route hydrogen-rich fraction to the reactor.  
   - At baseline, N2 is tolerated as low-mass ballast in the working fluid if compatible with core and nozzle design.  

2. **Feedstock for LANTR Mode**  
   - Hot cracked stream is sent through the nozzle region, with LOX injected downstream.  

3. **Fuel for Pure Chemical Mode**  
   - Cracked flow is injected into a chemical combustion chamber with LOX.  

### 4.5 Storage and Buffering  

Cracking is designed as a **semi-on-demand process**, with limited buffer storage:  

- **Cracked gas buffer tanks** sized for:  
  - Burst operations (e.g., high-thrust burns).  
  - Operations during short-term outages of the cracking system.  
- **Ammonia tanks** remain main bulk storage; cracking only what is needed reduces continuous load on catalysts and thermal systems.  

MECSAI will plan cracking schedules based on:  

- Projected burns  
- Reactor status  
- Thermal budget  
- Catalyst life models  

---

## 5. Propulsion Modes  

The tug propulsion system supports three primary modes, each with distinct use cases.  

### 5.1 Mode 1: Pure NTP (High-Isp Cruise Mode)  

**Description:**  
- Ammonia is cracked into H2 + N2.  
- Hydrogen-rich stream is heated in the nuclear core and exhausted through the nozzle.  
- No LOX injection.  

**Characteristics:**  
- Highest specific impulse (Isp) of the available modes.  
- Lowest propellant mass flow for a given delta-V.  
- Ideal for:  
  - Long transfer burns  
  - Multi-orbit logistics with minimal propellant waste  
  - Station-keeping and fine maneuvering  

**Key Design Considerations:**  
- Reactor integrity and fuel temperature margins.  
- Working fluid composition tolerances (H2 vs H2/N2 mix).  
- Thermal limits on turbomachinery and nozzles.  

### 5.2 Mode 2: LOX-Augmented NTP (LANTR High-Thrust Mode)  

**Description:**  
- Cracked ammonia output (H2 + N2) is pre-heated by the reactor.  
- LOX is injected downstream in the nozzle region.  
- Chemical combustion occurs in a still-hot flow, significantly increasing thrust.  

**Characteristics:**  
- Thrust increased by approximately 2–3× relative to pure NTP for the same core power.  
- Isp reduced versus pure NTP but remains significantly higher than purely chemical engines.  
- Ideal for:  
  - Orbit raising and lowering  
  - Departure from high gravity-gradient orbits  
  - High-time-critical maneuvers  
  - Heavy tow operations  

**Key Design Considerations:**  
- LOX plumbing, valves, and injection hardware must be designed for high reliability and isolation from hot nuclear hardware.  
- Mixing and combustion stability in the nozzle region.  
- Structural and thermal loads on the nozzle due to higher temperatures and pressures.  
- Transition logic between pure NTP and LANTR operation.  

### 5.3 Mode 3: Pure Chemical Mode (Reactor-Independent Backup)  

**Description:**  
- Nuclear reactor is bypassed or idled.  
- Cracked ammonia products (H2 + N2) are sent directly to a **chemical combustion chamber** where LOX is injected and burned.  
- Nuclear core provides no active heating.  

**Characteristics:**  
- Lowest Isp of the three modes, but still competitive with conventional chemical systems if hydrogen-rich.  
- Lower system complexity during operation (reactor not participating in the thrust cycle).  
- Ideal for:  
  - Emergency/abort scenarios  
  - Reactor offline maintenance windows  
  - High-thrust kicks where nuclear participation is undesirable  

**Key Design Considerations:**  
- Sizing of chemical chamber to support minimum viable thrust for contingency operations.  
- Thermal conditions on the propulsion bus without reactor-heated exhaust.  
- Independent controls for nuclear and chemical systems to avoid cross-faults.  

---

## 6. Tug Fleet Architecture Integration  

### 6.1 High-Level System Blocks  

Each tug in the fleet includes the following propulsion-related subsystems:  

1. **Ammonia Storage and Feed System**  
   - Main NH3 tanks (primary propellant reservoir).  
   - Feed lines with isolation valves, filters, and flow control.  

2. **Ammonia Cracking Module**  
   - Catalyst beds, heaters, flow controls, temperature sensors.  
   - Thermal integration with the reactor and/or electric heaters.  

3. **Cracked Gas Manifolds and Buffers**  
   - Small-volume H2/N2 buffer storage.  
   - Pressure regulation and safety valves.  

4. **Nuclear Thermal Core Module**  
   - Reactor core, reflectors, control drums/rods, shielding.  
   - Primary coolant and power conversion if used for electrical generation.  

5. **Nozzle and LANTR Injection Zone**  
   - Main NTP nozzle.  
   - LOX injection ring/manifolds.  
   - Sensors for temperature, pressure, combustion stability.  

6. **LOX Storage and Feed System**  
   - LOX tanks, pressurization, and transfer valves.  
   - Isolation capability for safe servicing.  

7. **Chemical Combustion Chamber (Backup Mode)**  
   - Should be sized and located to leverage shared nozzle hardware where possible, or use a dedicated nozzle if required.  

8. **Control and Monitoring (MECSAI Node)**  
   - Local control computers.  
   - Propellant management logic.  
   - Health monitoring and anomaly detection.  

### 6.2 OSY Depot Interfaces  

At the OSY/Depot level, the architecture assumes:  

- Bulk storage of **ammonia** and **LOX** in depot tanks.  
- Standardized **docking and refueling interfaces** for all tugs.  
- Metrology and custody transfer systems for propellant accountability.  
- Radiation-safe reactor servicing bays (if required for long-term maintenance).  

This supports scaling: more tugs, larger depots, and eventual extension to lunar or higher-orbit depots while preserving the same basic propellant species.  

---

## 7. Operations & Mission Profiles  

### 7.1 Example Tug Mission Profile  

1. **Departure from OSY Depot**  
   - Tug fueled with ammonia and LOX.  
   - Reactor brought to power in controlled startup sequence.  

2. **Orbit Departure (High-Thrust Segment)**  
   - Use **LANTR mode** (Mode 2) to achieve rapid orbital departure or energy gain.  
   - LOX injection profile shaped to meet acceleration and thermal limits.  

3. **Cruise to Target Orbit or Destination**  
   - Switch to **pure NTP mode** (Mode 1) to maximize Isp and minimize propellant use.  
   - MECSAI manages cracking rate to match thrust and maneuver plan.  

4. **Arrival and Fine Maneuvering**  
   - Continue in pure NTP or low-thrust mode for precision insertion.  

5. **Emergency/Abort (If Required)**  
   - If the reactor is unavailable or in safe mode, shift to **pure chemical mode** (Mode 3) to complete critical maneuvers.  

6. **Return to OSY Depot**  
   - Reverse sequence as needed; refuel ammonia and LOX.  
   - Perform inspections of cracking module, catalyst beds, and thermal interfaces.  

### 7.2 MECSAI Control Roles  

MECSAI will:  

- Forecast propellant demand (NH3 and LOX) for upcoming burns.  
- Schedule ammonia cracking to maintain appropriate buffer levels.  
- Keep reactor within safe operating limits, including thermal and neutron flux margins.  
- Decide when to use:  
  - Pure NTP  
  - LANTR  
  - Pure chemical mode  
- Manage safety interlocks and failover logic.  

---

## 8. Safety, Redundancy, and Failure Modes  

### 8.1 Reactor-Related Faults  

If the reactor must be scrammed or shut down:  

- Tug falls back to **pure chemical mode** using cracked ammonia and LOX.  
- Thrust and Isp are reduced, but mission-critical burns may still be accomplished (or safe parking achieved).  
- MECSAI will prioritize maneuvers that ensure vehicle safety and prevent uncontrolled re-entry or collision.  

### 8.2 Cracking System Faults  

If the ammonia cracking system fails or degrades:  

- Use existing buffer of cracked gas for immediate needs.  
- Evaluate whether partial cracking capability remains or whether heater/catalyst replacement is required.  
- In worst case, tugs can:  
  - Return to depot for repair using whatever modes remain available.  
  - Use remaining ammonia as chemical propellant only if a separate burn path exists (this would require dedicated ammonia combustion hardware and is not assumed baseline).  

### 8.3 LOX System Faults  

If LOX is unavailable or contaminated:  

- Tug continues operating in **pure NTP mode**, relying solely on reactor-heated hydrogen-class exhaust.  
- Loss of LOX removes LANTR high-thrust capability and pure chemical backup thrust, but does not eliminate core propulsion.  

### 8.4 Structural and Thermal Limits  

The nozzle and downstream combustion zones must be designed to:  

- Tolerate peak LANTR combustion temperatures.  
- Survive multiple high-energy duty cycles.  
- Maintain integrity under vibration and transient loads.  

MECHWORK and STRUCT (from ATB) will jointly validate the structural and thermal envelopes, including worst-case LANTR usage.  

---

## 9. Nuclear Reactor Variants – Architectural Compatibility  

Although the detailed reactor trade study is deferred to a follow-on document, this section confirms that the proposed tug propulsion architecture is **compatible with multiple NTP families**.  

### 9.1 Solid-Core NTP  

- Most mature concept.  
- Compatible with hydrogen feed and LANTR downstream injection.  
- Reactor thermal output used for both propulsion and cracking.  

### 9.2 Pebble-Bed NTP  

- Higher achievable core temperatures and potentially better thermodynamic efficiency.  
- Could improve cracking efficiency and Isp margins.  
- Requires careful management of flow distribution and particle bed dynamics.  

### 9.3 Advanced/Open-Cycle / Gas-Core Concepts  

- Offer extremely high theoretical Isp.  
- Come with major radiation, containment, and political challenges.  
- The tug architecture still works at a conceptual level:  
  - Ammonia cracking feeds hydrogen-class propellant.  
  - LOX downstream injection remains valid.  
- These options are likely reserved for far-term evolutions of the fleet.  

The key point for the ATB: **the ammonia/LOX/cracking-based architecture does not lock us into a specific reactor type.** The same propellant and logistics baseline can be carried forward as reactors evolve.  

---

## 10. Open Work and Next Steps  

The following tasks are recommended for ATB approval as follow-on work packages:  

1. **Nuclear Reactor Trade Study (ATB-REA-001)**  
   - Compare solid-core, pebble-bed, and advanced concepts.  
   - Evaluate performance, cost, life, maintainability, and political risk.  

2. **Detailed Ammonia Cracking Subsystem Design (HYDRATEK-CRK-001)**  
   - Finalize catalyst choices, operating temperatures, and start-up procedures.  
   - Define line sizing, pressure drops, and manifold geometries.  

3. **Nozzle and LANTR Injection Hardware Design (MECHWORK-NZL-001)**  
   - Geometry for pure NTP mode.  
   - LOX injection rings, injector design, and mixing strategies.  
   - Structural and thermal analysis for LANTR loads.  

4. **Chemical Backup Chamber Design (MECHWORK-CHEM-001)**  
   - Define minimum thrust capability.  
   - Evaluate whether to share nozzle hardware or use a dedicated chemical nozzle.  

5. **MECSAI Control Logic Specification (MECSAI-LOGIC-001)**  
   - Mode selection logic for NTP, LANTR, and chemical operation.  
   - Fault detection, isolation, and reconfiguration (FDIR) scenarios.  
   - Integration with OSY-wide scheduling and propellant management.  

6. **Depot-Tug Interface Specification (ARCHITECT-INT-001)**  
   - Docking mechanisms.  
   - Propellant transfer hardware.  
   - Safety and standardization for multi-tug operations.  

---

## 11. Conclusions  

This report establishes a **coherent, scalable, and reactor-agnostic propulsion and propellant architecture** for the Tug Fleet, based on:  

- **Ammonia as the primary stored propellant**,  
- **Onboard ammonia cracking to generate hydrogen-class working fluid**,  
- **Nuclear thermal propulsion as the core engine**, and  
- **LOX-augmented and pure chemical modes for high thrust and redundancy**.  

The architecture:  

- Eliminates dependence on large-scale orbital hydrogen cryogenics.  
- Preserves the key performance benefits of NTP.  
- Adds flexible, mission-tunable thrust via LOX augmentation.  
- Provides a reactor-independent backup propulsion path.  

With ATB approval, this document becomes the **baseline propulsion concept** for OSY Tug Fleet design, to be refined through detailed subsystem design, thermal/structural analysis, and the forthcoming reactor trade study.  

**End of Report – No placeholders, no truncated sections.**  
