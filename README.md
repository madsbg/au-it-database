# AU i informationsteknologi - Database

### Undervisningsmateriale

- Moodle: https://cphbusiness.mrooms.net/course/view.php?id=18043


### Bøger

- SQL in easy steps, 4th edition (ISBN 9781840789027)  
  https://ineasysteps.com/products-page/sql-in-easy-steps-4th-edition/

### Nyttige resurser

- [W3Schools SQL Tutorial](https://www.w3schools.com/sql/) - Opslagsværk med forklaring på de fleste SQL kommandoer.

## Opsætning af kursusmiljø

Kursusmiljøet er bygget på et Docker image med en [MariaDB](https://mariadb.org/) database server. Administrationsværktøjet [DBeaver](https://dbeaver.io/) benyttes til at forbinde til databasen og udføre SQL kommandoer.

### Installer Docker Desktop

Begynd med at installere [Docker Desktop](https://www.docker.com/products/docker-desktop/) til dit operativsystem. Hvis du bruger Windows skal du først [installere WSL](https://learn.microsoft.com/en-us/windows/wsl/install) (Windows Subsystem for Linux), inden du kan installere Docker Desktop.

Derefter skal følgende kommandoer udføres i et terminal vindue.

Hent det seneste Docker image med MariaDB database serveren.
```
docker pull mariadb:latest
```

Opret et lokalt volume til at gemme MariaDB databasen, så den ikke mistes, hvis Docker containeren skal genopbygges.
```
docker volume create mariadb_data
```

Opret og start en Docker container med en MariaDB database server. Hele kommandoen skal skrive på én linje (uden skråstreger '\\'). Den er delt op her for overskuelighedens skyld.
Du skal selv vælge et password. Husk det, for du skal bruge det igen senere.
```
docker run --name db1 \
  -e MARIADB_ROOT_PASSWORD=<dit_password> \
  -p 3306:3306 \
  -v mariadb_data:/var/lib/mysql \
  -d mariadb:latest
```
Kontroller at Docker contianeren kører med kommandoen:
```
docker ps
```

### Installer DBeaver

Download [DBeaver Community](https://dbeaver.io/download/) til dit operativ system og udfør derefter [installationen](https://dbeaver.io/download/#requirements).

Åbn DBeaver og opret en ny forbindelse til MariaDB database serveren:
1. Vælg *New Database Connection*.
2. Vælg *MariaDB* som database.
3. Udfyld følgende felter:
    - Server Host: localhost
    - Port: 3306
    - Database: \<blank\>
    - Username: root
    - Password: \<dit_password\>
4. Klik derefter på *Test Connection*.
5. Afslut konfigurationen ved at klikke på *Finish*.

Kontroller forbindelsen til MariaDB serveren i Docker containeren ved at udføre denne kommando i et editor vindue i DBeaver. Semikolon er en del af kommandoen:
````
SELECT 1;
````
Hvis forbindelsen til databaser serveren fungerer korrekt returneres resultatet '1'.

