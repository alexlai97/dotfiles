static const char norm_fg[] = "#c8c5c1";
static const char norm_bg[] = "#231809";
static const char norm_border[] = "#5a5146";

static const char sel_fg[] = "#c8c5c1";
static const char sel_bg[] = "#c6aa47";
static const char sel_border[] = "#c8c5c1";

static const char urg_fg[] = "#c8c5c1";
static const char urg_bg[] = "#b17b30";
static const char urg_border[] = "#b17b30";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
