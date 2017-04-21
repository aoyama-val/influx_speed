# influxdbとPostgreSQLの速度比較

## 実行

事前にテーブルを作成しておく

```
create table foobar (id serial primary key, time timestamp, value float);
```

```
ruby influx.rb
ruby postgres.rb
```
