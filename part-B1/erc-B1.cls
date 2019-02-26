\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{erc-B1}[2019/02/26 erc-B1]
\LoadClass{../erc}
\RequirePackage[left=2cm,top=1.5cm,bottom=1.7cm,right=2cm,headsep=.45cm,footskip=.6cm]{geometry}

\chead[Part B1]{Part B1}

\def\maketitle{\vspace*{.45cm}{\centering\bfseries\Large
ERC \erctype{} Grant \ercyear{}\\
Research proposal [Part B1]\\
\textit{(Part B1 is evaluated both in Step 1 and Step 2\\
Part B2 is evaluated in Step 2 only)}\par
\normalfont\huge
\vspace{.5cm}\@title\par
\vspace{.7cm}\@acronym\par
\normalfont\normalsize\raggedright\vspace{2cm}\begin{compactitem}
\item \textbf{Principal investigator (PI):} \@author
\item \textbf{Host institution:} \@institution
\item \textbf{Proposal duration:} 60 months%
\end{compactitem}
\par\vspace{1.2em}}}

\newcommand{\secsynopsis}{\pagebreak\section{Extended synopsis}}
\newcommand{\seccv}{\pagebreak\section{Curriculum vitae}}
\newcommand{\sectrack}{\pagebreak\section{Early achievements track-record}}

\newcommand{\headfundingid}{{\centering\bfseries\itshape Appendix: All
ongoing and submitted grants and funding of the PI (Funding
ID)\par}\vspace{1cm}}

\newenvironment{fundingidtable}{%
\noindent\begin{tabular}{p{4.2em}>{\raggedright}p{5.2em}>{\raggedleft}p{3em}>{\raggedright}p{4.5em}>{\raggedright}p{4.5em}p{15em}}
\toprule
\centering \textit{Title}&
\centering \textit{Funding Source}&
\centering\textit{Amount (\texteuro)}&
\multicolumn{1}{c}{\textit{Period}}&
\textit{Role of\\the PI}&
\multicolumn{1}{c}{\textit{Relation to the current ERC}}\\
\midrule}
{\bottomrule\end{tabular}}

% CV
\providecommand*{\listitemsymbol}{\textbullet}

\newlength{\quotewidth}
\newlength{\hintscolumnwidth}
\newlength{\separatorcolumnwidth}
\setlength{\separatorcolumnwidth}{0.025\textwidth}
\newlength{\maincolumnwidth}
\newcommand*{\sethintscolumnlength}[1]{
  \setlength{\hintscolumnwidth}{#1}%
  \setlength{\maincolumnwidth}{\textwidth}%
  \addtolength{\maincolumnwidth}{-\separatorcolumnwidth}%
  \addtolength{\maincolumnwidth}{-\hintscolumnwidth}}
\newcommand*{\sethintscolumntowidth}[1]{
  \settowidth{\hintscolumnwidth}{#1}%
  \setlength{\maincolumnwidth}{\textwidth}%
  \addtolength{\maincolumnwidth}{-\separatorcolumnwidth}%
  \addtolength{\maincolumnwidth}{-\hintscolumnwidth}}
% doubleitem lengths
\newlength{\doubleitemmaincolumnwidth}
% listitem lengths
\newlength{\listitemsymbolwidth}
\settowidth{\listitemsymbolwidth}{\listitemsymbol{}~}
% listdoubleitem lengths
\newlength{\listdoubleitemmaincolumnwidth}
% recompute all the lengths that depends on the text width
\newcommand*{\recomputelengths}{%
  \setlength{\quotewidth}{0.65\textwidth}%
  \sethintscolumnlength{\hintscolumnwidth}%
  % doubleitem lengths
  \setlength{\doubleitemmaincolumnwidth}{\maincolumnwidth}%
  \addtolength{\doubleitemmaincolumnwidth}{-\hintscolumnwidth}%
  \addtolength{\doubleitemmaincolumnwidth}{-\separatorcolumnwidth}%
  \setlength{\doubleitemmaincolumnwidth}{0.5\doubleitemmaincolumnwidth}%
  % listdoubleitem lengths
  \setlength{\listdoubleitemmaincolumnwidth}{\maincolumnwidth}%
  \addtolength{\listdoubleitemmaincolumnwidth}{-\listitemsymbolwidth}%
  \setlength{\listdoubleitemmaincolumnwidth}{0.475\listdoubleitemmaincolumnwidth}}
\sethintscolumnlength{0.15\textwidth}
\recomputelengths

\newif\if@sectionopen\@sectionopenfalse
\newif\if@firstcvline\@firstcvlinefalse % bug if initially set to true...

\newcommand*{\closecvsection}{%
  \if@sectionopen%
    \end{longtable}%
    \phantomsection% reset the anchor for hyperrefs
    \@sectionopenfalse\fi\vspace{-2em}}

\newcommand*{\cvsection}[1]{%
  \closecvsection{}%
  \@sectionopentrue%
  \phantomsection{}%
  \addcontentsline{toc}{subsection}{#1}%
  \begin{longtable}[l]{@{}l@{\hspace{\separatorcolumnwidth}}@{}p{\maincolumnwidth}@{}}%
  {\color{sectionrectanglecolor}\rule{\hintscolumnwidth}{1ex}}
&\sectionstyle{#1}\\[1ex]%
  \@firstcvlinetrue}

\newcommand*{\cvitem}[2]{%
  \if@firstcvline
  \else
    \\[-0.75em]\fi
  \cvline{#1}{#2}}

\newcommand*{\cventry}[6]{%
  \cvitem{#1}{%
    {\bfseries#2}%
    \ifthenelse{\equal{#3}{}}{}{, {\itshape#3}}%
    \ifthenelse{\equal{#4}{}}{}{, #4}%
    \ifthenelse{\equal{#5}{}}{}{, #5}%
    .%
    \ifthenelse{\equal{#6}{}}{}{\\\begin{minipage}[t]{\textwidth}\small#6\end{minipage}}}}

\newcommand*{\cvline}[2]{%
  \if@firstcvline%
    \@firstcvlinefalse%
    \\[-1em]% ugly hack to remove spaces before the first line
  \else%
    \\[-.2em]\fi%
  \begin{minipage}[t]{\hintscolumnwidth}\raggedleft\hintfont{#1}\end{minipage}&\begin{minipage}[t]{\maincolumnwidth}#2\end{minipage}}

\newcommand*{\weblink}[2][]{%
  \ifthenelse{\equal{#1}{}}%
    {\def\@linktext{#2}}%
    {\def\@linktext{#1}}%
  \href{#2}{\@linktext{}}}

\newcommand*{\cvlistitem}[1]{%
  \cvline{}{\makebox[0pt]{\listitemsymbol{}\hspace*{1cm}}#1}}
\renewcommand*{\bibfont}{\small}

\renewcommand\section{\@startsection{section}{1}{\z@}%
  {-2ex \@plus -1ex \@minus -.2ex}%
  {0.3ex \@plus.2ex}%
  {\ifnum \scr@compatibility>\@nameuse{scr@v@2.96}\relax
    \setlength{\parfillskip}{\z@ plus 1fil}\fi
    \raggedsection\normalfont\sectfont\nobreak\size@section}%
}
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
  {-1.25ex\@plus -1ex \@minus -.2ex}%
  {0.3ex \@plus .2ex}%
  {\ifnum \scr@compatibility>\@nameuse{scr@v@2.96}\relax
    \setlength{\parfillskip}{\z@ plus 1fil}\fi
    \raggedsection\normalfont\sectfont\nobreak\size@subsection
  }%
}
\renewcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
  {1.25ex \@plus1ex \@minus.2ex}%
  {-1em}%
  {\raggedsection\normalfont\sectfont\nobreak\size@paragraph}%
}

\bonetrue

\let\itemize\compactitem
\let\enditemize\endcompactitem
\let\enumerate\compactenum
\let\endenumerate\endcompactenum
\let\description\compactdesc
\let\enddescription\endcompactdesc
