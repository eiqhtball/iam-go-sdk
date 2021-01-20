clean:
	rm coverage.out

# in case of issues install race-detector
# sudo apt-get install golang-1.13-race-detector-runtime
test:
	go test -cover -race -count=1 ./...

coverage:
	go test -coverprofile=coverage.out ./...
	go tool cover -html=coverage.out

# for local testing
lint:
	docker run --rm -v $(PWD):$(PWD) -w $(PWD) golangci/golangci-lint:v1.33.0 golangci-lint run -v

# for testing on CI/CD. we specify required linter version in the .travis.yml file
lint-ci:
	golangci-lint run
