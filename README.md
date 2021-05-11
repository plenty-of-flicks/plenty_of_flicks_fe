<!-- Shields -->
![](https://img.shields.io/badge/Rails-6.1.1-informational?style=flat&logo=<LOGO_NAME>&logoColor=white&color=2bbc8a)
![](https://img.shields.io/badge/Ruby-2.5.3-orange)

# Plenty of Flicks FE

![plenty_of_flicks_logo](https://user-images.githubusercontent.com/68172332/116182397-753d5580-a6d9-11eb-8392-15235cc6feb0.png)

## Table of Contents
  - [What it does](#what-it-does)
  - [How to Install](#how-to-install)
  - [Dependencies](#dependencies)
  - [Learning Goals](#learning-goals)
  - [Project Diagram](#project-diagram)
  - [Licenses](#licenses)
  - [Contact](#contact)
  
## What it does

### The Plenty of Flicks App

> We all know the struggle. You sit down to watch a movie with a group of friends or significant other, and spend more time picking out a suitable flick than actually watching the movie. Enter Plenty of Flicks. Users can explore available movies on three supported subscription services (Netflix, Amazon Prime Video and Hulu), and add movies to their watchlist. When it's time to watch, users create a party with the group they want to watch with, and voila: PoF presents a list of movies they ALL want to watch.

### The Plenty of Flicks BE Repo

> The Plenty of Flicks FE Repo utilizes the custom endpoints created by the BE repo to create a versatile client-facing web application. With the repo, users can log in/out with Google Omniauth, add movies from Netflix, Hulu and Amazon Prime Video to their watchlists, add friends, create groups, and view shared watchlists.
> 
> Please [visit the Plenty of Flicks BE Repo here](https://github.com/plenty-of-flicks/plenty_of_flicks_be).

## How to Install

For usage on your local machine follow the instructions listed below:

> 1. git clone git@github.com:plenty-of-flicks/plenty_of_flicks_fe.git
> 1. cd plenty_of_flicks_fe
> 1. bundle
> 1. rake db:{create,migrate}
> 1. bundle exec figaro install
> 1. Add Plenty of Flicks BE domain, google client id and google client secret to the config/application.yml file (Google client id and secret available at https://developers.google.com/identity/gsi/web/guides/get-google-api-clientid)
```
  # in config/application.yml
    POF_BE: 'http://localhost:8000'
    GOOGLE_CLIENT_ID: <your google client id>
    GOOGLE_CLIENT_SECRET: <your google client secret>
 ```
> 7. rails s
> 8. Visit localhost:3000 in your web browser
> 9. ***For use with localhost BE domain, be sure to also run `rails s -p 8000` in your plenty_of_flicks_be directory***

## Dependencies

* This app uses Rails version `6.1.3.1`

* The [Figaro](https://github.com/laserlemon/figaro) gem is used to keep confidential information like API keys secure.

* The [SimpleCov](https://github.com/simplecov-ruby/simplecov) gem is used to ensure that 100% of our code is covered with unit testing.

* The [Omniauth Google Oauth2](https://github.com/zquestz/omniauth-google-oauth2) gem is used to authenticate user login via google.

* The [Webmock](https://github.com/bblimke/webmock) and [VCR](https://github.com/vcr/vcr) gems are used for mocking and stubbing BE API calls.


## Learning Goals

  * Gain experience working on a solo full-stack application
  
  * Develop a FE application with UI/UX and user empathy in mind
  
  * Gain fluency in FE styling
  
  * Refactor code for better code for improved organization/readability

  * Write thorough and understandable documentation

## Project Diagram

## Licenses

  * Ruby 2.5.3
  * Rails 6.1.3.1

## Contact

<h4>Nick King</h4>
<img src="https://avatars.githubusercontent.com/u/68172332?s=460&u=8b0b3766e31ff6be0d1dea0a8591483dc1bdd870&v=4" alt="Nick King"
 width="150" height="auto" style="float: left" />

[GitHub Profile](https://github.com/nmking22)
