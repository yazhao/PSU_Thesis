# YourName-Dissertation Template Change History
This is the change history for the template file YourName-Dissertation.tex. It was moved from that file to this separate markdown document on July 10, 2019.

### Version 1.6.5
I don't know how long this has been around, but the placement of page numbers was not consistent and running heads were included when they are explicitly forbidden by the Graduate School. This has now (hopefully) been fixed. It was fixed by commenting out a few lines in the class file and adding some very important lines to the template file. In particular, right after `\begin{document}`, I added:

	\pagestyle{fancy}
	\fancyhead[L,C,R]{}
	\fancyfoot[L,R]{}
	\fancyfoot[C]{\thepage}
	\renewcommand{\headrulewidth}{0pt}
	\renewcommand{\footrulewidth}{0pt}

I haven't done extensive testing, but this appears to also fix undergraduate theses. If you would like to include running heads in an undergraduate thesis, you may do so by redefining `\fancyhead` in the fancyhdr package. [2019/07/10]

### Version 1.6.1
If the List of Figures or the List of Tables occupied more than one page, then the placement of the `\addcontentsline` command would show the last page of the list in the Table of Contents rather than the first page as it should. This has been fixed. [2019/06/27]

### Version 1.6.0
Substantial changes to the title page and signature that are generated for bachelors theses.

* `honorsdepthead` has been changed to `escdepthead` since Engineering Science is the only department at Penn State that requires the department head's signature. Ugh.
* `honorsdegreeinfo` has been changed to `bachelorsdegreeinfo` to reflect the fact that all Engineering Science students write a thesis, but not all graduate with honors.
* Removed the `honors` class option.
* Added the `esc` class option for Engineering Science students. This puts the department head's name on the title page and adds their sig to the signature page.
* Added the `schreyer` option properly format the title page and signature page for students in the Schreyer Honors College.
* Added deptheadtitle command for Engineering Science students.
* Added the `twoha` option for students with interdisciplinary honors and thus with two honors advisors.
* Updated and revised some of the instructions below based on the above changes.

### Version 1.4.0
* Added two documents in a "LaTeX Help" folder. They should be helpful for people who are new to LaTeX.
* Added some equations, figures, a table to Chapter 1 to provide some examples.

### Version 1.3.0
* Added the `cite` package.
* Given that the Graduate School now allows essentially any line spacing, I have moved the line space setting from psuthesis.cls to this driver file. Go ahead and make it ugly if you want. :-)
* Removed `\addtocounter{page}{-1}` after `\psutitlepage` is executed. It made the paging of the frontmatter incorrect. I can no longer remember why it was there.
* Removed `\psusigpage` since the Graduate School now provides the signature page.
* Added the command `\collegesubmittedto` to add the College in which the thesis/dissertation has been completed to the title page.
* Added instructions for documents that include a single appendix since the Graduate School just hates calling it *Appendix A* if there is a single appendix.
* Removed the `fncychap` package since I could not easily find a way to make it work with documents that have a single appendix.
* Added the `titlesec` package so that the user can make the format of the chapter titles a little less boring than LaTeX's default.

### Version 1.2.2
Added some information to the main template file regarding the use of `hyperref` with the `psuthesis` class. Thanks to Nathan Urban for pointing out the included workaround.

### Version 1.2.
* Finally reproduced and fixed the problem where the page number listed in the TOC for the Bibliography was the last page number of the Bibliography.
* Added `10pt` and `11pt` options to the document class, though I have no idea why anyone would want to use such insanely small font sizes since it will lead to line lengths that are much too long.

### Version 1.2.0
* Two additional class options have been added to support honors theses submitted to the Schreyer Honors College. These options are (see the template file for details):
	- `honors`
	- `honorsdepthead`
* I have also added the commands (see the template file for details):
	- `honorsdegreeinfo`
	- `honorsadvisor`
	- `honorsdepthead`

### Version 1.1.2
If you want to use the subfigure package with our psuthesis class file, then you must must find the following line in the psuthesis.cls file:

	\RequirePackage{tocloft}

and add the `subfigure` option. I have already set this up for you in the psuthesis.cls file to make this easy to do.

### Version 1.1.1
Added the `fncychap` package to the distribution.

### Version 1.1.0	
* The way that the thesis frontmatter and backmatter is generated has been completely re-done in order to be more intuitive.
* I have added the ability to change the title of the Dedication/Epigraph to anything you please.
* In the process of changing the format of the Table of Contents to conform to the inflexible rules of the Grad School (the word "Chapter" and "Appendix" need to appear before the number and letter, respectively), I have added an option to the class called `inlinechaptertoc` that changes the format of the Chapter/Appendix entries in the TOC. Note that the `tocloft` package is now required.
* Appendices should now start with the `\Appendix` command rather than `\chapter`. See the accompanying files for examples.
* Added information regarding the Nontechnical Abstract that is required of ESC students.
* Added the `fncychap` package for those of you who like the nice Chapter headings it provides. I like Lenny, but you don't have to use it if you don't want to. In addition, the other options are: Sonny, Glenn, Conny, Rejne, and Bjarne

### Version 1.0.4
Fixed the `\addcontentsline` entry for BibTeX within the commented out text in the Bibliography section

### Version 1.0.3
Added a `sigpage` option to conform to new Grad School requirements

### Version 1.0.2
* Issued the `\appendix` command to start the appendices
* Moved the `\addcontentsline` for the bibliography so that the bibliography now shows up on the right page in the TOC
* Added some info if you use bibtex

### Version 1.0.1
`eqlist` and `eqparbox` are now included in the archive