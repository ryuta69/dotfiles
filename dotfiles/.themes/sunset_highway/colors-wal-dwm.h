static const char norm_fg[] = "#bfcfde";
static const char norm_bg[] = "#100f0b";
static const char norm_border[] = "#85909b";

static const char sel_fg[] = "#bfcfde";
static const char sel_bg[] = "#737C81";
static const char sel_border[] = "#bfcfde";

static const char urg_fg[] = "#bfcfde";
static const char urg_bg[] = "#AC9569";
static const char urg_border[] = "#AC9569";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
