import { defineConfig } from 'astro/config';
import mdx from '@astrojs/mdx';
import tailwind from '@astrojs/tailwind';
import compress from 'astro-compress';
import icon from "astro-icon";
import sitemap from "@astrojs/sitemap";

function filterPages(page) {
  const excluded = [
    'https://www.randomscience.org/licenses/',
    'https://www.randomscience.org/privacy/',
    'https://www.randomscience.org/m4bdemo',
  ]
  return !excluded.includes(page)
}

// https://astro.build/config
export default defineConfig({
  site: 'https://www.randomscience.org',
  compressHTML: true,
  integrations: [mdx(), icon(), tailwind({
    applyBaseStyles: false
  }), compress(), sitemap({
    filter: filterPages
  }),]
});