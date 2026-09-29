-- Tabela/Tópico de entrada de transações
CREATE TABLE transactions (
    transaction_id STRING,
    account_id INT,
    card_id STRING,
    merchant_id STRING,
    amount DOUBLE,
    mcc STRING,
    uf STRING,
    transaction_time TIMESTAMP(3),
    WATERMARK FOR transaction_time AS transaction_time - INTERVAL '5' SECOND
) WITH (
    'connector' = 'kafka',
    'topic' = 'transactions',
    'properties.bootstrap.servers' = '<SEU_BOOTSTRAP_SERVER>',
    'format' = 'json'
);

-- Tabela/Tópico de saída para detecção de fraudes
CREATE TABLE fraud_alerts (
    account_id INT,
    card_id STRING,
    first_txn TIMESTAMP(3),
    last_txn TIMESTAMP(3),
    txn_count BIGINT
) WITH (
    'connector' = 'kafka',
    'topic' = 'fraud_alerts',
    'properties.bootstrap.servers' = '<SEU_BOOTSTRAP_SERVER>',
    'format' = 'json'
);
