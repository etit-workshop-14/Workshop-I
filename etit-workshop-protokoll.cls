%% $Id: etit-workshop-protokoll.cls 498 2017-01-26 09:16:17Z nuernberg $
%% $Author: nuernberg $
%% $Date: 2017-01-26 10:16:17 +0100 (Do, 26 Jan 2017) $
%% $Revision: 498 $
%
% Class-File fuer ETIT-Workshop-Protokolle
%
\NeedsTeXFormat{LaTeX2e} 
\def\etit@version{0.0}
\def\etit@filedate{2015/05/13}

\ProvidesClass{etit-workshop-protokoll}[\etit@filedate\space \etit@version\space LaTeX2e document class]

\typeout{^^J%
  *******************************************************^^J%
  * document class ETIT-WORKSHOP-PROTOKOLL \space\space
  (\etit@filedate)^^J%
  * (c) 2012 Matthias Michelsburg^^J%
  *     2013 Thomas Nuernberg^^J%
  * ^^J%
  * Institut fuer Industrielle Informationstechnik (IIIT)^^J%
  * Karlsruher Institut fuer Technologie^^J%
  * http://www.iiit.kit.edu^^J%
  *******************************************************^^J%
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Options
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newif\ifetit@ansinew \etit@ansinewfalse%
\newif\ifetit@utfviii \etit@utfviiitrue% default utf8
\newif\ifetit@latini \etit@latinifalse%
\newif\ifetit@applemac \etit@applemacfalse%

\DeclareOption{ansinew}{\etit@ansinewtrue\etit@utfviiifalse\etit@latinifalse\etit@applemacfalse}   % ansinew als Zeichenkodierung
\DeclareOption{utf8}{\etit@utfviiitrue\etit@ansinewfalse\etit@latinifalse\etit@applemacfalse}      % utfviii als Zeichenkodierung
\DeclareOption{latin1}{\etit@latinitrue\etit@ansinewfalse\etit@utfviiifalse\etit@applemacfalse}    % latin1 als Zeichenkodierung
\DeclareOption{applemac}{\etit@applemactrue\etit@latinifalse\etit@ansinewfalse\etit@utfviiifalse}  % applemac als Zeichenkodierung

\PassOptionsToPackage{english,ngerman}{babel}%

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrartcl}}%

\ProcessOptions\relax%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Packages
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\LoadClass[11pt,a4paper,fleqn,twoside]{scrartcl}%
% \LoadClass[12pt,a4paper,fleqn,oneside]{scrartcl}%

\RequirePackage{graphicx}%
\RequirePackage[scaled=0.92]{helvet}%
\RequirePackage{courier}%

\renewcommand{\familydefault}{\sfdefault}%

\RequirePackage[T1]{fontenc}%
\ifetit@ansinew%
    \RequirePackage[ansinew]{inputenc}  % Direkte Eingabe von Umlauten mit ANSI
\fi%
\ifetit@utfviii%
    \RequirePackage[utf8]{inputenc}     % Direkte Eingabe von Umlauten mit UTF8
\fi%
\ifetit@latini%
    \RequirePackage[latin1]{inputenc}   % Direkte Eingabe von Umlauten mit latin1
\fi%
\ifetit@applemac%
    \RequirePackage[applemac]{inputenc} % Direkte Eingabe von Umlauten mit applemac
\fi%
\RequirePackage[ngerman]{babel}%

\RequirePackage[intlimits,fleqn]{amsmath}%
\RequirePackage{amssymb}%

\RequirePackage{array}%
\RequirePackage[headsepline]{scrlayer-scrpage}%
\RequirePackage[hyphens]{url}%
\RequirePackage{hyperref}%
\RequirePackage{geometry}%
\RequirePackage{booktabs}%
\RequirePackage{floatrow}%
\floatsetup[table]{capposition=top}%
\RequirePackage{tabularx}%

\RequirePackage[locale=DE,detect-all]{siunitx}%

\RequirePackage{listings}%
\ifetit@utfviii%
    \RequirePackage{listingsutf8}%
\fi%
\RequirePackage{accsupp}%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Satzspiegel
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\frenchspacing%

\geometry{%
    a4paper,%
    textwidth =         160mm,%
    textheight =        235mm,%
    top =               20mm,%
    includehead,%
    headheight =        15pt,%
    headsep =           10mm,%
    footskip =          10mm,%
    hmarginratio =      1:1,%
    marginparsep =      2mm,%
    marginparwidth =    16mm%
}%

\renewcommand{\topfraction}{2.00}%
\renewcommand{\bottomfraction}{2.00}%
\renewcommand{\textfraction}{-0.10}%
\renewcommand{\floatpagefraction}{0.10}%
\renewcommand{\baselinestretch}{1.10}%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Seitenlayout
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\automark[subsection]{section}%
\chead{}%
\cfoot{\pagemark}%
\ofoot{}%
% \setheadsepline{0.4pt} % Trennlinie unter Kopfzeile


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Listings
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\noaccsupp}[1]{\BeginAccSupp{ActualText={}}#1\EndAccSupp{}}%
\lstset{%
    numbers=left,                   % where to put the line-numbers
    basicstyle={\lstbasicfont},       % the size of the fonts that are used for the code	
    numberstyle=\footnotesize\noaccsupp,      % the size of the fonts that are used for the line-numbers
    stepnumber=1,                   % the step between two line-numbers. If it's 1 each line will be numbered
    numbersep=5pt,                  % how far the line-numbers are from the code
    backgroundcolor=\color{white},  % choose the background color. You must add \usepackage{color}
    showspaces=false,               % show spaces adding particular underscores
    showstringspaces=false,         % underline spaces within strings
    %showtabs=false,                 % show tabs within strings adding particular underscores
    frame=single,                   % adds a frame around the code
    tabsize=4,                      % sets default tabsize to 4 spaces
    captionpos=t,                   % sets the caption-position to bottom
    breaklines=true,                % sets automatic line breaking
    xleftmargin=3.5pt,              %
    xrightmargin=3.5pt,             %
    breakatwhitespace=false,        % sets if automatic breaks should only happen at whitespace
    extendedchars=true,
    captionpos=t,%
    belowcaptionskip=0.5em,%
    postbreak=\mbox{\textcolor{red}{$\hookrightarrow$}\space},%
    basicstyle=\ttfamily,           % the size of the fonts that are used for the code
}%

\ifetit@utfviii%
    \lstset{inputencoding=utf8/latin1}%
\fi%

\lstdefinestyle{matlab}{%
    basicstyle=\footnotesize\ttfamily,%
    columns=flexible,%
    language=matlab,%
    moredelim=[l][\bfseries\itshape]{\%\%},%
    morekeywords = {switch, case,inf},%
    keywordstyle=\color[rgb]{0,0,1},            % keywords in blue
    commentstyle=\color[rgb]{.133,.545,.133},   % comments in green,              
    stringstyle=\color[rgb]{.627,.126,.941},    % strings in purple
}%


\lstdefinestyle{latex}{%
    basicstyle=\footnotesize\ttfamily,%
    columns=flexible,%
    language=[LaTeX]{TeX}%
}%

\lstdefinestyle{other}{%
    basicstyle=\footnotesize\sffamily,%
    columns=flexible,%
}%

\def\lstlistingname{Quellcode}%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Title page
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\etit@kursnummer}{}%
\newcommand{\etit@kurstitel}{}%
\newcommand{\etit@gruppennummer}{}%

\newcommand{\kursnummer}[1]{\renewcommand{\etit@kursnummer}{#1}}%
\newcommand{\kurstitel}[1]{\renewcommand{\etit@kurstitel}{#1}}%
\newcommand{\gruppennummer}[1]{\renewcommand{\etit@gruppennummer}{#1}}%

\newcommand{\teilnehmer}[5]{%
    \ifx\etit@teilnehmer\@undefined%
        \newcommand{\etit@teilnehmer}{#1 & #2 & #3 & #4 & \href{mailto:#5}{\nolinkurl{#5}} \\}%
    \else%
        \g@addto@macro\etit@teilnehmer{#1 & #2 & #3 & #4 & \href{mailto:#5}{\nolinkurl{#5}} \\}%
    \fi%
}%

\renewcommand{\maketitle}{%
    \pagenumbering{arabic}%
    \begin{titlepage}%
        \newgeometry{top=25mm,headheight=0mm,headsep=0mm,textwidth=160mm}%
        \renewcommand{\familydefault}{\sfdefault}%
        \begin{minipage}{.25\textwidth}%
            \includegraphics[scale=0.45]{kit_logo_de_farbe_positiv}%
        \end{minipage}%
        \begin{minipage}{.7\textwidth}%
            \Large Workshop \\ \bfseries Elektrotechnik und Informationstechnik%
        \end{minipage}%
        \begin{center}%
            \vspace{2cm}%
            \Large Kurs \etit@kursnummer\\%
            \LARGE\bfseries\etit@kurstitel \normalfont \\%
            \vspace{1cm}%
            \includegraphics[width=0.5\textwidth]{etit_titelbild} \\%
            \vfill%
            \Large Gruppe \etit@gruppennummer \\%
            \vspace{.5cm}%
            \normalsize%
            \begin{tabularx}{\textwidth}{>{\hsize=1\hsize}X>{\hsize=1\hsize}X>{\hsize=0.8\hsize}X>{\hsize=0.7\hsize}X>{\hsize=1.5\hsize}X}%
                \toprule%
                Vorname & Nachname & Matrikel-Nr. & u-Account & E-Mail \\%
                \midrule%
                \etit@teilnehmer%
                \bottomrule%
            \end{tabularx} \\%
            \vspace{2cm}%
            \Large\today%
        \end{center}%
        \vfill%
        \restoregeometry%
    \end{titlepage}%
}%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Hyperrefs
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Hyperref
\hypersetup{%
    colorlinks=true,%
    citecolor=black,%
    linkcolor=black,%
    urlcolor=black,%
    breaklinks%
}%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Misc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\AtBeginDocument{%
    \renewcommand{\refname}{Literaturverzeichnis}%
    \renewcommand{\bibname}{Literaturverzeichnis}%
}%

\endinput
