export const POST = async ({ request, fetch }) => {
    const jaegerUrl = 'http://localhost:4318/v1/traces';
    
    console.log(request.headers);

    const deserializedHeaders = Object.fromEntries(request.headers.entries());

    // Forward the request to Jaeger
    const jaegerResponse = await fetch(jaegerUrl, {
        method: 'POST',
        headers: deserializedHeaders,
        // body: request.clone().bytes,
    });

    // Return the response from Jaeger
    return new Response(await jaegerResponse.text(), {
        status: jaegerResponse.status,
        headers: {
            'Access-Control-Allow-Origin': '*',
            'Access-Control-Allow-Methods': 'POST',
            'Access-Control-Allow-Headers': '*',
            'Content-Type': jaegerResponse.headers.get('Content-Type') || 'application/json'
        }
    });
};