static const char norm_fg[] = "#a5c5df";
static const char norm_bg[] = "#030616";
static const char norm_border[] = "#73899c";

static const char sel_fg[] = "#a5c5df";
static const char sel_bg[] = "#0C3DA2";
static const char sel_border[] = "#a5c5df";

static const char urg_fg[] = "#a5c5df";
static const char urg_bg[] = "#0E378A";
static const char urg_border[] = "#0E378A";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
