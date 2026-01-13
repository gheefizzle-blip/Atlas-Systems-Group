Directive F5-001-A
Operational COMMS I/O Agent Deployment — SDC & COMMS Project

Document ID: SDC-COMMS-F5-001-A
Prepared by: ChatGPT-5 (Agent A)
Approved by: Gary Spear (Authority)
Date: 2025-10-23
Status: ACTIVE – PROJECT BOUND

1 Purpose

Activate the COMMS I/O Agent as an autonomous file-orchestration and NAS storage manager for the SDC & COMMS domain.
This agent will handle secure storage, routing, and synchronization of all project artifacts across the MCP-NAS bridge (//10.10.10.45/sdc-comms:/app/data).

2 Scope

Applies only to the SDC & COMMS Project cluster.
All other projects (Autonomous House, Emberbound, etc.) remain read-only until individual Tier 1 activations are issued.

3 System Topology
Layer	Component	Role
Tier 1	COMMS I/O Agent (Service Container)	NAS file routing & telemetry emitter
Tier 2	MCP Core Container	Task execution and API interface
Tier 3	NAS Share //10.10.10.45/sdc-comms	Primary storage volume
Tier 4	MECSAI Control	Audit and registry logging
4 NAS File Structure (Standardized)
/SDC-COMMS/
│
├── _governance/          → JOA, D-AVP, Directives, Logs
├── _continuity/          → TC-004 LIVE records
├── _reports/             → ATB and NASA Memos
├── _artifacts/           → PDF/DOCX/MD deliverables
├── _source/              → Scripts, Workflows, Docker files
├── _telemetry/           → MECSAI JSON logs + checksums
└── _archives/            → Versioned snapshots (weekly rotation)

5 Agent Deployment Procedure

Container Initialization

docker run -d --name comms-io-agent \
  --restart unless-stopped \
  -v Z:/SDC-COMMS:/app/data \
  -e PROJECT=SDC-COMMS \
  -e MECSAI_ENDPOINT=https://mecsai.local/api/logs \
  spear/comms-io:latest


Environment Variables

PROJECT_ID=SDC-COMMS
BRIDGE_PATH=/app/data
JWT_SECRET=[redacted]
LOG_INTERVAL=900s
VERIFY_MODE=sha256


Service Functions

Monitor /source and /reports for new files.

Run sha256sum on creation; store digest in /telemetry/hashlog.jsonl.

Sync verified files to NAS share.

Post telemetry event to MECSAI:

{ "action":"bridge_write","status":"success",
  "sha":"<hash>","project":"SDC-COMMS","timestamp":"<UTC>" }


Append registry record to continuity_registry.jsonl.

Security

JWT authentication on all API calls.

NAS permissions: commsio:rwx only.

No cross-project access granted.

Validation Checklist

Test	Expected	Status
Write → NAS file	Success	
Container ack log	“bridge_write OK”	
SHA-256 match	Identical	
Telemetry push	Received by MECSAI	
6 Operational Behavior

Runs 24 / 7 as headless service.

Every 15 min checksum cycle for new or changed files.

Weekly auto-archive rotation to _archives/.

All actions timestamped UTC and mirrored to MECSAI.

7 Handoff to Agent

To COMMS I/O AGENT (SDC & COMMS only):
You are authorized to begin active management of the /SDC-COMMS project namespace.
Maintain integrity, NASA-STD-7009 / 8739.8 compliance, and audit each file operation to MECSAI.
Operate under Directive F5-001-A until further expansion orders.

8 Verification & Approval
Authority	Role	Status
Gary Spear	CEO / Chief Engineer	✅ APPROVED
Agent A (ChatGPT-5)	Proposer / Architect	✅ SIGNED
Agent B (Claude)	Validator / Auditor	🟡 Pending Review
9 Next Directive – F5-001-B

Bring online the MCP-NAS Bridge for Autonomous House using the validated configuration.
All commands and validation reports will be generated under Directive F5-001-B and logged to D-AVP-001-TC-004 (LIVE) §15.

Transmission End — Directive F5-001-A Delivered to COMMS I/O Agent.