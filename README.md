Riemann Redis
=============

Simple redis riemann client.

Submits the result of INFO [section] and SLOWLOG query into riemann.

Supports multiple sections by performing multiple INFO queries.

Get started
==========

``` bash
gem install riemann-redis
riemann-redis --help
riemann-redis-slowlog --help
```

Multiple --redis-sections can by specified, for example if you want to monitor both Memory and Replication

``` bash
riemann-redis --redis-section "Replication" --redis-section "Memory"
```