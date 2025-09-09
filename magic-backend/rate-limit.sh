#!/bin/bash

aws apigatewayv2 update-stage \
  --api-id <your-api-id> \
  --stage-name dev \
  --route-settings '{"POST /signup": {"ThrottlingBurstLimit": 5, "ThrottlingRateLimit": 2},
                     "POST /request-reset": {"ThrottlingBurstLimit": 5, "ThrottlingRateLimit": 2},
                     "POST /confirm-reset": {"ThrottlingBurstLimit": 5, "ThrottlingRateLimit": 2},
                     "POST /resend-verification": {"ThrottlingBurstLimit": 5, "ThrottlingRateLimit": 2},
                     "GET /verify": {"ThrottlingBurstLimit": 5, "ThrottlingRateLimit": 2},
                     "GET /validate-reset-token": {"ThrottlingBurstLimit": 5, "ThrottlingRateLimit": 2}}'

