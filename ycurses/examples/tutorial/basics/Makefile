# Makefile for JustForFun Files

# A few variables

LIBS=-L-lncurses

SRC_DIR=.
EXE_DIR=../demo/exe

EXES = \
	${EXE_DIR}/acs_vars \
	${EXE_DIR}/hello_world \
	${EXE_DIR}/init_func_example \
	${EXE_DIR}/key_code \
	${EXE_DIR}/mouse_menu \
	${EXE_DIR}/other_border \
	${EXE_DIR}/printw_example \
	${EXE_DIR}/scanw_example \
	${EXE_DIR}/simple_attr \
	${EXE_DIR}/simple_color \
	${EXE_DIR}/simple_key \
	${EXE_DIR}/temp_leave \
	${EXE_DIR}/win_border \
	${EXE_DIR}/with_chgat

${EXE_DIR}/%: %.o
	${DC} -of$@ $< ${LIBS}

%.o: ${SRC_DIR}/%.d
	${DC} -of$@ -c $< ${IMPORTS}

all:    ${EXES}

clean:
	@rm -f ${EXES}
