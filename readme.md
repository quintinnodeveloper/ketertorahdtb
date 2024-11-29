## Keter Database

#### Objetivo

- Implementar estrutura de dados do sistema _Keter_ para o banco de dados **MySQL**

#### Mapeamento de Dados Atual (consolidado)

```sql

-- Gerador de Demandas
SELECT UPPER('DEFENSIODTB') || TO_CHAR(NOW(), 'YYYYMMDDHH24MMSS') AS NUMERO_CHAMADO FROM INFORMATION_SCHEMA.COLUMNS LIMIT 1;

SELECT CONCAT(UPPER('DEFENSIODTB'), DATE_FORMAT(NOW(), '%Y%M%D%H%I%S')) AS NUMERO_CHAMADO
FROM INFORMATION_SCHEMA.COLUMNS
LIMIT 1;

```

#### Padrão de Versionamento

| **Código**   | 
|--------------|
| 🚀 init:     | 
| 🔵 feature:  |
| 🔴 hotfix:   |
| 🟠 bugfix:   |
| 🟢 release:  |
| 🟡 refactor: |
| 🟣 document: |
