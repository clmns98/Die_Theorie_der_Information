% DO NOT CHANGE THIS FILE

% Author and Maintainer: Philipp Arras (c@philipp-arras.de)
% Contributors: Chuyang Wang (mail@chuyang-wang.de)

\def\dsafileversion{1.6}
\def\dsafiledate{2022/07/17}

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{dsadokumentation}[\dsafiledate\space Version \dsafileversion\space by Philipp Arras]

% Layout and fonts
\LoadClass[a4paper, twoside]{scrreprt}
\RequirePackage{scrlayer-scrpage}
\clearpairofpagestyles{}
\RequirePackage{times}
\KOMAoption{chapterprefix}{true}
\renewcommand*\raggedchapter{\centering}
\RedeclareSectionCommand[beforeskip=0pt,afterskip=0.5\baselineskip]{chapter}
\setkomafont{chapterprefix}{\normalsize\mdseries}
\renewcommand{\chapapp}{Kurs}
\renewcommand*{\chapterformat}{%
  Akademie \myacademy{} --- \chapappifchapterprefix{\nobreakspace}\thechapter\autodot%
  \IfUsePrefixLine{%
    \par\nobreak\vspace{-\parskip}\vspace{-.6\baselineskip}%
    \rule{0.9\textwidth}{.5pt}%
  }{\enskip}%
}
\renewcommand\chapterlineswithprefixformat[3]{%
  \MakeUppercase{#2#3}
}
% /Layout and fonts

\RequirePackage[pdftex,
                pdfauthor={Deutsche Schuelerakademie},
                pdftitle={Akademie-Dokumentation},
                pdfcreator={DSA-Doku-Vorlage Version \dsafileversion{} vom \dsafiledate{}},
                pdflang={de-DE}]{hyperref}

% Bibliography
\RequirePackage[style=authoryear,citestyle=authoryear-comp,
giveninits=true,
sorting=nyvt,
alldates=year,
uniquename=false,
doi=false,
eprint=false,isbn=false,url=false,dashed=False]{biblatex}
\DeclarePrintbibliographyDefaults{heading=subbibliography}
\DeclareNameAlias{sortname}{family-given}
\renewbibmacro{in:}{}
% /Bibliography

% Better hyphenation
\RequirePackage[ngerman=ngerman-x-latest]{hyphsubst}

% Math packages
\RequirePackage{amsmath}

% German references
\RequirePackage[ngerman]{babel}
\RequirePackage[ngerman]{cleveref}

% Nice tables
\RequirePackage{booktabs}

% Nice quotation marks
\RequirePackage{csquotes}

% Include external graphics
\RequirePackage{graphicx}

% Custom commands
\newcommand\kurs[3]{\chapter{#1} \begin{center}\Large\MakeUppercase{#2}\normalsize

    \vspace{1.5em}
    \includegraphics[height=7cm]{#3} \end{center}}

\newcommand{\sectionauthor}[1]{%
  {\parindent0pt\vspace*{-1em}%
  \linespread{1.1}\large\itshape#1%
  \par\nobreak\vspace*{0.6em}}
  \@afterheading%
}


% Draft mode
\RequirePackage{datetime}
\RequirePackage{setspace}
\RequirePackage{lineno}
\RequirePackage{lastpage}

\KOMAoption{draft}{false}
\makeatletter
\@ifclasswith{dsadokumentation}{draft}{
  \setkeys{Gin}{draft=false}
  \linenumbers
  \setstretch{2}
  \chead{\textit{Entwurfsversion \today{} \ \currenttime{} (DSA-Doku-Vorlage Version \dsafileversion{})}}
  \cfoot*{\thepage{}/\pageref{LastPage}}
}{}
\makeatother
% \Draft mode
