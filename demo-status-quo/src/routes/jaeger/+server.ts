import type { RequestEvent } from '@sveltejs/kit';

export const POST = async ({ request, fetch }: RequestEvent) => {
    const jaegerUrl = 'http://localhost:4318/v1/traces';
    
    // Get the raw body as an ArrayBuffer to preserve it exactly
    const body = await request.arrayBuffer();
    
    // Forward the request to Jaeger with all original headers and body
    const jaegerResponse = await fetch(jaegerUrl, {
        method: 'POST',
        headers: request.headers,
        body: body
    });

    // Create a new response with the same status and headers from Jaeger
    const response = new Response(jaegerResponse.body, {
        status: jaegerResponse.status,
        statusText: jaegerResponse.statusText,
        headers: jaegerResponse.headers
    });

    // Add CORS headers
    response.headers.set('Access-Control-Allow-Origin', '*');
    response.headers.set('Access-Control-Allow-Methods', 'POST');
    response.headers.set('Access-Control-Allow-Headers', '*');

    return response;
};