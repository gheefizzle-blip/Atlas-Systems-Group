
# Pod-to-OSY Logistics Architecture Report  
**Hybrid NASA Technical / Engineering Design Document**  
**SDC-COMMS Program — Spear Enterprise LLC**  
**Date:** 2025-11-21  
**Document ID:** SDC-COMMS-2025-POD-OSY-LOG-01  

---

# 1. Executive Summary

This report presents the finalized architecture for launching 1‑metric‑ton pods from the Heber Magnetic Railgun Tower, aggregating them into 100‑pod magnetic clusters in a stable Low Earth Orbit (LEO) shell at ~300–400 km, and transporting them to the Orbital Shipyard (OSY) using hybrid chemical + Nuclear Electric Propulsion (NEP) tugs.  

A full technical analysis demonstrates:

- **Attempting to loft pods to 1000 km with SRBs is inefficient** and consumes 2–3 tons of propellant per pod for only a 200 m/s savings on NEP tug Δv.  
- Optimal pod apogee for clustering is **300–400 km**, achievable with a moderate SRB staged behind the 1500 m/s railgun launch velocity.  
- Pods require a small **ammonia trim engine** (Δv 20–40 m/s) for orbit circularization, phasing, and safe magnetic clustering.  
- Clustering 100 pods (≈100 tons) allows a single tug rendezvous, vastly increasing net throughput.  
- Tug architecture: **methalox booster for initial raise**, then NEP for the GEO ascent.  

This architecture satisfies KISS principles, minimizes cost, reduces SRB mass, and scales to high launch cadence (one launch every 2.5 minutes × 4 barrels = 576/day).

---

# 2. Launch System Inputs & Assumptions

## 2.1 Launch Tower Parameters
- Tower elevation: **2.2 km AMSL**  
- Tower height: **500 m**  
- Pod exit velocity: **1500–1800 m/s**  
- Peak acceleration: classified; assumed < 60 g  
- Environmental: humidity-dependent drag loss model  

## 2.2 Pod Parameters
| Parameter | Value |
|----------|-------|
| Pod dry mass | 1,000 kg (baseline) |
| Shape | Aerodynamic shell (low Cd) |
| SRB (custom) | 300 s baseline burn |
| Trim engine | Ammonia monopropellant |
| Cluster link | Electromagnetic & mechanical nodes |
| Target cluster size | 100 pods (≈100,000–120,000 kg) |

## 2.3 Tug Parameters
- Main engine: **NEP (ion/Hall cluster)**  
- Secondary: **Methalox booster (1–3 engines)**  
- RCS: ammonia or low-tox hydrazine alternative  
- Max cluster tow: **100–150 tons**  

---

# 3. Performance Analysis: Railgun + SRB

## 3.1 Railgun-Only Vertical Toss

The apogee altitude for a vertical toss:

\[
h pprox rac{v_0^2}{2g}
\]

### Case: v₀ = 1500 m/s  
\[
h pprox 115 km
\]

### Case: v₀ = 1800 m/s  
\[
h pprox 167 km
\]

**Conclusion:** Railgun alone reaches the edge of space but cannot enter a stable orbit.

---

# 4. SRB Contribution for 300–400 km Apogee

To reach the ideal clustering shell (300–400 km), an SRB must provide:

\[
\Delta v_{	ext{SRB}} pprox 1000–1500\ 	ext{m/s}
\]

This is easily achievable with:

- **Moderate thrust-to-weight (~1.5–2)**  
- **Burn time 250–300 seconds**  
- **Propellant mass fraction ~45–55%**  

This configuration yields a **3–4× smaller booster** than one sized for 1000 km.

---

# 5. Why 1000 km Apogee is a Bad Trade

A 1-ton pod reaching 1000 km apogee requires:

- **Total Δv ≈ 4.4 km/s**  
- Railgun contributes 1.5 km/s  
- **SRB must contribute ≈ 3.0 km/s (minimum)**  

Mass ratio required:

\[
m_0/m_f pprox \exp\left(rac{3000}{270 \cdot 9.81}ight) pprox 3.0
\]

Meaning:

- **67% of the pod stack becomes propellant (≈2 tons).**  
- Tug Δv savings: **~200 m/s**  

This is an irrational trade.

---

# 6. Optimal Architecture: 300–400 km Cluster Shell

## 6.1 Circularization

Pods reach apogee at ~300–400 km, then perform:

- Perigee raise: 20–40 m/s  
- Phasing: 5–10 m/s  
- Collision avoidance: 2–5 m/s  

Total trim requirement: **< 60 m/s** ammonia.

## 6.2 Cluster Assembly

### Docking Envelope:
- Relative velocity < 3 cm/s  
- Attitude error < 2 degrees  
- Proximity sensing (MECSAI supervised)

### Magnetic Link Specs:
- EM capture coils + mechanical latch  
- Load rating: 2 g lateral, 5 g axial  
- Fail-safe disengage via current pulse  

Cluster size: **~100 pods** → **100 tons**.

---

# 7. Tug Pickup & Ascent

## 7.1 Tug Rendezvous

- Tug matches orbit using **methalox micro-burn** or NEP slow-spiral.  
- Docking with full 100‑ton cluster occurs at relative velocity < 5 cm/s.

## 7.2 Chemical Kick

Raising the cluster’s perigee out of the LEO drag regime requires:

\[
\Delta v_{	ext{kick}} pprox 150–250\ 	ext{m/s}
\]

Methalox booster easily achieves this.

## 7.3 NEP Spiral to OSY (GEO)

From 400 km → GEO altitude:

\[
\Delta v pprox 3850\ 	ext{m/s}
\]

NEP achieves this over ~30–60 days depending on tug power.

---

# 8. Throughput & Scalability

### Launch cadence:
- 4 barrels × 1 pod per 2.5 minutes  
- = 24 launches/hour  
- = 576 launches/day  
- = 210,240 pods/year (theoretical max)

### Cluster throughput:
- 100 pods per cluster  
- → ~5760 clusters/year  
- Tug fleet of 6–12 NEP vehicles can maintain continuous OSY delivery.

---

# 9. Final System Architecture Recommendation

### **DO:**
- Use railgun + moderate SRB to reach **300–400 km**  
- Use ammonia trim for circularization & clustering  
- Build 100‑pod magnetic clusters  
- Use methalox + NEP tug architecture  
- Service tugs at a small LEO node (~400–600 km)

### **DO NOT:**
- Attempt 1000 km pod deliveries  
- Oversize SRBs (mass-kills logistics efficiency)  
- Force tugs to rendezvous with individual pods  
- Introduce early offloading depots (unnecessary)

This architecture is scalable, economically optimal, and physically realistic.

---

# 10. Annex A: Δv Tables

| Phase | Δv (m/s) |
|------|----------|
| Railgun launch | 1500–1800 |
| SRB | 1000–1500 |
| Ammonia trim | < 60 |
| Tug kick | 150–250 |
| NEP ascent | 3800–4000 |

---

# 11. Annex B: Mass Breakdown

| Component | Mass (kg) |
|----------|-----------|
| Pod payload + structure | 1000 |
| SRB (moderate) | 600–800 |
| Trim propellant | 5–10 |
| Docking/magnetics | 15–20 |
| Avionics + MECSAI link | 10–15 |

Total pod stack: **~1650–1850 kg**

---

# 12. Annex C: Figures (Text Descriptions)

### **Figure 1 — Pod Flight Profile**
1. Railgun launch  
2. SRB burn to 300–400 km  
3. Apogee coast  
4. Trim circularization  
5. Clustering  

### **Figure 2 — Tug Ascent Profile**
1. Tug docks with cluster  
2. Methalox perigee raise  
3. NEP spiral ascent  
4. OSY delivery  

---

**End of Document**
