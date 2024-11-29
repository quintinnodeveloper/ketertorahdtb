## Keter Database

#### Objetivo

- Implementar estrutura de dados do sistema _Keter_ para o banco de dados **MySQL**

#### Mapeamento de Dados Atual (consolidado)

```sql

-- Gerador de Demandas
SELECT 
	CONCAT(CONCAT(UPPER('KETER'), DATE_FORMAT(NOW(), '%Y%m%d%H%i%S')), 'DTB') AS NUMERO_CHAMADO 
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
