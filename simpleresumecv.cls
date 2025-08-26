% !TEX TS-program = xelatex
% !TEX encoding = UTF-8 Unicode
% -*- coding: UTF-8; -*-
% vim: set fenc=utf-8

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% simpleresumecv.cls
%% <https://github.com/zachscrivena/simple-resume-cv>
%% This is free and unencumbered software released into the
%% public domain; see <http://unlicense.org> for details.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\usepackage{ifthen}

\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{simpleresumecv}[2016/12/25 Simple Resume CV https://github.com/zachscrivena/simple-resume-cv]

\DeclareOption{a4paper}{\PassOptionsToClass{\CurrentOption}{article}}
\DeclareOption{letterpaper}{\PassOptionsToClass{\CurrentOption}{article}}

% Run in non-stop mode.
\DeclareOption{nonstopmode}{\nonstopmode}





% Datestamp format (default): {yyyy}{MM}{dd} ---> MMM yyyy (e.g., Jan 2008).
\newcommand{\DatestampYMD}[3]{\mbox{\ShortMonth{#2} #1}}
\newcommand{\DatestampYM}[2]{\mbox{\ShortMonth{#2} #1}}
\newcommand{\DatestampY}[1]{#1}
\DeclareOption{MMMyyyy}{} % default

% Datestamp format: {yyyy}{MM}{dd} ---> dd MMM yyyy (e.g., 15 Jan 2008).
\DeclareOption{ddMMMyyyy}{%
    \renewcommand{\DatestampYMD}[3]{\mbox{#3 \ShortMonth{#2} #1}}
    \renewcommand{\DatestampYM}[2]{\mbox{\ShortMonth{#2} #1}}
    \renewcommand{\DatestampY}[1]{#1}}

% Datestamp format: {yyyy}{MM}{dd} ---> MMMM yyyy (e.g., January 2008).
\DeclareOption{MMMMyyyy}{%
    \renewcommand{\DatestampYMD}[3]{\mbox{\LongMonth{#2} #1}}
    \renewcommand{\DatestampYM}[2]{\mbox{\LongMonth{#2} #1}}
    \renewcommand{\DatestampY}[1]{#1}}

% Datestamp format: {yyyy}{MM}{dd} ---> dd MMMM yyyy (e.g., 15 January 2008).
\DeclareOption{ddMMMMyyyy}{%
    \renewcommand{\DatestampYMD}[3]{\mbox{#3 \LongMonth{#2} #1}}
    \renewcommand{\DatestampYM}[2]{\mbox{\LongMonth{#2} #1}}
    \renewcommand{\DatestampY}[1]{#1}}

\ProcessOptions\relax


% Use article class as the base class.
\LoadClass[10pt,oneside]{article}

% Geometry package for page margins.
% TODO: Figure out what is wrong with the margin here
\RequirePackage[
    left=0.70in,
    right=0.70in,
    top=0.3in,
    bottom=0in,
    nohead,
    includefoot]{geometry}

% PDF settings and properties.
\RequirePackage{hyperref}

% Hyphenation: Disabled.
\RequirePackage[none]{hyphenat}

% Current date and time.

% Timestamp.
\newcommand{\Timestamp}{{\DTMnow}}

% Abbreviations for months.
\newcommand{\LongMonth}[1]{%
    \ifcase#1\relax
    \or January%
    \or February%
    \or March%
    \or April%
    \or May%
    \or June%
    \or July%
    \or August%
    \or September%
    \or October%
    \or November%
    \or December%
    \fi}
\newcommand{\ShortMonth}[1]{%
    \ifcase#1\relax
    \or Jan%
    \or Feb%
    \or Mar%
    \or Apr%
    \or May%
    \or Jun%
    \or Jul%
    \or Aug%
    \or Sep%
    \or Oct%
    \or Nov%
    \or Dec%
    \fi}

% XeLaTeX packages.
\RequirePackage{fontspec}
\defaultfontfeatures{Ligatures=TeX}
\RequirePackage{xunicode}


% Font: Use "Tinos" as the main typeface (\textnormal{}, \normalfont).
% The "Tinos" fonts are released under the Apache License Version 2.0,
% and can be downloaded for free at <http://www.fontsquirrel.com/fonts/tinos>.
% Symbol table: <http://www.fileformat.info/info/unicode/font/tinos/grid.htm>
\setmainfont
[Path=./Fonts/Tinos/,
    ItalicFont=Tinos-Italic,
    BoldFont=Tinos-Bold,
    BoldItalicFont=Tinos-BoldItalic]
{Tinos-Regular.ttf}


% Sans-serif font: Changed to "Tinos".
\renewcommand{\sffamily}{\rmfamily}

% Typewriter (monospace) font: Changed to "Tinos".
\renewcommand{\ttfamily}{\rmfamily}

% Small caps font: Changed to "Tinos".
\renewcommand{\scshape}{\rmfamily}
%\renewcommand{\textsc}[1]{\textbf{\MakeUppercase{#1}}}

% Font styles.
\newcommand{\UseHeadingFont}{\normalfont}
\newcommand{\UseHeaderFooterFont}{\UseHeadingFont\fontsize{8.2pt}{9.5pt}\selectfont}
\newcommand{\UseNoteFont}{\UseHeadingFont\fontsize{8pt}{9.6pt}\selectfont}
\newcommand{\UseTitleFont}{\UseHeadingFont\fontsize{24pt}{33.6pt}\selectfont\bfseries}
\newcommand{\UseSubTitleFont}{\normalfont\fontsize{10pt}{10.3pt}\selectfont}
\newcommand{\UseSectionFont}{\UseHeadingFont\fontsize{9pt}{11pt}\selectfont\bfseries}
\newcommand{\UseSubSectionFont}{\UseHeadingFont\fontsize{8.6pt}{10.3pt}\selectfont\bfseries}
\newcommand{\UseDetailFont}{\normalfont\fontsize{8.8pt}{10.3pt}\selectfont}

% Symbols (Unicode).
% See: https://unicode-table.com/en/
\newcommand{\BulletSymbol}{{\normalfont\fontsize{6}{7.2}\selectfont\raisebox{0.17em}{\char"25CF}}}
\newcommand{\SubBulletSymbol}{{\normalfont\fontsize{6}{7.2}\selectfont\raisebox{0.17em}{\char"25CF}}}
\newcommand{\TildeSymbol}{{\normalfont\char"007E}}


\newcommand{\HeaderText}{}
\newcommand{\FooterText}{\hfill\hfill}

\def\ps@plain{%
    \def\@oddhead{\HeaderText}%
    \def\@evenhead{\HeaderText}%
    \def\@oddfoot{\FooterText}%
    \def\@evenfoot{\FooterText}}

\pagestyle{plain}

% Paragraph style.
\setlength{\parindent}{0in} % No indentation at the beginning of each paragraph.
\setlength{\parskip}{0in} % No vertical space between paragraphs.

% Avoid bad page breaks within paragraphs.
\widowpenalties 1 10000
\clubpenalties 1 10000
\raggedbottom

% Avoid overfull lines.
\sloppy


% Macro: Title (name).
\newcommand{\Title}[1]{%
    \par\pdfbookmark[1]{#1}{#1}%
    \begingroup\centering%
    \UseTitleFont{#1}%
    \par\endgroup\par}

% Macro: SubTitle (personal information below name).
\newenvironment{SubTitle}
{\par\vspace{0.25\baselineskip}%
    \begingroup\centering%
    \UseSubTitleFont}
{\par\endgroup\par}

% Environment for detailed description of the position
\newenvironment{Description}
{%
    \SmallGap
    \par
    \begin{Detail}
        \Item
        \begin{minipage}{\descriptionWidth}
            }
            {\par
        \end{minipage}
    \end{Detail}
}

% Environment for the table of skills
\newenvironment{skillTable}
{
    \def\arraystretch{0}%  1 is the default, change whatever you need
    \hspace*{-0.8em}
    \begin{tabular}[t]{p{11em} p{\tableWidth}}
        }
        {
        \vspace{-1em}
    \end{tabular}
}

% Macro: Body (rest of the document).
\newenvironment{Body}
{%
    \par\vspace{1.5\baselineskip}%
    \begin{list}
        {}
        {\setlength\leftmargin{1.2in}%
            \setlength\rightmargin{0in}%
            \setlength\labelwidth{1.2in}%
            \setlength\labelsep{0in}%
            \setlength\listparindent{0in}%
            \setlength\itemindent{0in}%
            \setlength\parskip{0in}%
            \setlength\topsep{0in}%
            \setlength\parsep{0in}%
            \setlength\itemsep{.7\baselineskip}%
            \setlength\partopsep{0in}%
            \raggedright%
        }%
        }
        {%
    \end{list}%
    \par%
}


% Format Specification for education info
% format: \UnivInfo{UniversityName}{univURL}{UniversityLocation}{Degree}{Graduation Date}{HaveGraduatedBool}{GPA}
\newcommand{\UnivInfo}[6]{
    \Entry
    \href{#2}{\textbf{#1}}
    \hfill #3\\
    #4\hfill #5\\
    % \hfill GPA: #6
}


% Create Href, but only if the URL field is not blank
% Args: URL, text to display
\newcommand{\OptionalUrl}[2]{
    \ifthenelse{\equal{#1}{}}{#2}{\href{#1}{#2}}
}

% Format specification for name of positions without date
% Args: Name, URL, Description. Leave URL blank to not add hyperlink
\newcommand{\Position}[3]{
    \Entry\textbf{\OptionalUrl{#2}{#1}}
    \begin{Description}
        #3
    \end{Description}
    \Gap
}

% Format Specification for name of position and year range
% Args: Name, URL, Start Year, End Year, description.
% Leave URL blank to not add hyperlink
\newcommand{\PositionY}[5]{
    \Entry\textbf{\OptionalUrl{#2}{#1}}\hfill\DatestampY{#3}-- \DatestampY{#4}
    \begin{Description}
        #5
    \end{Description}
    \Gap
}


% Format Specification for position with year-month range
\newcommand{\PositionYM}[8]{
    \Entry\textbf{\OptionalUrl{#2}{#1}}\hfill\DatestampYM{#3}{#4} -- \DatestampYM{#5}{#6}
    \begin{Detail}\textit{#7}\end{Detail}
    \begin{Description}
        #8
    \end{Description}
    \Gap
}


% Command for a row of the skills table
\newcommand{\skillCategory}[2]{
    \textit{#1}&
    \begin{Detail}
        #2
    \end{Detail}
}

% Macro: SmallGap(small vertical gap between items in the same section)
\newcommand{\SmallGap}{\par\vspace{0.5mm}\par}
% Macro: Gap (vertical gap between items in the same section).
\newcommand{\Gap}{\par\vspace{1mm}\par}

% Macro: BigGap (big vertical gap between items in the same section).
\newcommand{\BigGap}{\par\vspace{2mm}\par}

% Macro: Section (new section for Education, Research Experience, etc.).
\newcommand{\Section}[1]
{\par\pdfbookmark[2]{#1}{PDF: #1}%
    \item[\smash{\parbox[t]{1.2in}{\UseSectionFont\raggedright\MakeUppercase{#1}}}]%
    \par}

% Macro: SubSection.
\newcommand{\SubSection}[3]
{\par\pdfbookmark[3]{#2}{#3}%
    {\UseSubSectionFont\raggedright\MakeUppercase{#1}}%
    \par}

% Macro: Detail (text in smaller font under an item).
\newenvironment{Detail}
{\par\begingroup\UseDetailFont}
{\par\endgroup\par}

% Macro: BulletItem.
\newsavebox{\BulletItemIndentBox}
\newlength{\BulletItemIndentWidth}
%
\newcommand{\BulletItem}[1]
{\par\vspace{0\baselineskip}%
    \savebox{\BulletItemIndentBox}{\hspace{1.5mm}\BulletSymbol\hspace{1.5mm}}%
    \usebox{\BulletItemIndentBox}%
    \ignorespaces #1\\%
}

% Macro: SubBulletItem.
\newsavebox{\SubBulletItemIndentBox}
\newlength{\SubBulletItemIndentWidth}
%
\newcommand{\SubBulletItem}[1]
{\par\vspace{0\baselineskip}%
    \savebox{\SubBulletItemIndentBox}{\hspace{1.5mm}\SubBulletSymbol\hspace{1.5mm}}
    \usebox{\SubBulletItemIndentBox}%
    \ignorespaces #1%
}

% Macro: Entry.
\newcommand{\Entry}
{\par\vspace{0\baselineskip}%
    \parshape 1%
    \labelwidth \linewidth%
    \ignorespaces%
}

% Macro: Item (aligns horizontally with BulletItem).
\newcommand{\Item}
{\par\vspace{0\baselineskip}%
    \savebox{\BulletItemIndentBox}{\hphantom{\hspace{1.5mm}\BulletSymbol\hspace{1.5mm}}}%
    \usebox{\BulletItemIndentBox}%
    \ignorespaces%
}

% Macro: SubItem (aligns horizontally with SubBulletItem).
\newcommand{\SubItem}
{\par\vspace{0\baselineskip}%
    \savebox{\SubBulletItemIndentBox}{\hphantom{\hspace{5.6mm}\SubBulletSymbol\hspace{1.5mm}}}%
    \usebox{\SubBulletItemIndentBox}%
    \ignorespaces%
}

% Macro: Hide.
\newcommand{\Hide}[1]{}

% End of class file.
\endinput
