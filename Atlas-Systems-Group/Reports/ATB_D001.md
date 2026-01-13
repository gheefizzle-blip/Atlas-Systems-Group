# ATB DIRECTIVE — ATB-D001
## Subject: Baseline Architecture Definition for the Heber Integrated Power Generation Campus
## From: ARCHITECT (Spear Enterprise Global Systems Engineering)
## To: ATB (Advanced Technical Board)
## Classification: CRITICAL INFRASTRUCTURE – MASTER SYSTEM REVIEW
## Status: ACTION REQUIRED

# 1. PURPOSE
This directive submits the baseline integrated architecture for the Heber Campus renewable–ammonia–nuclear hybrid generation system for ATB evaluation, hazard analysis, and approval to progress into subsystem specification.

# 2. SYSTEM SCOPE
The system under review is a multi-hundred-MW to multi-GW power generation complex combining oversized solar, ammonia systems, SOEC, steam blocks, optional SMR, MV distribution, substation interface, BESS layers, LOX plant, maglift integration, and data center cooling.

Objective: Deliver 24/7 firm power with Phase 1 exporting ~220 MW and scaling to 1–1.5 GW.

# 3. ARCHITECTURE OVERVIEW
## 3.1 Prime Energy Model
Solar oversized 3–5×. Nighttime firm via ammonia turbines and optional SMR. Ammonia serves as fuel, storage, and coolant.

## 3.2 24/7 Firm Output Goal
Phase 1: ~300 MW firm (70–80 MW internal, ~220 MW export). Full build: 1–1.5 GW via modular replication.

# 4. ELECTRICAL ARCHITECTURE
## 4.1 Substation (230 kV POI)
Single unified export point. GSUs for ammonia blocks and SMR. Grid-edge BESS (60–120 MW, 120–240 MWh) tied at POI for ramp shaping and grid support.

## 4.2 Campus MV (34.5 kV)
Feeds all campus loads. Plant-side BESS (1.2–2.0+ GWh) for intra-plant stability.

# 5. THERMAL & PROCESS
300 MW ammonia-fired blocks with 560°C steam turbines. SOEC-driven NH3 production. Ammonia R-717 cooling for data center and HVAC. Optional SMR for heat + baseload.

# 6. CONTROL (MECSAI)
Supervisory system dispatching solar, ammonia, SMR, SOEC, BESS, maglift, data center demands. Priority: maintain firm power, export profile, ammonia tank strategy.

# 7. SAFETY & REGULATORY (ATB)
ATB must review ammonia, LOX, steam, hydrogen, BESS, nuclear readiness. Provide standoffs, MCEs, compliance matrices.

# 8. ACTIONS REQUESTED
A. Approve or redline.  
B. Provide findings.  
C. Provide mandated changes.

# 9. DEADLINE
SRR response due within 7 days.
