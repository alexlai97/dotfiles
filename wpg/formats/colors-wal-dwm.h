static const char norm_fg[] = "#fed0d0";
static const char norm_bg[] = "#2b131f";
static const char norm_border[] = "#7f3e61";

static const char sel_fg[] = "#fed0d0";
static const char sel_bg[] = "#ca8961";
static const char sel_border[] = "#fed0d0";

static const char urg_fg[] = "#fed0d0";
static const char urg_bg[] = "#a36960";
static const char urg_border[] = "#a36960";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
