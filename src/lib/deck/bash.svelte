<script lang="ts">
	import type { Snippet } from 'svelte';

	let {
		id = null,
		noescape = false,
		class: className = null,
		fullScreen = false,
		children
	} = $props<{
		id?: string | null;
		noescape?: boolean;
		class?: string | null;
		fullScreen?: boolean;
		children?: Snippet;
	}>();
</script>

<div class="flex flex-col items-center justify-center">
	<div class="flex-col items-start justify-stretch {fullScreen ? 'w-[60vw]' : 'w-fit'}">
		<pre
			data-id={id || null}
			class="border border-gray-200 rounded-lg !bg-[#1a1a1a] m-0! w-full! px-4 py-2 font-mono">
			<div class="flex items-center gap-2 text-gray-400 mb-2">
				<div class="flex gap-1.5">
					<div class="w-3 h-3 rounded-full bg-[#ff5f56]"></div>
					<div class="w-3 h-3 rounded-full bg-[#ffbd2e]"></div>
					<div class="w-3 h-3 rounded-full bg-[#27c93f]"></div>
				</div>
				<span class="text-sm ml-2">zsh</span>
			</div>
			<code
				data-trim
				data-line-numbers={null}
				data-noescape={noescape || null}
				class={`${className} !bg-[#1a1a1a] language-bash`}>
				{@render children()}
			</code>
		</pre>
	</div>
</div>
