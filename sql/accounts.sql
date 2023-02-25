CREATE SEQUENCE account_seq start with 1; 

CREATE TABLE accounts (
    user_id bigint NOT NULL DEFAULT nextval('account_seq'),
    first_name varchar(50) NOT NULL,
    last_name varchar(50) NOT NULL,
    ssn int NOT NULL UNIQUE,
    username varchar(50) NOT NULL UNIQUE,
    pass_word varchar(50) NOT NULL,
    email varchar(50) NOT NULL UNIQUE,
    num_of_trades bigint DEFAULT 0,
    total_deposit NUMERIC(1000,2) DEFAULT 0.00,
    total_withdrawn NUMERIC(1000,2) DEFAULT 0.00,
    current_bal NUMERIC(1000,2) DEFAULT 0.00,
    net_profit NUMERIC(1000,2) DEFAULT 0.00,
    PRIMARY KEY (user_id),
    CHECK (net_profit = currBal + total_withdrawn - total_deposit)
);
