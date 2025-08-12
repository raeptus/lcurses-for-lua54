package = "lcurses"
version = "git-2"
rockspec_format = "3.0"

description = {
	detailed = "lcurses is a C library for Lua that wraps the curses API.",
	homepage = "https://lcurses.github.io/lcurses/",
	license = "MIT/X11",
	summary = "Lua bindings for curses"
}


source = {
	url = "git://github.com/raeptus/lcurses-for-lua54.git",
}


external_dependencies = {
	NCURSES = {
		library = "ncurses",
		header = "ncurses.h",
	},
}


dependencies = {
	"lua 5.4",
	supported_platforms = "unix",
}


build = {
	type = "make",
	build_variables = {
		CFLAGS = "$(CFLAGS)",
		LIBFLAG = "$(LIBFLAG)",
		NCURSES_LIBDIR = "$(NCURSES_LIBDIR)",
		NCURSES_INCDIR = "$(NCURSES_INCDIR)",
		LUA_LIBDIR = "$(LUA_LIBDIR)",
		LUA_INCDIR = "$(LUA_INCDIR)",
		LIB_EXTENSION = "$(LIB_EXTENSION)",
	},
	install_variables = {
		INST_LIBDIR = "$(LIBDIR)",
		INST_LUADIR = "$(LUADIR)",
		LIB_EXTENSION = "$(LIB_EXTENSION)",
	},
}


test = {
	type = "command",
	command = "make example",
}
