# Market-Nest

A minimal e‑commerce demo that lists products and shows product details.

## Project overview
Market Nest is a small storefront app whose scope is intentionally tiny — it provides:
- A product listing page (catalog)
- A product details page (images, description, price)

This project is meant for demos, prototypes, or as a starting point for a larger storefront.

## Key features
- List products with name, price, thumbnail
- Product details with gallery, full description, and SKU/price
- Simple client-side routing (single page app) or static pages
- Minimal design so you can easily customize lay1out and styling

## How to run the app (Flutter)
1) Clone the repo (main branch)
- Open a terminal / Git Bash / PowerShell:
  git clone -b main git@github.com:silentjazz02/market-nest.git

2) Install Flutter dependencies
- From the repo root run:
  flutter pub get

3) Check your environment (optional but recommended)
- Run:
  flutter doctor

## Apis Used
This app fetches product data from the public API: https://dummyjson.com/products
Please note that only the above api route was used since the route to provide product details by id returned the same data.

## Screenshots

- assets/screenshots/splash_screen.png
- assets/screenshots/product_list_screen.png
- assets/screenshots/product_detail_screen.png