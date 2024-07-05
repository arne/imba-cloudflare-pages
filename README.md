# Imba Cloudflare Pages with D1

This repository contains my current work-in-progress solution for running Imba on Cloudflare Pages with D1 support. Despite some drawbacks, it showcases a functional setup for this stack.

## Drawbacks

* *Sequential fetch requests*: Currently, fetch requests are made on the client side, resulting in two sequential requests to the server. Ideally, this should be optimized to a single request.
* *Separate router for `/api` endpoints*: The API endpoints are handled by a separate router, specified using the _routes.json file. The server-side routing uses [cloudflare-worker-router](https://github.com/tsndr/cloudflare-worker-router).
* *Two Build Steps*: There are two build steps—one for the client and one for the worker. This process feels cumbersome but it works.
* *Lack of best practices*: Still don't know best practices in fetching data and handling errors in a smooth way in Imba.

## Preview
You can preview the current code here: [https://imba-cloudflare-pages.pages.dev/](https://imba-cloudflare-pages.pages.dev/)

## Running it yourself
Not a lot of dependencies, but the build process is kinda wonky.
1. Create your own database with `wrangler`, typically like this:
   ```
   wrangler d1 create imba-todo
   ```
2. Paste the parameters into the `wrangler.toml`-file.
3. Create the table on the database with:
   ```
   npx wrangler d1 execute imba-todo --local --file=./src/server/db/sql/initial.sql
   ```
4. Build the project with
   ```
   npm run build
   ```
5. Run it with
   ```
   npm run dev
   ```

## Future Improvements

* Optimize the fetch request process to reduce the number of server requests.
* Streamline the build process to eliminate the need for separate steps.
* Establish best practices for data fetching and error handling in Imba.

## Contributing

Feel free to submit issues or pull requests if you have suggestions or improvements.
