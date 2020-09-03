static const char norm_fg[] = "#dfdfe0";
static const char norm_bg[] = "#081612";
static const char norm_border[] = "#9c9c9c";

static const char sel_fg[] = "#dfdfe0";
static const char sel_bg[] = "#509738";
static const char sel_border[] = "#dfdfe0";

static const char urg_fg[] = "#dfdfe0";
static const char urg_bg[] = "#1C8D27";
static const char urg_border[] = "#1C8D27";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
