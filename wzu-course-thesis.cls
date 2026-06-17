% Wenzhou University master course paper class.
% Contact: zsrnog@yeah.net
% Compile with XeLaTeX + biber.
\NeedsTeXFormat{LaTeX2e}[2020-10-01]
\ProvidesClass{wzu-course-thesis}[2026/06/16 v1.0 WZU master course paper template]

\RequirePackage{iftex}
\ifXeTeX\else
  \ClassError{wzu-course-thesis}{Please compile with XeLaTeX}{Use: latexmk -xelatex thesis.tex}
\fi

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexart}}
\ProcessOptions\relax
\LoadClass[UTF8,a4paper,zihao=-4]{ctexart}

\RequirePackage{etoolbox}
\RequirePackage{kvsetkeys}
\RequirePackage{geometry}
\RequirePackage{setspace}
\RequirePackage{fancyhdr}
\RequirePackage{titlesec}
\RequirePackage{graphicx}
\RequirePackage{xcolor}
\RequirePackage{caption}
\RequirePackage{subcaption}
\RequirePackage{booktabs}
\RequirePackage{tabularx}
\RequirePackage{longtable}
\RequirePackage{makecell}
\RequirePackage{multirow}
\RequirePackage{threeparttable}
\RequirePackage{array}
\RequirePackage{enumitem}
\RequirePackage{float}
\RequirePackage[section]{placeins}
\RequirePackage{tikz}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{amsthm}
\RequirePackage{mathtools}
\RequirePackage{bm}
\RequirePackage{siunitx}
\RequirePackage{algorithm}
\RequirePackage{algpseudocode}
\RequirePackage{listings}
\RequirePackage[backend=biber,style=gb7714-2015,gbpub=false,gbnamefmt=lowercase]{biblatex}
\RequirePackage{hyperref}
\RequirePackage[nameinlink,noabbrev]{cleveref}

\geometry{
  paper=a4paper,
  left=31.75mm,
  right=31.75mm,
  top=25.4mm,
  bottom=25.4mm,
  headheight=13pt,
  headsep=8mm,
  footskip=10mm
}

\AtBeginDocument{%
  \IfFontExistsTF{Times New Roman}{\setmainfont{Times New Roman}}{}%
  \IfFontExistsTF{SimSun}{\setCJKmainfont{SimSun}[AutoFakeBold=2.2,ItalicFont=KaiTi]}{}%
  \IfFontExistsTF{SimHei}{\setCJKsansfont{SimHei}[AutoFakeBold=2.2]}{}%
  \IfFontExistsTF{FangSong}{\setCJKmonofont{FangSong}}{}%
}
\IfFontExistsTF{华文行楷}{\setCJKfamilyfont{wzuxingkai}{华文行楷}}{\setCJKfamilyfont{wzuxingkai}{KaiTi}}
\newcommand{\wzuxingkai}{\CJKfamily{wzuxingkai}}
\IfFontExistsTF{SimHei}{\setCJKfamilyfont{wzuhei}{SimHei}[AutoFakeBold=2.6]}{\setCJKfamilyfont{wzuhei}{Microsoft YaHei}[AutoFakeBold=2.6]}
\newcommand{\wzuhei}{\CJKfamily{wzuhei}}
\IfFontExistsTF{SimSun}{\setCJKfamilyfont{wzusong}{SimSun}[AutoFakeBold=2.2]}{\setCJKfamilyfont{wzusong}{宋体}[AutoFakeBold=2.2]}
\newcommand{\wzusong}{\CJKfamily{wzusong}}
\IfFontExistsTF{华文宋体}{\setCJKfamilyfont{wzustsong}{华文宋体}[AutoFakeBold=2.2]}{\setCJKfamilyfont{wzustsong}{SimSun}[AutoFakeBold=2.2]}
\newcommand{\wzustsong}{\CJKfamily{wzustsong}}
\IfFontExistsTF{KaiTi}{\setCJKfamilyfont{wzukai}{KaiTi}[AutoFakeBold=2.2]}{\setCJKfamilyfont{wzukai}{SimSun}[AutoFakeBold=2.2]}
\newcommand{\wzukai}{\CJKfamily{wzukai}}

\setstretch{1.25}
\setlength{\parindent}{2em}
\setlength{\parskip}{0pt}
\raggedbottom

\hypersetup{
  colorlinks=true,
  linkcolor=black,
  citecolor=black,
  urlcolor=black,
  bookmarksnumbered=true,
  plainpages=false,
  hypertexnames=false,
  pdfstartview=FitH
}

\sisetup{
  detect-all,
  group-separator={,},
  group-minimum-digits=4,
  separate-uncertainty=true
}

\lstdefinestyle{wzu-course-code}{
  basicstyle=\ttfamily\small,
  breaklines=true,
  columns=fullflexible,
  frame=single,
  rulecolor=\color{black!35},
  backgroundcolor=\color{black!3},
  keywordstyle=\bfseries,
  commentstyle=\color{black!55},
  showstringspaces=false,
  tabsize=2
}
\lstset{style=wzu-course-code}

\renewcommand{\contentsname}{目\quad 录}
\renewcommand{\refname}{参考文献}
\renewcommand{\figurename}{图}
\renewcommand{\tablename}{表}
\renewcommand{\algorithmicrequire}{\textbf{输入：}}
\renewcommand{\algorithmicensure}{\textbf{输出：}}
\floatname{algorithm}{算法}

\renewcommand{\thesection}{\chinese{section}}
\renewcommand{\thesubsection}{\arabic{section}.\arabic{subsection}}
\renewcommand{\thesubsubsection}{\thesubsection.\arabic{subsubsection}}
\numberwithin{equation}{section}
\renewcommand{\theequation}{\arabic{section}-\arabic{equation}}
\renewcommand{\thefigure}{\arabic{section}-\arabic{figure}}
\renewcommand{\thetable}{\arabic{section}-\arabic{table}}

\ctexset{
  section = {
    format = \zihao{4}\bfseries\sffamily\raggedright,
    number = \chinese{section},
    aftername = 、,
    beforeskip = 18pt,
    afterskip = 8pt
  },
  subsection = {
    format = \zihao{-4}\bfseries\sffamily\raggedright,
    number = \thesubsection,
    aftername = \quad,
    beforeskip = 12pt,
    afterskip = 6pt
  },
  subsubsection = {
    format = \zihao{-4}\sffamily\raggedright,
    number = \thesubsubsection,
    aftername = \quad,
    beforeskip = 8pt,
    afterskip = 4pt
  }
}
\setcounter{secnumdepth}{3}
\setcounter{tocdepth}{3}

\captionsetup{
  font={small},
  labelfont={bf},
  labelsep=space,
  justification=centering,
  singlelinecheck=false,
  skip=6pt
}

\fancypagestyle{wzucourse}{%
  \fancyhf{}%
  \fancyfoot[C]{\songti\zihao{-5}\thepage}%
  \renewcommand{\headrulewidth}{0pt}%
  \renewcommand{\footrulewidth}{0pt}%
}
\pagestyle{wzucourse}
\fancypagestyle{plain}{%
  \fancyhf{}%
  \fancyfoot[C]{\songti\zihao{-5}\thepage}%
  \renewcommand{\headrulewidth}{0pt}%
  \renewcommand{\footrulewidth}{0pt}%
}
\fancypagestyle{empty}{%
  \fancyhf{}%
  \renewcommand{\headrulewidth}{0pt}%
  \renewcommand{\footrulewidth}{0pt}%
}

\theoremstyle{plain}
\newtheorem{theorem}{定理}[section]
\newtheorem{lemma}{引理}[section]
\theoremstyle{definition}
\newtheorem{definition}{定义}[section]
\newtheorem{example}{例}[section]
\theoremstyle{remark}
\newtheorem*{remark}{注}
\renewcommand{\proofname}{证明}

\crefname{section}{节}{节}
\crefname{subsection}{小节}{小节}
\crefname{figure}{图}{图}
\crefname{table}{表}{表}
\crefname{equation}{式}{式}
\crefname{algorithm}{算法}{算法}
\crefname{theorem}{定理}{定理}
\crefname{definition}{定义}{定义}

\makeatletter
\def\wzu@school{温州大学}
\def\wzu@schoolimage{assets/wzu-school-name.png}
\def\wzu@papername{硕\ 士\ 课\ 程\ 论\ 文}
\def\wzu@course{XXX课程}
\def\wzu@title{课程论文题目}
\def\wzu@college{数理学院}
\def\wzu@major{应用统计}
\def\wzu@author{张三}
\def\wzu@studentid{2024000000}
\def\wzu@advisor{李四}
\def\wzu@date{\the\year 年\the\month 月}

\define@key{wzucourse}{school}{\def\wzu@school{#1}}
\define@key{wzucourse}{school-image}{\def\wzu@schoolimage{#1}}
\define@key{wzucourse}{paper-name}{\def\wzu@papername{#1}}
\define@key{wzucourse}{course}{\def\wzu@course{#1}}
\define@key{wzucourse}{title}{\def\wzu@title{#1}}
\define@key{wzucourse}{college}{\def\wzu@college{#1}}
\define@key{wzucourse}{major}{\def\wzu@major{#1}}
\define@key{wzucourse}{author}{\def\wzu@author{#1}}
\define@key{wzucourse}{student-id}{\def\wzu@studentid{#1}}
\define@key{wzucourse}{advisor}{\def\wzu@advisor{#1}}
\define@key{wzucourse}{date}{\def\wzu@date{#1}}
\newcommand{\wzucoursesetup}[1]{\kvsetkeys{wzucourse}{#1}}

\renewcommand*\l@section[2]{\@dottedtocline{1}{0em}{2.8em}{\wzuhei #1}{\wzuhei #2}}
\renewcommand*\l@subsection[2]{\@dottedtocline{2}{1.8em}{3.2em}{\wzuhei #1}{\wzuhei #2}}
\renewcommand*\l@subsubsection[2]{\@dottedtocline{3}{4.2em}{4.0em}{\wzuhei #1}{\wzuhei #2}}

\newcommand{\wzu@coverfield}[3]{%
  \node[anchor=base east,font=\songti\zihao{-3}] at ([xshift=79mm,yshift=#1]current page.south west) {#2};
  \draw[line width=0.35pt]
    ([xshift=86mm,yshift=\dimexpr#1-1.8mm\relax]current page.south west) --
    ([xshift=158mm,yshift=\dimexpr#1-1.8mm\relax]current page.south west);
  \node[anchor=base,font=\wzukai\bfseries\zihao{-3}] at ([xshift=122mm,yshift=#1]current page.south west) {#3};
}

\newcommand{\makewzucoursecover}{%
  \hypersetup{pdftitle={\wzu@title},pdfauthor={\wzu@author}}%
  \begin{titlepage}
    \thispagestyle{empty}
    \begin{tikzpicture}[remember picture,overlay,x=1mm,y=1mm]
      \node at ([xshift=105mm,yshift=244mm]current page.south west)
        {\IfFileExists{\wzu@schoolimage}{\includegraphics[width=68mm]{\wzu@schoolimage}}{\wzuxingkai\fontsize{48pt}{58pt}\selectfont\wzu@school}};
      \node[font=\wzuhei\bfseries\zihao{-0}] at ([xshift=105mm,yshift=214mm]current page.south west) {\wzu@papername};
      \node[font=\wzusong\bfseries\zihao{2}] at ([xshift=105mm,yshift=175mm]current page.south west) {《\wzu@course》};
      \node[align=center,text width=150mm,font=\wzusong\bfseries\zihao{2}] at ([xshift=105mm,yshift=142mm]current page.south west) {题目：\wzu@title};
      \wzu@coverfield{101mm}{学\hspace{2em}院：}{\wzu@college}
      \wzu@coverfield{88mm}{专\hspace{2em}业：}{\wzu@major}
      \wzu@coverfield{75mm}{姓\hspace{2em}名：}{\wzu@author}
      \wzu@coverfield{62mm}{学\hspace{2em}号：}{\wzu@studentid}
      \wzu@coverfield{49mm}{指导老师：}{\wzu@advisor}
      \node[font=\wzusong\bfseries\zihao{-4}] at ([xshift=105mm,yshift=32mm]current page.south west) {\wzu@date};
    \end{tikzpicture}
    \null
  \end{titlepage}
}

\newcommand{\makewzucoursetoc}{%
  \clearpage
  \thispagestyle{empty}
  {\wzuhei\tableofcontents}
  \clearpage
  \pagenumbering{arabic}
  \pagestyle{wzucourse}
}

\newcommand{\makewzucoursebibliography}{%
  \clearpage
  \phantomsection
  \addcontentsline{toc}{section}{参考文献}
  \printbibliography[title=参考文献]
}

\newcommand{\Vector}[1]{\bm{#1}}
\newcommand{\Matrix}[1]{\bm{#1}}
\newcommand{\Tensor}[1]{\mathcal{#1}}
\newcommand{\diff}{\mathop{}\!\mathrm{d}}
\newcommand{\e}{\mathrm{e}}
\newcommand{\E}{\mathbb{E}}
\newcommand{\Var}{\operatorname{Var}}
\newcommand{\Cov}{\operatorname{Cov}}
\newcommand{\Prob}{\mathbb{P}}
\DeclareMathOperator{\argmin}{arg\,min}
\DeclareMathOperator{\argmax}{arg\,max}
\DeclareMathOperator{\logit}{logit}
\DeclareMathOperator{\diag}{diag}
\makeatother

\endinput
