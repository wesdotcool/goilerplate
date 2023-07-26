BINARY=goilerplate

.PHONY: run
run:
	go run .

build:
	go build -o $(BINARY)

builddebug: # Compile without optimizations. This makes using dlv much easier
	go build -gcflags="all=-N -l" -o $(BINARY)

test:
	ginkgo run -r

clean:
	rm -f $(BINARY)

install: # Install dependencies. Not to be confused with go install
	go mod tidy
	go install github.com/onsi/ginkgo/v2/ginkgo

define HELPSTRING
Run the following commands to copy and rename this project to your own:
  source rename.sh <PROJECT_NAME>
  make install
  make test
endef
export HELPSTRING
help: # Explains how to use goilerplate
	@echo "$$HELPSTRING"
