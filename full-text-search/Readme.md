- Simple Search

``` bash
curl -X GET "localhost:9200/_search" -H 'Content-Type: application/json' -d'
{
    "query": {
        "match" : {
            "_all" : "Doe"
        }
    }
}'
```


- Create index: `curl -X PUT  localhost:9200/news?pretty`

- Get indexes: `curl -X GET  localhost:9200/_cat/indices?v`

- Create mapping 

``` bash
curl -X POST "localhost:9200/news/new/_mapping" -H 'Content-Type: application/json' -d '{
    "new": 
    {
        "properties": 
        {
            "title":
            {
                "type": "text",
                "fields": {
                    "keyword": 
                    {
                        "type": "keyword",
                        "ignore_above": 256
                    }
                }
            },
            "content": 
            {
                "type": "text",
                "analyzer": "ik_max_word",
                "search_analyzer": "ik_max_word"
            }
        }
    }
}'
```

- Insert Data

``` bash
curl -X PUT "localhost:9200/news/new/1" -H 'Content-Type: application/json' -d'
{
  "title":"印度将因4大矛盾惨败中国 1项曾使印度国母被杀",
  "content":"全文检索+高亮显示"
}'

curl -X PUT "localhost:9200/news/new/2" -H 'Content-Type: application/json' -d'
{
  "title":"印度不要敬酒不吃吃罚酒满嘴跑火车 想想1962年",
  "content":"mapping介绍：定义索引(index)类型(type)的元数据，包括：数据类型、分词行为、建立倒排索引行为、搜索行为等。在搜索的时候会根据这个mapping定义的分词行为、搜索行为进行搜索" 
}'

curl -X PUT "localhost:9200/news/new/3" -H 'Content-Type: application/json' -d'
{
  "title":"莫迪就中印对峙发声：靠“亚洲古老传统”解决问题",
  "content":"本文假设你已经搭建好elasticsearch服务器，并在上面装了kibana和IK中文分词组件" 
}'
```

- Get a document: `curl -X GET localhost:9200/news/1?pretty`


- Full text search

``` bash
curl -X GET "localhost:9200/news/new/_search" -H 'Content-Type: application/json' -d'{
    "query" : 
    { 
      "match" : 
      { 
        "content" : "分词 服务器"
      }
    }
}'
```

