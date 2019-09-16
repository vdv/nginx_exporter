.PHONY: release
release:
	mkdir -p release/$(VERSION)
	docker build -t nginx_exporter .
	docker create --name nginx_exporter_build nginx_exporter && \
	docker cp nginx_exporter_build:/usr/local/bin/nginx_exporter release/$(VERSION); \
	docker rm nginx_exporter_build
	cd release/ && tar czvf $(VERSION).tar.gz $(VERSION) && rm -rf $(VERSION)


