CREATE SEQUENCE account_seq start with 1; 

CREATE TABLE accounts (
    user_id bigint NOT NULL DEFAULT nextval('account_seq'),
    first_name varchar(50) NOT NULL,
    last_name varchar(50) NOT NULL,
    username varchar(50) NOT NULL UNIQUE,
    pass_word varchar(50) NOT NULL,
    email varchar(50) NOT NULL UNIQUE,
    num_of_trades bigint DEFAULT 0,
    total_deposit bigint DEFAULT 0,
    total_withdrawn bigint DEFAULT 0,
    current_bal bigint DEFAULT 0,
    net_profit bigint DEFAULT 0,
    PRIMARY KEY (user_id),
    CHECK (net_profit = currBal + total_withdrawn - total_deposit)
);
