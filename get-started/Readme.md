- Create network: `docker network create full-text-search-playground`

- Create container: 

``` bash
docker run --name elasticsearch \
--net full-text-search-playground \
-p 9200:9200 \
-p 9300:9300 \
-e "discovery.type=single-node" elasticsearch:5.6-alpine
```

- Get cluster health: `curl -X GET localhost:9200/_cat/health?v`


- List nodes: `curl -X GET localhost:9200/_cat/nodes?v`

- List all indexes: `curl -X GET localhost:9200/_cat/indices?v`

- Create an index: `curl -X PUT  localhost:9200/customer?pretty`

- Index a document into index: 

``` bash
curl -X PUT "localhost:9200/customer/external/1?pretty" \
-H 'Content-Type: application/json' \
-d '{ "name": "John Doe" }'
```

- Get a document:

``` bash
curl -X GET localhost:9200/customer/_doc/1?pretty
```


