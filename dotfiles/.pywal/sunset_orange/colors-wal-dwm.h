static const char norm_fg[] = "#ecd4d3";
static const char norm_bg[] = "#190c0d";
static const char norm_border[] = "#a59493";

static const char sel_fg[] = "#ecd4d3";
static const char sel_bg[] = "#FBAC3B";
static const char sel_border[] = "#ecd4d3";

static const char urg_fg[] = "#ecd4d3";
static const char urg_bg[] = "#DB745B";
static const char urg_border[] = "#DB745B";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
