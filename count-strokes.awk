#!/usr/bin/awk -f

BEGIN { 
    FS = "	"
    current_repeats=1 
    errors=0
    windowchanges=0
    mouseevents=0
    keyevents=0
    unique_keyevents=0
    possible_autorepeats=0
    uniq_wins=0
}

{
    if ($0 ~ /^/) { 
        windowchanges++ 
        winid[$3]++
    } else if ($0 ~ /^/) { 
        is_mouse_key_switch("m")
        mouseevents++ 
    } else if ($0 ~ /^$/) {
        errors++ 
    } else {
        is_mouse_key_switch("k")
        keyevents++ 

        if ($0 == lastkey) {
            possible_autorepeats++
            current_repeats++
            if (current_repeats == 2) {
                possible_autorepeat_events++
            }
        } else {
            current_repeats=1
            unique_keyevents++
        }
        
        lastkey=$0
    }
}

END {
    printf("%s: %d\n", "errors", errors)
    printf("%s: %d\n", "mouse_key_switch", mouse_key_switch)
    printf("%s: %d\n", "windowchanges", windowchanges)
    for (win in winid) 
        uniq_wins++
    printf("%s: %d\n", "uniq_wins", uniq_wins)
    printf("%s: %d\n", "mouseevents", mouseevents)
    printf("%s: %d\n", "keyevents", keyevents)
    printf("%s: %d\n", "unique_keyevents", unique_keyevents)
    printf("%s: %d\n", "possible_autorepeat_events", possible_autorepeat_events)
    printf("%s: %d\n", "possible_autorepeats", possible_autorepeats)
    printf("%s: %d\n", "events", NR - errors)
}

function is_mouse_key_switch(mk) {
    if (mouse_key != mk) {
        mouse_key_switch++
    }
    mouse_key = mk
}

