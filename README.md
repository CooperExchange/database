# Cooper Exchange
The current respository is the database code for Cooper Exchange.

## To-do list
- [ ] Use Java to add a new user
- [ ] Use Java to process login
- [ ] Use Java to update username, email, first name, and last name
- [ ] Use Java to deposit and withdraw account balance
- [ ] Use Java to reset an account

## Setup local database via Docker
Set up a local Postgres database via Docker

```agsl
$ docker pull postgres
$ mkdir -p ~/srv/postgres
```

Run the local database
```agsl
$ docker run --rm --name lil-postgres -e POSTGRES_PASSWORD=password -d -v $HOME/srv/postgres:/var/lib/postgresql/data -p 5432:5432 postgres
```

```agsl
$ docker exec -it lil-postgres bash // go into the docker container
$ psql -h localhost -U postgres // run SQL comands
```

## A quick tutorial for CRUD operations via command-line
Create a database called `cooper_exchange`

```sql
CREATE DATABASE cooper_exchange;
```

Allow edit privilleges to the `cooper_exchange` database
```sql
GRANT ALL PRIVILEGES ON DATABASE cooper_exchange TO postgres;
```

Connect to the `cooper_exchange` database
```sql
\c cooper_exchange
```

Create a table called `accounts`

```sql
CREATE SEQUENCE hp_accounts_seq start with 10000;

CREATE TABLE accounts (
    user_id bigint NOT NULL UNIQUE,
    first_name varchar(50) NOT NULL,
    last_name varchar(50) NOT NULL,
    username varchar(50) NOT NULL UNIQUE,
    pass_word varchar(50) NOT NULL,
    email varchar(50) NOT NULL UNIQUE,
    num_of_trades bigint DEFAULT 0,
    total_deposit bigint DEFAULT 0,
    total_withdrawn bigint DEFAULT 0,
    currBal bigint DEFAULT 0,
    net_profit bigint DEFAULT 0,
    PRIMARY KEY (user_id),
    CHECK (net_profit = currBal + total_withdrawn - total_deposit)
);
```

View the `accounts` schema

```sql
\d accounts
```

Initialize accounts

```sql
INSERT INTO accounts (user_id, first_name, last_name, username, pass_word, email)
VALUES
    (101,'Bob', 'Lee', 'bobleesj', 'abc123', 'sangjoon.lee123@cooper.edu'),
    (102,'Evan', 'Kluger', 'evankg', 'abc123', 'evan.kluger123@cooper.edu'),
    (103,'Aliza', 'Meller', 'alizaml', 'abc123', 'aliza.meller123@cooper.edu'),
    (104,'Kanghyuk', 'Lee', 'chriskl', 'abc123', 'kanghyuk.lee123@cooper.edu');
```

Useful SQL commands

```sql
SELECT * FROM accounts;
SELECT first_name FROM accounts;
SELECT count(*) FROM accounts;
SELECT count(distinct(first_name)) FROM accounts;
DELETE FROM accounts WHERE user_id=100;
```

