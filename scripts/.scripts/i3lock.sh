#!/bin/dash

B='#00000000'  # blank
C='#ffffff22'  # clear ish
# D='#ff00ffcc'  # default
D='#206fe5cc'  # default
# T='#ee00eeee'  # text
T='#0485dbee'  # text
# W='#880000bb'  # wrong
W='#880000bb'  # wrong
# V='#bb00bbbb'  # verifying
V='#04dbc5bb'  # verifying

/usr/bin/i3lock \
--insidever-color=$C   \
--ringver-color=$V     \
\
--insidewrong-color=$C \
--ringwrong-color=$W   \
\
--inside-color=$B      \
--ring-color=$D        \
--line-color=$B        \
--separator-color=$D   \
\
--verif-color=$T        \
--wrong-color=$T        \
--time-color=$T        \
--date-color=$T        \
--layout-color=$T      \
--keyhl-color=$W       \
--bshl-color=$W        \
--greeter-color=$D     \
\
--screen 1            \
--blur 10             \
--clock               \
--indicator           \
--time-str="%H:%M:%S"  \
--date-str="%A, %m %Y" \
--greeter-text="Hi, this is Alex Lai's laptop. (alexlaixy97@gmail.com)" \
\
--pass-media-keys     \
--pass-power-keys     \
--pass-screen-keys     \
--pass-volume-keys     \

# --keylayout 0         \
# --veriftext="Drinking verification can..."
# --wrongtext="Nope!"
# --textsize=20
# --modsize=10
# --timefont=comic-sans
# --datefont=monofur
# etc
