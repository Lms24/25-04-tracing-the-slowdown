<script lang="ts">
	let { name = '', showText = true, class: className } = $props();
</script>

<div class="h-8 {className} rounded-md flex items-center justify-center text-sm">
	{#if name && showText}
		{name}
	{/if}
</div>
