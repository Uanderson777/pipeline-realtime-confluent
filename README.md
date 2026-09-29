# ?? Pipeline Real-Time End-to-End com Confluent Cloud & Flink

Este repositório contém a resolução do Desafio de Projeto da **DIO**, demonstrando a construção de um pipeline de dados em tempo real utilizando **Apache Kafka**, **Confluent Cloud** e **Flink SQL** para detecção de fraudes.

---

## ?? Arquitetura do Pipeline
 1. **Ingestão:** Transações enviadas para o tópico `transactions` no Kafka Cloud.
2. **Processamento:** Flink SQL escuta o fluxo em tempo real e identifica transações suspeitas ou de alto valor (> R$ 10.000,00).
3. **Saída:** Resultados gravados no tópico de alertas `fraud_alerts`.

---

## ?? Passo a Passo de Execução

### Passo 1 - Setup do Cluster e Ambiente (Confluent Cloud)
- Criação do cluster Kafka no ambiente `default` (região AWS `sa-east-1`).
- Configuração de API Keys e credenciais de acesso ao cluster.

### Passo 2 - Criação dos Tópicos no Kafka
- `transactions`: Tópico responsável por receber o fluxo de entrada.
- `fraud_alerts`: Tópico responsável por receber os alertas processados.

### Passo 3 - Processamento em Tempo Real com Flink SQL
- Criação da Compute Pool do Flink no Confluent Cloud.
- Execução das queries SQL de janelamento e filtragem CEP (Complex Event Processing) no Workspace SQL.

---

## ?? Teardown / Desmembramento do Cluster

Para evitar custos indesejados no ambiente Cloud:
- Exclusão do Workspace Flink SQL.
- Remoção dos tópicos `transactions` e `fraud_alerts`.
- Exclusão do Cluster Kafka (`cluster-desafio-dio`).
