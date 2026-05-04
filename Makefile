TYPST      := typst
TEMPLATE   := templates/resume.typ
RESUME_DIR := resumes
OUTPUT_DIR := output

# Auto-discovers all .yaml files in resumes/
RESUMES := $(wildcard $(RESUME_DIR)/*.yaml)
PDFS    := $(patsubst $(RESUME_DIR)/%.yaml,$(OUTPUT_DIR)/%.pdf,$(RESUMES))

.PHONY: all clean dirs

## Compiles all resumes to output/
all: dirs $(PDFS)

dirs:
	mkdir -p $(OUTPUT_DIR)

$(OUTPUT_DIR)/%.pdf: $(RESUME_DIR)/%.yaml $(TEMPLATE) shared/perfil.yaml shared/helpers.typ shared/tema.typ
	$(TYPST) compile $(TEMPLATE) $@ --input file=$<
	@echo "  ✓ $@"

## Removes all generated PDFs
clean:
	rm -rf $(OUTPUT_DIR)
	@echo "  ✓ output/ removed"
