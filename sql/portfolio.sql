CREATE SEQUENCE portfolio_seq start with 1;

CREATE TABLE portfolio (
    portfolio_id bigint NOT NULL DEFAULT nextval('portfolio_seq'),
    asset_id bigint NOT NULL,
    user_id bigint NOT NULL,
    asset_name varchar(15) NOT NULL,
    shares bigint NOT NULL,
    PRIMARY KEY (portfolio_id),
    FOREIGN KEY (user_id) REFERENCES accounts(user_id) ON DELETE CASCADE  
);
