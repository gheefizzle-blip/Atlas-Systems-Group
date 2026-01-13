
# ATB Report: Hydrogen Storage Architecture Determination & Launch Tower Thermal Assessment

## 1. Executive Summary
After a full evaluation of hybrid graphene–foam / metal-hydride hydrogen storage systems, the determination is clear: **hydride storage will NOT be adopted as a core storage architecture** in either the Heber Campus or the Orbital Shipyard (OSY). The system adds unnecessary complexity, cost, and maintenance burden while providing no meaningful performance benefit within our selected architecture paths.

- **Heber Campus** will use **ammonia (NH3)** as the primary hydrogen-storage medium.  
- **OSY** will use **cryogenic propellants** exclusively for large-scale storage.  
- Hydrides are **optional niche modules only**, not part of Tier‑1 design.

Additionally, a **thermal-dynamics assessment of the launch tower megastructure** must be initiated immediately due to high heat loads expected from the four-tube mag‑lift system and continuous air-evacuation cycles. This becomes an ATB action item.

---

## 2. Heber Campus: Final Hydrogen Storage Strategy

### 2.1 Chosen Architecture: Ammonia (NH3) as Primary Storage
Heber Campus is designed around **hydrogen → ammonia synthesis** for low‑cost, safe, and stable energy storage.

NH3 is superior for:
- High‑density storage
- Low‑pressure containment
- Compatibility with gas turbines
- Compatibility with cooling loops
- Integration with industrial storage standards
- Cost, safety, and operational simplicity

### 2.2 Why Hydrides Were Rejected
Hydrides introduce:
- A **third storage paradigm** (compressed H2, ammonia, hydrides)
- Higher costs
- Weight penalties
- Thermal complexity (heat needed for release)
- No operational advantage for a large-scale campus

### 2.3 Hydrogen Buffering
Only minimal compressed H₂ is needed:
- Between electrolyzers → compressors → ammonia synthesis loop  
- This is easily handled by standard gas receivers  
- **Hydrides add nothing meaningful here**

### 2.4 Final Verdict for Heber
**Hydrides removed from baseline.**  
NH3 is confirmed as the sole primary storage medium.

---

## 3. OSY: Final Hydrogen Storage Strategy

### 3.1 Chosen Architecture: Cryogenic Propellant Storage
In orbit we have:
- Vacuum  
- Low temperature background  
- Radiators already built into every major system  
- Re-liquefaction loops  
- Zero-cost insulation from vacuum environment  

Cryogenic fuels are the natural match for OSY operations.

### 3.2 Hydrides Not Required in Space
Hydrides would:
- Add mass
- Demand heat for H2 release
- Increase radiator load
- Complicate storage infrastructure
- Undermine commonality across tug, SDC, and AHM systems

Hydrides could be used for:
- Micro‑buffers in crewed modules
- Specialized emergency oxygen/hydrogen caches

But they are not appropriate for:
- Propellant storage  
- Tug fueling  
- SDC fueling  
- Bulk station commodities  

### 3.3 Final Verdict for OSY
**Hydrides removed from baseline.**  
Cryogenic storage is the sole architecture.

---

## 4. Strategic Summary

| System | Primary Storage | Secondary Storage | Hydrides Required? |
|--------|-----------------|------------------|---------------------|
| **Heber Campus** | NH3 | Standard compressed H₂ buffers | **No** |
| **OSY** | Cryogenic fuels | None | **No** |

Hydrides only remain as an experimental option—not part of production architecture.

---

## 5. Launch Tower Thermal Assessment — ATB Action Item

### 5.1 Problem Summary
The mag‑lift launch tower features:
- **Four launch tubes**  
- Pods launching **every 10 minutes**  
- **Massive electrical loads**  
- **Continuous air evacuation cycles**  
- **Thermal mass buildup** without proper reject pathways  

This system will accumulate heat faster than it can naturally dissipate unless engineered with robust thermal controls.

### 5.2 Expected Heat Sources
- Resistive heating from mag coils  
- Eddy‑current heating  
- High-current switching electronics  
- Rapid atmospheric compression and decompression  
- Vacuum pumps  
- Pod frictional air interactions  
- Electrical conversion hardware  
- Ambient desert temperatures (Heber site)  

### 5.3 Required ATB Thermal Study
The ATB must commission a complete thermal-dynamics assessment including:

1. **Steady-state thermal model**
2. **Transient thermal load model per launch cycle**
3. **Air evacuation thermodynamics**
4. **Thermal failure path analysis**
5. **Integration with NH₃ cooling loops**
6. **Peak load emergency case modeling**
7. **Fire/heat propagation within tower structure**
8. **Cooling loop redundancy and sectionalism**
9. **Impact on material fatigue and structural stresses**

This analysis becomes a **mandatory pre‑CAD gate**.

---

## 6. Recommended Cooling Architecture for Tower (Initial Concept)

### 6.1 Ammonia Cooling Backbone
The Heber campus already features:
- NH₃-based cooling  
- High thermal mass water tanks  
- Radiator systems  

This makes tower integration straightforward.

### 6.2 Proposed Features
- Subsurface ammonia cooling manifold along tower base  
- Secondary coolant bus running vertical infrastructure shafts  
- Coil array behind mag‑lift tracks for thermal pickup  
- Vacuum pump waste‑heat exchangers  
- Redundant heat-exchange branches  
- Automated MECSAI-driven flow & temperature control  

### 6.3 Resulting Benefits
- Avoid thermal creep  
- Stabilize launch cadence  
- Reduce component wear  
- Increase tower lifetime  
- Maintain operational safety margin  

---

## 7. Architectural Determination (Final)

### 7.1 Hydrogen Storage Architecture is Finalized
**NO hydride systems** will be part of the baseline design.

- Heber → **NH3 only**
- OSY → **Cryo only**

This reduces:
- Manufacturing complexity  
- Engineering overhead  
- Supply-chain burdens  
- Risk vectors  
- ATB process load  

### 7.2 Launch Tower Thermal Study is Mandatory
The ATB must formally initiate a **full thermal-dynamics assessment**.

---

## 8. ATB Action Items

### **Action Item 1 — Remove Hydrides from All Tier‑1 Designs**
- Update all ICDs  
- Update master architecture  
- Update compliance matrix  
- Notify HYDRATEK, MECHWORK, PHYSCORE  

### **Action Item 2 — Approve Heber NH3-Only Storage Architecture**
- Update Autonomous House documentation  
- Update Unified Autonomous Architecture  

### **Action Item 3 — Approve OSY Cryogenic-Only Architecture**
- Update SDC–COMMS Master Plan  
- Update NEP tug fueling ICD  

### **Action Item 4 — Commission Launch Tower Thermal Model**
- Assign PHYSCORE + AIRFLOW + STRUCT  
- Require first-pass model before CAD development  
- Add requirement to ATB’s Quality‑First Gate  

---

## 9. Conclusion
- Hydrides are **out**.  
- Ammonia and cryogenics form a clean, unified, scalable storage strategy.  
- Launch tower thermal analysis is **high priority** and cannot be delayed.  

This report is ready for ATB distribution and archival.

