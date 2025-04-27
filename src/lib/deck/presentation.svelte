<script lang="ts">
	import Bluesky from '../../icons/bluesky.svelte';
	import Github from '../../icons/github.svelte';
	import Globe from '../../icons/globe.svelte';
	import Otel from '../../icons/otel.svelte';
	import Sentry from '../../icons/sentry.svelte';
	import Svelte from '../../icons/svelte.svelte';
	import Bash from './bash.svelte';
	import Code from './code.svelte';
	import Slide from './slide.svelte';
	import Span from './Span.svelte';
</script>

<Slide>
	<div class="flex flex-row w-full justify-between">
		<div class="flex flex-col text-start items-center justify-center">
			<div class="flex-col text-start mb-12 mt-10">
				<h3 class="!normal-case w-full">Hi 👋 I'm Lukas</h3>
				<p>
					Software Engineer at <a
						href="https://sentry.io/welcome"
						class="inline-flex flex-row items-center">Sentry <Sentry color="#ff6900" size={48} /></a
					>
				</p>
				<div class="flex flex-col gap-2 items-start text-[0.6em]">
					<p>About me:</p>
					<ul>
						<li>Aviation ✈️</li>
						<li>Archery 🏹</li>
						<li>Svelte 🧡</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="flex flex-col items-center mr-10">
			<img src="/ls-2.jpg" class="rounded-full w-64 m-0!" alt="Lukas Stracke" />
			<p class="text-[1.5rem]">Lukas Stracke</p>
			<ul class="text-sm !list-none">
				<li class="flex flex-row gap-2 items-center mt-2">
					<Github size={20} class="text-blue-500" color="white" />
					<a href="https://github.com/Lms24">@Lms24</a>
				</li>
				<li class="flex flex-row gap-2 items-center mt-2">
					<Bluesky size={20} class="text-blue-500" color="#08f" />
					<a href="https://bsky.app/profile/stracke.tech">@stracke.tech</a>
				</li>
				<li class="flex flex-row gap-2 items-center mt-2">
					<Globe size={20} class="text-blue-500" color="white" />
					<a href="https://stracke.tech">https://stracke.tech</a>
				</li>
			</ul>
		</div>
	</div>
</Slide>

<Slide>
	<div class="flex flex-col w-full justify-between items-center">
		<h2>Svelte Summit is Coming! 👀</h2>
	</div>
</Slide>

<Slide>
	<!-- svelte-ignore element_invalid_self_closing_tag -->
	<iframe src="http://localhost:3000" class="w-screen h-[80vh]" title="Svelte Summit Tasks" />
</Slide>

<Slide>
	<div class="flex flex-col w-full justify-between items-center">
		<h2>Tracing the Slowdown</h2>
		<p class="inline-flex flex-row items-center">
			<Otel size={40} class="mr-2" /> in <Svelte size={40} />Kit Made Easy
		</p>
	</div>
</Slide>

<Slide>
	<div class="flex flex-col w-full justify-between items-start">
		<h2>Let's talk about Tracing!</h2>
		<div class="flex flex-row items-start justify-between w-full">
			<ol>
				<li>Tracing with OpenTelemetry</li>
				<li>OpenTelemetry in SvelteKit</li>
				<li>Instrumentation in ESM</li>
				<li>What SvelteKit can do better</li>
			</ol>
			<Otel size={220} />
		</div>
	</div>
</Slide>

<Slide>
	<div class="flex flex-col w-full justify-between items-center">
		<h2>Spans</h2>

		<Code id="code-animation" noescape={true} lines="1-4" filename="+page.ts">
			{`
    export const load = async ({fetch}) => {
      const res = await fetch('api/todos');
      return res.json();
    }
          `}
		</Code>
	</div>
</Slide>

<Slide>
	<div class="flex flex-col w-full justify-between items-center">
		<h2>Spans</h2>

		<Code id="code-animation" noescape={true} lines={'2,5'} filename="+page.ts">
			{`
    export const load = async ({fetch}) => {
      return startSpan({name: 'getTodos'}, async() => {
        const res = await fetch('api/todos');
        return res.json()
      })
    }
          `}
		</Code>
	</div>
</Slide>

<Slide>
	<div class="flex flex-col w-full justify-between items-center">
		<h2>Traces</h2>
		<div class="flex flex-col gap-1 flex-1 w-[70%]">
			<Span name="GET /todos" class="bg-blue-700 w-full" />
			<div class="flex flex-col w-full gap-1">
				<Span name="middleware - cors" class="bg-green-700 w-[98%] ml-[2%]" />
				<Span name="middleware - auth" class="bg-green-700 w-[95%] ml-[4%]" />
				<div class="flex flex-row gap-1 w-full">
					<div class="flex flex-col gap-1 w-72">
						<Span name="cache" class="bg-purple-500 w-[70%] ml-[20%]" />
						<Span name="db-query" class="bg-yellow-600 w-[67%] ml-[22%]" />
					</div>
					<div class="flex flex-col gap-1 w-full">
						<Span name="handler - /todos" class="bg-red-700 w-[100%]" />
						<div class="flex flex-row w-full">
							<div class="flex flex-col gap-1 w-[50%]">
								<Span name="cache" class="bg-purple-500 w-[90%] ml-[4%]" />
								<Span name="db-query" class="bg-yellow-600 w-[80%] ml-[6%]" />
							</div>
							<Span name="db-query" class="bg-yellow-600 w-[30%] ml-[2%]" />
							<Span name="db-query" class="bg-yellow-600 w-[30%] ml-[2%]" />
						</div>
					</div>
					<div class="flex flex-col w-52 gap-1">
						<Span name="response" class="bg-gray-500 w-[80%] ml-[0%]" />
						<Span name="transform" class="bg-teal-500 w-[70%] ml-[8%]" />
					</div>
				</div>
			</div>
		</div>
	</div>
</Slide>

<Slide>
	<div class="flex flex-col w-full justify-between items-center">
		<h2>Distributed Traces</h2>
		<div class="flex flex-col gap-1 flex-1 w-[70%] border-2 p-2 border-amber-700 bg-amber-700/10">
			<div class="flex flex-col gap-1 w-full">
				<Span name="load - /todos" class="bg-orange-700 w-full" />
				<Span name="fetch - /api/todos" class="bg-orange-700 w-[80%] ml-[5%] " />
				<div
					class="flex flex-col w-[70%] ml-[10%] gap-1 border-2 p-2 border-cyan-700 bg-cyan-700/10"
				>
					<Span name="GET /todos" class="bg-blue-700 w-full" />
					<div class="flex flex-col w-full gap-1">
						<Span name="middleware - cors" class="bg-green-700 w-[98%] ml-[2%]" />
						<Span name="middleware - auth" class="bg-green-700 w-[95%] ml-[4%]" />
						<div class="flex flex-row gap-1 w-full">
							<div class="flex flex-col gap-1 w-72">
								<Span name="fetch - /auth" class="bg-orange-700 w-[80%] ml-[18%]" />
								<div class="flex flex-col gap-1 border-2 p-2 border-red-700 bg-red-700/15 ml-[14%]">
									<Span name="GET /auth" class="bg-blue-700 w-[80%] ml-[0%]" />
									<Span name="cache" class="bg-purple-500 w-[70%] ml-[2%]" />
									<Span name="db-query" class="bg-yellow-600 w-[67%] ml-[4%]" />
								</div>
							</div>
							<div class="flex flex-col gap-1 w-full">
								<Span name="handler - /todos" class="bg-red-700 w-[100%]" />
								<div class="flex flex-row w-full">
									<div class="flex flex-col gap-1 w-[50%]">
										<Span name="cache" class="bg-purple-500 w-[90%] ml-[4%]" />
										<Span name="db-query" class="bg-yellow-600 w-[80%] ml-[6%]" />
									</div>
									<Span name="db-query" class="bg-yellow-600 w-[30%] ml-[2%]" />
									<Span name="db-query" class="bg-yellow-600 w-[30%] ml-[2%]" />
								</div>
							</div>
							<div class="flex flex-col w-52 gap-1">
								<Span name="response" class="bg-gray-500 w-[80%] ml-[0%]" />
								<Span name="transform" class="bg-teal-500 w-[70%] ml-[8%]" />
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="flex flex-row gap-2 mt-4 text-sm">
			<div class="flex items-center gap-2">
				<!-- svelte-ignore element_invalid_self_closing_tag -->
				<div class="w-4 h-4 bg-orange-700 rounded-sm" />
				<span>Client</span>
			</div>
			<div class="flex items-center gap-2">
				<!-- svelte-ignore element_invalid_self_closing_tag -->
				<div class="w-4 h-4 bg-cyan-700 rounded-sm" />
				<span>Backend</span>
			</div>
			<div class="flex items-center gap-2">
				<!-- svelte-ignore element_invalid_self_closing_tag -->
				<div class="w-4 h-4 bg-red-700 rounded-sm" />
				<span>Auth Service</span>
			</div>
		</div>
	</div></Slide
>

<Slide>
	<div class="flex flex-col w-full justify-between items-start">
		<h2>OpenTelemetry</h2>
		<div class="flex flex-row items-start justify-between w-full">
			<p class="text-start w-[50%]">
				Standard for Observability: Terminology, SDKs, APIs, Instrumentation
			</p>
			<Otel size={200} />
		</div>
	</div>
</Slide>

<Slide>
	<h2>Let's add OTel to SvelteKit!</h2>
</Slide>

<Slide>
	<div class="flex flex-col gap-4">
		<h3>Step 1: Dependencies</h3>
		<div class="flex flex-row items-center justify-center gap-8">
			<Bash noescape={true} class="text-sm" fullScreen={false}>
				{`
$ npm install \\
  # Core packages
  @opentelemetry/api \\
  @opentelemetry/exporter-trace-otlp-proto \\
  @opentelemetry/resources \\
  @opentelemetry/instrumentation \\

  # Web SDK
  @opentelemetry/sdk-trace-web \\
  @opentelemetry/instrumentation-document-load \\
  @opentelemetry/instrumentation-fetch \\

  # Node SDK
  @opentelemetry/sdk-node \\
  @opentelemetry/auto-instrumentations-node
`}
			</Bash>
			<img src="/thisisfine.webp" class="w-80 h-auto rounded-lg" alt="This is fine meme" />
		</div>
	</div></Slide
>

<Slide>
	<h3>Step 2: Initialize Web SDK</h3>
	<!-- svelte-ignore element_invalid_self_closing_tag -->
	<Code
		lines="true"
		noescape={true}
		language="javascript"
		class="text-sm"
		filename="instrument.client.ts"
	>
		{`
import { SimpleSpanProcessor, WebTracerProvider } from "@opentelemetry/sdk-trace-web";
import { DocumentLoadInstrumentation } from "@opentelemetry/instrumentation-document-load";
import { registerInstrumentations } from "@opentelemetry/instrumentation";
import { FetchInstrumentation } from "@opentelemetry/instrumentation-fetch";
import { resourceFromAttributes } from "@opentelemetry/resources";
import { OTLPTraceExporter } from "@opentelemetry/exporter-trace-otlp-proto";

const provider = new WebTracerProvider({
  resource: resourceFromAttributes({
    "service.name": "demo-todo-app",
  }),
  spanProcessors: [
    new SimpleSpanProcessor(new OTLPTraceExporter({ url: "http://localhost:3000/jaeger" })),
  ],
});

provider.register();

registerInstrumentations({
  instrumentations: [
    new DocumentLoadInstrumentation(),
    new FetchInstrumentation({ propagateTraceHeaderCorsUrls: /.*/ }),
  ],
});
`}
	</Code>
</Slide>

<Slide>
	<h3>Step 2: Initialize Web SDK</h3>
	<!-- svelte-ignore element_invalid_self_closing_tag -->
	<Code
		lines="true"
		noescape={true}
		language="javascript"
		class="text-sm w-[40vw]"
		filename="hooks.client.ts"
	>
		{`
import "./instrument.client"

// ... rest of your hooks
`}
	</Code>
</Slide>

<Slide>
	<h3>Step 3: Initialize Node SDK</h3>
	<Code
		lines="true"
		noescape={true}
		language="javascript"
		class="text-sm"
		filename="instrument.server.mjs"
	>
		{`
import { NodeSDK } from "@opentelemetry/sdk-node";
import { getNodeAutoInstrumentations } from "@opentelemetry/auto-instrumentations-node";
import { OTLPTraceExporter } from "@opentelemetry/exporter-trace-otlp-proto";
import { createAddHookMessageChannel } from "import-in-the-middle";
import { register } from "module";

const { registerOptions, waitForAllMessagesAcknowledged } = createAddHookMessageChannel();
register("import-in-the-middle/hook.mjs", import.meta.url, registerOptions);

const sdk = new NodeSDK({
	serviceName: "demo-todo-app",
	traceExporter: new OTLPTraceExporter(),
	instrumentations: [getNodeAutoInstrumentations()],
});

sdk.start();

await waitForAllMessagesAcknowledged();
		`}
	</Code>
</Slide>

<Slide>
	<h3>Step 4: Build and Start</h3>
	<Bash noescape={true} class="text-sm">
		{`
$ npm run build

$ node --import ./instrument.server.mjs ./build/index.js`}
	</Bash>
</Slide>

<Slide>
	<h3>Step 4: Build and Start</h3>
	<!-- svelte-ignore element_invalid_self_closing_tag -->
	<iframe src="http://localhost:3000" class="w-screen h-[60vh]!" title="Svelte Summit Taks" />
</Slide>

<Slide>
	<h3>Step 5: Analyze</h3>
	<!-- svelte-ignore element_invalid_self_closing_tag -->
	<iframe src="http://localhost:16686/search" class="w-screen h-[60vh]!" title="Jaeger" />
</Slide>

<Slide>
	<h2>Instrumentation in ESM</h2>

	<p>It's complicated...</p>
</Slide>

<Slide>
	<h3>Approaches to instrumentation</h3>
	<div class="flex flex-col gap-2">
		<h4>Listening</h4>
		<Code lines="true" noescape={true} language="javascript" class="text-md" fullScreen={false}>
			{`
import diagnostics_channel from 'node:diagnostics_channel';

diagnostics_channel.subscribe('fetch-start', (req) => {
	const span = startSpan({name: 'fetch'});
	storeSpan(req, span);
})

diagnostics_channel.subscribe('fetch-end', (req) => {
	const span = getSpan(req);
	span.end();
})
				`}
		</Code>
		<p>Package must emit events</p>
	</div>
</Slide>

<Slide>
	<h3>Approaches to instrumentation</h3>
	<div class="flex flex-col gap-2">
		<h4>Patching</h4>
		<Code lines="true" noescape={true} language="javascript" class="text-md" fullScreen={false}>
			{`
const pgPool = require('pg').Pool;

const originalQuery = pgPool.prototype.query;

pgPool.prototype.query = function (...args) {
	return startSpan({name: 'pg.query'}, () => {
		return originalQuery(...args);
	});
}
				`}
		</Code>
		<p>No package support required</p>
	</div>
</Slide>

<Slide>
	<div class="flex flex-col gap-4">
		<h3>Patching is complicated in ESM</h3>
		<Code lines="true" noescape={true} language="javascript" class="text" fullScreen={true}>
			{`
		import { Pool } from 'pg';
		
		const originalQuery = Pool.prototype.query;
		
		// ❌ Error: Cannot redefine property
		Pool.prototype.query = function (...args) { 
		  return startSpan({name: 'pg.query'}, () => {
			return originalQuery(...args);
		  });
		}
			`}
		</Code>
		<ol class="mt-8">
			<li>ESM modules are immutable</li>
			<li>Imports are resolved before code evaluation</li>
		</ol>
	</div>
</Slide>

<Slide>
	<h3>ESM: Module customization</h3>
	<p>import-in-the-middle</p>
	<Code
		lines="true"
		noescape={true}
		language="javascript"
		class="text"
		fullScreen={true}
		filename="instrument.server.mjs"
	>
		{`
import { register } from "node:module";

register("import-in-the-middle/hook.mjs", import.meta.url);

// ...
		`}
	</Code>
	<p>Applies patches when resolving imports</p>
</Slide>

<Slide>
	<h3>Customization hook registration</h3>
	<p>Must happen before any import:</p>
	<Bash noescape={true} class="text-md">
		{`
$ node \\
  # evaluated first
  --import ./instrument.server.mjs \\
  # loaded and evaluated after
  ./build/index.js`}
	</Bash>
</Slide>

<Slide>
	<h3>Customization hook registration</h3>
	<p>Must happen before any import:</p>
	<Bash noescape={true}>
		{`
$ node --import ./instrument.server.mjs ./build/index.js
  #or
$ NODE_OPTIONS="--import ./instrument.server.mjs"`}
	</Bash>
	<p>❌ not always possible (e.g. Vercel, Netlify)</p>
</Slide>

<Slide>
	<h2>How SvelteKit can do better</h2>
	<p>Two Suggestions</p>
</Slide>

<Slide>
	<h3>1. First-class support for Instrumentation</h3>
	<Code
		lines="true"
		noescape={true}
		language="javascript"
		class="text-sm"
		filename="src/instrumentation.server.ts"
	>
		{`
register("import-in-the-middle/hook.mjs", import.meta.url);

const sdk = new NodeSDK({
	serviceName: "demo-todo-app",
	traceExporter: new OTLPTraceExporter(),
	instrumentations: [getNodeAutoInstrumentations()],
});

sdk.start();
	`}
	</Code>
</Slide>

<Slide>
	<h3>Better than <code>--import</code>: <br />Dynamic import</h3>
	<Code lines="true" noescape={true} language="javascript" class="" filename="build/index.js">
		{`
// 1. Register customization hook and init SDK
import('instrument.server').then(() => {
	// 2. Start SvelteKit server
	import('./build/startServer');
})
	`}
	</Code>
</Slide>

<Slide>
	<h3>2. Emit <code>diagnostics_channel</code> messages</h3>
	<p>For example:</p>
	<ul>
		<li>Request start/end (`handle` hooks)</li>
		<li>`load` function calls</li>
		<li>API route handlers</li>
		<li>page rendering</li>
	</ul>
</Slide>

<Slide>
	<h3>Let's make this happen!</h3>
	<ol class="text-md">
		<li>
			<a
				href="https://github.com/Lms24/kit/pull/3"
				class="inline-flex flex-row items-center justify-center gap-2"
				><Github size={40} color="orange" /> Support <code>instrumentation.server.ts</code></a
			>
		</li>
		<li>
			TODO: Emit <code>diagnostics_channel</code> messages from SvelteKit
		</li>
	</ol>
</Slide>

<Slide>
	<h2>Recap</h2>
	<ul>
		<li>Use tracing to understand performance of your app</li>
		<li>OTel: Can be used but has its limitations</li>
		<li>SvelteKit can help overcome limitations</li>
	</ul>
</Slide>

<Slide>
	<div class="flex flex-col items-center justify-center">
		<h2>Thanks!</h2>
		<div class="bg-white rounded-lg p-1 flex flex-row items-center justify-center">
			<img src="/qr-slides.png" class="w-40 h-48 m-1!" alt="QR Code" />
		</div>
		<p>Feedback welcome and much appreciated!</p>
	</div>
</Slide>
