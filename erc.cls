\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{../erc}[2019/02/26 erc]
\LoadClass[oneside, a4paper, onecolumn, fontsize=11pt]{scrartcl}

\RequirePackage{mathptmx}
\RequirePackage{graphicx}
\graphicspath{{../img/}}
\pdfsuppresswarningpagegroup=1
\RequirePackage{amssymb}
\RequirePackage{paralist}
\RequirePackage{microtype}
\RequirePackage[pdfborder={0 0 0},colorlinks,citecolor=Violet, linkcolor=Red, urlcolor=blue]{hyperref}
\RequirePackage[dvipsnames]{xcolor}
\RequirePackage{longtable}
\RequirePackage{booktabs}
\RequirePackage{textcomp}
\RequirePackage{array}
\RequirePackage[TS1,T1]{fontenc}

\newsavebox{\@abstract}
\renewenvironment{abstract}
{\vfill\begin{lrbox}{\@abstract}\begin{minipage}{0.945\textwidth}}
{\end{minipage}\end{lrbox}\fbox{\usebox{\@abstract}}}

\setkomafont{section}{\normalsize\normalfont\bfseries}
\setkomafont{subsection}{\large\sffamily\mdseries\upshape\color{sectiontitlecolor}}
\renewcommand{\thesection}{\alph{section}} 

\renewcommand{\othersectionlevelsformat}[3]{\ifthenelse{\equal{#1}{section}}{Section #3: }{#3) }}

\RequirePackage{ifthen}

\RequirePackage[style=authoryear]{biblatex}
\ExecuteBibliographyOptions{maxnames=8,giveninits,parentracker=true,uniquename=init}
\defbibnote{bolditalics}{My name appears in bold, names of PhD students I supervised in italics.}

\RequirePackage{xpatch}
\RequirePackage{xstring}
% Adapted from
% http://tex.stackexchange.com/questions/73136/make-specific-author-bold-using-biblatex
\newbibmacro*{name:bold}[2]{%
  \edef\blx@tmp@name{\expandonce#1, \expandonce#2}%
  \def\do##1{\edef\blah{##1\bibinitperiod}\ifdefstrequal{\blx@tmp@name}{\blah}{\itshape\listbreak}{}}%
  \dolistloop{\italicnames}%
  \def\do##1{\edef\blah{##1\bibinitperiod}\ifdefstrequal{\blx@tmp@name}{\blah}{\bfseries\listbreak}{}}%
  \dolistloop{\boldnames}%
}
\newcommand*{\boldnames}{}
\newcommand*{\italicnames}{}

\xpretobibmacro{name:family}{\begingroup\usebibmacro{name:bold}{#1}{#2}}{}{}
\xpretobibmacro{name:given-family}{\begingroup\usebibmacro{name:bold}{#1}{#2}}{}{}
\xpretobibmacro{name:family-given}{\begingroup\usebibmacro{name:bold}{#1}{#2}}{}{}
\xpretobibmacro{name:delim}{\begingroup\normalfont}{}{}

\xapptobibmacro{name:family}{\endgroup}{}{}
\xapptobibmacro{name:given-family}{\endgroup}{}{}
\xapptobibmacro{name:family-given}{\endgroup}{}{}
\xapptobibmacro{name:delim}{\endgroup}{}{}

\RequirePackage{scrlayer-scrpage}
\pagestyle{scrheadings}
\clearscrheadfoot
\renewcommand{\headfont}{\normalfont}
\ihead[\emph{\@authorshort}]{\emph{\@authorshort}}

\ohead[\@acronym]{\@acronym}
\cfoot[\pagemark]{\pagemark}

\newcommand{\acronym}[1]{\def\@acronym{#1}}
\newcommand{\institution}[1]{\def\@institution{#1}}
\renewcommand{\author}[2][]{\def\@authorshort{#1}\def\@author{#2}}

\definecolor{sectionrectanglecolor}{rgb}{0.25,0.5,0.75}
\definecolor{sectiontitlecolor}{rgb}{0.2,0.4,0.65}
\definecolor{subsectioncolor}{rgb}{0,0,0}

\newcommand*{\sectionfont}{\large\sffamily\mdseries\upshape}
\newcommand*{\hintfont}{\small\sffamily}
\newcommand*{\subsectionfont}{\normalsize\sffamily\mdseries\upshape}

\providecommand*{\sectionstyle}[1]{{\sectionfont\color{sectiontitlecolor}#1}}
\providecommand*{\subsectionstyle}[1]{{\subsectionfont\color{subsectioncolor}#1}}

\DeclareBibliographyCategory{self}
\AtEveryCitekey{%
  \ifcategory{self}{%
  }{%
  \defcounter{maxnames}{2}%
  }%
}

\newcommand*{\mknamesignature}[5]{\xdef#1{#2|||}}

\DeclareIndexNameFormat{byname}%
 {%
  \mknamesignature{\currentsignature}{\namepartfamily}{\namepartgiven}{\namepartprefix}{\namepartsuffix}%
  \ifdefequal{\highlightname}{\currentsignature}%
    {\addtocategory{self}{\thefield{entrykey}}}%
    {}%
}

\AtDataInput{\indexnames[byname]{author}}

\newif\ifbone

\let\cite\autocite
