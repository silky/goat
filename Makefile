SOURCES:=$(wildcard *.go)
EXAMPLES:=$(patsubst examples/%.txt,examples/%.svg,$(wildcard examples/*.txt))

all: goat $(EXAMPLES);

goat: $(SOURCES)
	go build -o goat $(SOURCES)

clean:
	rm -f goat
	rm -f examples/*.svg

examples/%.svg: examples/%.txt
	./goat $< > $@

.NOTPARALLEL:
