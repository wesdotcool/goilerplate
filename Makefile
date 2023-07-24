BINARY=goilerplate

.PHONY: run
run:
	go run .

build:
	go build -o $(BINARY)

# Compile without optimizations. This makes using dlv much easier
builddebug:
	go build -gcflags="all=-N -l" -o $(BINARY)

test:
	ginkgo run -r

clean:
	rm -f $(BINARY)
