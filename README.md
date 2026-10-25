# BotCollection

BotCollection is a SilverStripe CMS project for showcasing and managing a curated collection of Transformers figurines. The application is built on the SilverStripe 4 installer stack and includes project-specific code under `mysite/` and theme assets under `themes/`.

## Overview

This repository contains:

- a SilverStripe CMS application for a figurine collection catalogue
- custom project code in `mysite/`
- front-end styling and assets in `themes/`
- supporting PHP dependencies managed by Composer
- a local environment setup configured for MySQL and a development URL

## Tech Stack

- PHP / SilverStripe CMS 4
- MySQL
- Composer
- custom project modules and theme integrations

## Local Setup

1. Install PHP dependencies:
   `composer install`
2. Create or update your local environment file:
   `cp .env.example .env`
3. Configure your local MySQL connection in `.env`.
4. Create the database referenced by `SS_DATABASE_NAME`.
5. Build the SilverStripe database and manifest data:
   `vendor/bin/sake dev/build`
6. Open the site in a browser at the configured base URL, typically:
   `http://botcollection.local`

## Project Structure

- `mysite/` – custom project code, templates, and configuration
- `themes/` – site theme files and front-end assets
- `resources/` – compiled or shared frontend resources
- `assets/` – uploaded media and managed files
- `vendor/` – Composer dependencies
- `.env` – local environment configuration

## Common Commands

- Install dependencies:
  `composer install`
- Update dependencies:
  `composer update`
- Run a local PHP development server:
  `php -S localhost:8000`
- Rebuild SilverStripe manifests and database state:
  `vendor/bin/sake dev/build`

## Notes

This project was scaffolded from the SilverStripe installer and adapted for BotCollection, a curated Transformers figurines collection. If you are setting up the project for the first time, ensure your local PHP/MySQL environment matches the values in `.env` before running the SilverStripe build steps.

## License

This project includes the standard repository license from the SilverStripe installer setup. See `LICENSE` for details.
