.PHONY: init proto

export PATH := $(shell go env GOPATH)/bin:$(PATH)

init:
	mkdir -p vendor.protogen/validate
	curl -sLo vendor.protogen/validate/validate.proto https://raw.githubusercontent.com/envoyproxy/protoc-gen-validate/main/validate/validate.proto

proto:
	mkdir -p pkg/product/v1 pkg/user/v1 pkg/cart/v1 pkg/order/v1 pkg/common/v1 pkg/payment/v1 pkg/fulfillment/v1 pkg/notification/v1
	protoc -I api -I vendor.protogen \
	    --go_out=./pkg/product/v1 --go_opt=paths=source_relative \
	    --go-grpc_out=./pkg/product/v1 --go-grpc_opt=paths=source_relative \
	    --validate_out="lang=go,paths=source_relative:./pkg/product/v1" \
	    api/product/v1/product.proto
	protoc -I api -I vendor.protogen \
	    --go_out=./pkg/user/v1 --go_opt=paths=source_relative \
	    --go-grpc_out=./pkg/user/v1 --go-grpc_opt=paths=source_relative \
	    --validate_out="lang=go,paths=source_relative:./pkg/user/v1" \
	    api/user/v1/user.proto
	protoc -I api -I vendor.protogen \
	    --go_out=./pkg/cart/v1 --go_opt=paths=source_relative \
	    --go-grpc_out=./pkg/cart/v1 --go-grpc_opt=paths=source_relative \
	    --validate_out="lang=go,paths=source_relative:./pkg/cart/v1" \
	    api/cart/v1/cart.proto
	protoc -I api -I vendor.protogen \
	    --go_out=./pkg/order/v1 --go_opt=paths=source_relative \
	    --go-grpc_out=./pkg/order/v1 --go-grpc_opt=paths=source_relative \
	    --validate_out="lang=go,paths=source_relative:./pkg/order/v1" \
	    api/order/v1/order.proto
	protoc -I api -I vendor.protogen \
	    --go_out=./pkg/payment/v1 --go_opt=paths=source_relative \
	    --go-grpc_out=./pkg/payment/v1 --go-grpc_opt=paths=source_relative \
	    --validate_out="lang=go,paths=source_relative:./pkg/payment/v1" \
	    api/payment/v1/payment.proto
	protoc -I api -I vendor.protogen \
	    --go_out=./pkg/fulfillment/v1 --go_opt=paths=source_relative \
	    --go-grpc_out=./pkg/fulfillment/v1 --go-grpc_opt=paths=source_relative \
	    --validate_out="lang=go,paths=source_relative:./pkg/fulfillment/v1" \
	    api/fulfillment/v1/fulfillment.proto
	protoc -I api -I vendor.protogen \
	    --go_out=./pkg/notification/v1 --go_opt=paths=source_relative \
	    --go-grpc_out=./pkg/notification/v1 --go-grpc_opt=paths=source_relative \
	    --validate_out="lang=go,paths=source_relative:./pkg/notification/v1" \
	    api/notification/v1/notification.proto
	protoc -I api -I vendor.protogen \
	    --go_out=./pkg/common/v1 --go_opt=paths=source_relative \
	    --validate_out="lang=go,paths=source_relative:./pkg/common/v1" \
	    api/common/v1/error.proto api/common/v1/pagination.proto
