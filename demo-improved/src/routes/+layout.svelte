<script lang="ts">
  import "../app.css";
</script>

<nav class="bg-orange-600 text-white shadow-md">
  <div class="container mx-auto px-4 py-3 flex justify-between items-center">
    <div class="flex items-center">
      <a href="/" class="text-xl font-bold flex items-center">
        Svelte Summit
      </a>
    </div>
    <div class="flex space-x-4">
      <a href="/" class="hover:text-orange-200 transition-colors">Home</a>
      <a href="/overview" class="hover:text-orange-200 transition-colors"
        >Conference Tasks</a
      >
    </div>
  </div>
</nav>

<main>
  <slot />
</main>

<footer class="bg-gray-100 py-6 mt-8">
  <div class="container mx-auto px-4 text-center text-gray-600">
    <p>© 2025 Svelte Summit Todos. All rights reserved.</p>
    <p class="text-sm mt-2">
      A demo application for the Svelte Summit conference
    </p>
  </div>
</footer>
