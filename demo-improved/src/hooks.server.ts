export const handle = async ({ event, resolve }) => {
  // if(event.request.method === 'OPTIONS') {
  // return new Response(null, {
  //         headers: {
  //         'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, PATCH, OPTIONS',
  //         'Access-Control-Allow-Origin': '*',
  //         'Access-Control-Allow-Headers': '*',
  //         }
  //     });
  // }

  return resolve(event);
};
