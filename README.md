# sql-drain

Drain Heroku app logs to a SQL database.

## Deployment

This app can itself be deployed to heroku. You need the postgres addon, followed by running this one-off schema creation command:

```
heroku pg:psql < schema.sql
```
