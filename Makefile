.PHONY: setup
setup:
	brew bundle
	mint bootstrap
	$(MAKE) gen

.PHONY: gen
gen:
	mint run xcodegen