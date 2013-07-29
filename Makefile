CC="/cygdrive/c/Program Files (x86)/AutoHotkey/Compiler/Ahk2Exe.exe"
PROG=keylogger

${PROG}.exe : ${PROG}.ahk ${PROG}.ico 
	${CC} /in ${PROG}.ahk /icon ${PROG}.ico

test : ${PROG}.exe
	./${PROG}.exe &

.PHONY : test
