COMPILE = typst compile
WATCH = typst watch
VIEW = typst view
SRCS = main.typ
OUT = cv.pdf

all: build

build: $(OUT)

$(OUT): $(SRCS)
	$(COMPILE) $(SRCS) $(OUT)

watch:
	$(WATCH) $(SRCS) $(OUT)

view: $(OUT)
	$(VIEW) $(OUT)

clean:
	@rm -f $(OUT)

re: clean all

help:
	@echo "Available targets:"
	@echo "  make build  - Compile CV to PDF"
	@echo "  make watch  - Watch for changes and auto-compile"
	@echo "  make view   - Compile and open PDF viewer"
	@echo "  make clean  - Remove generated PDF"
	@echo "  make help   - Show this help message"

.PHONY: all build watch view clean help