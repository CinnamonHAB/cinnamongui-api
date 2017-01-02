# CinnamonGUI API

Before using or developing create `api.env` and `db.env` in the `env/` directory. See `env/*.example` files.

## Developing

Run

```
docker-compose run api /bin/bash
```

In the console run `./scripts/start_server.sh` at least once, so gems and database get set up.

Afterwards, you can start the server using `bundle exec rails s -b '0.0.0.0'`. Also, all other rails commands work as expected.

To load initial data, run `bundle exec rake db:seed`

You can access the app at http://localhost:3000.
