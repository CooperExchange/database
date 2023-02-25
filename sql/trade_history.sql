CREATE SEQUENCE trade_seq start with 1;

CREATE TABLE trade_history (
    trade_id bigint NOT NULL DEFAULT nextval('trade_seq'),
    user_id bigint NOT NULL,
    asset_id bigint NOT NULL,
    asset_name varchar(15) NOT NULL,
    unit_price bigint NOT NULL,
    shares bigint NOT NULL,
    buy boolean NOT NULL,
    date_purchase date NOT NULL,
    PRIMARY KEY (trade_id),
    FOREIGN KEY (user_id) REFERENCES accounts(user_id),
    FOREIGN KEY (asset_id) REFERENCES assets(asset_id),
    FOREIGN KEY (asset_name) REFERENCES assets(asset_name)
);
