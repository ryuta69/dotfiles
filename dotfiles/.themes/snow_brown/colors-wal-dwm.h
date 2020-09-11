static const char norm_fg[] = "#e3e2e0";
static const char norm_bg[] = "#131514";
static const char norm_border[] = "#9e9e9c";

static const char sel_fg[] = "#e3e2e0";
static const char sel_bg[] = "#A08E70";
static const char sel_border[] = "#e3e2e0";

static const char urg_fg[] = "#e3e2e0";
static const char urg_bg[] = "#758675";
static const char urg_border[] = "#758675";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
