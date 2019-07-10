- Create network: `docker network create elastic-stack`

- Create elasticsearch:

``` bash
docker run --network elastic-stack \
--name elasticsearch \
--rm \
-p 9200:9200 \
-p 9300:9300 \
-v elasticsearch-data:/usr/share/elasticsearch/data \
-e "discovery.type=single-node" \
elasticsearch:5.6-alpine
```

- Create kibana

``` bash
docker run --network elastic-stack \
--rm \
-p 5601:5601 kibana:5.6
```