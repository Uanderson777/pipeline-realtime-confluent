# Pipeline em Tempo Real End-to-End com Confluent Cloud

Projeto desenvolvido para o Desafio de Projeto da DIO, utilizando Confluent Cloud, Apache Kafka e Apache Flink SQL para processamento de transações em tempo real e detecção de possíveis fraudes.

## Objetivo

Construir um pipeline de dados em tempo real capaz de receber transações, processar os eventos com Flink SQL e identificar situações de possível fraude.

A regra de fraude utilizada neste projeto é:

> 3 transações do mesmo cartão dentro de uma janela de 60 segundos.

## Arquitetura

```text
Transações
    |
    v
Kafka / Confluent Cloud
    |
    | transactions
    v
Flink SQL
    |
    | Janela de 60 segundos
    | Agrupamento por cartão
    | Contagem de transações
    v
Detecção de possível fraude
    |
    v
fraud_alerts
