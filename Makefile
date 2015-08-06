all:
	go build

deploy: all
	git push -f heroku master
	heroku logs -t

create:
	heroku pg:psql < schema.sql

inspect:
	echo "select count(*) from logs; select * from logs limit 1;" | heroku pg:psql
