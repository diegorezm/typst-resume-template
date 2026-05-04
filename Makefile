TYPST      := typst
TEMPLATE   := templates/resume.typ
RESUME_DIR := resumes
OUTPUT_DIR := output

# Descobre todos os arquivos .yaml em resumes/ automaticamente
RESUMES := $(wildcard $(RESUME_DIR)/*.yaml)
PDFS    := $(patsubst $(RESUME_DIR)/%.yaml,$(OUTPUT_DIR)/%.pdf,$(RESUMES))

.PHONY: all clean dirs

## Compila todos os currículos para output/
all: dirs $(PDFS)

dirs:
	mkdir -p $(OUTPUT_DIR)

$(OUTPUT_DIR)/%.pdf: $(RESUME_DIR)/%.yaml $(TEMPLATE) shared/perfil.yaml shared/helpers.typ shared/tema.typ
	$(TYPST) compile $(TEMPLATE) $@ --input arquivo=$<
	@echo "  ✓ $@"

## Remove todos os PDFs gerados
clean:
	rm -rf $(OUTPUT_DIR)
	@echo "  ✓ output/ removido"
