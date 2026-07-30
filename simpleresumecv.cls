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


\RequirePackage{tasks}
\RequirePackage{etoolbox}
\RequirePackage{enumitem}
\RequirePackage{multicol}
\RequirePackage{listofitems}

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

% XeLaTeX packages.
\RequirePackage{fontspec}
\defaultfontfeatures{Ligatures=TeX}


% Font: Use "Tinos" as the main typeface (\textnormal{}, \normalfont).
% The "Tinos" fonts are released under the Apache License Version 2.0,
% and can be downloaded for free at <http://www.fontsquirrel.com/fonts/tinos>.
% Symbol table: <http://www.fileformat.info/info/unicode/font/tinos/grid.htm>
\setmainfont[Path=./Fonts/Tinos/,
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

% Font styles.
\newcommand{\UseHeadingFont}{\normalfont}
\newcommand{\UseTitleFont}{\UseHeadingFont\fontsize{24pt}{33.6pt}\selectfont\bfseries}
\newcommand{\UseSubTitleFont}{\normalfont\fontsize{11pt}{10.3pt}\selectfont}
\newcommand{\UseSectionFont}{\UseHeadingFont\fontsize{10pt}{11pt}\selectfont\bfseries}
\newcommand{\UseDetailFont}{\normalfont\fontsize{9pt}{10.3pt}\selectfont}

% Symbols (Unicode).
% See: https://unicode-table.com/en/
\newcommand{\BulletSymbol}{{\normalfont\fontsize{6}{7.2}\selectfont\raisebox{0.17em}{\char"25CF}}}

% Geometry package for page margins.
% TODO: Figure out what is wrong with the margin here
\RequirePackage[
    left=0.70in,
    right=0.70in,
    top=0.3in,
    bottom=0.3in,
    nohead,
    includefoot]{geometry}

% PDF settings and properties.
\RequirePackage{hyperref}
\RequirePackage{calc}

% Hyphenation: Disabled.
\RequirePackage[none]{hyphenat}

% Configure section headings
\RequirePackage{titlesec}
\newlength{\SectionMargin}
\setlength{\SectionMargin}{1.3in}

\titleformat{\section}[leftmargin]{\UseSectionFont\raggedright}{}{0pt}{\MakeUppercase}
\titlespacing{\section}{\SectionMargin}{0.7\baselineskip}{0\baselineskip}

% Abbreviations for months.
\newcommand{\LongMonth}[1]{%
    \ifcase#1\relax
    \or{}January%
    \or{}February%
    \or{}March%
    \or{}April%
    \or{}May%
    \or{}June%
    \or{}July%
    \or{}August%
    \or{}September%
    \or{}October%
    \or{}November%
    \or{}December%
    \fi}
\newcommand{\ShortMonth}[1]{%
    \ifcase#1\relax
    \or{}Jan%
    \or{}Feb%
    \or{}Mar%
    \or{}Apr%
    \or{}May%
    \or{}Jun%
    \or{}Jul%
    \or{}Aug%
    \or{}Sep%
    \or{}Oct%
    \or{}Nov%
    \or{}Dec%
    \fi}



\pagestyle{empty}

% Paragraph style.
\setlength{\parindent}{0in} % No indentation at the beginning of each paragraph.
\setlength{\parskip}{0in} % No vertical space between paragraphs.

% Avoid bad page breaks within paragraphs.
\widowpenalties=1 10000
\clubpenalties=1 10000
\raggedbottom%

% Avoid overfull lines.
\sloppy

% Macro: Title (name).
\newcommand{\Title}[1]{%
    \par%
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
    \SmallGap%
    \par%
    \begin{Detail}%
    \Item%
    \begin{minipage}{\descriptionWidth}%
}
{\par%
    \end{minipage}%
    \end{Detail}%
}

% Environment for a single 3 column list of skills
% Takes arguments for the number of columns (default 3)
% and the name of the group.
\newenvironment{skillGroupEnvironment}[2][3]{%
    \textbf{#2}\par\vspace{-1\baselineskip}%
    \begingroup%
    \UseDetailFont%
    \begin{multicols}{#1}
    \begin{itemize}[
        label={},
        leftmargin=1em,
        itemindent=0pt,
        itemsep=0pt,
        parsep=0pt,
        topsep=0pt
    ]
}{%
    \end{itemize}%
    \end{multicols}%
    \endgroup%
    \vspace{-0.5\baselineskip}%
}

% Command for a three column set of skills with a header
% first arg is column count (optional, defaults to 3)
% second is header for the skill section
% third is the comma separated list of skills
\newcommand{\skillGroup}[3][3]{%
    \readlist\skillitems{#3}
    \begin{skillGroupEnvironment}[#1]{#2}

        % Reads argument 3 and turns it into a list named \skillitems
        % Iterate over the skillitems list.
        % For each member of the list, name it
        \foreachitem\skill\in\skillitems{%
            \item\skill%
        }%
    \end{skillGroupEnvironment}
}

% Macro: Body (rest of the document).
\newenvironment{Body}%
{%
    \par\vspace{0.8\baselineskip}%
    \setlength{\leftskip}{\SectionMargin}%
    \setlength{\parindent}{0pt}%
    \setlength{\parskip}{0pt}%
}
{%
    \par%
}



% Format Specification for education info
% format: \UnivInfo{UniversityName}{univURL}{UniversityLocation}{Degree}{Graduation Date}{HaveGraduatedBool}{GPA}
\newcommand{\UnivInfo}[6]{%
    \Entry%
    \href{#2}{\textbf{#1}}%
    \hfill #3%

    #4\hfill #5%

    % \hfill GPA: #6%
}%


% Create Href, but only if the URL field is not blank
% Args: URL, text to display
\newcommand{\OptionalUrl}[2]{%
    \ifstrempty{#1}{#2}{\href{#1}{#2}}%
}

% Add the detail section, but only if a value is provided
% Args: Text for detail. If not provided, section is not shown
\newcommand{\OptionalDetail}[1]{%
    \ifstrempty{#1}{}{\begin{Detail}\textit{#1}\end{Detail}}%
}

% Format specification for name of positions without date
% Args: Name, URL, Description. Leave URL blank to not add hyperlink
\newcommand{\Position}[3]{%
    \Entry\textbf{\OptionalUrl{#2}{#1}}%
    \begin{Description}%
        #3%
    \end{Description}%
    \Gap%
}%

% Format Specification for name of position and year range
% Args: Name, URL, Start Year, End Year, description.
% Leave URL blank to not add hyperlink
\newcommand{\PositionY}[6]{
    \Entry\textbf{\OptionalUrl{#2}{#1}}\hfill\DatestampY{#3}--\DatestampY{#4}%
    \OptionalDetail{#5}
    \begin{Description}%
        #6%
    \end{Description}%
    \Gap%
}


% Format Specification for position with year-month range
\newcommand{\PositionYM}[8]{
    \Entry\textbf{\OptionalUrl{#2}{#1}}\hfill\DatestampYM{#3}{#4}--\DatestampYM{#5}{#6}%
    \OptionalDetail{#7}
    \begin{Description}%
        #8%
    \end{Description}%
    \Gap%
}


% Command for a row of the skills table
\newcommand{\skillCategory}[2]{
    \textit{#1}&%
    \begin{Detail}%
        #2%
    \end{Detail}%
}

% Macro: SmallGap(small vertical gap between items in the same section)
\newcommand{\SmallGap}{\par\vspace{0.5mm}\par}
% Macro: Gap (vertical gap between items in the same section).
\newcommand{\Gap}{\par\vspace{1mm}\par}

% Macro: BigGap (big vertical gap between items in the same section).
\newcommand{\BigGap}{\par\vspace{2mm}\par}

% Macro: Detail (text in smaller font under an item).
\newenvironment{Detail}
{\par\begingroup\UseDetailFont}
{\par\endgroup\par}

% Macro: BulletItem.
\newcommand{\BulletItem}[1]
{%
    \par
    \hspace{1.5mm}\BulletSymbol\hspace{1.5mm}
    #1\\
}

% Macro: Entry.
% Its really just re-naming \par. But since we have a \EntryY elsewhere,
% it helps to have a common name
\newcommand{\Entry}{\par}

% Format specification for name of positions without date
% Args: Name, URL, Description. Leave URL blank to not add hyperlink
\newcommand{\EntryY}[3]
{\Entry{\OptionalUrl{#2}{#1}}\hfill\DatestampY{#3}}

% Macro: Item (aligns horizontally with BulletItem).
\newcommand{\Item}{\hspace{1.5mm}\hspace{\widthof{\BulletSymbol}}\hspace{1.5mm}}

% Macro: Hide.
\newcommand{\Hide}[1]{}

% End of class file.
\endinput
