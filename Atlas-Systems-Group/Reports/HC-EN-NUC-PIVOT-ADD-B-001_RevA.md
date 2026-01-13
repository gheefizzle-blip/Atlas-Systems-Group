# HC-EN-NUC-PIVOT-ADD-B-001 Rev A
# Addendum B: Dual Secondary Heat Dispatch Concept
# Topic: HTGR heat dispatch to (1) SOEC steam train and (2) ammonia cracker preheat

Document Control
- Program: Heber Autonomous Campus / OSY-E
- Date: 2025-12-16
- Author: Sam (ChatGPT)
- Routing: ATB, ARCHITECT, HYDRATEK, AIRFLOW, LOADBAL, MECHWORK, SYS-SAFE, ICS-SEC, MECSAI
- Status: FOR ATB REVIEW

## 1. Purpose
Capture a control-grade concept for how an HTGR-class reactor supplies useful heat into two different process paths without risky "coolant swapping":
- Path 1: Water/steam train for SOEC steam supply and (optionally) steam turbine/HRSG integration at Heber.
- Path 2: Ammonia feed preheat into an NH3 cracker to produce H2 for night operations when H2 buffer is low.

Key design principle:
- DO NOT switch the reactor coolant between water and ammonia.
- Use a helium primary loop with an Intermediate Heat Exchanger (IHX), then dispatch heat to dedicated secondary loops.

## 2. Why dedicated loops (not coolant conversion)
Water and ammonia are fundamentally different fluids for materials, safety, and operations.
Switching fluids through shared piping increases:
- contamination risk,
- corrosion/material compatibility risk,
- outage frequency,
- failure modes.

A proper industrial approach is:
Helium primary -> IHX -> intermediate heat transport -> split to two users via isolated heat exchangers.

INL process heat literature commonly frames HTGR process heat transfer using IHX / intermediate heat transport to power conversion or industrial loads.

## 3. System concept (block level)

### 3.1 Primary loop (reactor side)
- Working fluid: helium (HTGR primary)
- Components:
  - reactor core and vessel
  - helium circulators
  - helium purification/cleanup
  - primary-to-intermediate IHX (high integrity barrier)

### 3.2 Intermediate heat transport loop (IHTL)
Baseline recommendation for Heber:
- Use an intermediate loop medium selected for temperature range and materials (e.g., molten salt or other qualified intermediate media) to move heat safely to process users through a Secondary Heat Exchanger (SHX) / Process Heat Exchanger (PHX).

Baseline recommendation for OSY-E:
- Keep the number of loops minimal and maximize reliability:
  - helium primary -> Brayton heat input heat exchanger (power conversion)
  - separate, tightly controlled process heat branch only if required by the fuel plant

### 3.3 Heat users
User 1 - SOEC steam train:
- Feedwater preheat -> steam generator -> superheat -> SOEC steam header
- Condensate return and water treatment as required

User 2 - NH3 preheat and cracking:
- NH3 storage -> pump -> preheater (heat exchanger) -> cracker (catalyst bed) -> H2 cleanup (e.g., PSA/membrane) -> turbine/fuel cell feed
- N2 handling: vent, store, or use as inerting gas based on site needs

## 4. Operating modes and MECSAI dispatch logic

### Mode M1 - Day solar surplus (maximize production)
Goals:
- Run SOEC primarily on solar electricity.
- Use HTGR heat to reduce SOEC electrical demand (steam generation/superheat).
- Fill H2 buffer and convert excess into NH3 for dense storage.

Control logic (high level):
- If PV_surplus > threshold and BESS_SOC > threshold:
  - prioritize SOEC electricity from PV
  - dispatch HTGR heat to steam train (User 1)
  - NH3 cracker stays at idle/hot-standby or off
  - store H2; synthesize NH3 with excess

### Mode M2 - Night operations (consume stored H2)
Goals:
- Meet electrical demand with fuel cells/turbines from stored H2 first.
- Keep NH3 cracker as a reserve path.

Control logic:
- If PV < threshold and load > threshold:
  - if H2_buffer > H2_min:
    - run fuel cells/turbines on H2
    - keep cracker off
  - else:
    - enable NH3 preheat and cracker
    - route cracked H2 to generation
    - manage N2 byproduct

### Mode M3 - H2 buffer low (activate cracker)
Trigger:
- H2_buffer <= H2_min OR forecast indicates H2 shortfall before morning PV ramp

Actions:
- Open NH3 preheat valve
- Ramp cracker inlet temperature (controlled)
- Confirm conversion and H2 purity before feeding turbines/fuel cells
- Enable additional cleanup if purity fails

Why preheat is valuable:
- Ammonia decomposition is endothermic and requires significant heat input; literature notes high temperatures are typically required for high conversion (example ranges over 400 C for very high conversion depending on catalyst and conditions).

## 5. Key engineering notes

### 5.1 Ammonia cracking temperature and heat duty
Ammonia decomposition is endothermic and typically needs elevated temperature and a catalyst to reach high conversion. Example literature states high temperature requirements for very high conversion (often hundreds of degrees C, commonly cited in the 500-900 C range depending on system). This is exactly where HTGR process heat is valuable.

Design implication:
- The preheater should be sized to bring NH3 close to cracker operating temperature using reactor heat, minimizing electrical heaters.

### 5.2 Isolation and safety
Minimum isolation philosophy:
- Helium primary is isolated from all chemical process fluids by:
  - IHX barrier
  - intermediate loop barrier
  - process heat exchanger barrier

Hard requirements:
- double isolation where practical
- leak detection at each boundary
- automatic isolation valves
- purge and vent paths
- ammonia detection and emergency ventilation at NH3 equipment

### 5.3 OSY-E caution: avoid two-phase Rankine baselines
In microgravity, two-phase flow behavior (boiling/condensation, phase separation, instabilities) is a known engineering challenge with special design needs. NASA references exist specifically on microgravity two-phase flow and phase separation considerations.

Implication:
- OSY-E should baseline closed Brayton conversion (dynamic) rather than steam Rankine, unless we explicitly choose to pay the complexity cost.

## 6. Interfaces (ICD impacts)
New/updated ICDs:
- NUC-HTR-ICD-001: Helium primary to IHX boundary conditions (T, P, flow, allowable delta-P)
- THERM-DISP-ICD-001: heat dispatch manifold (valve states, bypass logic, dump heat path)
- SOEC-STEAM-ICD-001: steam grade requirements (P, T, allowable impurities, flow modulation)
- NH3-CRACK-ICD-001: NH3 inlet conditions, cracker target temperature, conversion verification, H2 purity spec
- ELEC-DISP-ICD-001: MECSAI logic states, ramp limits, interlocks, fail-safe states

## 7. Risks and mitigations (top)
R-B1 - Cross-contamination between loops
- Mitigation: multi-barrier heat exchange, leak detection, automatic isolation, pressure hierarchy (design pressures to force leak direction into safer volume).

R-B2 - Cracker performance and purity variability
- Mitigation: inline H2 purity monitoring, redundancy in cleanup, conservative turbine/fuel cell inlet specs.

R-B3 - Thermal transient stress in heat exchangers
- Mitigation: ramp-rate limits, bypass lines, preheat staging, validated transient models.

R-B4 - Microgravity two-phase issues (OSY-E)
- Mitigation: closed Brayton baseline; avoid boiling/condensing loops.

## 8. Next work packages
WP-B-01 (HYDRATEK + AIRFLOW) - draft a PFD/P&ID-level heat dispatch manifold with valve list, sensors, and emergency dump path.
WP-B-02 (LOADBAL + MECSAI) - implement control state machine for M1/M2/M3, including forecast-based preemptive cracker activation.
WP-B-03 (MECHWORK) - layout for: IHX, intermediate loop equipment, steam generator, NH3 preheater, cracker skid, and maintenance access.
WP-B-04 (SYS-SAFE + HFX) - hazard review: ammonia toxicity, hydrogen ignition, isolation philosophy, alarm philosophy.

## 9. Evidence pack - sources
- INL NGNP study on integration of HTGR with high-temperature electrolysis:
  https://inldigitallibrary.inl.gov/sites/sti/sti/4886652.pdf
- INL process heat exchanger options and IHX / intermediate heat transport loop framing:
  https://inldigitallibrary.inl.gov/sites/sti/sti/5144345.pdf
- NRC HTGR training / steam and process heat considerations (context for SG/IHX):
  https://www.nrc.gov/docs/ML1921/ML19214A096.pdf
- NASA closed Brayton cycle power converter (space nuclear power conversion development):
  https://ntrs.nasa.gov/api/citations/20100026654/downloads/20100026654.pdf
- NASA Brayton cycle development status and architecture (turbo-alternator, heat exchangers):
  https://ntrs.nasa.gov/api/citations/20020038204/downloads/20020038204.pdf
- NASA microgravity liquid-gas two-phase flow (phase separation and component behavior):
  https://ntrs.nasa.gov/api/citations/20190001795/downloads/20190001795.pdf
- NASA two-phase processes in microgravity whitepaper (boiling/condensation challenges):
  https://ntrs.nasa.gov/api/citations/20210023352/downloads/KhusidBoris_Two_Phase_Processes_Whitepaper_110121.pdf
- Ammonia decomposition review (hydrogen from ammonia cracking, catalyst and process overview):
  https://pubs.acs.org/doi/10.1021/acs.iecr.1c00843
- Example literature noting endothermic nature and high temperature requirements for high conversion:
  https://www.sciencedirect.com/science/article/abs/pii/S036031992303077X
  https://www.sciencedirect.com/topics/engineering/ammonia-decomposition

End of addendum.
