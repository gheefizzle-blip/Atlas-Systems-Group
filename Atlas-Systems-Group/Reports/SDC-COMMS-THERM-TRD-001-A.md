# NATIONAL AERONAUTICS AND SPACE ADMINISTRATION
**Advanced Technology Board (ATB)**  
**Thermal Systems Panel — Internal Memorandum**  
**Document ID:** SDC-COMMS-THERM-TRD-001-A  
**Date:** 2025-11-07  
**Distribution:** ATB / MECHWORK / AIRFLOW / PHYSCORE / MECSAI  

---

## SUBJECT
**Phase A Trade Study – Two-Phase Thermal Loop Integration for Space Data Center (SDC & COMMS)**

---

### SUMMARY
This memorandum documents the Phase A trade study comparing three advanced thermal management architectures for orbital data center applications operating under micro-/zero-gravity conditions. The study was jointly executed by MECHWORK, AIRFLOW, and PHYSCORE with integration oversight from MECSAI.

---

### 1. OBJECTIVE
Determine the optimal configuration (passive, pumped, or hybrid) for rejecting up to 15 kW per compute bay while meeting ΔT < 5 °C between die and sink, minimizing radiator mass, and ensuring compatibility with MECSAI predictive control.

---

### 2. CANDIDATE ARCHITECTURES

| Variant | Circulation | Strengths | Liabilities |
|----------|--------------|------------|--------------|
| **A – Loop Heat Pipe (LHP)** | Capillary (Passive) | Zero moving parts, high reliability | Length and start-up limits |
| **B – Pumped Two-Phase Loop (PTPL)** | Pump-Driven | Tight temperature control, long reach | Pump wear, power draw |
| **C – Hybrid Cascade** | Capillary + Micro-Pump | Passive safety + active modulation | Higher complexity, dual-loop mass |

---

### 3. PERFORMANCE TRADE

| Load (kW) | A – LHP | B – PTPL | C – Hybrid |
|-----------|----------|----------|------------|
| 5 | 38 kg (0 W) | 31 kg (+35 W) | 33 kg (+18 W) |
| 10 | 74 kg (0 W) | 58 kg (+50 W) | 61 kg (+25 W) |
| 15 | 110 kg (0 W) | 82 kg (+65 W) | 85 kg (+33 W) |

Hybrid loop delivers ~20 % radiator mass savings at < 30 % pump duty.

---

### 4. CONTROL INTEGRATION (MECSAI INTERFACE)
**Sensors:** evaporator T, condenser T, loop P, vapor fraction, pump RPM.  
**Actuators:** pump PWM, thermal control valve, heaters.  
**Logic Snippet:**  
```
IF ΔT_chip > 5°C THEN increase pump_PWM + open TCV
IF ΔP_loop > limit THEN vent/purge sequence
IF eclipse_mode = TRUE THEN enable freeze_guard heaters
```

---

### 5. RELIABILITY ASSESSMENT
| Metric | A | B | C |
|---------|---|---|---|
| MTBF (h) | > 80 000 | 20–30 000 | > 60 000 |
| Service Need | None | Pump | Pump + check |
| EMI Noise | None | Moderate | Low |

---

### 6. RECOMMENDATION
**Baseline:** Hybrid Cascade Loop (C).  
Provides the best trade of mass, power, and fault tolerance. Integrates natively with MECSAI’s supervisory control.

**Risks to retire prior to CDR:**  
- Freeze/thaw validation (–60 °C → +40 °C).  
- Capillary–pump interface stability > 2× load.  
- EMI suppression within compute bay.

---

### 7. ACTION ITEMS
1. MECHWORK + AIRFLOW – Publish Thermal ICD v1.0.  
2. PHYSCORE – Run transient simulation (0→15 kW / 5 min).  
3. MECSAI – Implement digital twin control test.  
4. ATB – Schedule SRR in T+14 days.  

---

**Prepared By:**  
*MECHWORK / AIRFLOW / PHYSCORE Joint Team*  

**Approved For Distribution:**  
───────────────────────────────  
**ARCHITECT** – Project Director    Date: _________  
**SYS-SAFE** – ATB Chair        Date: _________  
