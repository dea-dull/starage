#!/bin/bash

# Bash script to set up AWS Amplify with Auth in a React project

# Exit immediately if a command exits with a non-zero status
set -e

echo "Step 1: Installing Amplify libraries in your React project..."
npm install aws-amplify @aws-amplify/ui-react

echo "Step 2: Installing Amplify CLI globally..."
npm install -g @aws-amplify/cli

echo "Step 3: Configuring Amplify CLI with your AWS account..."
echo "This step is interactive. Please follow the prompts to log in and set up your IAM user."
amplify configure

echo "Step 4: Initializing Amplify project in your React app folder..."
echo "You will be prompted to select your editor, framework (React), and AWS region."
amplify init

echo "Step 5: Adding authentication to your Amplify backend..."
echo "Choose default or manual configuration, set sign-in method, required attributes, and redirect URIs."
amplify add auth

echo "Step 6: Deploying backend to AWS..."
echo "This will create Cognito user pool, IAM roles, and other resources."
amplify push

echo "Setup complete!"
echo "You now have:"
echo "- Cognito User Pool managing user sign-up/sign-in"
echo "- AWS resources deployed and linked to your project"
echo "- Hosted UI URLs ready (optional to use)"
echo "- aws-exports.js file generated for frontend config"

echo "Next steps: Build React components for signup/login using Amplify Auth methods and import aws-exports.js in your project."
