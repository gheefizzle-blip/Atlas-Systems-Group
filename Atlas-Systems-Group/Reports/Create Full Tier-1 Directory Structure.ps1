# SE-T1 TIER-1 DIRECTORY STRUCTURE CREATION - REV D
# Aligned with SE-T1-META-GUIDE-001 and NF-ICD-001 Rev A

$root = "Z:\SE_T1"

New-Item -ItemType Directory -Path $root -Force | Out-Null

function Make-Dir($path) {
    New-Item -ItemType Directory -Path $path -Force | Out-Null
}

Write-Host "SE-T1 Tier-1 Directory Build - Starting"

$dirs = @(
    "$root\INFRASTRUCTURE_CORE",
    "$root\ENERGY_DIVISION",
    "$root\SPACE_SYSTEMS",
    "$root\DIGITAL_SYSTEMS",
    "$root\CONSTRUCTION_CIVIL",
    "$root\SPECIAL_PROJECTS",
    "$root\ENGINEERING_RESEARCH",
    "$root\GOVERNANCE"
)

$dirs | ForEach-Object { Make-Dir $_ }

$infra = @(
    "MCP",
    "COMMS_IO",
    "CONTAINER_OPS",
    "CONTINUITY_REGISTRY",
    "AGENT_GOVERNANCE",
    "SECURITY_IAM",
    "SECURITY_IAM\DOMAIN_MAP"
)

foreach ($d in $infra) {
    Make-Dir "$root\INFRASTRUCTURE_CORE\$d"
}

Make-Dir "$root\INFRASTRUCTURE_CORE\CONTINUITY_REGISTRY\MCP"

$nfIcdRequired = @("_continuity", "_governance", "REPORTS", "CAD", "LOGS", "TEST_DATA")
foreach ($r in $nfIcdRequired) {
    Make-Dir "$root\INFRASTRUCTURE_CORE\CONTINUITY_REGISTRY\MCP\$r"
}

$divisions = @(
    "ENERGY_DIVISION",
    "SPACE_SYSTEMS",
    "DIGITAL_SYSTEMS",
    "SPECIAL_PROJECTS",
    "ENGINEERING_RESEARCH"
)

foreach ($div in $divisions) {
    Make-Dir "$root\$div\DEV"
    Make-Dir "$root\$div\OPS"
}

$phases = @("HEBER_PHASE_1", "HEBER_PHASE_2", "HEBER_PHASE_3")
$folders = @("DEV", "OPS", "ARCH", "STRUCT", "MEP", "FIRE", "SITE", "SURVEY")

foreach ($phase in $phases) {
    foreach ($sf in $folders) {
        Make-Dir "$root\CONSTRUCTION_CIVIL\$phase\$sf"
    }
}

$erd = @(
    "HYDROGEN_RD",
    "NUCLEAR_CONCEPTS",
    "PROPULSION_CONCEPTS",
    "SPACE_RD",
    "ADV_MATERIALS",
    "GROUND_RD",
    "EMERGING_TECH",
    "MULTIPHASE"
)

foreach ($d in $erd) {
    Make-Dir "$root\ENGINEERING_RESEARCH\$d"
}

$gov = @(
    "SAFETY_CRITICAL",
    "RELIABILITY",
    "HUMAN_FACTORS",
    "ATB",
    "RED_TEAM",
    "NASA_STD_DOCS",
    "ROUTING_MEMOS",
    "STRUCT_ARCHIVE"
)

foreach ($d in $gov) {
    Make-Dir "$root\GOVERNANCE\$d"
}

Write-Host "Done. Structure created at: $root"