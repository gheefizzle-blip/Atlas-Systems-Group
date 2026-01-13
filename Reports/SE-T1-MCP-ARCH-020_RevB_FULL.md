# SE-T1-MCP-ARCH-020 RevB

Phase 20 - Database and Metadata Indexing Architecture Date: 2025-12-04

0.0 REVISION NOTE (RevB) This revision incorporates all ATB-required
changes: - Revision A: Safety Envelope on Catalog DB Writes. - Revision
B: Isolation and hardening of the Metadata Index Service. - Revision C:
Recovery and fallback modes for catalogs and registry. - Revision D:
Recommended human verification tools.

1.0 PURPOSE AND SCOPE The purpose of this architecture is to define the
complete structure, rules, and operational behavior for: - SQL metadata
catalogs per NAS share. - A master registry database. - A hardened
Metadata Index Service as the sole point of interaction. - Tier 2
creative indexing for photos, audio, video. - Optional future semantic
search via embeddings. Scope includes schemas, workflows, indexing
patterns, safety rules, and integration with MCP, MECSAI, and n8n.

2.0 DESIGN PRINCIPLES 2.1 SQL as System of Record All structured
metadata is stored in SQL catalogs. Vector search may be added later as
a secondary index.

2.2 Project Isolation Each NAS share has its own catalog database. No
cross-project mixing.

2.3 Master Registry Authority A small registry DB holds project IDs, NAS
paths, DB paths, and project types.

2.4 Indirect Access Only Agents never access SQL directly. All access
flows through the Metadata Index Service.

2.5 Safety and Security First - No agent-triggered recursive scans. - No
agent-driven schema modifications. - Prepared statements only. - RBAC
and network isolation.

2.6 Recoverable Architecture Catalogs must be fully rebuildable from
NAS.

3.0 PROJECT SEGMENTATION 3.1 Tier 1 -- Engineering Projects
MEGAPROJECT: - Share: /NAS/MEGAPROJECT - Catalog DB:
/NAS/MEGAPROJECT/db/megaproj.db

3.2 Tier 2 -- Creative Projects EMBERBOUND: - Share: /NAS/EMBERBOUND -
DB: /NAS/EMBERBOUND/db/emberbound.db

TOMMY RANSOM: - Share: /NAS/TOMMY_RANSOM - DB:
/NAS/TOMMY_RANSOM/db/tommy.db

CAMERA ROLL: - Share: /NAS/SON_CAMERA_ROLL - DB:
/NAS/SON_CAMERA_ROLL/db/camera_roll.db

4.0 DATABASE ARCHITECTURE 4.1 Catalog Schema (Tier 1) Table: files - id
INTEGER PRIMARY KEY - path TEXT UNIQUE NOT NULL - filename TEXT NOT
NULL - extension TEXT - size_bytes INTEGER - created_at DATETIME -
modified_at DATETIME - description TEXT - tags TEXT - phase_id TEXT -
agent_owner TEXT - source_type TEXT NOT NULL - hash_sha256 TEXT NOT NULL
UNIQUE - last_indexed_at DATETIME NOT NULL - embedding_vector BLOB
(optional)

4.2 Creative Catalog Schema (Tier 2) Table: photos - id INTEGER PRIMARY
KEY - path TEXT UNIQUE NOT NULL - filename TEXT NOT NULL - size_bytes
INTEGER - taken_at DATETIME - created_at DATETIME - modified_at
DATETIME - description TEXT - tags TEXT - people_detected TEXT -
places_detected TEXT - objects_detected TEXT - hash_sha256 TEXT NOT NULL
UNIQUE - source_type TEXT NOT NULL - last_indexed_at DATETIME NOT NULL -
embedding_vector BLOB (optional)

4.3 Master Registry Schema Table: projects - id TEXT PRIMARY KEY - name
TEXT - db_path TEXT NOT NULL - nas_share TEXT NOT NULL - project_type
TEXT - description TEXT - active BOOLEAN - created_at DATETIME -
updated_at DATETIME

5.0 METADATA INDEX SERVICE (HARDENED) 5.1 Role This service is the
single access layer between all agents and all project catalogs.

5.2 Security and Isolation - Private VLAN or container network. -
Dedicated service account. - Strict RBAC. - DELETE operations
prohibited. - Prepared statements only. - No schema modification
allowed.

5.3 API Endpoints - GET /projects - GET /projects/{project_id} - POST
/projects/{project_id}/search - POST /projects/{project_id}/insert -
POST /projects/{project_id}/update - POST
/projects/{project_id}/refresh - POST
/projects/{project_id}/semantic-search (future)

5.4 Safety Envelope (ATB Revision A) The service enforces: - Required
fields: hash_sha256, source_type, last_indexed_at. - Rejection of
recursive scan triggers. - Rejection of schema modifications.

6.0 INTEGRATION PATTERNS 6.1 Read Pattern n8n -\> Metadata Index Service
-\> Catalog DB

6.2 Write Pattern File written to NAS -\> n8n calls insert/update APIs
-\> Service validates and writes metadata.

6.3 Agent Restrictions Agents cannot: - Issue full rescans. - Execute
SQL. - Access DB files.

7.0 INDEXING DAEMONS 7.1 Initial Catalog Build Daemon recursively scans
share and populates DB.

7.2 Incremental Scans Detects changed files and updates DB.

7.3 Load Controls (PHYSCORE Requirement) - Throttled I/O. - Scheduled
heavy scans.

7.4 Restricted Scan Triggers Only admin-level services may start full
rescans.

8.0 RECOVERY & FAILOVER (ATB Revision C) 8.1 Catalog DB Rebuild
Reconstruct DB from NAS.

8.2 Registry Rebuild Recreate registry DB from known project list.

8.3 Corruption Detection Integrity checks; mark project as degraded.

8.4 Read-Only Safe Mode Read operations continue; writes disabled.

8.5 Graceful Degradation Service returns structured errors without
crashing pipelines.

9.0 CREATIVE INDEXING 9.1 Camera Roll AI Processing Each image is
analyzed for: - Description - Tags - People detected - Objects
detected - Places

9.2 Search Capabilities Queries on: - people_detected - tags -
places_detected - taken_at date range

10.0 VECTOR SEARCH EXTENSION (OPTIONAL) 10.1 Role Semantic retrieval
enhancement.

10.2 Implementation Options - pgvector in Postgres - External vector DB

10.3 Retrieval Flow Service embeds query, finds nearest items, then SQL
filters.

11.0 HUMAN VERIFICATION TOOLS (ATB Recommendation D) A CLI utility
supporting: - search - read-only inspection - metadata checks

12.0 PHASE 20 WORK BREAKDOWN 20.0 Registry/catalog creation 20.1
Hardened Metadata Index Service 20.2 Indexing daemons & creative
indexing 20.3 Recovery tools and human CLI 20.4 Semantic search
(optional)

13.0 RISKS & MITIGATIONS - DB corruption -\> rebuild + safe modes -
Overload -\> throttled scans - Security -\> RBAC + isolation - Metadata
drift -\> scheduled scans

14.0 RECOMMENDATION RevB is the ATB-approved baseline for Phase 20
implementation.
