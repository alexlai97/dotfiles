static const char norm_fg[] = "#c4c7c5";
static const char norm_bg[] = "#162119";
static const char norm_border[] = "#505852";

static const char sel_fg[] = "#c4c7c5";
static const char sel_bg[] = "#5ba4a6";
static const char sel_border[] = "#c4c7c5";

static const char urg_fg[] = "#c4c7c5";
static const char urg_bg[] = "#72aa80";
static const char urg_border[] = "#72aa80";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
