FROM elixir:1.13.3-alpine
WORKDIR /app
RUN mix local.rebar --force && mix local.hex --force
COPY app/mix.exs app/mix.lock ./
RUN mix deps.get
COPY /app /app
