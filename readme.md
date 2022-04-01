# Phoenix/Elixir, Postresql, Docker Base

A generalized docker framework for creating a Elixir/Phoenix REST API using PostgreSQL as a data store.

## Docker Dependencies

Elixir - https://hub.docker.com/_/elixir (Alpine)

Postgres - https://hub.docker.com/_/postgres (Alpine)

## Creating an Application

1) First install hex and the phoenix app generator

`mix archive.install hex phx_new`

2) Now bootstrap the application...

- For a REST API (minimal):

`mix phx.new app --app APINAME --no-assets --no-html --no-gettext --no-dashboard --no-live --no-mailer`

- For a more traditional webapp:

`mix phx.new app --app APPNAME`

3) Now in app/config/dev.exs change:

  `hostname: "localhost",`

to

  `hostname: "db",`

to configure the app/api to point at the postgres docker image.

and

  `http: [ip: {127, 0, 0, 1}, port: 4000]`

to

  `http: [ip: {0, 0, 0, 0}, port: 4000]`

so the app/api can be accessed outside the container.

## Adding an endpoint and table (changeset)

`cd app`

`mix phx.gen.context Test Entity entities a_string:string an_integer:integer`

`mix phx.gen.json Test Entity entities a_string:string an_integer:integer --no-context`

then add the new route to app/lib/appname_web/router.ex under :api:

`resources "/entities", EntityController, except: [:new, :edit]`

## Start the app/api

`docker-compose up`

## Reference Links

https://www.dairon.org/2020/07/06/simple-rest-api-with-elixir-phoenix.html

https://danielwachtel.com/devops/dockerizing-a-phoenix-app-with-a-postgresql-database

The following are (kind of) examples (look at docker artifacts):

https://github.com/codeship-library/elixir-phoenix-quickstart/blob/master/docker-compose.yml

https://github.com/codeship-library/elixir-phoenix-quickstart

https://medium.com/codex/how-to-persist-and-backup-data-of-a-postgresql-docker-container-9fe269ff4334

Note from Nick
mix phx.gen.json RideShare Api.RideRequest ride_requests origin:string destination:string guests:integer --web Api --no-context --no-schema
