static const char norm_fg[] = "#c7c6c6";
static const char norm_bg[] = "#221e1c";
static const char norm_border[] = "#595654";

static const char sel_fg[] = "#c7c6c6";
static const char sel_bg[] = "#aa7e6a";
static const char sel_border[] = "#c7c6c6";

static const char urg_fg[] = "#c7c6c6";
static const char urg_bg[] = "#ab9890";
static const char urg_border[] = "#ab9890";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
