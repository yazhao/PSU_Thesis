# psuthesis.cls Change History
This is the change history for the psuthesis.cls file. It was moved from that file to this separate markdown document on July 10, 2019.

### Version 2.9.2
There were still broken things in both the frontmatter and mainmatter of the typeset document. In particular, the placement of page numbers was not consistent and running heads were included when they are explicitly forbidden by the Graduate School. This has now (hopefully) been fixed. It was fixed by commenting out a few lines in the class file and adding some very important lines to the template file. I haven't done extensive testing, but this appears to also fix undergraduate theses. If you would like to include running heads in an undergraduate thesis, you may do so by redefining `\fancyhead` in the fancyhdr package. [2019/07/10]

### Version 2.9.1
The `\Appendix` command I defined a long time ago did not include an optional short title argument like the `\chapter` command has. A user needed this, so he implemented it in my class file and sent me the changes so that I could include. A big thank you to Henry Gebhardt for doing this and sharing with me his changes so that I could include them. [2019/07/09]

### Version 2.9.0
More persnicketiness at The Graduate School. They now want *Dissertation Advisor* and *Chair of Committee* on two separate lines on the Committee Page. This one took some work to fix. I have added the `twoopt` package to make this happen and have redefined the `\advisor` command to have two optional arguments. See the main driver file for an example.

My previous implement of the `geometry` package turned out to be complete nonsense because I redefined some layout parameters subsequent to the initial layout definitions. This has now been fixed. If you want to change the page margins, use the `\newgeometry{⟨options⟩}` command in the driver file. [2019/06/27]

### Version 2.8.0
I have finally transitioned to using the `geometry` package. [2019/03/26]

### Version 2.7.2
Simon is now in this class. 0 credits. Grade: F [Fall 2018 LaTeX Class]

### Version 2.7.1
I mistakenly had `\psu@advisor` and `\psu@advisortitle` where I should have had `\psu@honorsadvisor` and `\psu@honorsadvisortitle` in three places. Now fixed. [2018/03/27]

### Version 2.7.0
I made substantial changes to the title page and signature that are generated for bachelors theses.

* `honorsdepthead` has been changed to `escdepthead` since Engineering Science is the only degree at Penn that requires the department head's signature. Ugh.
* `honorsdegreeinfo` has been changed to `bachelorsdegreeinfo` to reflect the fact that all Engineering Science students write a thesis, but not all graduate with honors.
* Removed the `honors` class option.
* Added the `esc` class option for Engineering Science students. This puts the department head's name on the title page and adds their sig to the signature page.
* Added the `schreyer` option properly format the title page and signature page for students in the Schreyer Honors College.
* Added `deptheadtitle` command for Engineering Science students.
* Added the `twoha` option for students with interdisciplinary honors and thus with two honors advisors.
* Removed the boolean `psu@escdepthead` since it is no longer used.

### Version 2.5.0
* Updated the class file to adjust for the change the Honors College made a few years ago regarding the page and signature page.
* The title page has removed signature spots for the honors option and the class now generates a separate unnumbered signature page that corresponds to the formatting dictated by the Honors College.
* Added the option to include the title of the Honors advisor.
* Changed the spelling of "adviser" to "advisor" everywhere for consistency. The Honors College used the version with the "e", which I find offensive.

### Version 2.4.0
* Given that the Graduate School now allows essentially any line spacing, I have moved the line space setting from psuthesis.cls to this driver file. Go ahead and make it ugly if you want. :-)
* Removed `\psusigpage` since the Graduate School now provides the signature page.
* Added the command `\collegesubmittedto` to add the College in which the thesis/dissertation has been completed to the title page.
* Now load the `textcase` package to deal with the capitalization of the `\documenttype` on the committee page.

### Version 2.3.2
Changed the implementation of the `tocloft` package to remove the "black boxes'' about which I got so many queries. It still isn't perfect, but it is better than it was before. Note that chapter titles that take two lines or more in the TOC now have hanging indents. I haven't been able to eliminate this, but I kind of like it, so I am leaving it as is (for now).

### Version 2.3.1
Added `10pt` and `11pt` options to the document class, though I have no idea why anyone would want to use such insanely small font sizes since it will lead to line lengths that are much too long.

### Version 2.3.0
Made substantial changes to the psuthesis.cls file since the `draft` option was not being passed to the `book` class. The change I made also prevents users from loading options that are not "recommended''. I want to thank Jared Craig Ahern for pointing out this problem and suggesting the fix.

### Version 2.2.0
Two additional class options have been added to support honors theses submitted to the Schreyer Honors College. These options are:

* `honors`
* `honorsdepthead`
* I have also added the commands:
	- `honorsdegreeinfo`
    - `honorsadvisor`
    - `honorsdepthead`

See the driver file for details on these options and commands.

### Version 2.1.2
Added a note both in the psuthesis.cls file and in the template file for users wanted to implement the `subfigure` package. That is, if you want to use the `subfigure` package you need to add an option when the `tocloft` package is loaded.

### Version 2.1.1
Fixed a bug, introduced in 2.1.0, that prevented any entries from appearing the List of Figures. :-)

### Version 2.1.0
Class now requires the `tocloft` package to format the TOC to correspond to PSU Grad School requirements.

* Added the `\Appendix` command to work around a quirk in LaTeX that makes `\addtocontents` not work well with `\include`.
* Eliminated a ton of booleans associated with the management of the frontmatter. This makes the frontmatter more intuitive, but it also presents you with the noose with which you can hang yourself. Sorry.
* Added the `inlinechaptertoc` option to the class. Allows for an alternate TOC format for Chapter and Appendix entries.
* There is no longer a `sigpage` option for the class.

### Version 2.0.5
Updated the signature page and added a committee page to conform to the new grad school requirement.

* There is now a `sigpage` option for the signature page (it can be turned off) and the standard now does not have signatures.
* Fixed problem with TOC page numbers of List of Figures, List of Tables, etc.
* Cleaned up a few things, especially the boolean logic for the degree type.

Version 2.0.5 owes a debt to Penn State graduate student Nils Krahnstoever who sent me a list of bugs along with some excellent suggestions.

### Version 2.0.4
Changed the alignment of "Date of Signature" text

### Version 2.0.3
Fixed the invocation of `\psu@title` to allow for `\\` line breaks. The `\MakeUppercase` command originally was not, for some reason, working. Unfortunately, I had to resort to some TeX primitives.

### Version 2.0.2
Added vita to `bs` and `ba` option for the Schreyer's Honors College.

### Version 2.0.1
* No longer include the abstract in the TOC.
* Double space the title on the title page.