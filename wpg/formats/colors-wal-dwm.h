static const char norm_fg[] = "#fefeff";
static const char norm_bg[] = "#202123";
static const char norm_border[] = "#6d6f76";

static const char sel_fg[] = "#fefeff";
static const char sel_bg[] = "#acb5c7";
static const char sel_border[] = "#fefeff";

static const char urg_fg[] = "#fefeff";
static const char urg_bg[] = "#a96974";
static const char urg_border[] = "#a96974";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
