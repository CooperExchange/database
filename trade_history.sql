CREATE TABLE trade_history (
    trade_id bigint NOT NULL UNIQUE;
    user_id bigint NOT NULL,
    asset_id bigint NOT NULL,
    asset_name varchar(15) NOT NULL;
    unit_price bigint NOT NULL,
    shares bigint NOT NULL,
    buy boolean NOT NULL,
    date_purchase date NOT NULL,
    PRIMARY KEY (trade_id),
    FOREIGN KEY (user_id) REFERENCES accounts(user_id)
);