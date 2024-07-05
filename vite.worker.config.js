import { defineConfig } from "vite";
import imba from "imba/plugin";

export default defineConfig({
  plugins: [imba()],
  build: {
    ssr: true,
    ssrManifest: false,
    outDir: "dist",
    emptyOutDir: false,
    rollupOptions: {
      input: "src/server/main.imba",
      output: {
        format: "es",
        entryFileNames: "_worker.js",
        inlineDynamicImports: true,
      },
    },
    target: "esnext",
  },
});
