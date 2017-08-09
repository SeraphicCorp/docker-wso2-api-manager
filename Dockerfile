# WSO2 API Manager

FROM sgrio/java-oracle:jdk_8
MAINTAINER Ravaka Razafimanantsoa <ravseraphin+docker-wso2-base@gmail.com>

ENV PRODUCT_NAME="api-manager" \
    PRODUCT_SHORT_NAME="am" \
    VERSION="2.1.0"
    
# Install packages
RUN apt-get update \
    && apt-get install --no-install-recommends -y \
      unzip \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /opt
ADD ./wso2${PRODUCT_SHORT_NAME}-${VERSION}.zip /opt/wso2${PRODUCT_SHORT_NAME}-${VERSION}.zip
ADD ./setup.sh /
RUN unzip wso2${PRODUCT_SHORT_NAME}-${VERSION}.zip && mv wso2${PRODUCT_SHORT_NAME}-${VERSION} wso2 && rm wso2${PRODUCT_SHORT_NAME}-${VERSION}.zip 

EXPOSE 8243 8280 9443 9763 10397

CMD /setup.sh && /opt/wso2/bin/wso2server.sh
