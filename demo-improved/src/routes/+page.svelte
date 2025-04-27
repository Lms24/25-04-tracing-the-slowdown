<script lang="ts">
  import "../app.css";
</script>

<div
  class="min-h-screen flex flex-col items-center justify-center bg-gradient-to-b from-orange-50 to-white p-4"
>
  <div class="max-w-4xl w-full text-center">
    <h1 class="text-5xl md:text-6xl font-bold text-orange-600 mb-6">
      Svelte Summit Conference Tasks
    </h1>

    <p class="text-xl text-gray-600 mb-12 max-w-2xl mx-auto">
      Track and manage all the tasks for our Svelte Summit conference booth and
      activities.
    </p>

    <div class="flex flex-col sm:flex-row gap-4 justify-center mb-16">
      <a
        href="/overview"
        class="px-8 py-4 bg-orange-600 text-white font-medium rounded-lg shadow-lg hover:bg-orange-700 transition-colors duration-300 flex items-center justify-center"
      >
        <span>View Conference Tasks</span>
        <svg
          xmlns="http://www.w3.org/2000/svg"
          class="h-5 w-5 ml-2"
          viewBox="0 0 20 20"
          fill="currentColor"
        >
          <path
            fill-rule="evenodd"
            d="M10.293 3.293a1 1 0 011.414 0l6 6a1 1 0 010 1.414l-6 6a1 1 0 01-1.414-1.414L14.586 11H3a1 1 0 110-2h11.586l-4.293-4.293a1 1 0 010-1.414z"
            clip-rule="evenodd"
          />
        </svg>
      </a>
    </div>

    <div class="grid grid-cols-1 md:grid-cols-3 gap-8 text-left">
      <div class="bg-white p-6 rounded-lg shadow-md">
        <div
          class="w-12 h-12 bg-orange-100 rounded-full flex items-center justify-center mb-4"
        >
          <svg
            xmlns="http://www.w3.org/2000/svg"
            class="h-6 w-6 text-orange-600"
            fill="none"
            viewBox="0 0 24 24"
            stroke="currentColor"
          >
            <path
              stroke-linecap="round"
              stroke-linejoin="round"
              stroke-width="2"
              d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2"
            />
          </svg>
        </div>
        <h3 class="text-xl font-semibold mb-2">Booth Setup</h3>
        <p class="text-gray-600">
          Track all tasks related to setting up our Svelte Summit booth and demo
          area.
        </p>
      </div>

      <div class="bg-white p-6 rounded-lg shadow-md">
        <div
          class="w-12 h-12 bg-orange-100 rounded-full flex items-center justify-center mb-4"
        >
          <svg
            xmlns="http://www.w3.org/2000/svg"
            class="h-6 w-6 text-orange-600"
            fill="none"
            viewBox="0 0 24 24"
            stroke="currentColor"
          >
            <path
              stroke-linecap="round"
              stroke-linejoin="round"
              stroke-width="2"
              d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"
            />
          </svg>
        </div>
        <h3 class="text-xl font-semibold mb-2">Swag & Giveaways</h3>
        <p class="text-gray-600">
          Manage all the merchandise, swag items, and giveaway preparations for
          attendees.
        </p>
      </div>

      <div class="bg-white p-6 rounded-lg shadow-md">
        <div
          class="w-12 h-12 bg-orange-100 rounded-full flex items-center justify-center mb-4"
        >
          <svg
            xmlns="http://www.w3.org/2000/svg"
            class="h-6 w-6 text-orange-600"
            fill="none"
            viewBox="0 0 24 24"
            stroke="currentColor"
          >
            <path
              stroke-linecap="round"
              stroke-linejoin="round"
              stroke-width="2"
              d="M13 10V3L4 14h7v7l9-11h-7z"
            />
          </svg>
        </div>
        <h3 class="text-xl font-semibold mb-2">Demo App</h3>
        <p class="text-gray-600">
          Track the development and setup of our OpenTelemetry tracing demo
          application.
        </p>
      </div>
    </div>
  </div>

  <footer class="mt-16 text-gray-500 text-sm">
    <p>© 2025 Svelte Summit Todos. All rights reserved.</p>
  </footer>
</div>
