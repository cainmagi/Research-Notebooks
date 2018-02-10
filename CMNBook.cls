%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Cain King's Math Note Book
% LaTeX Template
% -----------------------------------
% % Update statements:
% -----------------------------------
% % Version 1.0 (9/28/17)
%     - Creating this template. Only support English now. If need, there 
%       will be some extensions in the future.
%
% -----------------------------------
% % Control options statements:
% -----------------------------------
% % ----------------------
% % Text Configuration
%  (It is highly recommended to master them. Use \ckesetup{} to
%   change them)
% %
%  title            : [string], the whole title of this homework.
%  author           : [string], the name of the author of this document.
%  subject          : [string], the name of the class.
%  organization     : [string], the name of the organization/colledge/university.
%  version          : [string], the edition/version of this document, if left
%                     blank, it would be omitted.
%  ownerPass        : [string], password, if not provided, users could not edit
%                     this document.
%  userPass         : [string], password, if not provided, users could not open
%                     this document.
%                       - Noted that if ownerPass is not defined, this password 
%                         will not be effective!
%  repeatFrameTitle : [bool], let all frame which are divided by pagebreak remake
%                     their titles.
%  refNum           : [bool], let the title of bibtex is marked with the section
%                     number
% % ----------------------
% % Basic Configuration
%  (Options influencing the style. Use them as \documentclass[...]{ECEHW}
%     because \ECEHWsetup will not work.)
%  (Noted that [] shows the default option.)
% %
%  color :   [false], make links, section titles and frames colored.
%  mainfont: [Romande], use different types of fontfamily. Here are avaliable options:
%              - Romande,  - Palatino,  - Times,  - Stix,  - Helvetica,  - Utopia.
% % ----------------------
% % Command & Environment
%  (C marks a command and E marks an environment.)
% %
% % \maketitle {C}
%   - Used to make a modified title.
% % \ECEHWsetup {C}
%   - Basic setup command of the control options.
% -----------------------------------
% % Publications:
% -----------------------------------
% Author:
% Cain King (cainmagi@gmail.com / cain.king@foxmail.com)
%
% Noted that this template is modified from a simpler template.
%
% --- Original Version ---
%
% eBook
% LaTeX Template
% Version 1.0 (29/12/14)
%
% This template has been downloaded from:
% http://www.LaTeXTemplates.com
%
% Original author:
% Luis Cobo (luiscobogutierrez@gmail.com) with extensive modifications by:
% Vel (vel@latextemplates.com)
%
% License:
% CC BY-NC-SA 3.0 (http://creativecommons.org/licenses/by-nc-sa/3.0/)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{CMNBook}[2017/09/28 v1.0 Cain King's Math Note Book Class - Author: Yuchen Jin]

%----------------------------------------------------------------------------------------
%	DECLARE OPTIONS
%----------------------------------------------------------------------------------------
\RequirePackage{kvoptions}
\RequirePackage{etoolbox}
\RequirePackage{ifthen, calc}
\SetupKeyvalOptions{family=MNB, prefix=MNB@opt@, setkeys=\kvsetkeys}

\DeclareBoolOption[false]{draft}
\DeclareBoolOption[false]{color}
\DeclareComplementaryOption{gray}{color}
\DeclareBoolOption[false]{Chinese}
\DeclareComplementaryOption{deChinese}{Chinese}
\DeclareBoolOption[false]{repeatFrameTitle}
\DeclareBoolOption[true]{autoSetHyperref}
\DeclareBoolOption[false]{refNum}
\DeclareComplementaryOption{deRefNum}{refNum}

\DeclareStringOption[\textbf{Homework 0:}~Template]{title}[\textbf{Homework 0:}~Template]
\DeclareStringOption[Yuchen Jin]{author}[Yuchen Jin]
\DeclareStringOption[ECE 6000]{subject}[ECE 6000]
\DeclareStringOption[University of Houston]{organization}[University of Houston]
\DeclareStringOption[]{version}[]

\DeclareStringOption[]{ownerPass}[]
\DeclareStringOption[]{userPass}[]

\DeclareStringOption[Romande]{mainfont}[Romande]

\newcommand{\MNBsetup}[1]{
  \kvsetkeys{MNB}{#1}
  \ifMNB@opt@autoSetHyperref
    \hypersetup{
      pdfauthor={\MNB@opt@author},% 
      pdftitle={\MNB@opt@title},%
      pdfsubject={\MNB@opt@subject},%
      %pdfkeywords={}%
    }
  \fi
  \ifthenelse{\equal{\MNB@opt@version}{}}{
    \renewcommand{\MNB@str@version}{}
  }{
    \renewcommand{\MNB@str@version}{\MNB@opt@version~Edition,~}
  }
  \ifthenelse{\equal{\MNB@opt@ownerPass}{}}{}{
    \ifthenelse{\equal{\MNB@opt@userPass}{}}{
      \special{pdf:encrypt ownerpw (\MNB@opt@ownerPass) length 128 perm 2052}
    }{
      \special{pdf:encrypt ownerpw (\MNB@opt@ownerPass) userpw (\MNB@opt@userPass) length 128 perm 2052}
    }
  }
}

\DeclareDefaultOption{\relax}
\ProcessKeyvalOptions*\relax

\ifthenelse{\equal{\MNB@opt@version}{}}{
  \newcommand{\MNB@str@version}{}
}{
  \newcommand{\MNB@str@version}{\MNB@opt@version~Edition,~}
}

%----------------------------------------------------------------------------------------
%	REQUIRED PACKAGES
%----------------------------------------------------------------------------------------

\LoadClass[11pt,fleqn]{book} % A4 paper and 11pt font size

\RequirePackage[top=3cm,bottom=3cm,left=3.2cm,right=3.2cm,headsep=10pt,letterpaper]{geometry} % Page margins

\RequirePackage{xcolor} % Required for specifying colors by name
\definecolor{ocre}{RGB}{52,177,201} % Define the orange color used for highlighting throughout the book
\definecolor{darkBlue}{RGB}{12,32,95}

% Font Settings
%\usepackage{avant} % Use the Avantgarde font for headings
%\usepackage{times} % Use the Times font for headings
%\usepackage{mathptmx} % Use the Adobe Times Roman as the default text font together with math symbols from the Sym­bol, Chancery and Com­puter Modern fonts
%\usepackage{microtype} % Slightly tweak font spacing for aesthetics

% Bibliography
\RequirePackage[english]{babel}
\RequirePackage{csquotes}
\RequirePackage[style=alphabetic,sorting=nyt,sortcites=true,autopunct=true,autolang=hyphen,hyperref=true,abbreviate=false,backref=true,backend=biber]{biblatex}
\addbibresource{bibliography.bib} % BibTeX bibliography file
\defbibheading{bibempty}{}

\RequirePackage{tikz} % Required for drawing custom shapes
\definecolor[named]{color01}{rgb}{.2,.4,.6} % Color used in the title page
\RequirePackage{wallpaper} % Required for setting background images (title page)

\RequirePackage[hidelinks]{hyperref}
\RequirePackage{pdfpages} 
\newcommand\Loadedframemethod{TikZ}
\RequirePackage{tcolorbox}
\RequirePackage[framemethod=\Loadedframemethod]{mdframed}
\usetikzlibrary{shadows}
\usetikzlibrary{calc,through,backgrounds}
\usetikzlibrary{matrix,positioning}
%Desssins geometriques
\usetikzlibrary{arrows}
\usetikzlibrary{shapes.geometric}
\usetikzlibrary{datavisualization}
\usetikzlibrary{automata} % LATEX and plain TEX
\usetikzlibrary{shapes.multipart}
\usetikzlibrary{decorations.pathmorphing} 
\RequirePackage{titletoc}
\RequirePackage{bbding} 
\RequirePackage{enumitem} % Customize lists %\RequirePackage{enumerate}
\setlist[enumerate]{label=(\arabic*)}
\RequirePackage{multirow,dsfont}
\RequirePackage{tabularx,array}

\RequirePackage{titlesec} % Allows customization of titles
%\usepackage[english]{babel} % English language/hyphenation
\setlist{nolistsep} % Reduce spacing between bullet points and numbered lists
\RequirePackage{booktabs} % Required for nicer horizontal rules in tables
\RequirePackage{eso-pic} % Required for specifying an image background in the title page

%Ecriture arabe
\RequirePackage[T1]{fontenc}
\RequirePackage{fontspec}

%----------------------------------------------------------------------------------------
%	GRAPHICS CONFIGURATION
%----------------------------------------------------------------------------------------
\RequirePackage{ifpdf, ifxetex}
\ifpdf
  \RequirePackage{graphicx}
  \RequirePackage{epstopdf}
  \graphicspath{{Pics/}}
  % and their extensions so you won't have to specify these with
  % every instance of \includegraphics
  \DeclareGraphicsExtensions{.eps,.pdf,.jpeg,.png}
\else
  \ifxetex
    \RequirePackage{graphicx}
  \else
    \RequirePackage[dvipdfmx]{graphicx}
    \RequirePackage{bmpsize}
  \fi
  \graphicspath{{Pics/}}
  % and their extensions so you won't have to specify these with
  % every instance of \includegraphics
  \DeclareGraphicsExtensions{.eps,.pdf,.jpeg,.png}
\fi

\newcommand{\PicFolder}{mathpics/}

\def\includeMNBgraph{\futurelet\next\includeMNBgraphAux}
\def\includeMNBgraphAux{
  \ifx\next[%
    \expandafter\includeMNBgraphOptArg
  \else
    \expandafter\includeMNBgraphArg
  \fi
}

\ifMNB@opt@draft
  \def\includeMNBgraphOptArg[#1]#2{\relax
    \includegraphics[#1,draft]{\PicFolder#2}
  }
  \def\includeMNBgraphArg#1{\relax
    \includegraphics[width=0.8\columnwidth,draft]{\PicFolder#1}
  }
\else
  \def\includeMNBgraphOptArg[#1]#2{\relax
    \includegraphics[#1]{\PicFolder#2}
  }
  \def\includeMNBgraphArg#1{\relax
    \includegraphics[width=0.8\columnwidth]{\PicFolder#1}
  }
\fi

%----------------------------------------------------------------------------------------
%	FONT CONFIGURATION
%----------------------------------------------------------------------------------------

\ifthenelse{\equal{\MNB@opt@mainfont}{Palatino}}{
  \RequirePackage{mathpazo} % add possibly `sc` and `osf` options
  \RequirePackage{eulervm}
}{
  \ifthenelse{\equal{\MNB@opt@mainfont}{Times}}{
    \RequirePackage{newtxtext}
    %\RequirePackage{newtxmath}
  }{
    \ifthenelse{\equal{\MNB@opt@mainfont}{Stix}}{
      \RequirePackage{stix}
    }{
      \ifthenelse{\equal{\MNB@opt@mainfont}{Helvetica}}{
        \RequirePackage{helvet}
        \renewcommand{\rmdefault}{phv}
      }{
        \ifthenelse{\equal{\MNB@opt@mainfont}{Utopia}}{
          \RequirePackage[utopia]{mathdesign}
        }{
		  \ifthenelse{\equal{\MNB@opt@mainfont}{Libertine}}{
		    \RequirePackage{libertine} % or use \setmainfont to choose any font on your system
		  }{
            \RequirePackage{romande}
		  }
        }
      }
    }
  }
}
\newfontfamily\quotefont[Ligatures=TeX]{Linux Libertine O} % selects Libertine as the quote font

%----------------------------------------------------------------------------------------
%	MACRO SETTINGS
%----------------------------------------------------------------------------------------

\ifthenelse{\equal{\MNB@opt@ownerPass}{}}{}{
  \ifthenelse{\equal{\MNB@opt@userPass}{}}{
    \special{pdf:encrypt ownerpw (\MNB@opt@ownerPass) length 128 perm 2052}
  }{
    \special{pdf:encrypt ownerpw (\MNB@opt@ownerPass) userpw (\MNB@opt@userPass) length 128 perm 2052}
  }
}

\ifMNB@opt@Chinese
  \RequirePackage[PunctStyle=kaiming,AutoFakeBold,AutoFakeSlant]{xeCJK}
  \setCJKmainfont[BoldFont={Source Han Serif SC SemiBold}, ItalicFont={STKaiti}]{Source Han Serif SC}
  \setCJKmonofont[BoldFont={Source Han Serif SC SemiBold}, ItalicFont={STKaiti}]{Source Han Serif SC Medium} %思源常体
  \newCJKfontfamily[syseribol]\ExtBoldF[BoldFont={Source Han Serif SC Heavy}, ItalicFont={STKaiti}]{Source Han Serif SC Bold} %思源粗宋
  \newCJKfontfamily[syseriexl]\LightF[BoldFont={Source Han Serif SC Light}, ItalicFont={STKaiti}]{Source Han Serif SC ExtraLight} %思源特细宋
  \newCJKfontfamily[sysansbol]\ExtBoldSansF[BoldFont={Source Han Sans SC Heavy}, ItalicFont={STKaiti}]{Source Han Sans SC Bold} %思源粗黑
  \newCJKfontfamily[sysansreg]\SansF[BoldFont={Source Han Sans SC Medium}, ItalicFont={Source Han Sans SC Regular}]{Source Han Sans SC Regular} %思源常黑
  \newCJKfontfamily[sysansexl]\LightSansF[BoldFont={Source Han Sans SC Light}, ItalicFont={STKaiti}]{Source Han Sans SC ExtraLight} %思源特细黑
  \setCJKsansfont[BoldFont={Source Han Sans SC Medium}, ItalicFont={STKaiti}]{Source Han Sans SC Regular}% 设置缺省中文字体
  \setCJKfallbackfamilyfont{\CJKrmdefault}{SimSun-ExtB}
  \setCJKfallbackfamilyfont{\CJKsfdefault}{PMingLiU}
  \renewcommand\contentsname{目~~录}
  \renewcommand\listfigurename{插~图~目~录} % 对List of Figures进行汉化为插图目录
  \renewcommand\listtablename{表~格~目~录}  % 对List of Tables进行汉化表格目录
  %\newenvironment{proof}[1][证明]{\textbf{#1:~~~}}{\hfill\hspace{\qquad}$\square$}
  \addto\extrasenglish{%
    \def\chapterautorefname{章}
    \def\sectionautorefname{节}
    \def\subsectionautorefname{节}
    \renewcommand{\figurename}{图}
    \renewcommand{\tablename}{表}
    \renewcommand{\figureautorefname}{图}
    \renewcommand{\tableautorefname}{表}
  }
  \newcommand{\chapFont}{\ExtBoldSansF\bfseries}
  \newcommand{\secFont}{\ExtBoldSansF}
\else
  \newcommand{\chapFont}{\sffamily\bfseries}
  \newcommand{\secFont}{\sffamily\bfseries}
\fi

%----------------------------------------------------------------------------------------
%	MAIN TABLE OF CONTENTS
%----------------------------------------------------------------------------------------

\contentsmargin{0cm} % Removes the default margin
% Chapter text styling
\titlecontents{chapter}[1.25cm] % Indentation
{\addvspace{15pt}\large\ExtBoldSansF\bfseries} % Spacing and font options for chapters
{\color{ocre!60}\contentslabel[\Large\thecontentslabel]{1.25cm}\color{ocre}} % Chapter number
{}  
{\color{ocre!60}\normalsize\sffamily\bfseries\;\titlerule*[.5pc]{.}\;\thecontentspage} % Page number
% Section text styling
\titlecontents{section}[1.5cm] % Indentation
{\addvspace{5pt}\ExtBoldSansF} % Spacing and font options for sections
{\contentslabel[\thecontentslabel]{1.5cm}} % Section number
{}
{\sffamily\color{black}\bfseries\;\titlerule*[.5pc]{.}\;\thecontentspage} % Page number
[]
% Subsection text styling
\titlecontents{subsection}[1.75cm] % Indentation
{\addvspace{1pt}\sffamily\small} % Spacing and font options for subsections
{\contentslabel[\thecontentslabel]{1.75cm}} % Subsection number
{}
{\sffamily\;\titlerule*[.5pc]{.}\;\thecontentspage} % Page number
[] 

%----------------------------------------------------------------------------------------
%	MINI TABLE OF CONTENTS IN CHAPTER HEADS
%----------------------------------------------------------------------------------------

% Section text styling
\titlecontents{lsection}[0em] % Indendating
{\footnotesize\sffamily} % Font settings
{}
{}
{}

% Subsection text styling
\titlecontents{lsubsection}[.5em] % Indentation
{\normalfont\footnotesize\sffamily} % Font settings
{}
{}
{}
 
%----------------------------------------------------------------------------------------
%	PAGE HEADERS
%----------------------------------------------------------------------------------------

\RequirePackage{fancyhdr} % Required for header and footer configuration

\pagestyle{fancy}
\renewcommand{\chaptermark}[1]{\markboth{\ExtBoldSansF\normalsize\bfseries\chaptername\ \thechapter.\ #1}{}} % Chapter text font settings
\renewcommand{\sectionmark}[1]{\markright{\ExtBoldSansF\normalsize\thesection\hspace{5pt}#1}{}} % Section text font settings
\fancyhf{} \fancyhead[LE,RO]{\sffamily\normalsize\thepage} % Font setting for the page number in the header
\fancyhead[LO]{\rightmark} % Print the nearest section name on the left side of odd pages
\fancyhead[RE]{\leftmark} % Print the current chapter name on the right side of even pages
\renewcommand{\headrulewidth}{0.5pt} % Width of the rule under the header
\addtolength{\headheight}{2.5pt} % Increase the spacing around the header slightly
\renewcommand{\footrulewidth}{0pt} % Removes the rule in the footer
\fancypagestyle{plain}{\fancyhead{}\renewcommand{\headrulewidth}{0pt}} % Style for when a plain pagestyle is specified

% Removes the header from odd empty pages at the end of chapters
\makeatletter
\renewcommand{\cleardoublepage}{
\clearpage\ifodd\c@page\else
\hbox{}
\vspace*{\fill}
\thispagestyle{empty}
\newpage
\fi}

%----------------------------------------------------------------------------------------
%	THEOREM STYLES
%----------------------------------------------------------------------------------------

\RequirePackage{amsmath,amsfonts,amssymb,amsthm} % For math equations, theorems, symbols, etc

\newcommand{\intoo}[2]{\mathopen{]}#1\,;#2\mathclose{[}}
\newcommand{\ud}{\mathop{\mathrm{{}d}}\mathopen{}}
\newcommand{\intff}[2]{\mathopen{[}#1\,;#2\mathclose{]}}

\ifMNB@opt@Chinese
  \newtheorem{notation}{注意}[chapter]
\else
  \newtheorem{notation}{Notation}[chapter]
\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%% dedicated to boxed/framed environements %%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newtheoremstyle{ocrenumbox}% % Theorem style name
{0pt}% Space above
{0pt}% Space below
{\normalfont}% % Body font
{}% Indent amount
{\small\bf\sffamily\color{ocre}}% % Theorem head font
{\;}% Punctuation after theorem head
{0.25em}% Space after theorem head
{\small\sffamily\color{ocre}\thmname{#1}\nobreakspace\thmnumber{\@ifnotempty{#1}{}\@upn{#2}}% Theorem text (e.g. Theorem 2.1)
\thmnote{\nobreakspace\the\thm@notefont\sffamily\bfseries\color{black}---\nobreakspace#3.}} % Optional theorem note
\renewcommand{\qedsymbol}{$\blacksquare$}% Optional qed square

\newtheoremstyle{blacknumex}% Theorem style name
{5pt}% Space above
{5pt}% Space below
{\normalfont}% Body font
{} % Indent amount
{\small\bf\sffamily}% Theorem head font
{\;}% Punctuation after theorem head
{0.25em}% Space after theorem head
{\small\sffamily{\tiny\ensuremath{\blacksquare}}\nobreakspace\thmname{#1}\nobreakspace\thmnumber{\@ifnotempty{#1}{}\@upn{#2}}% Theorem text (e.g. Theorem 2.1)
\thmnote{\nobreakspace\the\thm@notefont\sffamily\bfseries---\nobreakspace#3.}}% Optional theorem note

\newtheoremstyle{blacknumbox} % Theorem style name
{0pt}% Space above
{0pt}% Space below
{\normalfont}% Body font
{}% Indent amount
{\small\bf\sffamily}% Theorem head font
{\;}% Punctuation after theorem head
{0.25em}% Space after theorem head
{\small\sffamily\thmname{#1}\nobreakspace\thmnumber{\@ifnotempty{#1}{}\@upn{#2}}% Theorem text (e.g. Theorem 2.1)
\thmnote{\nobreakspace\the\thm@notefont\sffamily\bfseries---\nobreakspace#3.}}% Optional theorem note

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%% dedicated to non-boxed/non-framed environements %%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newtheoremstyle{ocrenum}% % Theorem style name
{5pt}% Space above
{5pt}% Space below
{\normalfont}% % Body font
{}% Indent amount
{\small\bf\sffamily\color{ocre}}% % Theorem head font
{\;}% Punctuation after theorem head
{0.25em}% Space after theorem head
{\small\sffamily\color{ocre}\thmname{#1}\nobreakspace\thmnumber{\@ifnotempty{#1}{}\@upn{#2}}% Theorem text (e.g. Theorem 2.1)
\thmnote{\nobreakspace\the\thm@notefont\sffamily\bfseries\color{black}---\nobreakspace#3.}} % Optional theorem note
\renewcommand{\qedsymbol}{$\blacksquare$}% Optional qed square


% Defines the theorem text style for each type of theorem to one of the three styles above
\newcounter{dummy} 
\numberwithin{dummy}{section}
\theoremstyle{ocrenumbox}

\ifMNB@opt@Chinese
  \newtheorem{theoremeT}{定理}[section]
  \newtheorem{lemmaT}{引理}[section]
  \newtheorem{observation}[dummy]{观察}
  \newtheorem{proposition}[dummy]{命题}
  \newtheorem{claim}[dummy]{声明}
  \newtheorem{fact}[dummy]{公设}
  \newtheorem{assumption}[dummy]{假设}
  \newtheorem{problemT}{问题}[chapter]
  \newtheorem{characterT}{性质}[section]
  \theoremstyle{blacknumex}
  \newtheorem{exampleT}{例}[chapter]
  \theoremstyle{blacknumbox}
  \newtheorem{vocabulary}{词汇}[chapter]
  \newtheorem{definitionT}{定义}[section]
  \newtheorem{corollaryT}[dummy]{推断}
  \theoremstyle{ocrenum}
  \providecommand{\definitionTautorefname}{定义}
  \providecommand{\problemTautorefname}{问题}
  \providecommand{\exampleTautorefname}{例}
  \providecommand{\characterTautorefname}{性质}
  \providecommand{\theoremeTautorefname}{定理}
  \providecommand{\lemmaTautorefname}{引理}
  \providecommand{\corollaryTautorefname}{推断}
\else
  \newtheorem{theoremeT}{Theorem}[section]
  \newtheorem{lemmaT}{Lemma}[section]
  \newtheorem{observation}[dummy]{Observation}
  \newtheorem{proposition}[dummy]{Proposition}
  \newtheorem{claim}[dummy]{Claim}
  \newtheorem{fact}[dummy]{Fact}
  \newtheorem{assumption}[dummy]{Assumption}
  \newtheorem{problemT}{Problem}[chapter]
  \newtheorem{characterT}{Characteristic}[chapter]
  \theoremstyle{blacknumex}
  \newtheorem{exampleT}{Example}[chapter]
  \theoremstyle{blacknumbox}
  \newtheorem{vocabulary}{Vocabulary}[chapter]
  \newtheorem{definitionT}{Definition}[section]
  \newtheorem{corollaryT}[dummy]{Corollary}
  \theoremstyle{ocrenum}
  \providecommand{\definitionTautorefname}{Definition}
  \providecommand{\problemTautorefname}{Problem}
  \providecommand{\exampleTautorefname}{Example}
  \providecommand{\characterTautorefname}{Characteristic}
  \providecommand{\theoremeTautorefname}{Theorem}
  \providecommand{\lemmaTautorefname}{Lemma}
  \providecommand{\corollaryTautorefname}{Corollary}
\fi

% \newtheorem{definition}[dummy]{Definition}
% \newtheorem{exercise}{Exercise}[chapter]
\makeatother

%----------------------------------------------------------------------------------------
%	DEFINITION OF COLORED BOXES
%----------------------------------------------------------------------------------------

%\RequirePackage[framemethod=default]{mdframed} % Required for creating the theorem, definition, exercise and corollary boxes

% Theorem box
\newmdenv[skipabove=7pt,
skipbelow=7pt,
backgroundcolor=black!5,
linecolor=ocre,
innerleftmargin=5pt,
innerrightmargin=5pt,
innertopmargin=5pt,
leftmargin=0cm,
rightmargin=0cm,
innerbottommargin=5pt]{tBox}

% Lemma box
\newmdenv[skipabove=7pt,
skipbelow=7pt,
backgroundcolor=black!2,
linecolor=ocre,
innerleftmargin=5pt,
innerrightmargin=5pt,
innertopmargin=5pt,
leftmargin=0cm,
rightmargin=0cm,
innerbottommargin=5pt]{lBox}

% Exercise box	  
\newmdenv[skipabove=7pt,
skipbelow=7pt,
rightline=false,
leftline=true,
topline=false,
bottomline=false,
backgroundcolor=ocre!10,
linecolor=ocre,
innerleftmargin=5pt,
innerrightmargin=5pt,
innertopmargin=5pt,
innerbottommargin=5pt,
leftmargin=0cm,
rightmargin=0cm,
linewidth=4pt]{eBox}	

% Definition box
\newmdenv[skipabove=7pt,
skipbelow=7pt,
rightline=false,
leftline=true,
topline=false,
bottomline=false,
linecolor=ocre,
innerleftmargin=5pt,
innerrightmargin=5pt,
innertopmargin=0pt,
leftmargin=0cm,
rightmargin=0cm,
linewidth=4pt,
innerbottommargin=0pt]{dBox}	

% Corollary box
\newmdenv[skipabove=7pt,
skipbelow=7pt,
rightline=false,
leftline=true,
topline=false,
bottomline=false,
linecolor=gray,
backgroundcolor=black!5,
innerleftmargin=5pt,
innerrightmargin=5pt,
innertopmargin=5pt,
leftmargin=0cm,
rightmargin=0cm,
linewidth=4pt,
innerbottommargin=5pt]{cBox}

% Creates an environment for each type of theorem and assigns it a theorem text style from the "Theorem Styles" section above and a colored box from above
\newenvironment{theorem}{\begin{tBox}\begin{theoremeT}}{\end{theoremeT}\end{tBox}}
\newenvironment{lemma}{\begin{lBox}\begin{lemmaT}}{\end{lemmaT}\end{lBox}}
\newenvironment{exercise}{\begin{eBox}\begin{exerciseT}}{\hfill{\color{ocre}\tiny\ensuremath{\blacksquare}}\end{exerciseT}\end{eBox}}
\newenvironment{character}{\begin{eBox}\begin{characterT}}{\hfill{\color{ocre}\tiny\ensuremath{\blacksquare}}\end{characterT}\end{eBox}}
\newenvironment{definition}{\begin{dBox}\begin{definitionT}}{\end{definitionT}\end{dBox}}	
\newenvironment{problem}{\begin{dBox}\begin{problemT}}{\end{problemT}\end{dBox}}	
\newenvironment{example}{\begin{exampleT}}{\hfill{\tiny\ensuremath{\blacksquare}}\end{exampleT}}		
\newenvironment{corollary}{\begin{cBox}\begin{corollaryT}}{\end{corollaryT}\end{cBox}}	

%----------------------------------------------------------------------------------------
%	REMARK ENVIRONMENT
%----------------------------------------------------------------------------------------

\newenvironment{remark}{\par\vspace{10pt}\small % Vertical white space above the remark and smaller font size
\begin{list}{}{
\leftmargin=35pt % Indentation on the left
\rightmargin=25pt}\item\ignorespaces % Indentation on the right
\makebox[-2.5pt]{\begin{tikzpicture}[overlay]
\node[draw=ocre!60,line width=1pt,circle,fill=ocre!25,font=\sffamily\bfseries,inner sep=2pt,outer sep=0pt] at (-15pt,0pt){\textcolor{ocre}{R}};\end{tikzpicture}} % Orange R in a circle
\advance\baselineskip -1pt}{\end{list}\vskip5pt} % Tighter line spacing and white space after remark

%----------------------------------------------------------------------------------------
%	SECTION NUMBERING IN THE MARGIN
%----------------------------------------------------------------------------------------

\makeatletter
\renewcommand{\@seccntformat}[1]{\llap{\textcolor{ocre}{\csname the#1\endcsname}\hspace{1em}}}                    
\renewcommand{\section}{\@startsection{section}{1}{\z@}
{-4ex \@plus -1ex \@minus -.4ex}
{1ex \@plus.2ex }
{\normalfont\large\secFont}}
\renewcommand{\subsection}{\@startsection {subsection}{2}{\z@}
{-3ex \@plus -0.1ex \@minus -.4ex}
{0.5ex \@plus.2ex }
{\normalfont\sffamily\bfseries}}
\renewcommand{\subsubsection}{\@startsection {subsubsection}{3}{\z@}
{-2ex \@plus -0.1ex \@minus -.2ex}
{.2ex \@plus.2ex }
{\normalfont\small\sffamily\bfseries}}                        
\renewcommand\paragraph{\@startsection{paragraph}{4}{\z@}
{-2ex \@plus-.2ex \@minus .2ex}
{.1ex}
{\normalfont\small\sffamily\bfseries}}

%----------------------------------------------------------------------------------------
%	HYPERLINKS IN THE DOCUMENTS
%----------------------------------------------------------------------------------------

% For an unclear reason, the package should be loaded now and not later
%\usepackage{hyperref}
\renewcommand{\eqref}[1]{\hyperref[#1]{(\ref*{#1})}}
\hypersetup{
  pdfdisplaydoctitle={true},
  unicode={true},
  bookmarksnumbered={false},
  bookmarksopen={false},
  breaklinks={true},
  %pdfborder={0 0 1},
}

\ifpdf
  \hypersetup{pdfcreator={pdfLaTeX}}
\else
  \ifxetex
    \hypersetup{pdfcreator={xeLaTeX}}
  \else
    \hypersetup{pdfcreator={unknownLaTeX}}
  \fi
\fi

\hypersetup{
  pdfauthor={\MNB@opt@author},%
  pdftitle={\MNB@opt@title},%
  pdfsubject={\MNB@opt@subject},%
  %pdfkeywords={}%
}

%----------------------------------------------------------------------------------------
%	CHAPTER HEADINGS
%----------------------------------------------------------------------------------------

% The set-up below should be (sadly) manually adapted to the overall margin page septup controlled by the geometry package loaded in the main.tex document. It is possible to implement below the dimensions used in the goemetry package (top,bottom,left,right)... TO BE DONE

\newcommand{\thechapterimage}{}
\newcommand{\FrameFolder}{FramePic/}
\newcommand{\chapterimage}[1]{\renewcommand{\thechapterimage}{\FrameFolder#1}}

% Numbered chapters with mini tableofcontents
\def\thechapter{\arabic{chapter}}
\def\@makechapterhead#1{
\thispagestyle{empty}
{\centering \normalfont\sffamily
\ifnum \c@secnumdepth >\m@ne
\if@mainmatter
\startcontents
\begin{tikzpicture}[remember picture,overlay]
\node at (current page.north west)
{\begin{tikzpicture}[remember picture,overlay]
\node[anchor=north west,inner sep=0pt] at (0,0) {\includegraphics[width=\paperwidth]{\thechapterimage}};
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Commenting the 3 lines below removes the small contents box in the chapter heading
%\fill[color=ocre!10!white,opacity=.6] (1cm,0) rectangle (8cm,-7cm);
%\node[anchor=north west] at (1.1cm,.35cm) {\parbox[t][8cm][t]{6.5cm}{\huge\bfseries\flushleft \printcontents{l}{1}{\setcounter{tocdepth}{2}}}};
\draw[anchor=west] (5cm,-9cm) node [rounded corners=20pt,fill=ocre!10!white,text opacity=1,draw=ocre,draw opacity=1,line width=1.5pt,fill opacity=.6,inner sep=12pt]{\huge\chapFont\textcolor{black}{\thechapter. #1\strut\makebox[22cm]{}}};
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\end{tikzpicture}};
\end{tikzpicture}}
\par\vspace*{230\p@}
\fi
\fi}

% Unnumbered chapters without mini tableofcontents (could be added though) 
\def\@makeschapterhead#1{
\thispagestyle{empty}
{\centering \normalfont\sffamily
\ifnum \c@secnumdepth >\m@ne
\if@mainmatter
\begin{tikzpicture}[remember picture,overlay]
\node at (current page.north west)
{\begin{tikzpicture}[remember picture,overlay]
\node[anchor=north west,inner sep=0pt] at (0,0) {\includegraphics[width=\paperwidth]{\thechapterimage}};
\draw[anchor=west] (5cm,-9cm) node [rounded corners=20pt,fill=ocre!10!white,fill opacity=.6,inner sep=12pt,text opacity=1,draw=ocre,draw opacity=1,line width=1.5pt]{\huge\chapFont\textcolor{black}{#1\strut\makebox[22cm]{}}};
\end{tikzpicture}};
\end{tikzpicture}}
\par\vspace*{230\p@}
\fi
\fi
}
\makeatother