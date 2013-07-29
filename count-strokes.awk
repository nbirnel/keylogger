#!/usr/bin/awk -f

BEGIN { 
    repeats=1 
    errors=0
    windowchanges=0
    mouseevents=0
    keyevents=0
    unique_keyevents=0
    possible_autorepeats=0
}

{
    if ($0 ~ /^/) { windowchanges++ }
    else if ($0 ~ /^/) { mouseevents++ }
    else if ($0 ~ /^$/) { errors++ }
    else {
        keyevents++
        if ($0 == last) {
            possible_autorepeats++
            repeats++
        }
        else {
            repeats=1
            unique_keyevents++
        }
        
        last=$0
    }
}

END {
    printf("%s: %d\n", "errors", errors)
    printf("%s: %d\n", "windowchanges", windowchanges)
    printf("%s: %d\n", "mouseevents", mouseevents)
    printf("%s: %d\n", "keyevents", keyevents)
    printf("%s: %d\n", "unique_keyevents", unique_keyevents)
    printf("%s: %d\n", "possible_autorepeats", possible_autorepeats)
    printf("%s: %d\n", "events", NR - errors)
}
