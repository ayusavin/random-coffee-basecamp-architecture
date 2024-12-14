# Directories
DIAGRAMS_DIR := diagrams
PICTURES_DIR := pictures

# ANSI color codes
BLUE := \033[34m
GREEN := \033[32m
YELLOW := \033[33m
RED := \033[31m
PURPLE := \033[35m
CYAN := \033[36m
RESET := \033[0m
BOLD := \033[1m

.PHONY: all clean help

# Default target
all: help

# Clean generated files
clean:
	@echo "$(RED)Cleaning$(RESET) generated files..."
	@rm -rf $(PICTURES_DIR)

# Generate diagrams using the script
generate:
	@echo "$(GREEN)Generating diagrams$(RESET)..."
	@./scripts/generate_diagrams.sh

# Help target
help:
	@echo "$(BOLD)Available targets:$(RESET)"
	@echo "  $(RED)clean$(RESET)     - Remove all generated diagrams"
	@echo "  $(GREEN)generate$(RESET)  - Generate diagrams using the script"
	@echo "  $(BLUE)help$(RESET)      - Show this help message"
