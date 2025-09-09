aws apigatewayv2 update-api \
  --api-id <your-api-id> \
  --cors-configuration '{
    "AllowOrigins": ["https://your-frontend.com"],
    "AllowMethods": ["GET", "POST", "OPTIONS"],
    "AllowHeaders": ["Content-Type", "Origin", "Accept"],
    "ExposeHeaders": ["date", "x-api-id"],
    "MaxAge": 300,
    "AllowCredentials": true
  }'
