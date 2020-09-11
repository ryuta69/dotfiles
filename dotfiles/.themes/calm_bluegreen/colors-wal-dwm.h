static const char norm_fg[] = "#b3d7d4";
static const char norm_bg[] = "#101811";
static const char norm_border[] = "#7d9694";

static const char sel_fg[] = "#b3d7d4";
static const char sel_bg[] = "#037C83";
static const char sel_border[] = "#b3d7d4";

static const char urg_fg[] = "#b3d7d4";
static const char urg_bg[] = "#718964";
static const char urg_border[] = "#718964";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
