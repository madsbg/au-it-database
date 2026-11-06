# Session 4: ER modeling + DDL/DML (full build session)

**Presentation**: week4.pdf [er_modeling_ek.pdf]

**Book sections**:

- ***Getting started*** (create/delete database, run scripts)
- ***Creating database tables*** (create/delete table, data types, PK,alter)
- ***Inserting data into tables*** (insert/update/delete rows)

ER model basics: https://blog.visual-paradigm.com/beginners-guide-to-entity-relationship-er-diagrams/

Normalisation: https://en.wikipedia.org/wiki/Database_normalization

## Subtopics

- **ER model essentials**: entities, attributes, identifiers (PK concept)
- Relationships + cardinality/optionality (1:1, 1:M, M:N; 0..***, 1..***)
- Mapping ER → tables (why M:N becomes a junction table)
- **DDL basics**: `CREATE DATABASE`, `CREATE TABLE`, data types, `PRIMARY KEY`,basic constraints, `ALTER TABLE`
- **DML basics**: `INSERT` (with/without column list), `UPDATE`, `DELETE`
- Safe workflow in DBeaver: run script → refresh → verify with SELECTs

Normal forms (quick overview):

- **1NF**: atomic values, no repeating groups, no “lists in a column”
- **2NF**: no partial dependency on part of a composite key (onlyrelevant when you have composite keys)
- **3NF**: no transitive dependencies (non-key depends on non-key)

