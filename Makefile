SOURCES:=$(wildcard *.go)
EXAMPLES:=$(patsubst examples/%.txt,examples/%.svg,$(wildcard examples/*.txt))
PNG:=$(patsubst examples/%.txt,examples/%.png,$(wildcard examples/*.txt))

all: goat $(EXAMPLES) $(PNG);

goat: $(SOURCES)
	go build -o goat $(SOURCES)

clean:
	rm -f goat
	rm -f examples/*.svg

examples/%.svg: examples/%.txt
	./goat $< > $@

examples/%.png: examples/%.svg
	inkscape $< -e $@

.NOTPARALLEL:
