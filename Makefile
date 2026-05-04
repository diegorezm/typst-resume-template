TYPST      := typst
TEMPLATE   := templates/resume.typ
RESUME_DIR := resumes
OUTPUT_DIR := output

RESUMES := $(wildcard $(RESUME_DIR)/*.yaml)
PDFS    := $(patsubst $(RESUME_DIR)/%.yaml,$(OUTPUT_DIR)/%.pdf,$(RESUMES))

.PHONY: all clean dirs

all: dirs $(PDFS)

dirs:
	mkdir -p $(OUTPUT_DIR)

$(OUTPUT_DIR)/%.pdf: $(RESUME_DIR)/%.yaml $(TEMPLATE) shared/profile.yaml shared/helpers.typ shared/theme.typ
	$(TYPST) compile --root . $(TEMPLATE) $@ --input file=/$(RESUME_DIR)/$*.yaml 
	@echo "  ✓ $@"

clean:
	rm -rf $(OUTPUT_DIR)
	@echo " output/ removed"
