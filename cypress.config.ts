import { defineConfig } from 'cypress';

// Load environment variables
try {
  process.loadEnvFile(process.cwd() + '/.env.test');
} catch (_error) {}

export default defineConfig({
  e2e: {
    baseUrl: 'http://localhost:3000',
    env: process.env || {},
    setupNodeEvents(_on: any, _config: any) {},
  },
});
