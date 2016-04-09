%===============================================================================
% arbitrationbrief.cls - 
% Copyright (C) 2009-2013  Christopher De Coro
%
% This file is part of the LaWTeX package, for more information, see:
%   Project Homepage: http://www.cs.princeton.edu/~cdecoro/lawtex/ 
%   Code Repository: https://sourceforge.net/projects/lawtex/
%
% This program is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.
%
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
%
% You should have received a copy of the GNU General Public License
% along with this program.  If not, see <http://www.gnu.org/licenses/>.
%===============================================================================

%%\section{Arbitration Brief Document Class}
%% The file _arbitrationbrief.cls_ provides a document class (derived from _memoir_) for arbitration-style briefs, such as is used
%% in the annual Willem C. Vis International Arbitration Moot. It does not actually share much in the way
%% of code with other LawTeX packages, but is included due to it's related subject matter.
%%
%% This class file was used for the Yale Law School respondant's submission to the 2012 Vis Moot. Much of the boilerplate text 
%% (title page, headers, etc.) do not have commands provided to adapt them to other uses, therefore you will need to edit these 
%% portions of the class file yourself.
%%

\@ifundefined{SuppressClass}{%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{arbitrationbrief}
\LoadClassWithOptions{memoir}
}{}%

\RequirePackage[pdftex]{graphicx}
\RequirePackage{longtable}
\RequirePackage{ifthen}

\usepackage[colorlinks=false,pdfborder={0 0 0}]{hyperref}
\usepackage{url}

\def\url@leostyle{\@ifundefined{selectfont}{\def\UrlFont{\sf}}{\def\UrlFont{\small\ttfamily}}}
\urlstyle{leo}
%\mathchardef\UrlBigBreakPenalty=400
\renewcommand{\UrlBigBreaks}{}
%\renewcommand{\UrlBreaks}{\do\.\do\/\do\a\do\b\do\c\do\d\do\e\do\f\do\g\do\h\do\i\do\j\do\k\do\l\do\m\do\n\do\o\do\p\do\q\do\r\do\s\do\t\do\u\do\v\do\w\do\x\do\y\do\z\do\A\do\B\do\C\do\D\do\E\do\F\do\G\do\H\do\I\do\J\do\K\do\L\do\M\do\N\do\O\do\P\do\Q\do\R\do\S\do\T\do\U\do\V\do\W\do\X\do\Y\do\Z} 
\renewcommand{\UrlBreaks}{\do\.\do\/\do\:\do\=\do\&\do\_\do\_}
\mathchardef\UrlBreakPenalty=1
% Document formatting
%==============================================================================

%\abnormalparskip{8pt plus 1pt minus 0.5pt}
\abnormalparskip{10pt plus 1pt minus 0.5pt}
\setsecnumdepth{all}

%Section Heading Format 
\setsecheadstyle      {\bfseries\centering}
\setsubsecheadstyle   {\bfseries}
\setsubsubsecheadstyle{\bfseries}
\setparaheadstyle     {\itshape}

%Indentations of section headings 
\setsecindent      {0pt}
\setsubsecindent   {0pt}
\setsubsubsecindent{3em}
\setparaindent     {5em}

%Spacing before/after section headings 
%\setbeforesecskip{16pt}
\setaftersecskip {1pt}

\setbeforesubsecskip{4pt}
\setaftersubsecskip {4pt}

\setbeforesubsubsecskip{4pt}
\setaftersubsubsecskip {4pt}

\setbeforeparaskip{0.1pt}
\setafterparaskip {0.1pt}

%Section Heading Numbering Styles
%No numbers printed for section (removes a space); 
%I. Subsection; A. Subsubsection; 1. Paragraph
\renewcommand{\thesection}      {\hspace{-1em}}
\renewcommand{\thesubsection}   {\Roman{subsection}.}
\renewcommand{\thesubsubsection}{\Alph{subsubsection}.}
\renewcommand{\theparagraph}    {\arabic{paragraph}.}

%Formatting options for Table of Contents
\renewcommand{\contentsname}{TABLE OF CONTENTS}
\renewcommand{\printtoctitle}{\bfseries\centering}
\settocdepth{all}

%ToC Heading Fonts
\renewcommand{\cftsectionfont}      {\bfseries}
\renewcommand{\cftsubsectionfont}   {\bfseries}
\renewcommand{\cftsubsubsectionfont}{\normalfont}
\renewcommand{\cftparagraphfont}    {\normalfont}

%ToC Heading Indentations and Number-box width
\cftsetindents{section}      {0pt}{0pt} %No number, so numberwidth=0
\cftsetindents{subsection}   {0pt}{2em} %All other numbers equally sized
\cftsetindents{subsubsection}{2em}{2em}
\cftsetindents{paragraph}    {4em}{2em}

%ToC Spacing before entries
\setlength{\cftbeforesectionskip}      {6pt plus 1pt minus 0.5pt}
\setlength{\cftbeforesubsectionskip}   {\cftbeforesectionskip}
\setlength{\cftbeforesubsubsectionskip}{\cftbeforesectionskip}
\setlength{\cftbeforeparagraphskip}    {\cftbeforesectionskip}

\setlength{\parindent}{0em}
%\setlength{\parindent}{-2.5em}

%Page layout settings
\raggedbottom       %Allow uneven text heights
\clubpenalty=10000  %Prohibit orphans
\widowpenalty=10000 %Prohibit widows
\@secpenalty=-9000

%==============================================================================
% Title commands
%==============================================================================

\newboolean{claimant}
\setboolean{claimant}{true}
\newcommand{\respondent}{\setboolean{claimant}{false}}

\renewcommand{\and}{$\cdot$ }
\renewcommand{\maketitle}{%
\begingroup
\parskip=8pt
\OnehalfSpacing

\vspace*{-.7in}
\begin{centering}
\textsc{\textbf{Willem C. Vis International Commercial Arbitration Moot}} \\
\textsc{30 March --- 5 April 2012 Vienna}
\vspace{22pt}
\hrule

{\Huge \@title}

\vspace{10pt}
\hrule

\catcode`\&=4

\vspace{12pt}

\ifthenelse{\boolean{claimant}}{%
\begin{tabular}{ll}
\textbf{ON BEHALF OF} & \textbf{AGAINST} \\
Mediterraneo Elite Conferences Services, Ltd. & Equatoriana Control Systems, Inc. \\
45 Conference Place & 286 Second Avenue \\
Capital City, Mediterraneo & Oceanside, Equatoriana \\
Tel. (0) 146-9845 & Tel. (0) 237 86 00 \\
Fax (0) 146-9850 & Fax (0) 237 86 01 \\
\textbf{CLAIMANT} & \textbf{RESPONDENT}
\end{tabular}
}{%
\begin{tabular}{ll}
\small \textbf{ON BEHALF OF} & \small\textbf{AGAINST} \\
\small Equatoriana Control Systems, Inc. & \small Mediterraneo Elite Conference Services, Ltd.\\
%~ & \quad Conference Services, Ltd.  \\
\small 286 Second Avenue & \small 45 Conference Place \\
\small Oceanside, Equatoriana & \small Capital City, Mediterraneo \\
\small Tel. (0) 237 86 00 & \small Tel. (0) 146-9845\\
\small Fax (0) 237 86 01 & \small Fax (0) 146-9850 \\
\small \textbf{RESPONDENT} & \small \textbf{CLAIMANT}
\end{tabular}
}

\vspace{20pt}
\catcode`\&=10

%\catcode`\&=4
%\begin{tabularx}{\textwidth}{XX}
%{\textbf{ON BEHALF OF} \newline
%Mediterraneo Elite Conferences Services, Ltd. \newline
%45 Conference Place \newline
%Capital City, Mediterraneo \newline
%Tel. (0) 146-9845 \newline
%Fax (0) 146-9850 \newline
%\textbf{CLAIMANT}} &
%{hello}
%\end{tabularx}
%\catcode`\&=10

\includegraphics{shield.pdf}

\vspace{20pt}

{\Huge\textsc{Yale Law School}}
\thispagestyle{empty}

\vspace{20pt}

\textsc{\@author}
 
\end{centering}
\endgroup
\clearpage
}


%==============================================================================
% Everything after this is code for the ToA, and should be ignored
%==============================================================================
\def\Def#1#2{\expandafter\def\csname#1\endcsname{#2}}
\def\EDef#1#2{\expandafter\edef\csname#1\endcsname{#2}}
\def\XDef#1#2{\expandafter\xdef\csname#1\endcsname{#2}}
\def\GDef#1#2{\expandafter\gdef\csname#1\endcsname{#2}}
\def\Call#1{\csname#1\endcsname}

\newcounter{parano}
\newif\ifparano\paranofalse
\def\prepara{}
\def\postpara{}

\renewcommand\theparano{\arabic{parano}.}

\newdimen\paranoboxwidth
%\newdimen\paranoindent

\paranoboxwidth=3em
%\paranoindent=-2.5em

\def\parano{\global\paranotrue\@ifnextchar[{\@@parano}{\@parano}}

\long\def\@parano{%%
   \everypar{\stepcounter{parano}%
   \hbox to \paranoboxwidth{\prepara\theparano\hfill}\postpara}}

\long\def\@@parano[#1]{%
   \setcounter{parano}{#1}%
   \addtocounter{parano}{-1}%
   \@parano}

\def\endparano{\everypar{}%\parindent\parwidth}
         \global\paranofalse%
         %\parindent\parwidth%
}

\let\old@xsect\@xsect
\let\old@section\section
\let\old@subsection\subsection
\let\old@subsubsection\subsubsection
\let\old@paragraph\paragraph
\let\old@mainmatter\mainmatter

%\def\section#1{\penalty-5000\everypar{}\old@section{#1}}
%\def\subsection#1{\penalty-5000\everypar{}\old@subsection{#1}}
%\def\subsubsection#1{\penalty-5000\everypar{}\old@subsubsection{#1}}
%\def\paragraph#1{\penalty-5000\everypar{}\old@paragraph{#1}}

\def\@xsect#1{\old@xsect{#1}\ifparano\@parano\fi\ignorespaces}
\def\mainmatter{\parano{}\old@mainmatter}

\AtEndDocument{%
	\immediate\closeout\Cases@idxfile%
	\immediate\closeout\Statutes@idxfile%
	\immediate\closeout\Commentary@idxfile%
	\immediate\closeout\Rules@idxfile%
	\write18{makeindex -s arbitrationcitations.ist Cases}%
	\write18{makeindex -s arbitrationcitations.ist Statutes}%
	\write18{makeindex -s arbitrationcitations.ist Commentary}%
	\write18{makeindex -s arbitrationcitations.ist Rules}%
}

\renewenvironment{theindex}
               {%\penalty10000%
				\parindent=0in%
                \parskip=2pt plus .3pt%
				%\linepenalty=4000%
				%\hyphenpenalty=10000%
				\rightskip=0in%     
				\LTleft=-.5in%
				\leftskip=-2in%
				\parfillskip=0in%
                \let\item\@idxitem%
				\catcode`\|=4%
				\renewcommand{\arraystretch}{1.5}%
				\DoubleSpacing%
				%\begin{longtable}[l]{p{1.35in}p{4.2in}p{.55in}}}
				\begin{longtable}[l]{@{}p{1.3in}p{3.7in}p{.55in}}}%
               {\end{longtable}\par}
\renewcommand\@idxitem{\@printpagenums \par \hangindent 2\indexindentsize}
\renewcommand\subitem{\@idxitem \hspace*{20pt}}
\renewcommand\subsubitem{\@idxitem \hspace*{30pt}}

\newcommand{\tableofauthorities}{%
{%
\parskip=1pt%
\LTpre=6pt%
\vspace{8pt}
\subsection*{Statutes \& Treaties}
\vspace{-45pt}
\printindex{Statutes}%
\subsection*{Rules}%
\vspace{-40pt}
\printindex{Rules}%
\subsection*{Cases and Arbitral Awards}%
\vspace{-40pt}
\printindex{Cases}%
\clearpage
\subsection*{Commentary}%
\vspace{-40pt}
\printindex{Commentary}%
}}

\def\printindex#1{\@input{#1.ind}}
\def\makeindex#1{\begingroup
  \makeatletter
  \if@filesw \expandafter\newwrite\csname #1@idxfile\endcsname
  \expandafter\immediate\openout \csname #1@idxfile\endcsname #1.idx\relax
  \typeout{Writing index file #1.idx }\fi \endgroup}

\def\index#1{\@bsphack\begingroup
               \def\protect##1{\string##1\space}\@sanitize
               \@wrindex{#1}}

% \@wrindex now checks that the appropriate file is defined.

\def\@wrindex#1#2{\let\theparano\relax
   \xdef\@gtempa{\@ifundefined{#1@idxfile}{}{\expandafter
      \immediate\write\csname #1@idxfile\endcsname{\string
      \indexentry{#2}{\arabic{parano}}}}}\endgroup\@gtempa
   \if@nobreak \ifvmode\nobreak\fi\fi\@esphack}

%%
%%\cmd{newauthority}{Type}{Short Name}{Full Name}[Declare a new authority]
%%
%% \noindent This is the _arbitrationbrief.cls_ equivalent of the LawTeX _\newcase_, etc. New authorities are declared with this command, to which one
%% must provide an Authority Type (Commentary, Statutes, Rules, or Cases), a short name to appear in the body of the text, and a long name to 
%% appear in the table of authorities.
%%
\DeclareRobustCommand{\newauthority}[3]{
	\Def{#2@Type}{Other}
	\Def{#2@Idxtype}{#1}
	\EDef{#2@ShortName}{#2}
	\Def{#2@FullName}{#3}
	%\Def{#2@Index}{\@bbIndexCite{#2}}
}

%%
%%\cmd{cite}{Short Name}[Cite an authority in a citation block]
%%
%% \noindent This adds a citation to the text, ensuring that it will be recorded in the table of authorities, and providing a hyperlink thereto.
%% This command does not take a pin cite; that should be given explicitly in the flow of the text, if appropriate.
%%
\def\cite#1{%
	%Check that this source is defined
	\ifcsname #1@Type\endcsname%
		\relax%
	\else
		\errmessage{No source named #1 has been defined}
	\fi%
%
	\index{\Call{#1@Idxtype}}{\protect\hypertarget{#1}{\textit{#1}}|\string\raggedright\relax\Call{#1@FullName}}%
	\hyperlink{#1}{\textit{#1}}%
}

%%
%%\cmd{romancite}{Short Name}[Cite an authority in the body text.]
%%
%% \noindent This adds a citation to the text, in roman (not italic) font, ensuring that it will be recorded in the table of authorities, and providing a hyperlink thereto.
%% This command does not take a pin cite; that should be given explicitly in the flow of the text, if appropriate. 
%%
\def\romancite#1{%
	%Check that this source is defined
	\ifcsname #1@Type\endcsname%
		\relax%
	\else
		\errmessage{No source named #1 has been defined}
	\fi%
%
	\index{\Call{#1@Idxtype}}{\protect\hypertarget{#1}{\textit{#1}}|\string\raggedright\relax\Call{#1@FullName}}%
	\hyperlink{#1}{#1}%
}

%==============================================================================
% Misc Default Settings
%==============================================================================
%
\DeclareRobustCommand{\availableat}[1]{\textit{available at} \url{#1}}

%The ampersand is usually special. This makes it normal and replaces it with the pipe 
\catcode`\_=11
\catcode`\&=11
\catcode`\|=4

\makeindex{Commentary}
\makeindex{Statutes}
\makeindex{Rules}
\makeindex{Cases}

% vim: set syntax=tex :
