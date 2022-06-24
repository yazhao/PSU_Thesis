%%% ======================================================================
%%%  @LaTeX-file{
%%%     filename  = "psuthesis.cls",
%%%     version   = "2.9.2",
%%%     date      = "2019/07/10",
%%%     time      = "16:00:00 EDT",
%%%     author    = "Gary L. Gray",
%%%     copyright = "Gary L. Gray",
%%%     address   = "Engineering Science and Mechanics,
%%%                  212 Earth & Engineering Sciences Bldg.,
%%%                  Penn State University,
%%%                  University Park, PA 16802,
%%%                  USA",
%%%     telephone = "814-863-1778",
%%%     email     = "gray@psu.edu",
%%%     keywords  = "latex, psuthesis, thesis class",
%%%     supported = "yes",
%%%     abstract  = "This package provides a style for typesetting
%%%                  Penn State theses at the bachelors, masters,
%%%                  or Ph.D. level."
%%%  }
%%% ======================================================================
% Change History
% The change history can be found in the accompanying document entitled
% "psuthesis class change history.md".
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NeedsTeXFormat{LaTeX2e}[1995/06/01]
\ProvidesClass{psuthesis}[2019/07/10 v2.9.2 psuthesis class]
\RequirePackage{ifthen}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Declare options for different degree types.
% Allowable degrees are:
%     Ph.D. using class option <phd>
%     M.S. using class option <ms>
%     M.Eng. using class option <meng>
%     M.A. using class option <ma>
%     B.S. using class option <bs>
%     B.A. using class option <ba>
%     Bachelors degree with Schreyer honors using class option <schreyer>
%
% The option of an option sets the boolean for that option to
% true and all others to false.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newboolean{psu@secondthesissupervisor}
\newboolean{psu@schreyer}
\newboolean{psu@esc}
\newboolean{psu@twoha}
\newboolean{psu@bs}
\newboolean{psu@ba}
\newboolean{psu@ms}
\newboolean{psu@meng}
\newboolean{psu@ma}
\newboolean{psu@phd}
\newboolean{psu@toc}

\setboolean{psu@secondthesissupervisor}{false}
\setboolean{psu@schreyer}{false}
\setboolean{psu@esc}{false}
\setboolean{psu@twoha}{false}
\setboolean{psu@bs}{false}
\setboolean{psu@ba}{false}
\setboolean{psu@ms}{false}
\setboolean{psu@meng}{false}
\setboolean{psu@ma}{false}
\setboolean{psu@phd}{false}

\DeclareOption{bs}{\setboolean{psu@bs}{true}\setboolean{psu@phd}{false}}
\DeclareOption{ba}{\setboolean{psu@ba}{true}\setboolean{psu@phd}{false}}
\DeclareOption{ms}{\setboolean{psu@ms}{true}\setboolean{psu@phd}{false}}
\DeclareOption{meng}{\setboolean{psu@meng}{true}\setboolean{psu@phd}{false}}
\DeclareOption{ma}{\setboolean{psu@ma}{true}\setboolean{psu@phd}{false}}
\DeclareOption{phd}{\setboolean{psu@phd}{true}}
\DeclareOption{inlinechaptertoc}{\setboolean{psu@toc}{true}}
\DeclareOption{secondthesissupervisor}{\setboolean{psu@secondthesissupervisor}{true}}
\DeclareOption{schreyer}{\setboolean{psu@schreyer}{true}}%
\DeclareOption{twoha}{\setboolean{psu@twoha}{true}}%
\DeclareOption{esc}{\setboolean{psu@esc}{true}}%
\setboolean{psu@bs}{false}
\setboolean{psu@ba}{false}
\setboolean{psu@phd}{false}
\setboolean{psu@twoha}{false}

\DeclareOption{draft}{\PassOptionsToClass{\CurrentOption}{book}}
\DeclareOption{10pt}{\PassOptionsToClass{\CurrentOption}{book}}
\DeclareOption{11pt}{\PassOptionsToClass{\CurrentOption}{book}}
\DeclareOption{12pt}{\PassOptionsToClass{\CurrentOption}{book}}
\DeclareOption*{\PackageWarning{psuthesis}{Unknown option `\CurrentOption'. Ignoring}}
\ExecuteOptions{phd} % the default option is <phd>
\ProcessOptions
\LoadClass[openany,oneside]{book}
\RequirePackage{calc}
\RequirePackage{setspace}
% If you are using the subfigure package, load the tocloft package with
% the subfigure option and comment out the next line.
%\RequirePackage{tocloft}[2003/09/26]
\RequirePackage[subfigure]{tocloft}[2003/09/26]
\RequirePackage{fancyhdr}
\RequirePackage[overload]{textcase}
\RequirePackage[letterpaper, left = 1.4in, right = 0.9in, top = 0.9in, bottom = 0.9in, includefoot]{geometry}
\RequirePackage{twoopt}

%%%%%%%%%%%%%%%%%%%%%%%%
% Settings for tocloft %
%%%%%%%%%%%%%%%%%%%%%%%%
% Format chapter entries so that the chapter name goes on a line
% following "Chapter #".
\renewcommand{\@pnumwidth}{1.75em} % remove TOC margin errors
\renewcommand{\@tocrmarg}{2.75em}
\newlength{\mylength}% a "scratch" length
\newlength{\mylonglength}% another "scratch" length
\ifthenelse{\boolean{psu@toc}}
{%
% Format chapter entries so that the chapter name goes on the same line
% as "Chapter #".
\renewcommand{\cftchappresnum}{Chapter }
\settowidth{\mylength}{\bfseries\cftchappresnum\cftchapaftersnum}% extra space
\addtolength{\cftchapnumwidth}{\mylength} % add the extra space
%
\newcommand{\mylongname}{Appendix }% the longest chapter number header
\settowidth{\mylonglength}{\bfseries\mylongname\cftchapaftersnum}% extra space
}
{%
\renewcommand{\cftchappresnum}{Chapter } 
\renewcommand{\cftchapaftersnumb}{\\ \mbox{}\hspace{-\mylength}\hspace{-0.1em}}
\settowidth{\mylength}{\bfseries\cftchappresnum\cftchapaftersnum} % extra space 
\addtolength{\cftchapnumwidth}{\mylength+0.1em} % add the extra space\renewcommand{\cftchapfont}{\bfseries} 
}%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Here I define internal "commands" that will be used to store the
% thesis title, author name, department, etc.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Store the title of the thesis.
\newcommand{\psu@title}{Theory of Everything}
\renewcommand{\title}[1]{\renewcommand{\psu@title}{#1}}

% Store the author's name.
\newcommand{\psu@author}{Richard Feynman}
\renewcommand{\author}[1]{\renewcommand{\psu@author}{#1}}

% Store the department name.
\newcommand{\psu@dept}{ESM}
\providecommand{\dept}[1]{\renewcommand{\psu@dept}{#1}}

% Store the date the degree will be conferred.
\newcommand{\psu@degreedate}{May 1900}
\providecommand{\degreedate}[1]{\renewcommand{\psu@degreedate}{#1}}

% Store the year of the copyright.
\newcommand{\psu@copyrightyear}{1900}
\providecommand{\copyrightyear}[1]{\renewcommand{\psu@copyrightyear}{#1}}

% Store the document type.
\newcommand{\psu@documenttype}{Thesis}
\providecommand{\documenttype}[1]{\renewcommand{\psu@documenttype}{#1}}

% Store the academic unit to which the document has been submitted.
\newcommand{\psu@submittedto}{The Graduate School}
\providecommand{\submittedto}[1]{\renewcommand{\psu@submittedto}{#1}}

% Store the College to which the document has been submitted.
\newcommand{\psu@collegesubmittedto}{College of Engineering}
\providecommand{\collegesubmittedto}[1]{\renewcommand{\psu@collegesubmittedto}{#1}}

% Store the the info for the honors degree(s) type(s).
\newcommand{\psu@bachelorsdegreeinfo}{for a baccalaureate degree(s) \\ in Biology and Physics \\ with honors in Computer Engineering}
\providecommand{\bachelorsdegreeinfo}[1]{\renewcommand{\psu@bachelorsdegreeinfo}{#1}}

% Store the academic unit to which the document has been submitted.
\newcommand{\psu@escdepthead}{Department Q. Head}
\providecommand{\escdepthead}[1]{\renewcommand{\psu@escdepthead}{#1}}

% Store the academic unit to which the document has been submitted.
\newcommand{\psu@escdeptheadtitle}{Department Q. Head}
\providecommand{\escdeptheadtitle}[1]{\renewcommand{\psu@escdeptheadtitle}{#1}}

% Store the name of the second Thesis Supervisor for a baccalaureate degree.
\newcommand{\psu@secondthesissupervisor}{Second Q. Jones}
\providecommand{\secondthesissupervisor}[1]{\renewcommand{\psu@secondthesissupervisor}{#1}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Store the name of the degree by determining which boolean was
% set in the class option was specified.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\ifthenelse{\boolean{psu@bs}}%
{\newcommand{\psu@degreetype}{Baccalaureate of Science}}%
{}

\ifthenelse{\boolean{psu@ba}}%
{\newcommand{\psu@degreetype}{Baccalaureate of Arts}}%
{}

\ifthenelse{\boolean{psu@ms}}%
{\newcommand{\psu@degreetype}{Master of Science}}%
{}

\ifthenelse{\boolean{psu@meng}}%
{\newcommand{\psu@degreetype}{Master of Engineering}}%
{}

\ifthenelse{\boolean{psu@ma}}%
{\newcommand{\psu@degreetype}{Master of Arts}}%
{}

\ifthenelse{\boolean{psu@phd}}%
{\newcommand{\psu@degreetype}{Doctor of Philosophy}}%
{}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Store the number of readers in \psu@readers. This quantity is
% input in the main file using the \numberofreaders command.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\psu@readers}{4}
\providecommand{\numberofreaders}[1]{\renewcommand{\psu@readers}{#1}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% 
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\psu@honorsadvisor}{Name of Honors Advisor}%
\newcommand{\psu@honorsadvisortitle}{Associate Professor of Something}%
\providecommand{\honorsadvisor}[2]%
{\renewcommand{\psu@honorsadvisor}{#1}%
\renewcommand{\psu@honorsadvisortitle}{#2}}

\newcommand{\psu@honorsadvisortwo}{Name of Second Honors Advisor}%
\newcommand{\psu@honorsadvisortwotitle}{Associate Professor of Something}%
\providecommand{\honorsadvisortwo}[2]%
{\renewcommand{\psu@honorsadvisortwo}{#1}%
\renewcommand{\psu@honorsadvisortwotitle}{#2}}

%\newcommand{\psu@advisor}{John Doe}
%\newcommand{\psu@advisortitle}{John Doe}
%\newcommand{\psu@advisoroption}{}%
%\providecommand{\advisor}[3][]%
%{\renewcommand{\psu@advisoroption}{#1}%
%\renewcommand{\psu@advisor}{#2}%
%\renewcommand{\psu@advisortitle}{#3}}

\newcommand{\psu@advisor}{John Doe}
\newcommand{\psu@advisortitle}{John Doe}
\newcommand{\psu@advisoroptionone}{}%
\newcommand{\psu@advisoroptiontwo}{}%
\providecommandtwoopt{\advisor}[4][][]%
{\renewcommand{\psu@advisoroptionone}{#1}%
\renewcommand{\psu@advisoroptiontwo}{#2}%
\renewcommand{\psu@advisor}{#3}%
\renewcommand{\psu@advisortitle}{#4}}

\newcommand{\psu@readerone}{John Doe}
\newcommand{\psu@readeronetitle}{John Doe}
\newcommand{\psu@readeroneoption}{}%
\providecommand{\readerone}[3][]%
{\renewcommand{\psu@readeroneoption}{#1}%
\renewcommand{\psu@readerone}{#2}%
\renewcommand{\psu@readeronetitle}{#3}}

\newcommand{\psu@readertwo}{John Doe}
\newcommand{\psu@readertwotitle}{John Doe}
\newcommand{\psu@readertwooption}{}%
\providecommand{\readertwo}[3][]%
{\renewcommand{\psu@readertwooption}{#1}%
\renewcommand{\psu@readertwo}{#2}%
\renewcommand{\psu@readertwotitle}{#3}}

\newcommand{\psu@readerthree}{John Doe}
\newcommand{\psu@readerthreetitle}{John Doe}
\newcommand{\psu@readerthreeoption}{}%
\providecommand{\readerthree}[3][]%
{\renewcommand{\psu@readerthreeoption}{#1}%
\renewcommand{\psu@readerthree}{#2}%
\renewcommand{\psu@readerthreetitle}{#3}}

\newcommand{\psu@readerfour}{John Doe}
\newcommand{\psu@readerfourtitle}{John Doe}
\newcommand{\psu@readerfouroption}{}%
\providecommand{\readerfour}[3][]%
{\renewcommand{\psu@readerfouroption}{#1}%
\renewcommand{\psu@readerfour}{#2}%
\renewcommand{\psu@readerfourtitle}{#3}}

\newcommand{\psu@readerfive}{John Doe}
\newcommand{\psu@readerfivetitle}{John Doe}
\newcommand{\psu@readerfiveoption}{}%
\providecommand{\readerfive}[3][]%
{\renewcommand{\psu@readerfiveoption}{#1}%
\renewcommand{\psu@readerfive}{#2}%
\renewcommand{\psu@readerfivetitle}{#3}}

\newcommand{\psu@readersix}{John Doe}
\newcommand{\psu@readersixtitle}{John Doe}
\newcommand{\psu@readersixoption}{}%
\providecommand{\readersix}[3][]%
{\renewcommand{\psu@readersixoption}{#1}%
\renewcommand{\psu@readersix}{#2}%
\renewcommand{\psu@readersixtitle}{#3}}


\newsavebox{\tempbox}
\renewcommand{\@makecaption}[2]{%
\vspace{7pt}\sbox{\tempbox}{\small\textbf{#1.} #2}%
\ifthenelse{\lengthtest{\wd\tempbox > \linewidth}}%
{\small\textbf{#1.} #2\par}%
{\centering \small\textbf{#1.} #2}%
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                %
% The actual layout begins here. %
%                                %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Here is the permission page.
%\newcommand{\psupermissionpage}{%
%\thispagestyle{empty}
%\begin{singlespace}
%\noindent
%I grant The Pennsylvania State University the non-exclusive right to use this work for the University's own purposes and to make single copies of the work available to the public on a not-for-profit basis if copies are not otherwise available. \\[0.6in]
%\mbox{} \hfill
%\parbox{3in}{\begin{center} \rule{3in}{0.4pt} \\ \psu@author
%\end{center}}
%\end{singlespace}
%\newpage
%\addtocounter{page}{-1}
%}


% Here is the title page.
\newcommand{\psutitlepage}{%
\setcounter{page}{1}
\thispagestyle{empty}%
%%%
\ifthenelse{\boolean{psu@bs} \or \boolean{psu@ba}}
%%%
{%
\vspace*{-1in}
%\enlargethispage{0.5in}
\ifthenelse{\boolean{psu@schreyer}}
{
\begin{center}
THE PENNSYLVANIA STATE UNIVERSITY \\ SCHREYER HONORS COLLEGE
\end{center}
}
{
\begin{center}
THE PENNSYLVANIA STATE UNIVERSITY
\end{center}
}
\vfill
\begin{center}
\MakeUppercase{\psu@dept}
\end{center}
\vfill
\begin{center}
\MakeUppercase{\psu@title}
\end{center}
\vfill
\begin{center}
\MakeUppercase{\psu@author} \\ \MakeUppercase{\psu@degreedate}
\end{center}
\vfill
\begin{center}
A thesis \\ submitted in partial fulfillment \\ of the requirements \\
\psu@bachelorsdegreeinfo
\end{center}
\vfill
\mbox{}
\begin{center}
Reviewed and approved$^{*}$ by the following:\\[4mm]
\psu@advisor \\
\psu@advisortitle \\
Thesis Supervisor \\[4mm]
\ifthenelse{\boolean{psu@twoha}}
{
\psu@honorsadvisor \\
\psu@honorsadvisortitle\\
Honors Advisor \\[4mm]
\psu@honorsadvisortwo \\
\psu@honorsadvisortwotitle\\
Honors Advisor
}
{
\psu@honorsadvisor \\
\psu@honorsadvisortitle\\
Honors Advisor
} \\[4mm]
\ifthenelse{\boolean{psu@esc}}
{
\psu@escdepthead \\
Department Head \\
\psu@escdeptheadtitle
\enlargethispage{24pt}
}
{}
\vfill
\ifthenelse{\boolean{psu@schreyer}}
{
$^{*}$Signatures are on file in the Schreyer Honors College and Department of Engineering Science and Mechanics.
}
{
$^{*}$Signatures are on file in the Department of Engineering Science and Mechanics.
}
\end{center}
%
%
\newpage
% Now for the bachelors signature pages.
\ifthenelse{\boolean{psu@schreyer} \and \boolean{psu@esc}}
{
{\thispagestyle{empty}\large\bfseries\noindent
This page is not included in the thesis. The page following this one is submitted to the Department of Engineering Science and Mechanics.
}
\newpage
\thispagestyle{empty}
\noindent
We approve the thesis of \psu@author:\\[10mm]
\mbox{}\hfill Date of Signature \hspace{5mm}\mbox{}\\[24pt]
\rule{3.5in}{0.5pt}\hfill\rule{1.5in}{0.5pt}\\[12pt]
\psu@advisor \\
\psu@advisortitle \\
Thesis Supervisor \\[42pt]
%
\rule{3.5in}{0.5pt}\hfill\rule{1.5in}{0.5pt}\\[12pt]
\psu@honorsadvisor \\
\psu@honorsadvisortitle \\
Honors Advisor \\[42pt]
\ifthenelse{\boolean{psu@twoha}}
{
\rule{3.5in}{0.5pt}\hfill\rule{1.5in}{0.5pt}\\[12pt]
\psu@honorsadvisortwo \\
\psu@honorsadvisortwotitle \\
Honors Advisor \\[42pt]
}
{}
\ifthenelse{\boolean{psu@esc}}{
\rule{3.5in}{0.5pt}\hfill\rule{1.5in}{0.5pt}\\[12pt]
\psu@escdepthead \\
Department Head \\
\psu@escdeptheadtitle
}
{}
% Now the page that goes to the Schreyer Honors College.
\newpage
{\thispagestyle{empty}\large\bfseries\noindent
This page is not included in the thesis. The page following this one is submitted to the Schreyer Honors College.
}
\newpage
\thispagestyle{empty}
\noindent
We approve the thesis of \psu@author:\\[10mm]
\mbox{}\hfill Date of Signature \hspace{5mm}\mbox{}\\[24pt]
\rule{3.5in}{0.5pt}\hfill\rule{1.5in}{0.5pt}\\[12pt]
\psu@advisor \\
\psu@advisortitle \\
Thesis Supervisor \\[42pt]
%
\rule{3.5in}{0.5pt}\hfill\rule{1.5in}{0.5pt}\\[12pt]
\psu@honorsadvisor \\
\psu@honorsadvisortitle \\
Honors Advisor \\[42pt]
\ifthenelse{\boolean{psu@twoha}}
{
\rule{3.5in}{0.5pt}\hfill\rule{1.5in}{0.5pt}\\[12pt]
\psu@honorsadvisortwo \\
\psu@honorsadvisortwotitle \\
Honors Advisor \\[42pt]
}
{}
\addtocounter{page}{-5}
}
{
\newpage
\thispagestyle{empty}
\noindent
We approve the thesis of \psu@author:\\[10mm]
\mbox{}\hfill Date of Signature \hspace{5mm}\mbox{}\\[24pt]
\rule{3.5in}{0.5pt}\hfill\rule{1.5in}{0.5pt}\\[12pt]
\psu@advisor \\
\psu@advisortitle \\
Thesis Supervisor \\[42pt]
%
\rule{3.5in}{0.5pt}\hfill\rule{1.5in}{0.5pt}\\[12pt]
\psu@honorsadvisor \\
\psu@honorsadvisortitle \\
Honors Advisor \\[42pt]
\ifthenelse{\boolean{psu@twoha}}
{
\rule{3.5in}{0.5pt}\hfill\rule{1.5in}{0.5pt}\\[12pt]
\psu@honorsadvisortwo \\
\psu@honorsadvisortwotitle \\
Honors Advisor \\[42pt]
}
{}
\ifthenelse{\boolean{psu@esc}}{
\rule{3.5in}{0.5pt}\hfill\rule{1.5in}{0.5pt}\\[12pt]
\psu@escdepthead \\
Department Head \\
\psu@escdeptheadtitle
}
{}
\addtocounter{page}{-2}
}
%\ifthenelse{\boolean{psu@escdepthead}}{%
%\begin{tabbing}%
%Approved: \= \rule{2.75in}{0.5pt} \quad Date: \= \rule{1.5in}{0.5pt} \\[-3pt]
%          \> \qquad \psu@advisor \\[-3pt]
%          \> \qquad Thesis Supervisor \\[8mm]
%%
%\ifthenelse{\boolean{psu@secondthesissupervisor}}{%
%          \> \rule{2.75in}{0.5pt}              \> \rule{1.5in}{0.5pt} \\[-3pt]
%          \> \qquad \psu@secondthesissupervisor \\[-3pt]
%          \> \qquad Thesis Supervisor \\[8mm]
%}{}%
%%
%          \> \rule{2.75in}{0.5pt}              \> \rule{1.5in}{0.5pt} \\[-3pt]
%          \> \qquad \psu@honorsadvisor \\[-3pt]
%          \> \qquad Honors Advisor \\[8mm]
% %
%          \> \rule{2.75in}{0.5pt}              \> \rule{1.5in}{0.5pt} \\[-3pt]
%          \> \qquad \psu@escdepthead \\[-3pt]
%          \> \qquad Department Head
%\end{tabbing}%
%}%
%{%
%\begin{tabbing}%
%Approved: \= \rule{2.75in}{0.5pt} \quad Date: \= \rule{1.5in}{0.5pt} \\[-3pt]
%          \> \qquad \psu@advisor \\[-3pt]
%          \> \qquad Thesis Supervisor \\[8mm]
%%
%\ifthenelse{\boolean{psu@secondthesissupervisor}}{%
%          \> \rule{2.75in}{0.5pt}              \> \rule{1.5in}{0.5pt} \\[-3pt]
%          \> \qquad \psu@secondthesissupervisor \\[-3pt]
%          \> \qquad Thesis Supervisor \\[8mm]
%}{}%
%%
%          \> \rule{2.75in}{0.5pt}              \> \rule{1.5in}{0.5pt} \\[-3pt]
%          \> \qquad \psu@honorsadvisor \\[-3pt]
%          \> \qquad Honors Advisor
%\end{tabbing}%
%}%
}%
%%%
{%
\vspace*{-0.25in}
\begin{center}
	The Pennsylvania State University\\
	\psu@submittedto \\
	\psu@collegesubmittedto
\end{center}
\vfill
\begin{center}
    \setstretch{2}
    \bfseries\uppercase\expandafter{\psu@title}
\end{center}
\vfill
\begin{center}
    A \psu@documenttype\ in\\
    \psu@dept\\
    by\\
    \psu@author\\
\end{center}
\vfill
\begin{center}
    \copyright\ \psu@copyrightyear\ \psu@author
\end{center}
\vfill
\begin{center}
    Submitted in Partial Fulfillment\\
    of the Requirements\\
    for the Degree of
\end{center}
\vfill
\begin{center}
     \psu@degreetype
\end{center}
\vfill
\begin{center}
    \psu@degreedate
\end{center}
%\newpage
%\ifthenelse{\boolean{psu@ms} \or \boolean{psu@meng} \or \boolean{psu@ma}}{\psupermissionpage}{}
}
%%%
\restoregeometry
\newpage
}


% Here is the committee page.

\newlength{\psu@sigoptionskip}
\newlength{\psu@sigafteroptionskip}
\newlength{\psu@intersigspace}

\newcommand{\psucommitteepage}{%
    \ifthenelse{\psu@readers = 6}{%
        \setlength{\psu@sigafteroptionskip}{1.0\baselineskip}
        \setlength{\psu@intersigspace}{1.0\baselineskip}
    }%
    {%
        \setlength{\psu@sigafteroptionskip}{1.5\baselineskip}
        \setlength{\psu@intersigspace}{1.5\baselineskip}
    }
    \vspace*{-0.2in}
    \noindent {\normalsize The \MakeTextLowercase{\psu@documenttype} of \psu@author\ was reviewed and approved$^{*}$ by the following:}\\[3\baselineskip]
\mbox{}\hfill
\parbox{\textwidth - 0.5in}{
         \psu@advisor\\[\psu@sigoptionskip]
         \psu@advisortitle
         \ifthenelse{\equal{\psu@advisoroptionone}{}}%
                    {\\[\psu@intersigspace]}%
                    {\\[\psu@sigoptionskip]
                        \psu@advisoroptionone \\ \psu@advisoroptiontwo \\[\psu@sigafteroptionskip]}
\ifcase \psu@readers
\or
          \psu@readerone\\[\psu@sigoptionskip]
          \psu@readeronetitle
          \ifthenelse{\equal{\psu@readeroneoption}{}}%
                     {}%
                     {\\[\psu@sigoptionskip] \psu@readeroneoption}
\or
          \psu@readerone\\[\psu@sigoptionskip]
          \psu@readeronetitle
          \ifthenelse{\equal{\psu@readeroneoption}{}}%
                     {\\[\psu@intersigspace]}%
                     {\\[\psu@sigoptionskip]
                               \psu@readeroneoption \\[\psu@sigafteroptionskip]}
          \psu@readertwo\\[\psu@sigoptionskip]
          \psu@readertwotitle
          \ifthenelse{\equal{\psu@readertwooption}{}}%
                     {}%
                     {\\[\psu@sigoptionskip] \psu@readertwooption}
\or
          {\psu@readerone}\\[\psu@sigoptionskip]
          \psu@readeronetitle
          \ifthenelse{\equal{\psu@readeroneoption}{}}%
                     {\\[\psu@intersigspace]}%
                     {\\[\psu@sigoptionskip]
                               \psu@readeroneoption \\[\psu@sigafteroptionskip]}
          {\psu@readertwo}\\[\psu@sigoptionskip]
          \psu@readertwotitle
          \ifthenelse{\equal{\psu@readertwooption}{}}%
                     {\\[\psu@intersigspace]}%
                     {\\[\psu@sigoptionskip]
                               \psu@readertwooption \\[\psu@sigafteroptionskip]}
          {\psu@readerthree}\\[\psu@sigoptionskip]
          \psu@readerthreetitle
          \ifthenelse{\equal{\psu@readerthreeoption}{}}%
                     {}%
                     {\\[\psu@sigoptionskip] \psu@readerthreeoption}
\or
          \psu@readerone\\[\psu@sigoptionskip]
          \psu@readeronetitle
          \ifthenelse{\equal{\psu@readeroneoption}{}}%
                     {\\[\psu@intersigspace]}%
                     {\\[\psu@sigoptionskip]
                               \psu@readeroneoption \\[\psu@sigafteroptionskip]}
          \psu@readertwo\\[\psu@sigoptionskip]
          \psu@readertwotitle
          \ifthenelse{\equal{\psu@readertwooption}{}}%
                     {\\[\psu@intersigspace]}%
                     {\\[\psu@sigoptionskip]
                               \psu@readertwooption \\[\psu@sigafteroptionskip]}
          \psu@readerthree\\[\psu@sigoptionskip]
          \psu@readerthreetitle
          \ifthenelse{\equal{\psu@readerthreeoption}{}}%
                     {\\[\psu@intersigspace]}%
                     {\\[\psu@sigoptionskip]
                               \psu@readerthreeoption \\[\psu@sigafteroptionskip]}
          \psu@readerfour\\[\psu@sigoptionskip]
          \psu@readerfourtitle
          \ifthenelse{\equal{\psu@readerfouroption}{}}%
                     {}%
                     {\\[\psu@sigoptionskip] \psu@readerfouroption}
\or
          \psu@readerone\\[\psu@sigoptionskip]
          \psu@readeronetitle
          \ifthenelse{\equal{\psu@readeroneoption}{}}%
                     {\\[\psu@intersigspace]}%
                     {\\[\psu@sigoptionskip]
                               \psu@readeroneoption \\[\psu@sigafteroptionskip]}
          \psu@readertwo\\[\psu@sigoptionskip]
          \psu@readertwotitle
          \ifthenelse{\equal{\psu@readertwooption}{}}%
                     {\\[\psu@intersigspace]}%
                     {\\[\psu@sigoptionskip]
                               \psu@readertwooption \\[\psu@sigafteroptionskip]}
          \psu@readerthree\\[\psu@sigoptionskip]
          \psu@readerthreetitle
          \ifthenelse{\equal{\psu@readerthreeoption}{}}%
                     {\\[\psu@intersigspace]}%
                     {\\[\psu@sigoptionskip]
                               \psu@readerthreeoption \\[\psu@sigafteroptionskip]}
          \psu@readerfour\\[\psu@sigoptionskip]
          \psu@readerfourtitle
          \ifthenelse{\equal{\psu@readerfouroption}{}}%
                     {\\[\psu@intersigspace]}%
                     {\\[\psu@sigoptionskip]
                               \psu@readerfouroption \\[\psu@sigafteroptionskip]}
          \psu@readerfive\\[\psu@sigoptionskip]
          \psu@readerfivetitle
          \ifthenelse{\equal{\psu@readerfiveoption}{}}%
                     {}%
                     {\\[\psu@sigoptionskip] \psu@readerfiveoption}
\or
          \psu@readerone\\[\psu@sigoptionskip]
          \psu@readeronetitle
          \ifthenelse{\equal{\psu@readeroneoption}{}}%
                     {\\[\psu@intersigspace]}%
                     {\\[\psu@sigoptionskip]
                               \psu@readeroneoption \\[\psu@sigafteroptionskip]}
          \psu@readertwo\\[\psu@sigoptionskip]
          \psu@readertwotitle
          \ifthenelse{\equal{\psu@readertwooption}{}}%
                     {\\[\psu@intersigspace]}%
                     {\\[\psu@sigoptionskip]
                               \psu@readertwooption \\[\psu@sigafteroptionskip]}
          \psu@readerthree\\[\psu@sigoptionskip]
          \psu@readerthreetitle
          \ifthenelse{\equal{\psu@readerthreeoption}{}}%
                     {\\[\psu@intersigspace]}%
                     {\\[\psu@sigoptionskip]
                               \psu@readerthreeoption \\[\psu@sigafteroptionskip]}
          \psu@readerfour\\[\psu@sigoptionskip]
          \psu@readerfourtitle
          \ifthenelse{\equal{\psu@readerfouroption}{}}%
                     {\\[\psu@intersigspace]}%
                     {\\[\psu@sigoptionskip]
                               \psu@readerfouroption \\[\psu@sigafteroptionskip]}
          \psu@readerfive\\[\psu@sigoptionskip]
          \psu@readerfivetitle
          \ifthenelse{\equal{\psu@readerfiveoption}{}}%
                     {\\[\psu@intersigspace]}%
                     {\\[\psu@sigoptionskip]
                               \psu@readerfiveoption \\[\psu@sigafteroptionskip]}
          \psu@readersix\\[\psu@sigoptionskip]
          \psu@readersixtitle
          \ifthenelse{\equal{\psu@readersixoption}{}}%
                     {}%
                     {\\[\psu@sigoptionskip] \psu@readersixoption}
\fi
}

\mbox{}\vfill

\noindent
\parbox{\textwidth}{$^{*}$Signatures are on file in the Graduate School.}

\newpage
}


%\newcommand{\psusigpage}{%\setlength{\textheight}{8.0in}
%{\Huge\thispagestyle{empty}
%\sffamily\bfseries
%\mbox{}\vfill
%\noindent
%The following page is the Signature Page. The Signature Page needs to be given to the Grad School, but it should not be bound with the thesis.
%\begin{center}
%\tiny Don't bind this page either!
%\end{center}
%\vfill
%}
%\newpage 
%\psu@signaturepage}


\newcommand{\thesisabstract}[1]{%
%\pagestyle{plain}
\chapter*{Abstract}
    \begin{singlespace}
        \input{#1}
    \end{singlespace}
\newpage
}


\renewcommand{\contentsname}{Table of Contents}
\setcounter{secnumdepth}{10}
\setcounter{tocdepth}{4}
\newcommand{\thesistableofcontents}{%
\begin{singlespace}
\if@twocolumn
\@restonecoltrue\onecolumn
\else
\@restonecolfalse
\fi
\chapter*{\contentsname
\@mkboth{%
\MakeUppercase\contentsname}{\MakeUppercase\contentsname}}%
\@starttoc{toc}%
\if@restonecol\twocolumn\fi%
\end{singlespace}
\clearpage
}

%\renewcommand{\listfigurename}{List of Figures}
%\newcommand{\thesislistoffigures}{%
%\begin{singlespace}
%\if@twocolumn
%\@restonecoltrue\onecolumn
%\else
%\@restonecolfalse
%\fi
%%\chapter{\listfigurename
%%\@mkboth{%
%%\MakeUppercase\listfigurename}{\MakeUppercase\listfigurename}}%
%\chapter{\listfigurename}
%\@starttoc{lof}%
%\if@restonecol\twocolumn\fi
%\end{singlespace}
%\clearpage
%}

\renewcommand{\listtablename}{List of Tables}
\newcommand{\thesislistoftables}{%
\begin{singlespace}
\if@twocolumn
\@restonecoltrue\onecolumn
\else
\@restonecolfalse
\fi
\chapter{\listtablename
\@mkboth{%
\MakeUppercase\listtablename}{\MakeUppercase\listtablename}}%
\@starttoc{lot}%
\if@restonecol\twocolumn\fi
\end{singlespace}
\clearpage
}


\newcommand{\thesislistofsymbols}[1]{%
\chapter{List of Symbols}
%\addcontentsline{toc}{chapter}{List of Symbols}
\begin{singlespace}
    \input{#1}
\end{singlespace}
}


\newcommand{\thesisacknowledgments}[1]{%
\chapter{Acknowledgments}
%\addcontentsline{toc}{chapter}{Acknowledgments}
\begin{singlespace}
    \input{#1}
\end{singlespace}
}


\newcommand{\thesisdedication}[2]{%
\chapter*{#2}
\begin{singlespace}
    \input{#1}
\end{singlespace}
}


\newcommand{\Appendix}{\@dblarg\my@Appendix}
\def\my@Appendix[#1]#2{%
\ifthenelse{\value{chapter} = 0}
{
\ifthenelse{\boolean{psu@toc}}
{%
\addtocontents{toc}{\protect\addtolength{\cftchapnumwidth}{-\mylength}}
\addtocontents{toc}{\string\renewcommand{\string\cftchappresnum}{Appendix }}
\addtocontents{toc}{\protect\addtolength{\cftchapnumwidth}{\mylonglength}}
}%
{%
\addtocontents{toc}{\string\renewcommand{\string\cftchappresnum}{Appendix }}
}}{}%
\chapter[#1]{#2}
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\DeclareRobustCommand{\thesismainmatter}{%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%\setlength{\textheight}{8.5in}
\mainmatter
%\pagestyle{empty}
%\renewcommand{\@oddhead}{\mbox{}\hfill\arabic{page}}
%\let\ps@plain = \ps@empty
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\vita}[1]{%
\begin{singlespace}
\thispagestyle{empty}
\begin{center}
    \textbf{{\large Vita} \\[0.1in] \psu@author}
\end{center}
\input{#1}
\end{singlespace}
}


%%
%% End of file `psuthesis.cls'.
