.PHONY: init proto

export PATH := $(shell go env GOPATH)/bin:$(PATH)

init:
	mkdir -p vendor.protogen/validate
	curl -sLo vendor.protogen/validate/validate.proto https://raw.githubusercontent.com/envoyproxy/protoc-gen-validate/main/validate/validate.proto

proto:
	mkdir -p pkg/product/v1 pkg/user/v1 pkg/cart/v1 pkg/order/v1 pkg/common/v1 pkg/payment/v1 pkg/fulfillment/v1 pkg/notification/v1
	protoc -I api -I vendor.protogen \
	    --go_out=./pkg --go_opt=paths=source_relative \
	    --go-grpc_out=./pkg --go-grpc_opt=paths=source_relative \
	    --validate_out="lang=go,paths=source_relative:./pkg" \
	    api/product/v1/product.proto
	protoc -I api -I vendor.protogen \
	    --go_out=./pkg --go_opt=paths=source_relative \
	    --go-grpc_out=./pkg --go-grpc_opt=paths=source_relative \
	    --validate_out="lang=go,paths=source_relative:./pkg" \
	    api/user/v1/user.proto
	protoc -I api -I vendor.protogen \
	    --go_out=./pkg --go_opt=paths=source_relative \
	    --go-grpc_out=./pkg --go-grpc_opt=paths=source_relative \
	    --validate_out="lang=go,paths=source_relative:./pkg" \
	    api/cart/v1/cart.proto
	protoc -I api -I vendor.protogen \
	    --go_out=./pkg --go_opt=paths=source_relative \
	    --go-grpc_out=./pkg --go-grpc_opt=paths=source_relative \
	    --validate_out="lang=go,paths=source_relative:./pkg" \
	    api/order/v1/order.proto
	protoc -I api -I vendor.protogen \
	    --go_out=./pkg --go_opt=paths=source_relative \
	    --go-grpc_out=./pkg --go-grpc_opt=paths=source_relative \
	    --validate_out="lang=go,paths=source_relative:./pkg" \
	    api/payment/v1/payment.proto
	protoc -I api -I vendor.protogen \
	    --go_out=./pkg --go_opt=paths=source_relative \
	    --go-grpc_out=./pkg --go-grpc_opt=paths=source_relative \
	    --validate_out="lang=go,paths=source_relative:./pkg" \
	    api/fulfillment/v1/fulfillment.proto
	protoc -I api -I vendor.protogen \
	    --go_out=./pkg --go_opt=paths=source_relative \
	    --go-grpc_out=./pkg --go-grpc_opt=paths=source_relative \
	    --validate_out="lang=go,paths=source_relative:./pkg" \
	    api/notification/v1/notification.proto
	protoc -I api -I vendor.protogen \
	    --go_out=./pkg --go_opt=paths=source_relative \
	    --validate_out="lang=go,paths=source_relative:./pkg" \
	    api/common/v1/error.proto api/common/v1/pagination.proto
