<script lang="ts">
  const { data } = $props();
</script>

<div class="container mx-auto p-4">
  <h1 class="text-3xl font-bold mb-6 text-orange-600 text-center">
    Todo List App
  </h1>

  {#if data.error}
    <div
      class="bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded"
    >
      {data.error}
    </div>
  {:else}
    <div class="grid gap-6 grid-cols-1 md:grid-cols-2 lg:grid-cols-3">
      {#each data.users as user, index}
        <div
          class="border border-gray-300 rounded-lg p-5 bg-white shadow-md hover:shadow-lg transition-shadow duration-300 overflow-hidden relative"
        >
          <!-- User header with subtle gradient background -->
          <div
            class="absolute top-0 left-0 right-0 h-2 bg-gradient-to-r from-orange-400 to-orange-600 opacity-70"
          ></div>

          <!-- User info with avatar -->
          <div class="flex items-center mb-4 mt-2">
            <div
              class="w-12 h-12 rounded-full bg-gradient-to-br from-orange-400 to-orange-600 opacity-90 flex items-center justify-center text-white font-bold text-xl mr-3"
            >
              {user.username.charAt(0).toUpperCase()}
            </div>
            <div>
              <h2 class="text-xl font-semibold text-gray-800">
                {user.username}
              </h2>
              <p class="text-sm text-gray-600">{user.email}</p>
            </div>
          </div>

          <!-- Todo count badge -->
          <div class="mb-4">
            <span
              class="inline-block bg-orange-100 text-orange-800 text-xs font-medium px-2.5 py-0.5 rounded-full"
            >
              {user.todos.length} todos
            </span>
          </div>

          <!-- Todo list -->
          <div class="space-y-3 max-h-80 overflow-y-auto pr-2">
            {#each user.todos as todo}
              <div
                class="flex items-start gap-3 p-3 rounded-lg {todo.completed
                  ? 'bg-green-50'
                  : 'bg-gray-50'} hover:bg-opacity-80 transition-colors duration-200"
              >
                <div class="pt-1">
                  <input
                    type="checkbox"
                    checked={todo.completed}
                    disabled
                    class="h-4 w-4 rounded border-gray-300 text-orange-600 focus:ring-orange-500 {todo.completed
                      ? 'bg-green-500 border-green-500'
                      : ''}"
                  />
                </div>
                <div class="flex-1">
                  <p
                    class="font-medium {todo.completed
                      ? 'text-green-700 line-through'
                      : 'text-gray-800'}"
                  >
                    {todo.title}
                  </p>
                  {#if todo.description}
                    <p class="text-sm text-gray-600 mt-1">{todo.description}</p>
                  {/if}
                </div>
              </div>
            {/each}
          </div>
        </div>
      {/each}
    </div>
  {/if}
</div>

<style>
  :global(body) {
    background-color: #f8f9fa;
  }

  /* Custom scrollbar for todo lists */
  :global(.space-y-3::-webkit-scrollbar) {
    width: 6px;
  }

  :global(.space-y-3::-webkit-scrollbar-track) {
    background: #f1f1f1;
    border-radius: 10px;
  }

  :global(.space-y-3::-webkit-scrollbar-thumb) {
    background: #fcd5b4;
    border-radius: 10px;
  }

  :global(.space-y-3::-webkit-scrollbar-thumb:hover) {
    background: #fbbf8c;
  }
</style>
