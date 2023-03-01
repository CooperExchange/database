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
