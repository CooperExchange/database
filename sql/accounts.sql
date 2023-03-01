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
