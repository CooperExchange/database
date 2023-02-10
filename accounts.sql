CREATE TABLE accounts (
    user_id bigint NOT NULL UNIQUE,
    first_name varchar(50) NOT NULL,
    last_name varchar(50) NOT NULL,
    username varchar(50) NOT NULL,
    pass_word varchar(50) NOT NULL,
    email varchar(50) NOT NULL,
    num_of_trades bigint DEFAULT 0,
    total_deposit bigint DEFAULT 0,
    total_withdrawn bigint DEFAULT 0,
    currBal bigint DEFAULT 0,
    net_profit bigint DEFAULT 0,
    PRIMARY KEY (user_id),
    CHECK (net_profit = currBal + total_withdrawn - total_deposit)
);
