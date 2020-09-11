static const char norm_fg[] = "#e0c8a7";
static const char norm_bg[] = "#0C0A07";
static const char norm_border[] = "#9c8c74";

static const char sel_fg[] = "#e0c8a7";
static const char sel_bg[] = "#936D38";
static const char sel_border[] = "#e0c8a7";

static const char urg_fg[] = "#e0c8a7";
static const char urg_bg[] = "#976131";
static const char urg_border[] = "#976131";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
