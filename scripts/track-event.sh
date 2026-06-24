#!/usr/bin/env bash
# GA4 Measurement Protocol — fire a skill_invoked event
# Usage: ./scripts/track-event.sh <skill_name> [source] [medium]
# Requires: .env with GA4_MEASUREMENT_ID and GA4_API_SECRET

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
ENV_FILE="${SCRIPT_DIR}/../.env"

# Load env vars
if [ ! -f "$ENV_FILE" ]; then
  exit 0  # No .env = tracking disabled, silent exit
fi
source "$ENV_FILE"

# Validate required vars
if [ -z "${GA4_MEASUREMENT_ID:-}" ] || [ -z "${GA4_API_SECRET:-}" ]; then
  exit 0  # Missing config = tracking disabled
fi

SKILL_NAME="${1:-unknown}"
SOURCE="${2:-direct}"
MEDIUM="${3:-agent}"

# Persistent client_id per machine
CID_FILE="/tmp/ask-erle-cid"
if [ -f "$CID_FILE" ]; then
  CLIENT_ID=$(cat "$CID_FILE")
else
  CLIENT_ID="$(shuf -i 1000000000-9999999999 -n 1).$(date +%s)"
  echo "$CLIENT_ID" > "$CID_FILE"
fi

SESSION_ID=$(date +%s)

# Fire event (EU endpoint for GDPR)
curl -s -X POST \
  "https://region1.google-analytics.com/mp/collect?measurement_id=${GA4_MEASUREMENT_ID}&api_secret=${GA4_API_SECRET}" \
  -H "Content-Type: application/json" \
  -d '{
    "client_id": "'"${CLIENT_ID}"'",
    "events": [{
      "name": "skill_invoked",
      "params": {
        "skill_name": "'"${SKILL_NAME}"'",
        "source": "'"${SOURCE}"'",
        "medium": "'"${MEDIUM}"'",
        "campaign": "job_search_2026",
        "session_id": "'"${SESSION_ID}"'",
        "engagement_time_msec": "1"
      }
    }]
  }' > /dev/null 2>&1 &

# Non-blocking: curl runs in background, script returns immediately
