# NASA MCP Change-Detection Playbook v0.1
*Automated monitoring and impact triage for LNIS, ICSIS, SCaN-MOCS, and LCRNS.*

## 1) Objective
Detect spec/document updates within 24 hours, classify impact, and open targeted tasks for ARCHITECT and MECSAI with proper citations.

## 2) Watchlist & Frequency
- LNIS (primary PDF + landing page): daily checksum watch
- ICSIS Rev B hosting site: daily
- SCaN-MOCS PDF location(s): daily
- LCRNS program updates pages: daily (RSS/HTML diffs)

## 3) Pipeline
1. **Fetch**: robots-aware HTTP; store artifact + SHA256
2. **Parse**: PDF text, headings, figures; section anchors
3. **Compare**: structural + semantic diff vs. last baseline
4. **Classify**: Editorial / Minor / Substantive
5. **Map**: changed clauses → NAO entities → subsystems
6. **Emit**: JSON delta object; archive diff
7. **Notify**: route by impact level

## 4) Impact Levels & Routing
- **Editorial**: note in weekly brief
- **Minor**: Notify ARCHITECT channel; annotate crosswalk
- **Substantive**: Create MECSAI task with remediation checklist; ATB review if safety/compliance

## 5) Delta JSON Schema (excerpt)
```json
{
  "source": "LNIS v5",
  "doc_sha": "<sha256>",
  "new_version": "2025-02-12",
  "section": "5.2.4",
  "change_type": "substantive",
  "summary": "Updated LNSP handshake timing under optical fade",
  "affected_subsystems": ["Optical Mesh Router", "Relay Node Controller"],
  "actions": [
    {"owner": "MECSAI", "task": "Update handshake timers", "due": "+14d"},
    {"owner": "ARCHITECT", "task": "Review routing policy thresholds"}
  ]
}
```

## 6) MECSAI Integration
- REST hook to post Delta JSON
- Auto-create tasks with labels: `NASA-LNIS`, `ICSIS`, `SCaN-MOCS`, `LCRNS`
- Link to relevant ICD excerpts and prior test results

## 7) QA & Rollback
- Two-person review for Substantive changes
- Keep prior baselines; enable design rollback notes

## 8) KPIs
- Detection latency (median hours)
- Precision/Recall of “Substantive” classification
- Mean time to mitigation (MTTM)
- % of deltas with validated tests

## 9) Runbook Triggers
- New doc checksum or header date
- Silent edits detected by paragraph hash changes
- Partner mirror indicates version skew

## 10) Deliverables
- Daily delta log (JSON)
- Weekly Spec Change Brief (PDF)
- Updated Crosswalk entries with new RAG states
