local_src = src
local_lib = bin
local_lualib = $(local_src)/lib
local_includes = -Isrc -Isrc/include
local_examples = examples

$(local_lib)/curses_c.$(LIB_EXTENSION):
ifeq ($(CFLAGS),)
	$(error !!! use "luarocks build" for compiling !!!)
endif
	mkdir -p $(local_lib)

	$(CC) -c $(CFLAGS) $(local_includes) -I$(NCURSES_INCDIR) -I$(LUA_INCDIR) $(local_src)/curses.c -o $(local_lib)/curses_c.o
	$(CC) $(CFLAGS) $(LIBFLAG) -L$(NCURSES_LIBDIR) -L$(LUA_LIBDIR) -llua -lncurses $(local_lib)/curses_c.o -o $(local_lib)/curses_c.$(LIB_EXTENSION)


.PHONY: clean
clean:
	rm -r $(local_lib)


.PHONY: example
example:
	# only works if bin/ exists
	LUA_PATH="src/lib/?.lua" \
	LUA_CPATH="$(local_lib)/?.so" \
	lua $(local_examples)/curses.lua


.PHONY: install
install:
	mkdir -p $(INST_LIBDIR)
	cp --update $(local_lib)/curses_c.$(LIB_EXTENSION) $(INST_LIBDIR)

	mkdir -p $(INST_LUADIR)
	cp --update $(local_lualib)/curses.lua $(INST_LUADIR)


.PHONY: uninstall
uninstall:
	rm -f $(INST_LIBDIR)/curses_c.$(LIB_EXTENSION)
	rm -f $(INST_LUADIR)/curses.lua
