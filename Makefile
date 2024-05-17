SOURCES=$(wildcard Sources/*.swift)
TEST_SOURCES=$(wildcard Tests/*.swift)
EXECUTABLE_DIR=Executables
EXECUTABLE=$(EXECUTABLE_DIR)/Main
TEST_EXECUTABLE=$(EXECUTABLE_DIR)/MainTest

build:
	@mkdir -p $(EXECUTABLE_DIR)
	swiftc $(SOURCES) -o $(EXECUTABLE)

test:
	@mkdir -p $(EXECUTABLE_DIR)
	swiftc $(TEST_SOURCES) -o $(TEST_EXECUTABLE)
	$(TEST_EXECUTABLE) || true

run:
	$(EXECUTABLE) || true

clean:
	rm -f $(EXECUTABLE) $(TEST_EXECUTABLE)