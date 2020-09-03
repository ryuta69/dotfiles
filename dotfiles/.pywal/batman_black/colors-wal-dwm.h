static const char norm_fg[] = "#7ebdcf";
static const char norm_bg[] = "#000000";
static const char norm_border[] = "#588490";

static const char sel_fg[] = "#7ebdcf";
static const char sel_bg[] = "#054A74";
static const char sel_border[] = "#7ebdcf";

static const char urg_fg[] = "#7ebdcf";
static const char urg_bg[] = "#074E65";
static const char urg_border[] = "#074E65";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
