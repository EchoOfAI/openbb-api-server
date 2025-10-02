#!/bin/bash

# Create OpenBB config directory
mkdir -p ~/.openbb_platform

# Create user_settings.json with credentials from environment variables
cat > ~/.openbb_platform/user_settings.json << EOF
{
  "credentials": {
    "fmp_api_key": "${FMP_API_KEY:-}",
    "benzinga_api_key": "${BENZINGA_API_KEY:-}",
    "polygon_api_key": "${POLYGON_API_KEY:-}",
    "fred_api_key": "${FRED_API_KEY:-}"
  }
}
EOF

echo "OpenBB credentials configured from environment variables"
cat ~/.openbb_platform/user_settings.json

# Start OpenBB API server
openbb-api --host 0.0.0.0 --port 6900
