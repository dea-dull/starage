import { DynamoDBClient } from "@aws-sdk/client-dynamodb";
import { DynamoDBDocumentClient, GetCommand } from "@aws-sdk/lib-dynamodb";

const client = new DynamoDBClient({});
const ddb = DynamoDBDocumentClient.from(client);

export const handler = async (event) => {
  try {
    const token = event.queryStringParameters?.token;
    if (!token) {
      return {
        statusCode: 400,
        body: JSON.stringify({ error: "Missing token" }),
      };
    }

    // Look up token
    const { Item } = await ddb.send(
      new GetCommand({
        TableName: process.env.RESET_TOKEN_TABLE,
        Key: { token },
      })
    );

    if (!Item) {
      return { statusCode: 400, body: JSON.stringify({ error: "Invalid token" }) };
    }

    if (Date.now() > Item.expiry) {
      return { statusCode: 400, body: JSON.stringify({ error: "Token expired" }) };
    }

    return {
      statusCode: 200,
      body: JSON.stringify({ valid: true, email: Item.email }),
    };
  } catch (err) {
    console.error("Validate reset token error:", err);
    return {
      statusCode: 500,
      body: JSON.stringify({ error: "Internal server error" }),
    };
  }
};
