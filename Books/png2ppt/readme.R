

# 这个模板用来将一批图片批量地转换成Power Point幻灯片。
# 标题(title)、作者、日期等都可以修改。
# 要求待转换的图片存放在figures子目录中，
# 以.png, .PNG, .jpg, .JPG截尾，
# 且文件名的次序符合要插入的次序。
# figures子目录中已经存放了样例图片，
# 自己使用时应删除样例图片。
#
# 只要运行此R源文件，就可以得到pptout.pptx文件作为输出结果。

yaml <- "---
title: 多张图片组成的幻灯片
author: 李东风
date: 2020-02-09
---"

bfhead <- "\n```{r, echo=FALSE\"}"

fout <- file("pptout.Rmd", "wt", encoding="UTF-8")
writeLines(yaml, con=fout)
figs <- list.files("figures", pattern="*.png$|*.PNG$|*.jpg$|*.JPG$")
figs <- sort(figs)

if(length(figs) > 0){
  for(f in figs){
    writeLines(bfhead, con=fout)
    incl <- paste0("knitr::include_graphics(\"",
                   file.path("figures", f), "\")")
    writeLines(incl, con=fout)
    writeLines("```\n", con=fout)
  } 
} else {
    writeLines("```{r, echo=FALSE}", con=fout)
    writeLines("cat(\"figures子目录中没有png或者jpg文件！\")", con=fout)
    writeLines("```\n", con=fout)
}
close(fout)

## 编译pptout.Rmd为pptout.pptx:

rmarkdown::render("pptout.Rmd", 
  output_format="powerpoint_presentation", 
  encoding="UTF-8")

