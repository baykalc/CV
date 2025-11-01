%% Start of file `awesome-cv.cls' (LIGHT + POLISHED v2)
\ProvidesClass{awesome-cv}[2025/09/21 v1.6.1-lite Awesome CV]
\NeedsTeXFormat{LaTeX2e}

%-------------------- Options / Base --------------------
\DeclareOption{draft}{\setlength\overfullrule{5pt}}
\DeclareOption{final}{\setlength\overfullrule{0pt}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass{article}

%-------------------- Packages (trimmed & fast) ----------
\RequirePackage{array,enumitem,ragged2e,geometry,fancyhdr,xcolor,xifthen,etoolbox,setspace}
\RequirePackage[quiet]{fontspec}
\defaultfontfeatures{Ligatures=TeX}
\RequirePackage{parskip}
\RequirePackage[hidelinks,unicode]{hyperref}
% microtype adds subtle kerning; skip gracefully if unavailable
\IfFileExists{microtype.sty}{%
  \RequirePackage[protrusion=true,expansion=false]{microtype}% XeTeX cannot expand fonts
}{%
  \ClassWarning{awesome-cv}{microtype.sty not found; proceeding without microtype}
}
\hypersetup{pdftitle={},pdfauthor={},pdfsubject={},pdfkeywords={}}
% NO unicode-math, NO fontawesome, NO local Roboto scanning

%-------------------- Page layout -------------------------
\geometry{left=2.0cm, top=1.5cm, right=2.0cm, bottom=2.0cm, footskip=.5cm, includehead}
\fancyhfoffset{0em}\renewcommand{\headrulewidth}{0pt}\fancyhf{}\pagestyle{fancy}

%-------------------- Colors ------------------------------
\definecolor{white}{HTML}{FFFFFF}
\definecolor{black}{HTML}{000000}
\definecolor{darkgray}{HTML}{2A2A2A}
\definecolor{gray}{HTML}{5D5D5D}
\definecolor{lightgray}{HTML}{9A9A9A}
\definecolor{darktext}{HTML}{414141}
\colorlet{text}{darkgray}\colorlet{graytext}{gray}\colorlet{lighttext}{lightgray}
\definecolor{awesome-skyblue}{HTML}{0395DE}
\definecolor{awesome-red}{HTML}{DC3522}
\colorlet{awesome}{awesome-skyblue}

\newbool{acvSectionColorHighlight}\setbool{acvSectionColorHighlight}{true}
\newcommand*{\sectioncolor}[1]{\ifbool{acvSectionColorHighlight}{{\color{awesome}#1}}{#1}}

%-------------------- Fonts (nice but light) ---------------
% Source Sans Pro + Source Code Pro ship with Overleaf/TeX Live. Real Light/Semibold give “Awesome-CV” feel.
\newcommand*{\acv@sansfontpath}{fonts/SourceSansPro/}
\newcommand*{\acv@monofontpath}{fonts/SourceCodePro/}
\setmainfont{SourceSansPro}[
  Path = \acv@sansfontpath,
  Extension = .otf,
  UprightFont = *-Regular,
  ItalicFont = *-RegularIt,
  BoldFont = *-Semibold,
  BoldItalicFont = *-SemiboldIt
]
\setsansfont{SourceSansPro}[
  Path=\acv@sansfontpath,
  Extension=.otf,
  UprightFont=*-Regular,
  ItalicFont=*-RegularIt,
  BoldFont=*-Semibold,
  BoldItalicFont=*-SemiboldIt
]
\setmonofont{SourceCodePro}[
  Path=\acv@monofontpath,
  Extension=.otf,
  UprightFont=*-Regular,
  ItalicFont=*-RegularIt,
  BoldFont=*-Semibold,
  BoldItalicFont=*-SemiboldIt
]

\newfontfamily\headerfont{SourceSansPro}[
  Path=\acv@sansfontpath, Extension=.otf,
  UprightFont=*-Semibold, ItalicFont=*-SemiboldIt
]
\newfontfamily\headerfontlight{SourceSansPro}[
  Path=\acv@sansfontpath, Extension=.otf,
  UprightFont=*-Light, ItalicFont=*-LightIt
]
\newfontfamily\footerfont{SourceSansPro}[
  Path=\acv@sansfontpath, Extension=.otf,
  UprightFont=*-Semibold
]
\newfontfamily\bodyfont{SourceSansPro}[
  Path=\acv@sansfontpath, Extension=.otf,
  UprightFont=*-Regular, ItalicFont=*-RegularIt, BoldFont=*-Semibold
]
\newfontfamily\bodyfontlight{SourceSansPro}[
  Path=\acv@sansfontpath, Extension=.otf,
  UprightFont=*-Light, ItalicFont=*-LightIt
]

% Tiny helper for tasteful letterspacing in headers
\newcommand{\ls}[1]{\addfontfeatures{LetterSpace=#1}}

%-------------------- Icon stubs (no heavy icon font) ------
\providecommand{\faPhone}{}\providecommand{\faEnvelopeO}{}\providecommand{\faHome}{}
\providecommand{\faGithub}{}\providecommand{\faGitlab}{}\providecommand{\faStackOverflow}{}
\providecommand{\faLinkedin}{}\providecommand{\faTwitter}{}\providecommand{\faSkype}{}
\providecommand{\faReddit}{}\providecommand{\faXingSquare}{}\providecommand{\faScholar}{}

%-------------------- Styles -------------------------------
% Name: colored last name, real Light weight first name, slight tracking
\newcommand*{\headerfirstnamestyle}[1]{{\fontsize{34pt}{1em}\headerfontlight\ls{2}\color{text} #1}}
\newcommand*{\headerlastnamestyle}[1]{{\fontsize{34pt}{1em}\headerfont\ls{2}\color{awesome} #1}}
\newcommand*{\headerpositionstyle}[1]{{\fontsize{9pt}{1em}\bodyfont\color{darktext} #1}}
\newcommand*{\headeraddressstyle}[1]{{\fontsize{8.3pt}{1em}\bodyfont\color{lighttext} #1}}
\newcommand*{\headersocialstyle}[1]{{\fontsize{8.3pt}{1em}\bodyfont\ls{4}\color{text} #1}}
\newcommand*{\headerquotestyle}[1]{{\fontsize{9pt}{1em}\bodyfont\itshape\color{darktext} #1}}
\newcommand*{\footerstyle}[1]{{\fontsize{8pt}{1em}\footerfont\scshape\color{lighttext} #1}}

% Sections: uppercase, tighter tracking, understated rule accent
\newcommand*{\sectionstyle}[1]{{\fontsize{16pt}{1em}\bodyfont\bfseries\ls{1.5}\sectioncolor{#1}}}
\newcommand*{\acvSectionRuleColor}{awesome}
\newcommand*{\acvSectionRuleThickness}{1.0pt}
\newcommand*{\acvSectionRuleSkip}{0.08em}
\newcommand*{\acvSectionRuleLength}{0.85\linewidth}
\newcommand*{\subsectionstyle}[1]{{\fontsize{12pt}{1em}\bodyfont\scshape\textcolor{text}{#1}}}
\newcommand*{\paragraphstyle}{\fontsize{9.3pt}{1.05em}\bodyfontlight\color{text}}

% Entries
\newcommand*{\entrytitlestyle}[1]{{\fontsize{10.5pt}{1em}\bodyfont\bfseries\color{darktext} #1}}
\newcommand*{\entrypositionstyle}[1]{{\fontsize{9pt}{1em}\bodyfont\color{graytext} #1}}
\newcommand*{\entrydatestyle}[1]{{\fontsize{8.3pt}{1em}\bodyfontlight\slshape\color{graytext} #1}}
\newcommand*{\entrylocationstyle}[1]{{\fontsize{9.3pt}{1em}\bodyfontlight\slshape\color{awesome} #1}}
\newcommand*{\descriptionstyle}[1]{{\fontsize{9.5pt}{1.07em}\bodyfontlight\color{text} #1}}

% Subentries
\newcommand*{\subentrytitlestyle}[1]{{\fontsize{8.2pt}{1em}\bodyfont\mdseries\color{graytext} #1}}
\newcommand*{\subentrypositionstyle}[1]{{\fontsize{7.5pt}{1em}\bodyfont\color{graytext} #1}}
\newcommand*{\subentrydatestyle}[1]{{\fontsize{7.3pt}{1em}\bodyfontlight\slshape\color{graytext} #1}}
\newcommand*{\subentrylocationstyle}[1]{{\fontsize{7.3pt}{1em}\bodyfontlight\slshape\color{awesome} #1}}
\newcommand*{\subdescriptionstyle}[1]{{\fontsize{8.1pt}{1.05em}\bodyfontlight\color{text} #1}}

\newcommand*{\honortitlestyle}[1]{{\fontsize{9pt}{1em}\bodyfont\color{graytext} #1}}
\newcommand*{\honorpositionstyle}[1]{{\fontsize{9pt}{1em}\bodyfont\bfseries\color{darktext} #1}}
\newcommand*{\honordatestyle}[1]{{\fontsize{9pt}{1em}\bodyfont\color{graytext} #1}}
% Organization (right column) — keep readable, not italic
\newcommand*{\honorlocationstyle}[1]{{\fontsize{9pt}{1em}\bodyfontlight\color{awesome} #1}}

% (Reserved for future inline award styling)

\newcommand*{\skilltypestyle}[1]{{\fontsize{10pt}{1em}\bodyfont\bfseries\color{darktext} #1}}
\newcommand*{\skillsetstyle}[1]{{\fontsize{9pt}{1em}\bodyfontlight\color{text} #1}}

%-------------------- Personal info & helpers ------------------
\newcommand*{\name}[2]{\def\@firstname{#1}\def\@lastname{#2}}
\newcommand*{\firstname}[1]{\def\@firstname{#1}}
\newcommand*{\lastname}[1]{\def\@lastname{#1}}
\newcommand*{\familyname}[1]{\def\@lastname{#1}}\def\@familyname{\@lastname}
\newcommand*{\address}[1]{\def\@address{#1}}
\newcommand*{\position}[1]{\def\@position{#1}}
\newcommand*{\mobile}[1]{\def\@mobile{#1}}
\newcommand*{\email}[1]{\def\@email{#1}}
\newcommand*{\homepage}[1]{\def\@homepage{#1}}
\newcommand*{\github}[1]{\def\@github{#1}}
\newcommand*{\gitlab}[1]{\def\@gitlab{#1}}
\newcommand*{\stackoverflow}[2]{\def\@stackoverflowid{#1}\def\@stackoverflowname{#2}}
\newcommand*{\scholar}[2]{\def\@scholarid{#1}\def\@scholarname{#2}}
\newcommand*{\linkedin}[1]{\def\@linkedin{#1}}
\newcommand*{\twitter}[1]{\def\@twitter{#1}}
\newcommand*{\skype}[1]{\def\@skype{#1}}
\newcommand*{\reddit}[1]{\def\@reddit{#1}}
\newcommand*{\xing}[1]{\def\@xing{#1}}
\newcommand*{\extrainfo}[1]{\def\@extrainfo{#1}}
\renewcommand*{\quote}[1]{\def\@quote{#1}}

\newcommand{\acvHeaderNameDelim}{\space}
\newcommand{\acvHeaderAfterNameSkip}{1.6mm}
\newcommand{\acvHeaderAfterPositionSkip}{.6mm}
\newcommand{\acvHeaderAfterAddressSkip}{-.3mm}
% Use a subtle colored bullet as the social separator (feels “designed” w/o icons)
\newcommand{\acvHeaderIconSep}{}
\newcommand{\acvHeaderSocialSep}{\ \textcolor{lighttext}{\textbullet}\ }
\newcommand{\acvHeaderAfterSocialSkip}{3.0mm}
\newcommand{\acvHeaderAfterQuoteSkip}{5mm}
\newcommand{\acvHeaderBottomSkip}{3mm}
\newcommand{\acvSectionTopSkip}{1mm}
\newcommand{\acvSectionContentTopSkip}{1.9mm}

% Utilities
\newcolumntype{L}[1]{>{\raggedright\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{C}[1]{>{\centering\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{R}[1]{>{\raggedleft\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\def\vhrulefill#1{\leavevmode\leaders\hrule\@height#1\hfill \kern\z@}
\newcommand*{\ifempty}[3]{\ifthenelse{\isempty{#1}}{#2}{#3}}

%-------------------- Header / Footer / Sections ---------------
\newcommand*{\makecvheader}[1][C]{%
  \newlength{\headertextwidth}\newlength{\headerphotowidth}
  \setlength{\headertextwidth}{\textwidth}\setlength{\headerphotowidth}{0cm}
  \begin{minipage}[c]{\headertextwidth}
    \ifthenelse{\equal{#1}{L}}{\raggedright}{\ifthenelse{\equal{#1}{R}}{\raggedleft}{\centering}}
    \headerfirstnamestyle{\@firstname}\headerlastnamestyle{{}\acvHeaderNameDelim\@lastname}\\[\acvHeaderAfterNameSkip]
    \ifthenelse{\isundefined{\@position}}{}{\headerpositionstyle{\@position\\[\acvHeaderAfterPositionSkip]}}%
    \ifthenelse{\isundefined{\@address}}{}{\headeraddressstyle{\@address\\[\acvHeaderAfterAddressSkip]}}%
    \headersocialstyle{%
      \newbool{isstart}\setbool{isstart}{true}%
      \ifthenelse{\isundefined{\@mobile}}{}{ \@mobile\setbool{isstart}{false} }%
      \ifthenelse{\isundefined{\@email}}{}{ \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}\href{mailto:\@email}{\@email} }%
      \ifthenelse{\isundefined{\@homepage}}{}{ \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}\href{https://\@homepage}{\@homepage} }%
      \ifthenelse{\isundefined{\@github}}{}{ \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}\href{https://github.com/\@github}{github.com/\@github} }%
      \ifthenelse{\isundefined{\@gitlab}}{}{ \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}\href{https://gitlab.com/\@gitlab}{gitlab.com/\@gitlab} }%
      \ifthenelse{\isundefined{\@scholarid}}{}{ \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}\href{https://scholar.google.com/citations?hl=en&user=\@scholarid}{\@scholarname} }%
      \ifthenelse{\isundefined{\@stackoverflowid}}{}{ \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}\href{https://stackoverflow.com/users/\@stackoverflowid}{\@stackoverflowname} }%
      \ifthenelse{\isundefined{\@linkedin}}{}{ \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}\href{https://www.linkedin.com/in/\@linkedin}{linkedin.com/in/\@linkedin} }%
      \ifthenelse{\isundefined{\@twitter}}{}{ \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}\href{https://twitter.com/\@twitter}{@\@twitter} }%
      \ifthenelse{\isundefined{\@skype}}{}{ \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}\@skype }%
      \ifthenelse{\isundefined{\@reddit}}{}{ \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}\href{https://www.reddit.com/user/\@reddit}{u/\@reddit} }%
      \ifthenelse{\isundefined{\@xing}}{}{ \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}\href{https://www.xing.com/profile/\@xing}{\@xing} }%
      \ifthenelse{\isundefined{\@extrainfo}}{}{ \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}\@extrainfo }%
    } \\[\acvHeaderAfterSocialSkip]
    \ifthenelse{\isundefined{\@quote}}{}{ \headerquotestyle{\@quote\\}\vspace{\acvHeaderAfterQuoteSkip}}
  \end{minipage}\par\vspace*{\acvHeaderBottomSkip}
}

\newcommand*{\makecvfooter}[3]{\fancyfoot{}\fancyfoot[L]{\footerstyle{#1}}\fancyfoot[C]{\footerstyle{#2}}\fancyfoot[R]{\footerstyle{#3}}}

% Section headings: compact rule accent
\newcommand{\cvsection}[1]{%
  \vspace{\acvSectionTopSkip}%
  \sectionstyle{#1}%
  \phantomsection\\[\acvSectionRuleSkip]%
  {\color{\acvSectionRuleColor}\makebox[\linewidth][l]{\rule{\acvSectionRuleLength}{\acvSectionRuleThickness}}}%
}
\newcommand{\cvsubsection}[1]{\vspace{\acvSectionContentTopSkip}\vspace{-3mm}\subsectionstyle{#1}\phantomsection}

\newenvironment{cvparagraph}{\vspace{\acvSectionContentTopSkip}\vspace{-3mm}\paragraphstyle}{\par\vspace{2mm}}
\newenvironment{cventries}{\vspace{\acvSectionContentTopSkip}\begin{center}}{\end{center}}

\newcommand*{\cventrySchool}[5]{%
  % Gentle negative space, but not enough to collide
  \vspace{-0.2mm}\setlength\tabcolsep{0pt}\setlength{\extrarowheight}{0pt}
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}} L{\textwidth - 4.5cm} R{4.5cm}}
    \ifempty{#2#3}{\entrypositionstyle{#1} & \entrydatestyle{#4} \\}{\entrytitlestyle{#2} & \entrylocationstyle{#3} \\\entrypositionstyle{#1} & \entrydatestyle{#4} \\}
    \if\relax\detokenize{#5}\relax\else \multicolumn{2}{L{\textwidth}}{\descriptionstyle{#5}}\fi
  \end{tabular*}%
}

\newcommand*{\cventry}[5]{%
  % Small negative spacing to keep layout tight without collisions
  \vspace{-0.1mm}\setlength\tabcolsep{0pt}\setlength{\extrarowheight}{0pt}
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}} L{\textwidth - 4.5cm} R{4.5cm}}
    \ifempty{#2#3}{\entrypositionstyle{#1} & \entrydatestyle{#4} \\}{\entrytitlestyle{#2} & \entrylocationstyle{#3} \\\entrypositionstyle{#1} & \entrydatestyle{#4} \\}
    \if\relax\detokenize{#5}\relax\else \multicolumn{2}{L{\textwidth}}{\descriptionstyle{#5}}\fi
  \end{tabular*}%
}

\newenvironment{cvsubentries}{\begin{center}}{\end{center}}
\newcommand*{\cvsubentry}[4]{%
  \setlength\tabcolsep{0pt}\setlength{\extrarowheight}{0pt}
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}} L{\textwidth - 4.5cm} R{4.5cm}}
    \setlength\leftskip{0.2cm}
    \subentrytitlestyle{#2} & \ifthenelse{\equal{#1}{}}{\subentrydatestyle{#3}}{}
    \ifthenelse{\equal{#1}{}}{}{\subentrypositionstyle{#1} & \subentrydatestyle{#3} \\}
    \ifthenelse{\equal{#4}{}}{}{\multicolumn{2}{L{17.0cm}}{\subdescriptionstyle{#4}} \\}
  \end{tabular*}
}

\newenvironment{cvhonors}{%
  \vspace{\acvSectionContentTopSkip}\vspace{-2mm}
  \begin{center}\setlength\tabcolsep{0pt}\setlength{\extrarowheight}{0.1ex}
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}} C{2.0cm} L{\textwidth - 6.3cm} R{4.3cm}}
}{%
  \end{tabular*}\end{center}
}
% Use en dash with thin spaces for a cleaner award/description separator
\newcommand*{\cvhonor}[4]{\honordatestyle{#4} & \honorpositionstyle{#1} \,\textendash\, \honortitlestyle{#2} & \honorlocationstyle{#3} \\}

\newenvironment{cvskills}{%
  \vspace{\acvSectionContentTopSkip}\vspace{-2.0mm}
  \begin{center}\setlength\tabcolsep{1ex}\setlength{\extrarowheight}{0pt}
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}} r L{\textwidth * \real{0.9}}}
}{%
  \end{tabular*}\end{center}
}
\newcommand*{\cvskill}[2]{\skilltypestyle{#1} & \skillsetstyle{#2} \\}

\newenvironment{cvitems}{%
  % Slightly relaxed spacing; avoids overlap while staying compact
  \vspace{-2.0mm}\begin{justify}\begin{itemize}[leftmargin=2ex, topsep=0.5ex, itemsep=0.25ex]
  \setlength{\parskip}{0pt}\renewcommand{\labelitemi}{\textbullet}
}{%
  \end{itemize}\end{justify}\vspace{-1.0mm}
}

%-------------------- Bibliography -----------------------------
% (Disabled here for speed; load biblatex in main .tex if you need it.)

%% End of file `awesome-cv.cls' (LIGHT + POLISHED v2)
