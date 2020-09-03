static const char norm_fg[] = "#c0c7ca";
static const char norm_bg[] = "#111a1f";
static const char norm_border[] = "#868b8d";

static const char sel_fg[] = "#c0c7ca";
static const char sel_bg[] = "#798362";
static const char sel_border[] = "#c0c7ca";

static const char urg_fg[] = "#c0c7ca";
static const char urg_bg[] = "#8D7856";
static const char urg_border[] = "#8D7856";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
