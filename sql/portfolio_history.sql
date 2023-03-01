CREATE TABLE portfolio_history (
    portfolio-history_id SERIAL PRIMARY KEY,
    user_id      bigint           NOT NULL,
    portfolio_value NUMERIC(1000,2) NOT NULL,
    date_balance DATE DEFAULT CURRENT_DATE,
);
