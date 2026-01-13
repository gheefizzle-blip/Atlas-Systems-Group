# APPENDIX B
# Battery Energy Storage System (BESS) Technology Selection and Bankability Doctrine
#
# Document ID: HC-MGD-001-APP-B
# Revision: A (Baseline)
# Status: Draft - Governance Review
# Date: 2025-12-31
# Related Documents: HC-MGD-001, heber_autonomous_campus_master_plan_v_0.4
#
# NOTE: ASCII-only document. Use hyphen '-' only.

====================================================================
B.1 PURPOSE AND SCOPE
====================================================================

This appendix defines the baseline doctrine for selecting and contracting utility-scale battery
energy storage systems (BESS) for the Heber Campus.

The doctrine is written to match the campus power priority order and firming requirements.
BESS exists to buffer renewable variance and support resilient operations, not to serve as a
science project or an energy-density showcase.

This appendix is chemistry-agnostic by design. It enforces bankability (financeable) and
insurability (loss-control compatible) as hard gates. Price is a primary driver after gates.

====================================================================
B.2 PROJECT-SPECIFIC BESS BASELINE (FROM PROGRAM DOCS)
====================================================================

Planning baseline includes a 500 MWh BESS block with a dedicated substation and deluge,
and a site plan requirement for 360-degree fire lanes.

Operational doctrine:
- Internal power priority order places battery charging below critical safety systems, data
  center uptime, SOEC stable bands, and chemical plant steady-state duty.
- Firming and resilience are explicitly required to ride through renewable variance using
  battery buffering (plus firm sources and load shaping).

MECSAI supervisory doctrine is expected to monitor battery SOC as a core control variable.

(See References: Program Docs)

====================================================================
B.3 DEFINITIONS (FOR CONTRACTING)
====================================================================

BESS:
- A stationary energy storage system (ESS) that stores electrical energy and discharges it
  later to support grid services, firming, and resilience.

Financeable (Bankable):
- A BESS that can be funded by commercial lenders on standard project-finance terms
  because risk is bounded by credible warranties, performance guarantees, supplier track
  record, and enforceable remedies.

Insurable:
- A BESS that can be underwritten under standard commercial property and liability policies
  because its hazards are understood, documented, and mitigated using recognized codes,
  testing, and loss prevention guidance.

====================================================================
B.4 HARD GATES (MUST PASS)
====================================================================

B.4.1 Safety listing and test evidence (minimum)
A BESS solution SHALL provide:
1) UL 9540 system listing (or jurisdiction-accepted equivalent listing for stationary ESS).
2) UL 9540A test evidence appropriate to the deployed configuration, including thermal
   runaway characterization and propagation behavior.
3) Installation and operational design consistent with NFPA 855 (Stationary ESS), plus
   local AHJ requirements.

B.4.2 Loss prevention compatibility (insurance gate)
A BESS solution SHALL provide:
1) Site-specific loss prevention package aligned to major insurer guidance (example:
   FM Global Data Sheet 5-33 for lithium-ion ESS when applicable).
2) Fire protection basis of design (BoD) covering detection, suppression, spacing, and
   emergency response interfaces.
3) Evidence that the OEM will support insurer engineering review (documentation, calls,
   and acceptance testing support).

B.4.3 Financeability gate (lender + EPC reality)
A BESS solution SHALL provide:
1) Warranties that cover defects and ALSO guarantee minimum energy capacity retention
   and/or performance metrics appropriate to project economics.
2) Defined remedies for shortfall (augmentation, replacement, liquidated damages, or
   equivalent).
3) A vendor and integrator profile that can satisfy lender due diligence (track record,
   balance sheet, service capability, and parts availability).

If any hard gate fails, the technology is NOT eligible for Phase 1 procurement.

====================================================================
B.5 ELIGIBLE TECHNOLOGY CLASSES (FINANCEABLE/INSURABLE DEFAULT SET)
====================================================================

B.5.1 Lithium-ion BESS (LFP)
- Default baseline for near-term, utility-scale deployment when financeability and pricing
  dominate.
- Strengths: mature supply chain, large deployment base, strong bankability ecosystem.
- Typical use: 2-6 hour durations (project-specific).

B.5.2 Lithium-ion BESS (NMC and related nickel-bearing chemistries)
- Eligible when justified by vendor support and total installed cost (including insurance)
  and when hazards/mitigations meet the hard gates.
- Use case is niche for campus stationary storage due to cost and risk profile.

B.5.3 Sodium-ion BESS
- Emerging class. May become eligible as commercial stationary offerings mature.
- Eligible only when a stationary product meets UL/NFPA gates and lender/insurer comfort.

B.5.4 Flow battery systems (vanadium redox, zinc-bromine, similar)
- Eligible for longer duration stationary use where fire profile and cycle life economics
  justify capex.
- Requires equivalent safety and code compliance package and validated EPC integration.

B.5.5 Metal-air / long-duration batteries (example: iron-air)
- Eligible only when there is a commercial track record, defined warranties, and lender/
  insurer acceptance for the deployment configuration.
- Consider for multi-day firming if project economics justify.

B.5.6 Explicitly out-of-scope for Phase 1 (watchlist only)
- All-solid-state "EV-style" packs (solid electrolyte) are watchlist items until bankability,
  insurer guidance, and stationary certifications are demonstrated at scale.
- Semi-solid and hybrid concepts are also watchlist unless they clear all hard gates in the
  target jurisdiction.

====================================================================
B.6 PROCUREMENT SCORING (AFTER PASSING HARD GATES)
====================================================================

Vendor selection SHALL use a weighted scoring model. Baseline weights:

- Price and total cost of ownership (TCO): 35%
  * Installed $/kWh and $/kW
  * Augmentation schedule cost
  * O&M cost, spares, and service pricing
  * Efficiency losses and parasitic loads

- Performance and degradation: 20%
  * Round-trip efficiency, power capability, usable energy
  * Cycle life or throughput warranty
  * Calendar degradation profile at site temperature band

- Safety and insurability package quality: 20%
  * UL/NFPA compliance completeness
  * Fire detection/suppression design quality
  * Insurer engineering acceptance likelihood

- Financeability and contractual strength: 15%
  * Warranty strength and enforceable remedies
  * Vendor balance sheet and service network
  * EPC wrap compatibility

- Integration and controls: 10%
  * Controls interface quality (ICD completeness)
  * SCADA/MECSAI telemetry, alarms, and logs
  * Black start and islanding compatibility (if required)

Weights can be adjusted by governance, but price MUST remain a major driver.

====================================================================
B.7 REQUIRED DELIVERABLES FROM VENDORS (DUE DILIGENCE PACKAGE)
====================================================================

Each vendor proposal SHALL include, at minimum:

1) Product architecture
- Container/building configuration, power conversion system (PCS), thermal management
- Single-line and protection concept, grounding and arc-flash considerations
- Operating envelope and derates

2) Safety and compliance package
- UL 9540 listing evidence and UL 9540A test report summary (configuration-specific)
- NFPA 855 compliance matrix and deviations (if any) with mitigation
- Emergency response guide and firewater/deluge interface requirements

3) Insurance support package
- Loss prevention dossier (spacing, venting, detection, suppression, monitoring)
- Incident reporting and corrective action process
- Support for insurer engineering review (named technical contacts)

4) Financeability package
- Warranty terms: capacity retention, throughput, efficiency (as applicable)
- Remedies and process for warranty claims
- Vendor financials, service plan, spares plan, and availability guarantees (if offered)

5) Controls and MECSAI integration
- Interface Control Document (ICD) for power, controls, and telemetry (no TBDs)
- Required signals: SOC, SOH, module temps, alarms, events, fault codes, logs
- Cybersecurity posture for control interfaces (segmentation and update policy)

====================================================================
B.8 GOVERNANCE AND CHANGE CONTROL
====================================================================

This appendix is governed under the same change control doctrine as HC-MGD-001.
Any change that affects hard gates, eligible technologies, or scoring weights requires
ARCHITECT approval and ATB review.

====================================================================
B.9 REFERENCES (EXTERNAL - FOR EVIDENCE)
====================================================================

NOTE: External references are provided as plain ASCII URLs so this appendix is self-contained.

REF-EXT-001: UL - UL 9540A Test Method for Battery Energy Storage Systems (BESS)
- https://www.ul.com/services/ul-9540a-test-method

REF-EXT-002: UL - Energy Storage System Testing and Certification (UL 9540 context)
- https://www.ul.com/services/energy-storage-system-testing-and-certification

REF-EXT-003: NFPA 855 industry briefing (explains linkage to UL 9540 and UL 9540A)
- https://cleanpower.org/wp-content/uploads/gateway/2024/01/NFPA855_Safety_240111.pdf

REF-EXT-004: FM Global - Data Sheet 5-33 Lithium-Ion Battery Energy Storage Systems
- https://www.fm.com/FMAApi/data/ApprovalStandardsDownload?itemId=%7BFB314761-0A9C-4B8C-9410-A31D6792170B%7D

REF-EXT-005: IEA - Batteries and Secure Energy Transitions (stationary storage chemistry mix)
- https://www.iea.org/reports/batteries-and-secure-energy-transitions

REF-EXT-006: IRENA/IEA-ETSAP - Electricity Storage Technology Brief (storage tech taxonomy)
- https://www.irena.org/-/media/Files/IRENA/Agency/Publication/2012/IRENA-ETSAP-Tech-Brief-E18-Electricity-Storage.pdf

REF-EXT-007: NREL - Grid-Scale Battery Storage: Frequently Asked Questions (definitions and basics)
- https://docs.nrel.gov/docs/fy19osti/74426.pdf

REF-EXT-008: CESA - Energy Storage Best Practice Guide (warranties and contracting concepts)
- https://www.cesa.org/wp-content/uploads/ACES-Energy-Storage-Best-Practice-Guide.pdf

REF-EXT-009: Long Duration Energy Storage Council - Accelerating LDES Bankability (risk allocation and bankability)
- https://ldescouncil.com/wp-content/uploads/2025/12/Accelerating-LDES-Bankability-LDES-Council.pdf
====================================================================
B.10 REFERENCES (PROGRAM DOCS)
====================================================================

REF-PROG-001: HC-MGD-001 - dispatch priority, firming/resilience, and MECSAI doctrine.
REF-PROG-002: heber_autonomous_campus_master_plan_v_0.4 - 500 MWh BESS siting, substation, and
             360-degree fire lanes.

====================================================================
END OF APPENDIX B
====================================================================
