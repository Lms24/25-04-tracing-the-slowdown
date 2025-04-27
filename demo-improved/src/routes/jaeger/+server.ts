import type { RequestEvent } from "@sveltejs/kit";

export const POST = async ({ request, fetch }: RequestEvent) => {
  const jaegerUrl = "http://localhost:4318/v1/traces";

  const body = await request.arrayBuffer();

  const jaegerResponse = await fetch(jaegerUrl, {
    method: "POST",
    headers: request.headers,
    body: body,
  });

  const response = new Response(jaegerResponse.body, {
    status: jaegerResponse.status,
    statusText: jaegerResponse.statusText,
    headers: jaegerResponse.headers,
  });

  response.headers.set("Access-Control-Allow-Origin", "*");
  response.headers.set("Access-Control-Allow-Methods", "POST");
  response.headers.set("Access-Control-Allow-Headers", "*");

  return response;
};
