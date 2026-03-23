COMPILE = TYPST_FONT_PATHS=~/.local/share/fonts typst compile
WATCH   = TYPST_FONT_PATHS=~/.local/share/fonts typst watch
SRCS    = main.typ
OUT     = cv.pdf

all: build

build: $(OUT)

$(OUT): $(SRCS)
	$(COMPILE) $(SRCS) $(OUT)

watch:
	$(WATCH) $(SRCS) $(OUT)

clean:
	@rm -f $(OUT)

re: clean all

help:
	@echo "  make        - compile CV to PDF"
	@echo "  make watch  - auto-recompile on save"
	@echo "  make clean  - remove generated PDF"

.PHONY: all build watch clean re help
