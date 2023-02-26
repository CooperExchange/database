CREATE SEQUENCE asset_seq start with 1;

CREATE TABLE assets(
    asset_id bigint NOT NULL DEFAULT nextval('asset_seq'),
    asset_name varchar(100) NOT NULL UNIQUE,
    ticker varchar(50) NOT NULL UNIQUE,
    market_cap bigint NOT NULL,
    pe_ratio NUMERIC(4,2) NOT NULL,
    dividend_yield NUMERIC(4,2) NOT NULL,
    PRIMARY KEY (asset_id)
);
