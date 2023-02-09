CREATE TABLE portfolio (
    portfolio_id bigint NOT NULL UNIQUE,
    asset_id bigint NOT NULL,
    user_id bigint NOT NULL;
    asset_name varchar(15) NOT NULL;
    shares bigint NOT NULL;
    PRIMARY KEY (portfolio_id),
    FOREIGN KEY (user_id) REFERENCES accounts(user_id)   
);