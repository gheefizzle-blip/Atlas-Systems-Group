
# Launch Tube & Pod Diameter Determination Report
## For ATB Review — Magnetic Rail Gun Launch System

## 1. Purpose
This report defines the engineering, physics, and vacuum performance criteria required for selecting launch tube diameter and pod diameter. These variables directly determine vacuum pump size, power consumption, heating loads, structural loads, electromagnetic coil geometry, and operational cadence. The ATB shall use this report as the foundation for determining final tube and pod geometry.

## 2. Key Variables
- **Tube Inner Diameter (Dt)**
- **Pod Outer Diameter (Dp)**
- **Radial Clearance (C = (Dt - Dp)/2)**
- **Tube Length (L = 500 m baseline)**
- **Target Launch Pressure (Pf)** — candidates: 1 mbar, 0.1 mbar, 0.01 mbar
- **Pump-Down Time (t_evacuate = 480 seconds)**

## 3. Tube Volume
The geometric tube volume:
```
V_tube = π * (Dt^2) / 4 * L
```

This volume controls the total mass of air to be removed.

## 4. Effective Pumping Speed Requirement
Pump-down follows:
```
P(t) = P0 * exp( -S_eff * t / V )
```
Solve for S_eff:
```
S_eff = (V_tube / t_evacuate) * ln(P0 / Pf)
```
**Scaling:** S_eff ∝ Dt²  
Doubling Dt → 4× required pumping speed.

## 5. Power Requirements
Theoretical minimum:
```
W = nRT * ln(P0 / Pf)
```
Real systems require **0.8–1.2 MW per tube** for 1 m class diameters. Larger diameters increase this proportionally with mass flow.

## 6. Heat Rejection
100% of pump electrical energy becomes heat. A tower will reject:
- **3–5 MW thermal** continuously during pump-down cycles  
Integrates into ammonia absorption cooling and district thermal loops.

## 7. Structural Considerations
Larger Dt requires:
- Thicker shell walls to resist collapse
- Higher material stiffness
- Better buckling prevention
- Dynamic stability control

Residual internal pressure is nearly zero → external atmospheric 101 kPa acts radially inward.

## 8. Pod Aerodynamics at Partial Vacuum
Pod cross-section:
```
A = π * (Dp^2) / 4
```
Clearance C affects:
- Slip flow / transitional regime aerodynamics  
- Heating from rarefied drag  
- Potential wall interactions under misalignment  
Pf selection must reflect this.

## 9. Electromagnetic (Rail/Coil) Geometry Coupling
Tube diameter directly affects:
- Coil diameter
- Inductance
- Field strength
- Coil spacing
- Mechanical loading  
Bigger tube → heavier and more expensive coil system.

## 10. ATB Evaluation Requirements
The ATB shall evaluate at minimum:
- Dt in **0.8 m, 1.0 m, 1.2 m**  
- Dp such that **C = 15–25 mm** nominal  
- Pf: **1 mbar**, **0.1 mbar**, **0.01 mbar**
- Pump-down feasibility  
- Power and thermal loads  
- Structural risks  
- Coil and EM scaling impacts  
- Manufacturing viability of long tubes

## 11. Deliverables Required from ATB
1. Selected tube diameter Dt  
2. Selected pod diameter Dp  
3. Required radial clearance C  
4. Selected launch pressure Pf  
5. Calculated S_eff and required pump capacity  
6. Electrical and thermal system impacts  
7. Final recommendation for design freeze  
