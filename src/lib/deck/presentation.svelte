<script lang="ts">
  import Code from "./code.svelte";
  import Slide from "./slide.svelte";
</script>

<Slide>
  <div class="flex flex-row w-full justify-between items-end">
    <div class="flex flex-col">
      <h3>Hi 👋</h3>

      <p>
        I'm Lukas, I work at <a href="https://sentry.io/welcome">Sentry</a>
      </p>

      <div class="flex flex-col gap-2 items-start">
        <p>About me:</p>
        <ul>
          <li>Aviation ✈️</li>
          <li>Archery 🏹</li>
          <li>Testing 🧪</li>
        </ul>
      </div>
    </div>
    <div class="flex flex-col items-center">
      <img src="/ls-2.jpg" class="rounded-full w-64" alt="Lukas Stracke" />
      <p class="text-[1.5rem]">Lukas Stracke</p>
      <ul class="text-sm list-none">
        <li>GitHub: <a href="https://github.com/Lms24">@Lms24</a></li>
        <li>
          Twitter: <a href="https://twitter.com/lukasstracke">@lukasstracke</a>
        </li>
      </ul>
    </div>
  </div>
</Slide>

<Slide>
  <div class="flex flex-col w-full justify-between items-center">
    <div class="flex flex-col items-center gap-4">
      <h3>Mutation Testing</h3>
      <p>"How to test your tests"</p>
    </div>
  </div>
</Slide>

<Slide>
  <div class="flex flex-col w-full justify-between items-center">
    <h3>What We're gonna talk about:</h3>

    <ol>
      <li>Intro to mutation testing</li>
      <li>MT in JavaScript (live demo 🤞)</li>
      <li>MT at Sentry</li>
    </ol>
  </div></Slide
>

<Slide>
  <p>We all want to know how good we test our code.</p>
  <p>But how?</p>
</Slide>

<Slide>
  <h3>Code Coverage</h3>
  <div class="flex flex-col w-full justify-between items-center">
    <img src="coverage.png" class="w-1/2" alt="Coverage Badges" />
  </div>

  <p>Line, branch, function, etc.., coverage</p>
</Slide>

<Slide>
  <div class="flex flex-col w-full justify-between items-center">
    <h4>But there's a problem:</h4>
    <Code id="code" lines={true} noescape={true}>
      {`
      test('myFunction works flawlessly', () => {
        const result = myFunction();
        expect(true).toBe(true);
      })
        `}
    </Code>
    <img src="cov-100.png" class="w-40" alt="Coverage Problem" />
  </div>
</Slide>

<Slide>
  <h3>Enter Mutation Testing</h3>

  <p>Actually test your tests</p>
</Slide>

<Slide>
  <h3>How does it work?</h3>
</Slide>

<Slide>
  <p>1. Generate mutants</p>
  <Code id="code" lines={true} noescape={true}>
    {`
    // original
    function isEven(n) {
      return n % 2 === 0;
    }
    `}
  </Code>
</Slide>

<Slide>
  <p>1. Generate mutants</p>
  <Code id="code" lines={true} noescape={true}>
    {`
    // equality operator
    function isEven(n) {
      return n % 2 !== 0;
    }
    `}
  </Code>
</Slide>

<Slide>
  <p>1. Generate mutants</p>
  <Code id="code" lines={true} noescape={true}>
    {`
    // condition operator
    function isEven(n) {
      return false;
    }
    `}
  </Code>
</Slide>

<Slide>
  <p>1. Generate mutants</p>
  <Code id="code" lines={true} noescape={true}>
    {`
    // block statement operator
    function isEven(n) {
    }
    `}
  </Code>
</Slide>

<Slide>
  <p>2. Run tests against mutant</p>
  <ul>
    <li>Tests fail/crash: Mutant is "killed"</li>
    <li>Tests pass: Mutant "survived"</li>
  </ul>
</Slide>

<Slide>
  <p>3. Repeat for all mutants</p>
</Slide>

<Slide>
  <p>Result: Mutation Score</p>
  <p>#all_mutants / #killed_mutants</p>
</Slide>

<Slide>
  <h3>Mutation Testing in JavaScript</h3>

  <p>Using <a href="https://stryker-mutator.io">Stryker</a></p>
</Slide>

<Slide>
  <h3>Live Demo Time</h3>
</Slide>

<Slide>
  <h3>Limitations</h3>
</Slide>

<Slide>
  <p>Equivalent mutants</p>

  <Code id="code" lines={true} noescape={true}>
    {`
    // original
    function add(a, b) {
      return a + b;
    }
    `}
  </Code>

  <Code id="code" lines={true} noescape={true}>
    {`
    // mutant
    function add(a, b) {
      return b + a;
    }
    `}
  </Code>

  <p class="text-2xl">➡️ Mutant can't be killed</p>
</Slide>

<Slide>
  <p>Performance</p>

  <ul>
    <li>Slower than coverage calculation</li>
    <li>MT doesn't scale well</li>
    <li>Requires "fast" tests</li>
  </ul>
</Slide>

<Slide>
  <h3>Mutation Testing at Sentry</h3>
  <p>Applied to Sentry's JS SDK Codebase</p>
</Slide>

<Slide>
  <h3>We have lots of tests</h3>
  <ul>
    <li>Unit tests (Jest, Vitest)</li>
    <li>Integration tests (Jest, Playwright)</li>
    <li>End-to-end tests (Playwright)</li>
  </ul>
  <p>➡️ Stryker doesn't support Playwright</p>
</Slide>

<Slide>
  <h3>We work in a monorepo</h3>
  <ul>
    <li><code>@sentry/react</code></li>
    <li><code>@sentry/browser</code></li>
    <li><code>@sentry/core</code></li>
    <li>...</li>
  </ul>
  <p>➡️ Tests in individual packages and across packages</p>
</Slide>

<Slide>
  <h3>MT with Stryker</h3>
  <ul>
    <li>Only at package-level</li>
    <li>Works fairly well</li>
    <li>Duration is "acceptable"</li>
    <li>Jest ➡️ Vitest is ⚡️</li>
    <li>But...</li>
  </ul>
</Slide>

<Slide>
  <h3>Problems</h3>
  <ul>
    <li>Mutation Score doesn't tell the whole story</li>
    <li>Too slow to run on every PR</li>
    <li>No great solutions (yet) to track score over time</li>
  </ul>
</Slide>

<Slide>
  <h3>Recap</h3>
  <ul>
    <li>Mutation Testing is cool</li>
    <li>JavaScript is a good fit</li>
    <li>Complex code bases are challenging</li>
    <li>Give it a try!</li>
  </ul>
</Slide>

<Slide>
  <div class="flex flex-col w-full justify-between items-center gap-16">
    <h3>Thanks!</h3>
    <div class="flex flex-row gap-20">
      <div class="flex flex-col">
        <img src="/blog-link.png" class="w-64" alt="QR Code to Blog Post" />
        <p>
          <a href="https://sentry.engineering/blog/js-mutation-testing-our-sdks"
            >Blog Post</a
          >
        </p>
      </div>
      <div class="flex flex-col mb-20">
        <img src="/slides-link.png" class="w-64" alt="QR Code to Slide Deck" />
        <p>
          <a href="https://github.com/Lms24/24-10-viennajs-mutation-testing"
            >Slide Deck</a
          >
        </p>
      </div>
    </div>
  </div>
</Slide>
