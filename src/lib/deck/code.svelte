<script lang="ts">
	import type { Snippet } from 'svelte';

	let {
		id = null,
		lines = null,
		noescape = false,
		language = 'javascript',
		class: className = null,
		filename = null,
		fullScreen = false,
		children
	} = $props<{
		id?: string | null;
		lines?: string | boolean | null;
		noescape?: boolean;
		language?: string | null;
		class?: string | null;
		filename?: string | null;
		fullScreen?: boolean;
		children?: Snippet;
	}>();
</script>

<div class="flex flex-col items-center justify-center">
	<div class="flex-col items-start justify-stretch {fullScreen ? 'w-[60vw]' : 'w-fit'}">
		{#if filename}
			<div
				class="text-sm text-white py-1 px-4 bg-[#272822] border-t-[1px] border-x-[1px] border-grey-200 rounded-t-lg w-fit"
			>
				{filename}
			</div>
		{/if}
		<pre
			data-id={id || null}
			class="border border-gray-200 {filename
				? 'rounded-b-lg rounded-r-lg'
				: 'rounded-lg'} !bg-gray-800  m-0! w-full! p-1">
			<code
				data-trim
				data-line-numbers={lines || null}
				data-noescape={noescape || null}
				class={`language-${language} ${className}`}>
			{@render children()}
		</code>
	</pre>
	</div>
</div>