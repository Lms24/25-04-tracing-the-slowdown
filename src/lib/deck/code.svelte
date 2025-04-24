<script lang="ts">
	export let id: string | null = null;
	export let lines: string | boolean | null = null;
	export let noescape = false;
</script>

<pre data-id={id || null} class="border border-gray-200 rounded-lg !bg-gray-800 p-1">
  <code
		data-trim
		data-line-numbers={lines || null}
		data-noescape={noescape || null}
		class="language-javascript">
    <slot />
  </code>
</pre>
