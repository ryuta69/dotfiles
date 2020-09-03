#!/bin/sh
[ "${TERM:-none}" = "linux" ] && \
    printf '%b' '\e]P010100c
                 \e]P161602C
                 \e]P26C6E32
                 \e]P3716B48
                 \e]P48A7649
                 \e]P57A8535
                 \e]P69B9945
                 \e]P7c5c1a3
                 \e]P8898772
                 \e]P961602C
                 \e]PA6C6E32
                 \e]PB716B48
                 \e]PC8A7649
                 \e]PD7A8535
                 \e]PE9B9945
                 \e]PFc5c1a3
                 \ec'
