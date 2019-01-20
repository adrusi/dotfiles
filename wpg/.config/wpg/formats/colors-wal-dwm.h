static const char norm_fg[] = "#9dcecc";
static const char norm_bg[] = "#0f0f1a";
static const char norm_border[] = "#97556f";

static const char sel_fg[] = "#9dcecc";
static const char sel_bg[] = "#92385F";
static const char sel_border[] = "#9dcecc";

static const char urg_fg[] = "#9dcecc";
static const char urg_bg[] = "#476A90";
static const char urg_border[] = "#476A90";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
