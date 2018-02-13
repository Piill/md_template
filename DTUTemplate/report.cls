% Packages that must be initialized before the draft call
\RequirePackage[final]{graphicx} %\includegraphics
%\RequirePackage{listings} %Inputting Code

\ProvidesClass{report}
\LoadClassWithOptions{extarticle}
	%extarticle: http://ftp.snt.utwente.nl/pub/software/tex/macros/latex/contrib/extsizes/extsizes.pdf

%%%%%%%%%%%%%%%%%%%%
%%% USER OPTIONS %%%
%%%%%%%%%%%%%%%%%%%%

\RequirePackage{lmodern}
	%\RequirePackage ~ \usepackage
	% lmoderm: Latin modern, fonts
\RequirePackage{etoolbox}
	%Conditionals, if, else
	\newtoggle{is_danish}
	\newtoggle{is_english}

%%% FONT TYPE
\DeclareOption{sans}{
	\renewcommand{\familydefault}{\sfdefault}
}
\DeclareOption{roman}{
	\renewcommand{\familydefault}{\rmdefault}
}

\ExecuteOptions{roman}
  % Set default option

%%% Language
\DeclareOption{danish}{ \toggletrue{is_danish}}
\DeclareOption{english}{ \toggletrue{is_english}}

\ProcessOptions\relax
	% Terminate option processing

%%%%%%%%%%%%%%%%
%%% PACKAGES %%%
%%%%%%%%%%%%%%%%

%%% STANDARD WIZARD QUICK START
\usepackage{amsmath}
\usepackage[utf8]{inputenc}
\iftoggle{is_english}{\usepackage[english]{babel}}{} \iftoggle{is_danish}{\usepackage[danish]{babel}}{}
	%Preffered language last
\usepackage{amssymb}
\usepackage{mathtools} %>amsmath
\usepackage{amssymb} %useful mathematical symbols
\usepackage{graphicx}
\usepackage{caption}
\usepackage{subcaption}
%%\usepackage{listings}

%%% MINIMUM
\usepackage[a4paper, top=3cm, bottom=2.5cm, left=2.5cm, right=2.5cm]{geometry} %Page formatting
	\setlength{\headheight}{14.5pt}
\usepackage[usenames,dvipsnames,svgnames,table]{xcolor} %> color, load early
\usepackage[square, comma, sort]{natbib} %\citep{}, \citet{}
\usepackage{lastpage} %Page counter
\usepackage{fancyhdr} %Format header and footer
\usepackage[fit, breakwords]{truncate}
\usepackage[hidelinks, final]{hyperref} %Internet links %NB: INCLUDE BEFORE cleveref
  % Removing 'final' might make the draft compile faster
\usepackage{cleveref} %\pageref
\usepackage{float} %H specifier for figures/tables ect
\usepackage[section]{placeins} %\FloatBarrier: empty float holding queue + add this to all sections

%%% REGULAR PACKAGES
\usepackage[colorinlistoftodos, obeyFinal]{todonotes} %todo notes
\usepackage[final]{listings} %Inputting Code
\usepackage{siunitx} %\SI
\usepackage{ifdraft} %test draft/final state. Default is final

%%% USEFULL PACKAGES
\usepackage[final]{pdfpages} %Include PDF
\usepackage{enumitem} %Format itemize, enumerate
\usepackage{epstopdf} %Allows EPS graphics
\usepackage[notref, notcite]{showkeys} %Display label in pdf
\usepackage{lipsum} % \lipsum: Create some latin text to test layout and formatting
\usepackage{draftwatermark} %Package to show watermark, when in draft form
%\usepackage{usecases} %Package for making usecases

%\usepackage{enumerate}
%\usepackage{ulem}
%\usepackage{microtype}
%\usepackage{tikz}
%\usepackage{calc}
%\usepackage{ifthen} // Obsolete! Use etoolbox instead
%\usepackage{physics}
%\usepackage{siunitx}
%\usepackage{fixltx2e}
%\usepackage{leftidx}
%\usepackage{setspace}


%%%%%%%%%%%%%%%%%%%%%%%
%%% CUSTOM COMMANDS %%%
%%%%%%%%%%%%%%%%%%%%%%%

%%% PRACTICAL
% Pretty normal and square parenthesesies
\renewcommand{\(}[1]{\left( #1 \right)}
\renewcommand{\[}[1]{\left[ #1 \right]}
\renewcommand{\)} %DUMMY, FIXES SYNTAX HIGHLIGHTING

\newcommand{\info}[1]{
\begin{small} \begin{quote}\begin{em} #1
\end{em}\end{quote}\end{small}}

\renewcommand{\c}[1]{ \lstinline$#1$} %inline code

%Todonotes
\definecolor{td_red}{rgb}{1, 0.2, 0.2} % keywords
\newcommand{\tdr}[1]{\todo[inline, color=td_red]{#1}}
\newcommand{\tdo}[1]{\todo[inline, color=Dandelion]{#1}}
\newcommand{\tdb}[1]{\todo[inline, color=CornflowerBlue]{#1}}
\newcommand{\tdg}[1]{\todo[inline, color=LimeGreen]{#1}}
\newcommand{\tdp}[1]{\todo[inline, color=CarnationPink]{#1}}
\newcommand{\tdy}[1]{\todo[inline, color=Yellow]{#1}}

\newcommand*{\rom}[1]{\expandafter\@slowromancap\romannumeral #1@} %ads a command to write roman numericals

%%%%%%%%%%%%%%%%%%%%
%%% LAYOUT SETUP %%%
%%%%%%%%%%%%%%%%%%%%

\setlength\parindent{0pt} % Remove paragraph indent
\newtoggle{custom_TOC}

%%% META
\newcommand{\course}[1]{\def \course {#1}}
\newcommand{\titlepagepicture}[1]{\def \titlepagepicture{#1}}
\newcommand{\universityname}[1]{\def\universityname{#1}}
\newcommand{\TOCtitle}[1]{
  \toggletrue{custom_TOC}
  \def\TOCtitle{#1}
}

\newcommand{\TOC}{
  \iftoggle{custom_TOC}{
    \renewcommand*\contentsname{\TOCtitle}
  }{
    \iftoggle{is_danish}{ % === IF
      \renewcommand*\contentsname{Indholdsfortegnelse}
    } { % ===ELSE
      \renewcommand*\contentsname{Table of Content}
    } %=== END IF
  }
  \tableofcontents
  \thispagestyle{empty}
  \newpage
  \setcounter{page}{1}
}


%%% HEADERS & FOOTERS
\pagestyle{fancy}
\makeatletter
%%\chead{\truncate{250pt}{\course}}
\rhead{\@date}
\lfoot{}
\cfoot{\thepage/\pageref{LastPage}} %CHANGEABLE
\rfoot{}


%%% PROGRAMMING LANGUAGES
\definecolor{lightlightgray}{gray}{0.95} % background
\definecolor{comment}{rgb}{0.35, 0.6, 0.35}
\definecolor{shpurple}{rgb}{0.5,0,0.35} % keywords
\definecolor{matlabgreen}{rgb}{28,172,0}
\definecolor{matlablilas}{rgb}{170,55,241}

%Dette er så der kan skrives æ,ø og å i kodesegmenter
\lstset{literate=%
{æ}{{\ae}}1
{å}{{\aa}}1
{ø}{{\o}}1
{Æ}{{\AE}}1
{Å}{{\AA}}1
{Ø}{{\O}}1
}

\lstset{language=MATLAB,%
    %basicstyle=\color{red},
    breaklines=true,%
    morekeywords={matlab2tikz},
    keywordstyle=\color{blue},
    morekeywords=[2]{1},
    keywordstyle=[2]{\color{black}},
    identifierstyle=\color{black},%
    stringstyle=\color{matlablilas},
    commentstyle=\color{matlabgreen},%
    showstringspaces=false,
    numbers=left,%
    numberstyle={\tiny \color{black}},
    numbersep=9pt,
    emph=[1]{for,end,break},emphstyle=[1]\color{red},
    frame=single,                   % adds a frame around the code
    frame=ltrb,
    rulecolor=\color{black},        % if not set, the frame-color may be changed on line-breaks within not-black text (e.g. commens (green here))
    tabsize=2,                      % sets default tabsize to 2 spaces
    captionpos=b,                   % sets the caption-position to bottom
    breaklines=true,                % sets automatic line breaking
    breakatwhitespace=false,        % sets if automatic breaks should only happen at whitespace
    title=\lstname,                 % show the filename of files included with \lstinputlisting;
    xleftmargin=25pt,
    xrightmargin=25pt,
    aboveskip=10pt,
    belowskip=10pt
}

\lstset{ language=C++,
  backgroundcolor=\color{lightlightgray},
  morekeywords={*, factorial, sum, erlang},
  keywordstyle=\color{shpurple}\textbf,
  commentstyle=\color{comment}\textit,
  stringstyle=\color{blue},
  numberstyle=\small\color{gray},  % the style that is used for the line-numbers
%
% Boring default stuff
  basicstyle=\ttfamily,           % the size of the fonts that are used for the code
  numbers=left,                   % where to put the line-numbers
  stepnumber=1,                   % the step between two line-numbers. If it's 1, each line will be numbered
  numbersep=8pt,                  % how far the line-numbers are from the code
  showspaces=false,               % show spaces adding particular underscores
  showstringspaces=false,         % underline spaces within strings
  showtabs=false,                 % show tabs within strings adding particular underscores
  frame=single,                   % adds a frame around the code
  frame=ltrb,
  rulecolor=\color{black},        % if not set, the frame-color may be changed on line-breaks within not-black text (e.g. commens (green here))
  tabsize=2,                      % sets default tabsize to 2 spaces
  captionpos=b,                   % sets the caption-position to bottom
  breaklines=true,                % sets automatic line breaking
  breakatwhitespace=false,        % sets if automatic breaks should only happen at whitespace
  title=\lstname,                 % show the filename of files included with \lstinputlisting;
  xleftmargin=25pt,
  xrightmargin=25pt,
  aboveskip=10pt,
  belowskip=10pt
}

%%% TITLE PAGE
\makeatother
\makeatletter
\renewcommand{\maketitle}{
  \begin{titlepage}
    \begin{center}
      \vspace*{0.5cm}
      \input{\titlepagepicture}

      \vspace{1.5cm}
      {\LARGE  \universityname} %CHANGEABLE
      \vspace{3cm}
      \hrule
      \vspace{0.6cm}
      \textsc{\LARGE \@title}
      \vspace{0.6cm}
      \hrule
      \vspace{0.6cm}
      \iftoggle{is_danish}{
        \textsc{Kursus} \\
      }{
        \textsc{Course:} \\ %CHANGEABLE
      }
      \course\\
      \vspace{0.6cm}
      \vspace{2cm}
    \end{center}

    \begin{minipage}[t]{1\textwidth}
      \begin{flushleft} \large
        \newlength{\authheight}
        \settoheight{\authheight}{\parbox{\linewidth}{\@author}}
        \newlength{\linehgt}
        \settoheight{\linehgt}{\parbox{\linewidth}{()}}
        \iftoggle{is_danish}{
          \ifdim \authheight>\linehgt
          \textsc{Forfattere:}
          \else
            \textsc{Forfatter:}
          \fi
        }{
          \ifdim \authheight>\linehgt
          \textsc{Authors:}
          \else
            \textsc{Author:}
          \fi
        }
        \\
        \vspace{0.15cm}
        \@author
      \end{flushleft}
    \end{minipage}
    \begin{minipage}[t]{1\textwidth}
      \begin{flushright} \large
      \end{flushright}
    \end{minipage}
    \vfill
    \begin{center}
      \@date
    \end{center}
    \thispagestyle{empty}
    \setcounter{page}{0}
  \end{titlepage}
}
\makeatother




\endinput
	% NB: This must be the last command in a class document
