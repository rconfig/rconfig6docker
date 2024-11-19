<!-- References:
https://www.twilio.com/blog/get-started-docker-laravel
https://laravel-for-newbie.kejyun.com/en/advanced/scheduling/docker/
https://github.com/mohammadain/laravel-docker-cron/blob/master/Dockerfile -->

<!-- Improved compatibility of back to top link: See: https://github.com/othneildrew/Best-README-Template/pull/73 -->

<a name="readme-top"></a>

<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://github.com/rconfig/rconfig">
            <img src="https://www.rconfig.com/images/rConfig_logos/new/blue/hex_logo_blue_horizontal_96.png" alt="rConfig Logo" />
  </a>

  <h3 align="center">rConfig v6 Core Docker Setup</h3>

  <p align="center">
    rConfig v6 Core is a free, open source, community edition of rConfig v6. It is a fully functional version of rConfig v6, with all the core features of rConfig v6 Professional, but with some limitations. Check out our <a href="https://www.rconfig.com/pricing#full-features"><strong>features list</strong></a> to learn more.
    <br />
    <br />
    <a href="https://v6docs.rconfig.com"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="#intro">Intro</a>
    ·
    <a href="#setup">Installation</a>
    ·
    <a href="#update">Updating</a>
    ·
    <a href="#contributing">Contributing</a>
    ·
    <a href="#license">License</a>
    ·
    <a href="#support">Support</a>
  </p>

[![Tests](https://github.com/eliashaeussler/typo3-badges/actions/workflows/tests.yaml/badge.svg)](https://github.com/eliashaeussler/typo3-badges/actions/workflows/tests.yaml)
[![License](https://img.shields.io/github/license/eliashaeussler/typo3-badges)](LICENSE) [![Made with Node](https://img.shields.io/badge/dynamic/json?label=node&query=%24.engines%5B%22node%22%5D&url=https%3A%2F%2Fraw.githubusercontent.com%2FMichaelCurrin%2Fbadge-generator%2Fmaster%2Fpackage.json)](https://nodejs.org 'Go to Node.js homepage')
[![PHP Version Require](https://poser.pugx.org/pugx/badge-poser/require/php)](https://packagist.org/packages/pugx/badge-poser)

 <img src="https://img.shields.io/badge/-Vue3-4FC08D?logo=vue.js&logoColor=white&style=flat"/>
 <img src="https://img.shields.io/badge/-Laravel-FF2D20?logo=laravel&logoColor=white&style=flat"/>
 <!-- <img src="https://img.shields.io/badge/-Tailwind%20CSS-06B6D4?logo=tailwind-css&logoColor=white&style=flat"/> -->
 <img src="https://img.shields.io/badge/-ViteJs-6e37a0?logo=vite&logoColor=white&style=flat"/>
 <img src="https://img.shields.io/badge/-PatternFly-004285?logo=Ghost&logoColor=white&style=flat"/>
 <img src="https://img.shields.io/badge/-mySQL-4479A1?logo=mysql&logoColor=white&style=flat"/>

</div>

<!-- Intro -->

<a name="intro"></a>

## Intro

rConfig v6 Docker Setup is a set of scripts to help you get started with rConfig V6 Core on Docker. rConfig V6 Coreis an enterprise grade Network Configuration Management (NCM) software package with superior NCM features and capabilities to help you easily manage configurations on large and small heterogenous networks. rConfig v6 is our flagship professional version of rConfig aimed at high value networks and business operations. rConfig v6 runs natively on many variants of Linux. Within this repo, we have developed docker compose - Dockerfile files and related artifacts to allow our customers run rConfig v6 within a Docker environment.

If you are looking for rConfig V6 professional, please visit `https://www.rconfig.com/`.

Supported OS

- Rocky Linux 8/9+
- RHEL Linux 8/9+
- CentOS Linux 8/9+
- Ubuntu 20.04+

rConfig v6 core is completely free, you do not need an API key from rConfig to download and use this version. Please follow the instructions below to get started.

## rConfig Editions

| Feature              | rConfig Core        | rConfig Professional |
|----------------------|---------------------|----------------------|
| Configuration Backup | :white_check_mark:  | :white_check_mark:   |
| Multi-Vendor Support | :white_check_mark:  | :white_check_mark:   |
| Unlimited Devices | :white_check_mark:  | :white_check_mark:   |
| Enterprise Features  | :x:                 | :white_check_mark:   |
| API Access           | :x:                 | :white_check_mark:   |
| Premium Support      | :x:                 | :white_check_mark:   |

_Check out more on our [features page](https://www.rconfig.com/pricing#full-features)._

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- Installation -->

<a name="setup"></a>

## Installation

We have made it super easy to get started with rConfig v6 on Docker. Follow the steps below to get started.

### Prerequisites

- Docker & Docker Compose installed on your server

> **Note**
> You will need to be logged in as root when running the scripts.

### Steps

### rConfig Setup Steps

1. Login as root
2. Clone this repository to your server

```sh
git clone https://github.com/rconfig/rconfig6docker.git
```
3. Change directory to the repo

```sh
cd rconfig6docker
```
4. Edit the .env file and update the following variables:

```sh
cd /data
APP_URL="https://SERVER.DOMAIN.LOCAL" # Your FQDNorIP domain
DB_HOST=db # This is the name of the database container or other server if you are using an external database
DB_PORT=3306 # The port of the database server
DB_DATABASE=DBNAME # The name of the database, this can be anything if you are creating a new database
DB_USERNAME=DBUSER # The username for the database
DB_PASSWORD=DBPASS # The password for the database
```
5. Run the following command to start the rConfig V6 Docker container:
```sh
cd /rconfig6docker
docker-compose up -d --build
```
6. Verify that the container is running by running the following command:
```sh
docker-compose ps
```
7. Once the containers are up and running with no errors from the previous output, login to the app container.
```sh
docker exec -it {app container name} /bin/bash
```
8. You need to complete the installation by running the following commands inside the container:
```sh
php artisan migrate
```
If you area asked Do you want to run this command?', type `yes` and press enter.
The output from the above should look like this:
```sh
                                    APPLICATION IN PRODUCTION.


 ┌ Are you sure you want to run this command? ──────────────────┐
 │ Yes                                                          │
 └──────────────────────────────────────────────────────────────┘

   INFO  Preparing database.

  Creating migration table ............................................................. 26ms DONE


   INFO  Running migrations.

  2016_06_01_000001_create_oauth_auth_codes_table ...................................... 42ms DONE
  2016_06_01_000002_create_oauth_access_tokens_table ................................... 40ms DONE
  
```
```sh
php artisan key:generate
```
```sh
php artisan passport:install
```
```sh
php artisan rconfig:sync-tasks
```
```sh
php artisan rconfig:clear-all
```
```sh
chown -R www-data:www-data /var/www/html/rconfig/storage
```
```sh
chmod -R 775 /var/www/html/rconfig/storage
```
9. Open your browser and navigate to your server's domain name, the default port for the web app is 8080. You should see the rConfig login page. The default system credentials are below. Please change or remove these as soon as a new admin user is created.

Username: admin@domain.com
Password: admin

Check out our docs [v6docs.rconfig.com](https://v6docs.rconfig.com) to learn more


<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- Updating -->

<!-- CONTRIBUTING -->

<a name="contributing"></a>

## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**. We are pretty strict on code quality and style. Please follow the best practices. You should also have a strong working knowledge of PHP, Laravel, and VueJS.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request for approval to merge into the `develop` branch

#### How to run tests

1. Create a new database for testing
2. Copy the `.env.example` file to `.env.testing`
3. php artisan key:generate --env=testing
4. change the `APP_ENV` variable in the `.env.testing` file to `testing`
5. Update the `.env.testing` file with the correct database credentials
6. Run the tests with `php artisan test`


<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- LICENSE -->

<a name="license"></a>

## License

This code base for this repository's code is distributed under License from rConfig. See `LICENSE.txt` for more information. rConfig v6 Professional is excluded from this license and repository.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- https://github.com/othneildrew/Best-README-Template/blob/master/README.md -->

<a name="support"></a>

## Support

Although we provide this code free and open source, rConfig v6 core is based best effort support basis. You may open issues in the issue section here at github. We will try to address issues in a timely manner, but without guarantees. For prompt support and business critical environments, you should take out a subscription for rCOnfig v6 Professional. rConfig Professional subscribers should open a ticket via our normal support channels.

## Acknowledgments

Inspiration, code snippets, etc.

- [Laravel](https://www.laravel.com)
- [vuejs](https://vuejs.org/)
- [patternfly v4](https://v4-archive.patternfly.org/v4/)

See composer.json and package.json for a full list of dependencies, and their licenses.
