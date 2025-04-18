import { defineConfig } from "vitest/config";

export default defineConfig({
  test: {
    include: ["test/*.test.js"],
    coverage: {
      exclude: [
        "node_modules",
        "stryker.config.mjs",
        "vite.config.ts",
        "**/*.test.js",
      ],
    },
  },
});
