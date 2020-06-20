TEST_SCRIPTS = $(wildcard test-*.sh)
SOURCES = ../cjs-ledger ../cjs-manifest

DATA_SOURCE_DIR = data-source
DATA_DIR = data
DATA_PACKAGE_NAMES = $(notdir $(wildcard $(DATA_SOURCE_DIR)/*))
DATA_PACKAGES = $(addprefix $(DATA_DIR)/,$(addsuffix -0.1.0.tgz,$(DATA_PACKAGE_NAMES)))

SENTINELS = $(addprefix .success-,$(TEST_SCRIPTS))

test: $(SENTINELS)

.PHONY: test

.success-%: % $(SOURCES) $(DATA_PACKAGES)
	./$<
	touch $@

$(DATA_DIR)/%-0.1.0.tgz: $(DATA_SOURCE_DIR)/%/package/index.js $(DATA_SOURCE_DIR)/%/package/package.json
	mkdir --parents $(DATA_DIR)
	tar --create --gzip --file $@ --directory=$(DATA_SOURCE_DIR)/$* package

clean:
	@rm --recursive --force $(DATA_DIR) $(SENTINELS)
