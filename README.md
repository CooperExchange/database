# Cooper Exchange
The current respository is the database code for Cooper Exchange.

## Setup local database via Docker
Set up a local Postgres database via Docker

```agsl
$ docker pull postgres
$ mkdir -p ~/srv/postgres
```

Run the Docker local database:
```agsl
$ docker run --rm --name lil-postgres -e POSTGRES_PASSWORD=password -d -v $HOME/srv/postgres:/var/lib/postgresql/data -p 5432:5432 postgres
```
To execute SQL commands in the docker container
```agsl
$ docker exec -it lil-postgres bash // go into the docker container using container name
$ docker exec -it 46c0b162a40b bash // or go into the docker container using container id
$ psql -h localhost -U postgres // run SQL comands
```

```agsl
$ CREATE DATABASE cooper_exchange;
$ GRANT ALL PRIVILEGES ON DATABASE cooper_exchange TO postgres;
$ \c cooper_exchange
```

```sql
CREATE TABLE accounts (
    user_id     SERIAL PRIMARY KEY,
    first_name varchar(50) NOT NULL,
    last_name varchar(50) NOT NULL,
    username varchar(50) NOT NULL UNIQUE,
    pass_word varchar(50) NOT NULL,
    email varchar(50) NOT NULL UNIQUE,
    total_deposit NUMERIC(1000,2) DEFAULT 0.00,
    total_withdrawal NUMERIC(1000,2) DEFAULT 0.00,
    remaining_cash NUMERIC(1000,2) DEFAULT 0.00,
);

CREATE TABLE trades (
    trade_id     SERIAL PRIMARY KEY,
    trade_type   varchar(50)      NOT NULL,
    trade_date   DATE DEFAULT CURRENT_DATE,
    user_id      bigint           NOT NULL,
    asset_symbol varchar(50)      NOT NULL,
    asset_name   varchar(50)      NOT NULL,
    asset_price  NUMERIC(1000, 2) NOT NULL,
    asset_count  NUMERIC(1000, 2) NOT NULL,
    total_price  numeric GENERATED ALWAYS AS (asset_price * asset_count) STORED
);

CREATE TABLE portfolios (
    portfolio_id        SERIAL PRIMARY KEY,
    asset_symbol varchar(50)      NOT NULL,
    user_id      bigint           NOT NULL,
    asset_name   varchar(50)      NOT NULL,
    asset_count  NUMERIC(1000, 2) NOT NULL,  
);

CREATE TABLE portfolio_history (
    portfolio-history_id SERIAL PRIMARY KEY,
    user_id      bigint           NOT NULL,
    portfolio_value NUMERIC(1000,2) NOT NULL,
    date_balance DATE DEFAULT CURRENT_DATE,
);


## Useful Tips

View the `accounts` schema

```sql
\d accounts
```

SQL commands

```sql
SELECT * FROM accounts;
SELECT first_name FROM accounts;
SELECT count(*) FROM accounts;
SELECT count(distinct(first_name)) FROM accounts;
DELETE FROM accounts WHERE user_id=100;
```

