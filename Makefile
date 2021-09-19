.PHONY: setup
setup:
	brew bundle
	mint bootstrap
	$(MAKE) carthage
	$(MAKE) gen

.PHONY: gen
gen:
	mint run xcodegen

.PHONY: carthage
carthage:
	mint run carthage bootstrap --platform iOS --cache-builds --use-xcframeworks