\dt;

DROP TABLE logs;

CREATE TABLE logs (
       id SERIAL,
       received timestamp default now(),
       privalversion text,
       time text,
       hostname text,
       name text,
       procid text,
       msgid text,
       data text
);
