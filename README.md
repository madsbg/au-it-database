# AU i informationsteknologi - Database

### Materiale

- Moodle: https://cphbusiness.mrooms.net/course/view.php?id=18043


### Bøger

- SQL in easy steps, 4th edition (ISBN 9781840789027)  
  https://ineasysteps.com/products-page/sql-in-easy-steps-4th-edition/

### Nyttige resurser

- [W3Schools SQL Tutorial](https://www.w3schools.com/sql/) - Opslagsværk med forklaring på de fleste SQL kommandoer.


## Opsætning af kursusmiljø

Kursusmiljøet er bygget på et Docker image med en [MariaDB](https://mariadb.org/) database server. Administrationsværktøjet [DBeaver](https://dbeaver.io/) benyttes til at forbinde til databasen.

Begynd med at installere [Docker Desktop](https://www.docker.com/products/docker-desktop/) til dit operativsystem. Hvis du bruger Windows skal du først [installere WSL](https://learn.microsoft.com/en-us/windows/wsl/install), inden du kan installere Docker Desktop.

Hent det seneste Docker image med MariaDB.
```
docker pull mariadb:latest
```

Opret et lokalt volume til at gemme MariaDB databasen, så den ikke mistes, hvis Docker containeren skal genopbygges.
```
docker volume create mariadb_data
```

Opret og start en Docker container med en MariaDB database server. Hele kommandoen skal skrive på én linje. Den er delt op her for overskuelighedens skyld.
Du skal selv vælge et password. Husk det, for du skal bruge det senere.
```
docker run --name db1 \
  -e MARIADB_ROOT_PASSWORD=<your_password> \
  -p 3306:3306 \
  -v mariadb_data:/var/lib/mysql \
  -d mariadb:latest
```