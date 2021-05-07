# pgbadger report<br />

Host with **debian** name is primary database, one with **debiandevopstarget** name is standby, the replication is physical and streaming<br />

In async mode I made **testtable** in postgres database with `CREATE TABLE testtable (number integer);` command, then `EXPLAIN ANALYSE INSERT INTO testtable SELECT * FROM generate_series(2, 4);` with **4,6; 6,8; 8,10; 10,12** sequences, `SELECT * FROM pg_stat_replication;` command shows replication lag, it isn't present, then the same in sync mode, same for replication lag, in all cases **Execution time** is bigger in sync mode<br />

Then as postgres user i typed `pgbench -p 5432 -i -s 50 dbtest` and made a report in pgbadger

