<script lang="ts">
	export let name = 'example.md'
	export let external = false
	export let fragment = false
</script>

{#if external}
	<section data-markdown={name} />
{:else}
	<section data-markdown class={fragment ? 'fragment' : ''}>
		<div data-template>
			<slot />
		</div>
	</section>
{/if}
