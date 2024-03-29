OS := $(shell uname)

ifeq ($(OS), Darwin)
	INSTALL_FLAG = "install-darwin"
	INSTALL_DIR = "~/Library/Rime"
endif
ifeq ($(OS), Linux)
	INSTALL_FLAG = "install-unix"
	INSTALL_DIR = "~/.config/ibus/rime"
endif
ifeq ($(OS), Windows_NT)
	INSTALL_FLAG = "install-win"
	INSTALL_DIR = "%APPDATA%\Rime"
endif


install:
	@make $(INSTALL_FLAG)

install-darwin:
	@eval "cp $(CURDIR)/default.custom.yaml     $(INSTALL_DIR)/default.custom.yaml"
	@eval "cp $(CURDIR)/luna_pinyin_simp.custom.yaml $(INSTALL_DIR)/luna_pinyin_simp.custom.yaml"
	@eval "cp $(CURDIR)/squirrel.custom.yaml    $(INSTALL_DIR)/squirrel.custom.yaml"

install-unix:
	@eval "ln -s $(CURDIR)/default.custom.yaml     $(INSTALL_DIR)/default.custom.yaml"
	@eval "ln -s $(CURDIR)/luna_pinyin_simp.custom.yaml $(INSTALL_DIR)/luna_pinyin_simp.custom.yaml"
	@eval "ln -s $(CURDIR)/squirrel.custom.yaml    $(INSTALL_DIR)/squirrel.custom.yaml"

install-win:
	@eval "cp $(CURDIR)/default.custom.yaml     $(INSTALL_DIR)\default.custom.yaml"
	@eval "cp $(CURDIR)/luna_pinyin_simp.custom.yaml $(INSTALL_DIR)\luna_pinyin_simp.custom.yaml"
	@eval "cp $(CURDIR)/squirrel.custom.yaml    $(INSTALL_DIR)\squirrel.custom.yaml"

uninstall:
	@eval "rm $(INSTALL_DIR)/default.custom.yaml"
	@eval "rm $(INSTALL_DIR)/luna_pinyin_simp.custom.yaml"
	@eval "rm $(INSTALL_DIR)/squirrel.custom.yaml"
