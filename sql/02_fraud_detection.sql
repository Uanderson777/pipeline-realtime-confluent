-- Processamento e filtragem em tempo real no Flink SQL
INSERT INTO fraud_alerts
SELECT 
    account_id,
    card_id,
    MIN(transaction_time) AS first_txn,
    MAX(transaction_time) AS last_txn,
    COUNT(*) AS txn_count
FROM transactions
WHERE amount > 10000.00
GROUP BY 
    account_id, 
    card_id, 
    TUMBLE(transaction_time, INTERVAL '1' MINUTE);
