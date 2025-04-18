// @ts-check
/** @type {import('@stryker-mutator/api/core').PartialStrykerOptions} */
const config = {
  packageManager: "pnpm",
  reporters: ["html", "clear-text", "progress"],
  testRunner: "vitest",
  coverageAnalysis: "perTest",
  cleanTempDir: false,
  plugins: ["@stryker-mutator/vitest-runner"],
};
export default config;
