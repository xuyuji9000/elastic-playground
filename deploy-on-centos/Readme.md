- Install java: `yum install java-1.8.0-openjdk-devel`

- Import GPG key: `rpm --import https://artifacts.elastic.co/GPG-KEY-elasticsearch`

- Add repo

```
# /etc/yum.repos.d/elasticsearch.repo
[elasticsearch-5.x]
name=Elasticsearch repository for 5.x packages
baseurl=https://artifacts.elastic.co/packages/5.x/yum
gpgcheck=1
gpgkey=https://artifacts.elastic.co/GPG-KEY-elasticsearch
enabled=1
autorefresh=1
type=rpm-md
```

- Install: `yum install elasticsearch`

- Enable

``` bash
systemctl enable elasticsearch
systemctl start elasticsearch
```
