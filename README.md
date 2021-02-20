# Nogn Test

## Environment

- PHP 7.3.25
- MySQL 5.7.32
- Craft 3.6.6
- Node 14.5.5
- NPM 6.14.11

NOTE: We're using [NVM](https://github.com/nvm-sh/nvm) to manage Node versions.

## Craft CMS Setup

In the `/craft/` directory...

1. Run `composer install`
2. Setup a server that points to a test URL (e.g. `http://nogn.test/`)
3. Load the database backup from `/craft/db/`.
4. Run `php craft setup`.
5. Edit `.env` and update the `PRIMARY_SITE_URL` var with the test server's URL.

### Admin user account

    user: admin
    password: nogntest


## Gridsome Setup

From the `/gridsome/` directory...

1. Run `npm install`
2. Copy `.env.exmaple` to `.env`. Update the settings in `.env` with the Craft site's local api URL.

Now you're ready to run Gridsome!

    $ gridsome develop

