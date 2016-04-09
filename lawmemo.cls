\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{lawmemo}
\LoadClassWithOptions{article}

\RequirePackage{bluebook}

\makeindex{Case}
\makeindex{Statute}
\makeindex{Other}

\newcommand{\subject}[1]{\def\@subject{#1}}
\newcommand{\recipient}[1]{\def\@recipient{#1}}

\renewcommand{\maketitle}{
{
\noindent \textbf{\@title} \\
\renewcommand{\baselinestretch}{0.8}
\noindent\makebox[1.4cm][l]{\bf To:} \@recipient\\
\noindent\makebox[1.4cm][l]{\bf From:} \@author\\
\noindent\makebox[1.4cm][l]{\bf Date:} \@date\\
\noindent\makebox[1.4cm][l]{\bf Re:} \@subject
}
} 

\def\section{\@startsection{section}{1}{0pt}{0pt}{0.1pt}{\centering\normalsize\bfseries}*}
\def\subsection{\@startsection{subsection}{2}{0pt}{0pt}{-12pt}{\normalsize\bfseries}*}

\def\pagenumber#1{#1}
\def\indexpenalty{0}

% vim: set syntax=tex :
