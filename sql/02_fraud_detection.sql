
-- Detecção de fraude em tempo real com Flink SQL
-- Regra: 3 transações do mesmo cartão dentro de uma janela de 60 segundos

SELECT
    card_id,
    COUNT(*) AS transaction_count,
    MIN(transaction_ts) AS first_transaction,
    MAX(transaction_ts) AS last_transaction
FROM TABLE(
    TUMBLE(
        TABLE `default`.`cluster-desafio-dio`.`transactions`,
        DESCRIPTOR(transaction_ts),
        INTERVAL '60' SECOND
    )
)
GROUP BY
    window_start,
    window_end,
    card_id
HAVING COUNT(*) >= 3;
