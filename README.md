# Docker image for standalone HBase

[![](https://images.microbadger.com/badges/image/olegfedoseev/docker-hbase-standalone.svg)](http://microbadger.com/images/olegfedoseev/docker-hbase-standalone "Get your own image badge on microbadger.com")

Small, standalone HBase for development. With REST and Thrift servers.

# Exposed ports

* 8080/8085 - REST API & Web UI
* 9090/9095 - Thrift API & Web UI
* 16000/16010 - HBase Master & Web UI
* 2181 - ZooKeeper

# Volumes

You can mount volume for data at `/data`.
HBase will store its data at `/data/hbase`, ZooKeeper at `/data/zookeeper`.

# How to use

Pull it:

	docker pull olegfedoseev/hbase-standalone

Run it:

	docker run -it \
		-p 8080:8080 \
		-p 8085:8085 \
		-p 9090:9090 \
		-p 9095:9095 \
		-p 16010:16010 \
		-p 2181:2181 \
		olegfedoseev/hbase-standalone
