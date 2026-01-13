# ATB Evacuation Architecture Brief  
OSY – Orbital Shipyard GEO Evacuation & Lifeboat System  
Rev A – ATB Review Package

---

## Executive Summary

The Orbital Shipyard (OSY) operates in **geosynchronous orbit (~35,786 km) directly above the Heber Campus**, housing **300–500 personnel**, with expansion planned via additional habitat wheels. A catastrophic event onboard requires a fully autonomous, robotics-assisted, 100% personnel evacuation capability.

This document presents a scalable evacuation architecture based on **GEO-capable lifeboat spacecraft (“Evac Pods”)** and a **central Lifeboat Ring** integrated with MECSAI and the robotic support fleet.

---

## 1. Mission Requirements

- Evacuate **all humans on board**, including unconscious or incapacitated individuals.  
- Maintain evacuation capability during:
  - Power degradation  
  - Radiation anomalies  
  - Fire events  
  - Depressurization  
  - Uncontrolled rotation  
  - Structural damage to one or more habitat wheels  
- Lifeboats must support:
  - **GEO deorbit burns**  
  - **Atmospheric reentry**  
  - **Autonomous landing and beaconing**  
- Evacuation architecture must **scale with OSY population growth** and additional habitat wheels.

---

## 2. Population & Pod Capacity

- **Design population band:** 300–500 personnel  
- **Evacuation seat requirement:** ≥120% of maximum planned occupancy  
- **Baseline seat requirement:** 600 seats  

### 2.1 Pod Capacity

- **Primary pod capacity:** 30 persons per Primary Evac Pod (PEP)  
- **Baseline fleet:**  
  - 20 pods × 30 seats = **600 total seats**  
  - Provides coverage for 500 people with 100 excess seats (120% capacity)

### 2.2 Scaling Rule

As OSY expands:

- For every **+60 additional permanent residents**, add **+3 pods** (90 seats).  
- Enforce rule:  
  - `Total seats ≥ 1.2 × maximum expected humans on board`  
- This rule applies regardless of habitat wheel count; pod ring capacity tracks total headcount, not geometry alone.

---

## 3. Pod Classification

### 3.1 Primary Evac Pods (PEPs)

**Role:** Main evacuation vehicle for the general population.

**Key characteristics:**

- Capacity: **30 persons** (combination of seated and stretcher positions)  
- Propulsion:
  - Dedicated propulsion module  
  - Sufficient Δv to execute **GEO deorbit burns**  
- Reentry:
  - Ablative heat shield  
  - Ballistic or lift-modulated reentry profile  
- Landing:
  - Parachutes plus airbags and/or retro-landing assistance  
  - Designed for land and ocean touchdown  
- Life Support:
  - 24–48 hour autonomous support window  
- Avionics:
  - Triple-redundant avionics stack  
  - Integrated MECSAI uplink for command and telemetry  
- Interior:
  - Rapid robotic loading and egress paths  
  - Tie-downs and restraint systems compatible with unconscious evacuees

### 3.2 Medical Evac Pods (MEPs)

**Role:** Dedicated evacuation for critical or high-dependency medical cases.

- Capacity: **10–12 critical patients** plus med support hardware  
- Equipment:
  - ICU-level life support  
  - Onboard medical monitoring  
- Flight system:
  - Same propulsion and reentry profile as PEPs  
- Fleet:
  - 2–3 pods configured as MEPs within the **20-pod baseline**, not additional to it

---

## 4. Lifeboat Ring Architecture

### 4.1 Location & Structure

- Positioned on the **non-rotating central spine** of the OSY to avoid spin-complications for docking and ejection.  
- Radially distributed **20 pod docking ports**, providing:
  - Symmetric load distribution  
  - Multiple egress vectors in case of localized damage

### 4.2 Access Corridors

- Each habitat wheel must have at least **two independent access routes** to the Lifeboat Ring.  
- Corridors include:
  - Pressurized passageways  
  - Integrated lighting and directional guidance panels  
  - Floor and wall features designed for robotic traction and maneuvering

### 4.3 Lifeboat Ring Subsystems

- Environmental isolation and zoning  
- Fire hardening and blast shielding  
- Autonomous hatch and seal control  
- Redundant power feeds and switchgear  
- CCTV and thermal sensor coverage  
- Local MECSAI uplink nodes  
- Manual human override panels for emergency control

---

## 5. Robotic Evacuation Infrastructure

Evacuation is **robot-assisted by design**, not as an optional enhancement.

### 5.1 Robot Classes

#### 5.1.1 Shepherd Units

- Primary role: **guide ambulatory occupants** from their current location to assigned pods.  
- Capabilities:
  - Visual signals (lights, projectors, AR tags)  
  - Audio guidance and instructions  
  - Corridor routing based on MECSAI commands

#### 5.1.2 Carrier Units

- Primary role: **lift, carry, and transport unconscious or incapacitated humans**.  
- Capabilities:
  - Gentle, bio-safe lifting mechanisms with head/neck stabilization  
  - Navigation in narrow corridors and through airlocks  
  - Operation in low or no lighting conditions

#### 5.1.3 Loader Units

- Primary role: **final positioning and restraint inside pods**.  
- Capabilities:
  - Seat/stretcher loading and securement  
  - Harness and restraint verification via sensors  
  - Status reporting back to MECSAI (seat locked, occupant secure, etc.)

### 5.2 Robotics & MECSAI Feedback

Each robot reports:

- Location  
- Task state (en route, loading, complete)  
- Evacuee status (conscious/unconscious, secured/not secured)  
- Faults or blocked paths

MECSAI uses this information for global optimization of the evacuation sequence.

---

## 6. MECSAI Role

MECSAI is the **mission director** for evacuation operations.

### 6.1 Major Functions

1. **Detection**
   - Monitors:
     - Structural integrity  
     - Pressurization state  
     - Fire and thermal sensors  
     - Radiation and power anomalies  
   - Triggers “Abandon OSY” state when predefined thresholds are exceeded.

2. **Alarm & Mustering**
   - Issues station-wide evacuation alerts.  
   - Assigns each human a **specific pod and seat**.  
   - Synchronizes with corridor displays, AR overlays, and robotic units.

3. **Corridor Control**
   - Seals non-critical bulkheads to create **clear paths**.  
   - Adjusts airflow and lighting to reinforce evacuation paths.

4. **Robot Tasking**
   - Dispatches Shepherds to high-density human zones.  
   - Dispatches Carriers to locations of non-moving or medically flagged individuals.  
   - Commands Loaders in pods to receive evacuees and secure restraints.

5. **Pod Readiness & Launch**
   - Polls each pod for:
     - Life support status  
     - Propulsion readiness  
     - Hatch seal integrity  
     - Seat occupancy and restraint status  
   - Determines launch order and timing.  
   - Enforces **auto-launch** when structural integrity thresholds demand immediate separation.

6. **Landing & Recovery Coordination**
   - Selects landing zones based on:
     - Weather  
     - Political stability  
     - Rescue readiness  
   - Notifies Heber Campus and partner recovery teams with trajectories and ETA.

---

## 7. GEO Evacuation Flight Profile

1. **Separation**
   - Pod undocks from Lifeboat Ring using cold-gas or low-impulse thrusters.  
   - Clears the OSY structure to a safe distance corridor.

2. **Deorbit Burn**
   - Pod performs a **Δv burn from GEO** to drop into a transfer that results in a suitable perigee for atmospheric entry.  
   - MECSAI pre-computes burn timing, with onboard autonomy providing last-second adjustments.

3. **Service Module Jettison**
   - Prior to entry, the propulsion/avionics bus separates if configured as a two-part system.

4. **Atmospheric Entry**
   - Heat shield absorbs and manages reentry heating.  
   - Pod maintains attitude and deceleration profile via RCS and/or aerodynamic control.

5. **Descent & Landing**
   - Parachute deployment sequence.  
   - Airbag or retro-thruster assisted final touchdown.  
   - Landing modes: desert, ocean, or open flat terrain.

6. **Post-Landing**
   - Beacon and locator activation.  
   - Internal life support continues until rescue.

---

## 8. Landing Zone Hierarchy

MECSAI prioritizes:

1. **Heber Campus Desert Landing Zone**  
2. **Pacific Ocean Splashdown Corridors**  
3. **Australian Outback or similar low-density, cooperative territories**  
4. Additional pre-negotiated global fallback zones

Factors:

- Meteorological conditions  
- Airspace and maritime traffic  
- Political and security profile  
- Distance from Heber Campus or allied rescue bases

---

## 9. Safety & Redundancy

### 9.1 Structural Redundancy

- Lifeboat Ring designed to maintain functionality even with partial structural damage.  
- Multiple access corridors per wheel ensure alternative routes.

### 9.2 Pod Redundancy

- Triple-redundant avionics and control paths.  
- Independent, isolated fuel and power systems.  
- Periodic self-test regime orchestrated by MECSAI.

### 9.3 Robotics Redundancy

- Overlapping capabilities between robot classes where feasible.  
- Safe failure behavior:
  - Freeze in place or return-to-safe-zone behaviors.  
  - No uncontrolled motion near humans.

### 9.4 MECSAI Redundancy

- Redundant compute cores with cross-checking.  
- Hard-coded “safe state” behaviors in case of partial MECSAI outage.

---

## 10. Open Items For ATB Review

The ATB is requested to specifically weigh in on:

1. **30-seat pod capacity**  
   - Is this the optimal trade-off between pod complexity, docking count, and separation risk?

2. **Launch Sequencing Strategy**  
   - Burst-launch all pods as fast as possible vs. tightly sequenced, path-deconflicted launches.

3. **Two-Stage Evac Option**  
   - Under what scenarios would a **lifeboat-to-bus** architecture be preferable for GEO?  
   - Is there value in a “GEO evacuation bus” that collects multiple pods before deorbit?

4. **Debris & Plume Interaction**
   - Detailed analysis of thrust vectoring, exhaust plumes, and potential debris fields during mass pod separation.

5. **Secondary Lifeboat Rings**
   - When OSY scales, should additional Lifeboat Rings be mandated on new hubs or wheels?

---

**End of ATB Evacuation Architecture Brief – Rev A**  
Ready for ATB circulation and technical deep dive.  
