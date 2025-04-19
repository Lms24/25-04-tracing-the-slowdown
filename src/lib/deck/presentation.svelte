<script lang="ts">
	import Bluesky from '../../icons/bluesky.svelte';
	import Github from '../../icons/github.svelte';
	import Globe from '../../icons/globe.svelte';
	import Otel from '../../icons/otel.svelte';
	import Sentry from '../../icons/sentry.svelte';
	import Svelte from '../../icons/svelte.svelte';
  import Code from './code.svelte';
	import Slide from './slide.svelte';
</script>

<Slide>
	<div class="flex flex-row w-full justify-between ">
		<div class="flex flex-col text-start items-center justify-center">
			<div class="flex-col text-start">
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
		<div class="flex flex-col items-center">
			<img src="/ls-2.jpg" class="rounded-full w-64" alt="Lukas Stracke" />
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
				<li>Observability in ESM</li>
				<li>How to get started</li>
				<li>What Svelte can do better</li>
			</ol>
      <Otel size={220}></Otel>
		</div>
	</div>
</Slide>

<Slide>
  <div class="flex flex-col w-full justify-between items-start">
    <h2>What is Tracing?</h2>

    <p>Spans: Measure duration of operations</p>
    <Code id="code" noescape={true} lines={'2,5'}>
          {`
    function getUser(id) {
      return startSpan({name: 'getUser'}, async() => {
        const res = await fetch(\`api/users/\${id}\`)
        return res.json()
      })
    }
          `}
        </Code>
  </div>
</Slide>

<Slide>
  <div class="flex flex-col w-full justify-between items-start">
    <h2>What is Tracing?</h2>
      Traces: Collection of related spans

      TODO: Image of trace span waterfall
  </div>
</Slide>


<Slide>
  <div class="flex flex-col w-full justify-between items-start">
    <h2>What is Tracing?</h2>
      Distributed: Tracing across services
      TODO: Image of distributed trace
  </div>
</Slide>

<Slide>
  <div class="flex flex-col w-full justify-between items-start">
    <h2>OpenTelemetry</h2>
    <p class="text-start">Common Standard for Observability: Terminology, APIs, SDKs, Instrumentation</p>
  </div>
</Slide>

<Slide>
  <div class="flex flex-col w-full justify-between items-start">
    <h2>Observability in ESM</h2>
    <div class="flex flex-row items-start justify-between w-full">
      <div>
        
      </div>
  </div>
</Slide>

<Slide>
  <div class="flex flex-col w-full justify-between items-start">
    <h2>Otel in SvelteKit</h2>
    <div class="flex flex-row items-start justify-between w-full">
      <div>
        
      </div>
  </div>
</Slide>

<Slide>
  <div class="flex flex-col w-full justify-between items-start">
    <h2>How SvelteKit can do better</h2>
    <div class="flex flex-row items-start justify-between w-full">
      <div>
        
      </div>
  </div>
</Slide>