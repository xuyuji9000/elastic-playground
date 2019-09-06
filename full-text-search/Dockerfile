FROM elasticsearch:7.3.1
ENV ELASTICSEARCH_VERSION=7.3.1
RUN yes | elasticsearch-plugin install https://github.com/medcl/elasticsearch-analysis-ik/releases/download/v${ELASTICSEARCH_VERSION}/elasticsearch-analysis-ik-${ELASTICSEARCH_VERSION}.zip
