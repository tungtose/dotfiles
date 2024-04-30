#!/usr/bin/env bash
theme="launcher_theme"
dir="$HOME/.config/rofi"

ALPHA="#00000000"
BG="#32363e"
FG="#32363e"
SELECT="#abb2bf"
ACCENT="#282c34"

# overwrite colors file
cat > $dir/colors.rasi <<- EOF
	/* colors */

	* {
	  al:  $ALPHA;
	  bg:  $BG;
	  se:  $SELECT;
	  fg:  $FG;
	  ac:  $ACCENT;
	}
EOF

rofi -no-lazy-grab -show drun -modi drun -theme $dir/"$theme"

