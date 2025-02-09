BINARY_NAME=go-ip-color
VERSION=1.0.0
BUILD_DIR=build

.PHONY: all clean build

all: clean build

clean:
	rm -rf $(BUILD_DIR)

build:
	mkdir -p $(BUILD_DIR)
	# MacOS builds
	GOOS=darwin GOARCH=amd64 go build -o $(BUILD_DIR)/$(BINARY_NAME)_$(VERSION)_darwin_amd64
	GOOS=darwin GOARCH=arm64 go build -o $(BUILD_DIR)/$(BINARY_NAME)_$(VERSION)_darwin_arm64
	# Linux builds
	GOOS=linux GOARCH=amd64 go build -o $(BUILD_DIR)/$(BINARY_NAME)_$(VERSION)_linux_amd64
	GOOS=linux GOARCH=arm64 go build -o $(BUILD_DIR)/$(BINARY_NAME)_$(VERSION)_linux_arm64
	# Windows builds
	GOOS=windows GOARCH=amd64 go build -o $(BUILD_DIR)/$(BINARY_NAME)_$(VERSION)_windows_amd64.exe
	GOOS=windows GOARCH=arm64 go build -o $(BUILD_DIR)/$(BINARY_NAME)_$(VERSION)_windows_arm64.exe