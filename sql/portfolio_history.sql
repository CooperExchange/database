CREATE TABLE portfolio_history (
    portfolio_history_id bigint NOT NULL UNIQUE,
    user_id bigint NOT NULL;
    currBal bigint NOT NULL,
    date_balance date NOT NULL,
    PRIMARY KEY (portfolio_history_id),
    FOREIGN KEY (user_id) REFERENCES accounts(user_id)   
);