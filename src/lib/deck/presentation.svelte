<script lang="ts">
  import Slide from "./slide.svelte";
</script>

<Slide>
  <div class="flex flex-row w-full justify-between items-end">
    <div class="flex flex-col">
      <h3 class="normal-case">Hi 👋</h3>

      <p>
        I'm Lukas, I work at <a href="https://sentry.io/welcome">Sentry</a>
      </p>

      <div class="flex flex-col gap-2 items-start">
        <p>About me:</p>
        <ul>
          <li>Aviation ✈️</li>
          <li>Archery 🏹</li>
        </ul>
      </div>
    </div>
    <div class="flex flex-col items-center">
      <img src="/ls-2.jpg" class="rounded-full w-64" alt="Lukas Stracke" />
      <p class="text-[1.5rem]">Lukas Stracke</p>
      <ul class="text-sm list-none">
        <li>GitHub: <a href="https://github.com/Lms24">@Lms24</a></li>
        <li>
          Bluesky: <a href="https://bsky.app/profile/stracke.tech">@stracke.tech</a>
        </li>
        <li>
          Website: <a href="https://stracke.tech">stracke.tech</a>
        </li>
      </ul>
    </div>
  </div>
</Slide>