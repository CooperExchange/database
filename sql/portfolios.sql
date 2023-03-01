CREATE TABLE portfolios (
    portfolio_id        SERIAL PRIMARY KEY,
    asset_symbol varchar(50)      NOT NULL,
    user_id      bigint           NOT NULL,
    asset_name   varchar(50)      NOT NULL,
    asset_count  NUMERIC(1000, 2) NOT NULL,  
);
