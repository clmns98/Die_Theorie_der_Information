% DO NOT CHANGE THIS FILE

% Author and Maintainer: Philipp Arras (c@philipp-arras.de)
% Contributors: Chuyang Wang (mail@chuyang-wang.de)

\def\dsafileversion{1.11}
\def\dsafiledate{2022/07/26}

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
\renewcommand{\chapapp}{KURS}
\renewcommand*{\chapterformat}{%
  \MakeUppercase{Akademie \myacademy{}} --- \chapappifchapterprefix{\nobreakspace}\thechapter\autodot%
  \IfUsePrefixLine{%
    \par\nobreak\vspace{-\parskip}\vspace{-.6\baselineskip}%
    \rule{0.9\textwidth}{.5pt}%
  }{\enskip}%
}
\renewcommand\chapterlineswithprefixformat[3]{%
  #2 \MakeUppercase{#3}
}
% /Layout and fonts

\RequirePackage[pdftex,
                pdfauthor={Deutsche Schuelerakademie},
                pdftitle={Akademie-Dokumentation},
                pdfcreator={DSA-Doku-Vorlage Version \dsafileversion{} vom \dsafiledate{}},
                pdflang={de-DE}]{hyperref}

% Bibliography
\RequirePackage[style=apa]{biblatex}
\DeclarePrintbibliographyDefaults{heading=subbibliography}
% /Bibliography

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

% Code listings with solarized colors
\usepackage[x11names, rgb, html]{xcolor}
\usepackage{listings}
\definecolor{sbase0}{HTML}{839496}
\definecolor{sbase1}{HTML}{93A1A1}
\definecolor{sbase2}{HTML}{EEE8D5}
\definecolor{sbase3}{HTML}{FDF6E3}
\definecolor{scyan}{HTML}{2AA198}
\definecolor{sblue}{HTML}{268BD2}
\lstset{
    frame=lines,
    backgroundcolor=\color{sbase3},
    basicstyle=\ttfamily,
    keywordstyle=\color{scyan}\textbf,
    commentstyle=\color{sbase0},
    stringstyle=\color{sblue},
    showstringspaces=false,
    tabsize=2
}
% /Code listings

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
