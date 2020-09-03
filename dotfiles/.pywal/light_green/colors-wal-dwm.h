static const char norm_fg[] = "#c5c1a3";
static const char norm_bg[] = "#10100c";
static const char norm_border[] = "#898772";

static const char sel_fg[] = "#c5c1a3";
static const char sel_bg[] = "#6C6E32";
static const char sel_border[] = "#c5c1a3";

static const char urg_fg[] = "#c5c1a3";
static const char urg_bg[] = "#61602C";
static const char urg_border[] = "#61602C";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
