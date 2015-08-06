\dt;

DROP TABLE logs;

CREATE TABLE logs (
       id SERIAL,
       privalversion text,
       time text,
       hostname text,
       name text,
       procid text,
       msgid text,
       data text
);
