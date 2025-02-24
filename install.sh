cd /opt

=======
>>>>>>> 337410a4930ef5ee0e37bf3831c54e8caba0d476
git clone https://github.com/sh-serenity/ser-b.git

export dbuser=dbuser
export dbpass=12houres
export dbhost=dbhost
export db=db
export myroot=dbblaroot

cd ser-b

docker-compose up --build -d

docker exec -i $dbhost  -uroot -p$myroot -e "create user $dbuser identified by '$dbpass'"
docker exec -i $dbhost  -uroot -p$myroot -e "create database $db"
docker exec -i $dbhost  -uroot -p$myroot -e "grant all on $db.* to $dbuser"
docker exec -i $dbhost  -u$dbuser -p$dbpass mysql < db.sql
