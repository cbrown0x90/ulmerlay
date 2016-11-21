/* See LICENSE file for copyright and license details. */

/* appearance */
static const unsigned int borderpx  = 1;        /* border pixel of windows */
static const unsigned int snap      = 10;       /* snap pixel */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 0;        /* 0 means bottom bar */
static const char *fonts[]          = { "gohufont:size=9", "Font Awesome:size=9" };
static const char col_gray_dark[]       = "#222222";
static const char col_gray_light[]       = "#bbbbbb";
static const char *colors[SchemeLast][3]      = {
	/*               fg         bg         border   */
	[SchemeNorm] = { col_gray_light, col_gray_dark, col_gray_dark },
	[SchemeSel] =  { col_gray_dark, col_gray_light,  col_gray_light },
};

/* tagging */
static const char *tags[] = { "1: Web", "2: Personal", "3: Work", "4: Misc", "5: Music", "6: Chat" };

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class      instance    title       tags mask     isfloating   monitor */
    { "qTox",     NULL,       NULL,       1 << 5,       0,           -1 },
};

/* layout(s) */
static const float mfact     = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 1;    /* 1 means respect size hints in tiled resizals */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[]=",      tile },    /* first entry is default */
	{ "><>",      NULL },    /* no layout function means floating behavior */
	{ "[M]",      monocle },
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = { "dmenu-start", NULL };
static const char *termcmd[]  = { "st", NULL };
static const char *web[] = { "qutebrowser", "--backend", "webengine", NULL };
static const char *lock[] = { "slock", NULL };
static const char *ncmpcpp[] = { "ncmpcpp-start", NULL };
static const char *tox[] = { "qtox", NULL };
static const char *screenshot[] = { "screenshot" , NULL };
static const char *audio_mute[] = { "amixer", "sset", "Master", "toggle", NULL };
static const char *audio_raise[] = { "amixer", "sset", "Master", "5%-", NULL };
static const char *audio_lower[] = { "amixer", "sset", "Master", "5%+", NULL };
static const char *toggleLock[] = { "toggle-lock", NULL };
static const char *mopidy_prev[] = { "/home/chris/.scripts/mopidy-commands/mopidy-previous", NULL };
static const char *mopidy_next[] = { "/home/chris/.scripts/mopidy-commands/mopidy-next", NULL };
static const char *mopidy_play[] = { "/home/chris/.scripts/mopidy-commands/mopidy-play", NULL };

#include "movestack.c"
static Key keys[] = {
        /* modifier                     key        	function        argument */
        { MODKEY,                       XK_d,      	spawn,          {.v = dmenucmd } },
        { MODKEY,                       XK_Return, 	spawn,          {.v = termcmd } },
        { MODKEY,                       XK_c,      	spawn,          {.v = web } },
        { MODKEY,                       XK_b,      	togglebar,      {0} },
        { MODKEY,                       XK_t,      	spawn,          {.v = tox } },
        { MODKEY,                       XK_n,      	spawn,          {.v = ncmpcpp } },
        { 0,                            XK_Print, 	spawn,         	{.v = screenshot } },
        { 0,                            0x1008ff12, spawn,         	{.v = audio_mute } },
        { 0,                            0x1008ff11, spawn,         	{.v = audio_raise } },
        { 0,                            0x1008ff13, spawn,         	{.v = audio_lower } },
        { 0,                            XK_F9, 		spawn,         	{.v = mopidy_prev } },
        { 0,                            XK_F10, 	spawn,         	{.v = mopidy_play } },
        { 0,                            XK_F11, 	spawn,         	{.v = mopidy_next } },
        { 0,							XK_F4,		spawn,			{.v = toggleLock } },
        { MODKEY|ShiftMask,             XK_l,      	spawn,          {.v = lock } },
        { MODKEY,                       XK_Left,   	focusstack,     {.i = -1 } },
        { MODKEY,                       XK_Right,  	focusstack,     {.i = +1 } },
        { MODKEY|ShiftMask,             XK_Left,   	movestack,      {.i = -1 } },
        { MODKEY|ShiftMask,             XK_Right,  	movestack,      {.i = +1 } },
        { MODKEY,                       XK_i,      	incnmaster,     {.i = +1 } },
        { MODKEY,                       XK_u,      	incnmaster,     {.i = -1 } },
        { MODKEY,                       XK_k,      	setmfact,       {.f = -0.05} },
        { MODKEY,                       XK_l,      	setmfact,       {.f = +0.05} },
        { MODKEY,                       XK_Tab,    	view,           {0} },
        { MODKEY|ShiftMask,             XK_q,      	killclient,     {0} },
        { MODKEY,                       XK_e,      	setlayout,      {.v = &layouts[0]} },
        { MODKEY,                       XK_f,      	setlayout,      {.v = &layouts[1]} },
        { MODKEY,                       XK_w,      	setlayout,      {.v = &layouts[2]} },
        { MODKEY,                       XK_space,  	setlayout,      {0} },
        { MODKEY|ShiftMask,             XK_space,  	togglefloating, {0} },
        { MODKEY,                       XK_0,      	view,           {.ui = ~0 } },
        { MODKEY|ShiftMask,             XK_0,      	tag,            {.ui = ~0 } },
        { MODKEY,                       XK_comma,  	focusmon,       {.i = -1 } },
        { MODKEY,                       XK_period, 	focusmon,       {.i = +1 } },
        { MODKEY|ShiftMask,             XK_comma,  	tagmon,         {.i = -1 } },
        { MODKEY|ShiftMask,             XK_period, 	tagmon,         {.i = +1 } },
        TAGKEYS(                        XK_1,                      	0)
        TAGKEYS(                        XK_2,                      	1)
        TAGKEYS(                        XK_3,                      	2)
        TAGKEYS(                        XK_4,                      	3)
        TAGKEYS(                        XK_5,                      	4)
        TAGKEYS(                        XK_6,                      	5)
        TAGKEYS(                        XK_7,                      	6)
        TAGKEYS(                        XK_8,                      	7)
        TAGKEYS(                        XK_9,                      	8)
        { MODKEY|ShiftMask,             XK_e,      	quit,           {0} },
};

/* button definitions */
/* click can be ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};

