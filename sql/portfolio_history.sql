CREATE SEQUENCE portfolio_history_seq start with 1;

CREATE TABLE portfolio_history (
    portfolio_history_id bigint NOT NULL DEFAULT nextval('portfolio_history_seq'),
    user_id bigint NOT NULL,
    current_bal NUMERIC(1000,2) NOT NULL,
    date_balance date NOT NULL,
    PRIMARY KEY (portfolio_history_id),
    FOREIGN KEY (user_id) REFERENCES accounts(user_id)
);
