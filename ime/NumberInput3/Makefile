
BUILD_PATH = build/Debug
INSTALL_PATH = /Library/Input\ Methods
TEMP_PATH = ~/ime_temp
TARGET = NumberInput.app

all: build

build:
	xcodebuild -configuration Debug

clean:
	rm -rf build
	
USER = root
MACHINE = macime.local

i : install

install: build
	ssh $(USER)@$(MACHINE) 'mkdir -p $(TEMP_PATH)'
	scp -r $(BUILD_PATH)/$(TARGET) $(USER)@$(MACHINE):$(TEMP_PATH)
	ssh $(USER)@$(MACHINE) 'rm -rf $(INSTALL_PATH)/$(TARGET)'
	ssh $(USER)@$(MACHINE) 'mv -f $(TEMP_PATH)/$(TARGET) $(INSTALL_PATH)/$(TARGET)'

u : uninstall

uninstall:
	ssh $(USER)@$(MACHINE) 'rm -rvf $(TEMP_PATH)/$(TARGET)'
	ssh $(USER)@$(MACHINE) 'rm -rvf $(INSTALL_PATH)/$(TARGET)'

login:
	ssh $(USER)@$(MACHINE)

reboot:
	ssh $(USER)@$(MACHINE) 'reboot'
	