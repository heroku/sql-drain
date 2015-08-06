# sql-drain

Drain Heroku app logs to a SQL database.

## Deployment

This app can itself be deployed to heroku. You need the postgres addon, followed by running this one-off schema creation command:

```
make createschema
```

## Adding the drain

Push this app as "my-sql-drain" and then:

```
heroku drains:add -a myapp http://my-sql-drain.herokuapp.com/logs
```

Verify that the database is being updated with received logs by looking at the
count and recently received log lines:

```
make inspect
```


## Database schema

Logs are put in a table named "logs" and have the following schema. Auto-incrementing `id` column can be used to determine the log order.

```
echo "select count(*) from logs; select * from logs order by id desc limit 15;" | heroku pg:psql
---> Connecting to DATABASE_URL
 count 
-------
 67370
(1 row)

  id   | privalversion |               time               | hostname | name | procid | msgid |                     data                     
-------+---------------+----------------------------------+----------+------+--------+-------+----------------------------------------------
 67371 | <190>1        | 2015-08-06T19:14:25.798894+00:00 | host     | app  | spew.1 | -     | 78537 spews {=bY9Lg+WNUj|BqVvKEW|j0wVy[@&;m5+
       |               |                                  |          |      |        |       | 
 67370 | <190>1        | 2015-08-06T19:14:24.791121+00:00 | host     | app  | spew.1 | -     | 78536 spews %2\Vxdx#<22?l8kPX_J+/Pc!o?QNay:[+
       |               |                                  |          |      |        |       | 
 67369 | <190>1        | 2015-08-06T19:14:23.790843+00:00 | host     | app  | spew.1 | -     | 78535 spews a{T]O?Z\:dVWRsGKUL1CP=\dLGNtE^W/+
       |               |                                  |          |      |        |       | 
 67368 | <190>1        | 2015-08-06T19:14:22.782507+00:00 | host     | app  | spew.1 | -     | 78534 spews \:lE6PB*f-(\?buV,g#D:9PT9W5[C2(9+
       |               |                                  |          |      |        |       | 
 67367 | <190>1        | 2015-08-06T19:14:21.782265+00:00 | host     | app  | spew.1 | -     | 78533 spews [vnEcZdp0?Dvs^owx?gx3aIT'_AnM)Dj+
       |               |                                  |          |      |        |       | 
 67366 | <190>1        | 2015-08-06T19:14:20.781906+00:00 | host     | app  | spew.1 | -     | 78532 spews [E,U:Jci/4g|+[1r>p7A7/4AKw+:b2iL+
       |               |                                  |          |      |        |       | 
 67365 | <190>1        | 2015-08-06T19:14:19.779449+00:00 | host     | app  | spew.1 | -     | 78531 spews Pp;,>3NQ<QvpkXmVG/@(}:B?OGl]/.E6+
       |               |                                  |          |      |        |       | 
 67364 | <190>1        | 2015-08-06T19:14:18.779186+00:00 | host     | app  | spew.1 | -     | 78530 spews ){%[5cbN_PsSX'IG\D>>\>S(f|.%|5#L+
       |               |                                  |          |      |        |       | 
 67363 | <190>1        | 2015-08-06T19:14:17.777409+00:00 | host     | app  | spew.1 | -     | 78529 spews ')='Ykch=+],S%e+Bx<C|}[@Ht'7vvcI+
       |               |                                  |          |      |        |       | 
 67362 | <190>1        | 2015-08-06T19:14:16.773350+00:00 | host     | app  | spew.1 | -     | 78528 spews H%cuSI_+xM69F03mSm/U3lH9H(bv&^n++
       |               |                                  |          |      |        |       | 
 67361 | <190>1        | 2015-08-06T19:14:15.772009+00:00 | host     | app  | spew.1 | -     | 78527 spews 5'ZWxS&26=ds^e2Zm(Yb'e[wX+Vi+^jK+
       |               |                                  |          |      |        |       | 
 67360 | <190>1        | 2015-08-06T19:14:14.767980+00:00 | host     | app  | spew.1 | -     | 78526 spews %A0!>fq8<^t0\a]@g@Redu^ECRkgrDT=+
       |               |                                  |          |      |        |       | 
 67359 | <190>1        | 2015-08-06T19:14:13.765798+00:00 | host     | app  | spew.1 | -     | 78525 spews w;=JedawCTwi<vAxVz%g}(rc&H4ied*>+
       |               |                                  |          |      |        |       | 
 67358 | <190>1        | 2015-08-06T19:14:12.764213+00:00 | host     | app  | spew.1 | -     | 78524 spews Nl?]w5n!Lv}a[b0|J;\mYCP@x_Vz{&D8+
       |               |                                  |          |      |        |       | 
 67357 | <190>1        | 2015-08-06T19:14:11.765835+00:00 | host     | app  | spew.1 | -     | 78523 spews ^Y\1>s\HXK'p^v=2h]mh8mkC=/s,U%O<+
       |               |                                  |          |      |        |       | 
(15 rows)
```
