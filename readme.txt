Bookdown Sample软件包说明书
=================================

本软件包是R软件、RStudio软件支持下，
借助于R的knitr、rmarkdown、bookdown等扩展包，
进行中文图书、论文、简单报告、幻灯片撰写的模板。
用户在展开打包的zip文件后，
只要复制Books中的某个模板子目录，
建立一个对应的RStudio项目，
对模板的内容进行修改，
就可以很容易地转换成HTML、Word、PDF、幻灯片等格式。
模板的目的是固定了一些常用的设置，
如果初学者自己去看资料学习如何设置
则往往花费很多精力而且一旦有错误也很难解决。

Rmarkdown和bookdown在转换网页格式的输出时，
如果结果有数学公式，
会使用MathJax软件包来显示公式；
这个软件包是远程的一个Javascript程序库，
在断网或者网络不够通畅时转换的网页结果中的数学公式不能正常显示。
所以本软件包中包含了MathJax程序库的一个副本，
但是Rmd文件中访问这个库使用了相对路径，
所以所有的模板在使用时，
只能在Books子目录中原地复制并修改子目录名后使用，
而不能复制到其它子目录中使用。

模板中的.Rmd文件是内容文件，
用户通过在RStudio中建立与模板所在子目录对应的项目，
然后修改.Rmd内容为自己所需内容，
就可以转换为各种输出格式。

注意，.Rmd文件的开头两个仅包含三个减号的行中间的部分是参数设置，
除了其中的标题（title）、作者名（author）、日期（date）需要修改以外都不要修改，
即使是一个空格也不要改，
否则就可能无法工作。

转换可以通过RStudio的Knit快捷图标或者Build窗格的快捷图标进行，
也可以通过在RStudio的Console中提交编译命令进行转换，
后者更为可靠。
所需命令在每个模板中都有说明。


软件包中在Books子目录下有如下的模板：

* Rmarkdown: 这是中文的R Markdown文件的简单模板，
  其中report.Rmd的文件是内容，
  另外的`_output.yml`、`_header.html`
  和`preamble.tex`文件是一些辅助设置。
  可转换为HTML、Word和PDF格式。
  可以复制report.Rmd产生多个副本，分别修改，
  得到多个结果文件。
* CBook：这是利用bookdown扩展包进行中文图书写作的模板。
  支持将中文书转换为gitbook格式的网页文件，
  以及基于LaTeX的单个PDF输出。
  多个.Rmd文件都是同一本数的内容。
  用法见其中的`0101-usage.Rmd`。
* CArticle: 这是bookdown扩展包进行中文论文或者技术报告写作的模板，
  其中的内容文件仅有一个`index.Rmd`，
  其它文件都是辅助设置文件。
  用法在`index.Rmd`中。
* Slides: 这是用rmarkdown扩展包编写幻灯片的模板，
  幻灯片为HTML文件，在网络浏览器中播放。
  称为Slidy幻灯片。
  内容文件为`slides.Rmd`，
  其它的`_output.yml`、`_header.html`文件是设置文件。
  可以复制slides.Rmd为多个副本，
  分别修改，产生多个幻灯片文件。
* png2ppt: 可以将一批PNG或者Jpeg文件转化成一个Power Point幻灯片。
  将带转换的图片文件存放在此子目录的figures子目录中，
  然后运行其中的"readme.R"源程序，
  就可以得到转换结果pptout.pptx文件。
* SiteRmd:
  用`rmarkdown::render_site()`命令生成简单网站的样例。
  `index.Rmd`是主页面源文件，
  其它Rmd文件是内容源文件， 
  `_site.yml`是网站设置文件。 

  

