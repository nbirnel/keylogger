CC="/cygdrive/c/Program Files (x86)/AutoHotkey/Compiler/Ahk2Exe.exe"
PROG=keylogger

${PROG}.exe : ${PROG}.ahk
	${CC} /in ${PROG}.ahk

test : ${PROG}.exe
	./${PROG}.exe &

.PHONY : test
