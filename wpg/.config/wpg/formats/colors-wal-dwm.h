static const char norm_fg[] = "#c9c8c8";
static const char norm_bg[] = "#272524";
static const char norm_border[] = "#5d5b5a";

static const char sel_fg[] = "#c9c8c8";
static const char sel_bg[] = "#ad8f83";
static const char sel_border[] = "#c9c8c8";

static const char urg_fg[] = "#c9c8c8";
static const char urg_bg[] = "#c6bcb9";
static const char urg_border[] = "#c6bcb9";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
