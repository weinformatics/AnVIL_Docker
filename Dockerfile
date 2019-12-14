# wilistr
FROM rocker/tidyverse:3.6.1 
MAINTAINER cailiangliang765@163.com

RUN apt update -y && apt upgrade -y && apt -y install libglu1-mesa-dev jags libmagick++-dev

# 加入R心愿单包，持续加入
#Install from GitHub repository
RUN R -e 'options("repos" = c(CRAN="https://mirrors.tuna.tsinghua.edu.cn/CRAN/")); options(BioC_mirror="https://mirrors.tuna.tsinghua.edu.cn/bioconductor"); install.packages("BiocManager")'
RUN R -e 'options("repos" = c(CRAN="https://mirrors.tuna.tsinghua.edu.cn/CRAN/")); options(BioC_mirror="https://mirrors.tuna.tsinghua.edu.cn/bioconductor"); BiocManager::install(ask=FALSE)'
RUN R -e 'options("repos" = c(CRAN="https://mirrors.tuna.tsinghua.edu.cn/CRAN/")); options(BioC_mirror="https://mirrors.tuna.tsinghua.edu.cn/bioconductor"); BiocManager::install("maftools")'
RUN apt install libbz2-dev liblzma-dev libxt-dev -y #安装ChAMP需要
RUN R -e 'options("repos" = c(CRAN="https://mirrors.tuna.tsinghua.edu.cn/CRAN/")); options(BioC_mirror="https://mirrors.tuna.tsinghua.edu.cn/bioconductor"); BiocManager::install("ChAMP")'
RUN R -e 'options("repos" = c(CRAN="https://mirrors.tuna.tsinghua.edu.cn/CRAN/")); options(BioC_mirror="https://mirrors.tuna.tsinghua.edu.cn/bioconductor"); BiocManager::install("openxlsx")'
RUN R -e 'options("repos" = c(CRAN="https://mirrors.tuna.tsinghua.edu.cn/CRAN/")); options(BioC_mirror="https://mirrors.tuna.tsinghua.edu.cn/bioconductor"); BiocManager::install("officer")'
RUN R -e 'options("repos" = c(CRAN="https://mirrors.tuna.tsinghua.edu.cn/CRAN/")); options(BioC_mirror="https://mirrors.tuna.tsinghua.edu.cn/bioconductor"); BiocManager::install("rvg")'
RUN R -e 'options("repos" = c(CRAN="https://mirrors.tuna.tsinghua.edu.cn/CRAN/")); options(BioC_mirror="https://mirrors.tuna.tsinghua.edu.cn/bioconductor"); BiocManager::install("RTCGAToolbox")' # 分析TCGA数据
RUN R -e 'options("repos" = c(CRAN="https://mirrors.tuna.tsinghua.edu.cn/CRAN/")); options(BioC_mirror="https://mirrors.tuna.tsinghua.edu.cn/bioconductor"); BiocManager::install("pheatmap")' #制作热图
RUN R -e 'options("repos" = c(CRAN="https://mirrors.tuna.tsinghua.edu.cn/CRAN/")); options(BioC_mirror="https://mirrors.tuna.tsinghua.edu.cn/bioconductor"); BiocManager::install("VennDiagram")' #制作韦恩图
RUN R -e 'options("repos" = c(CRAN="https://mirrors.tuna.tsinghua.edu.cn/CRAN/")); options(BioC_mirror="https://mirrors.tuna.tsinghua.edu.cn/bioconductor"); BiocManager::install("rcompanion")'
RUN R -e 'options("repos" = c(CRAN="https://mirrors.tuna.tsinghua.edu.cn/CRAN/")); options(BioC_mirror="https://mirrors.tuna.tsinghua.edu.cn/bioconductor"); BiocManager::install("iheatmapr")' #20190811加入
RUN R -e 'options("repos" = c(CRAN="https://mirrors.tuna.tsinghua.edu.cn/CRAN/")); options(BioC_mirror="https://mirrors.tuna.tsinghua.edu.cn/bioconductor"); BiocManager::install("conumee")'
RUN R -e 'options("repos" = c(CRAN="https://mirrors.tuna.tsinghua.edu.cn/CRAN/")); options(BioC_mirror="https://mirrors.tuna.tsinghua.edu.cn/bioconductor"); BiocManager::install("TCGAbiolinks")'
# R饼图版气泡图20191022
RUN R -e 'options("repos" = c(CRAN="https://mirrors.tuna.tsinghua.edu.cn/CRAN/")); options(BioC_mirror="https://mirrors.tuna.tsinghua.edu.cn/bioconductor"); BiocManager::install("gtable")'
RUN R -e 'options("repos" = c(CRAN="https://mirrors.tuna.tsinghua.edu.cn/CRAN/")); options(BioC_mirror="https://mirrors.tuna.tsinghua.edu.cn/bioconductor"); BiocManager::install("ggplot2")'
RUN R -e 'options("repos" = c(CRAN="https://mirrors.tuna.tsinghua.edu.cn/CRAN/")); options(BioC_mirror="https://mirrors.tuna.tsinghua.edu.cn/bioconductor"); BiocManager::install("tidyr")'
RUN R -e 'options("repos" = c(CRAN="https://mirrors.tuna.tsinghua.edu.cn/CRAN/")); options(BioC_mirror="https://mirrors.tuna.tsinghua.edu.cn/bioconductor"); BiocManager::install("tibble")'
RUN R -e 'options("repos" = c(CRAN="https://mirrors.tuna.tsinghua.edu.cn/CRAN/")); options(BioC_mirror="https://mirrors.tuna.tsinghua.edu.cn/bioconductor"); BiocManager::install("ggimage")'
RUN R -e 'options("repos" = c(CRAN="https://mirrors.tuna.tsinghua.edu.cn/CRAN/")); options(BioC_mirror="https://mirrors.tuna.tsinghua.edu.cn/bioconductor"); BiocManager::install("ggrepel")'
# ggstatsplot的构建时间特别长，因此放到最后
RUN R -e 'options("repos" = c(CRAN="https://mirrors.tuna.tsinghua.edu.cn/CRAN/")); options(BioC_mirror="https://mirrors.tuna.tsinghua.edu.cn/bioconductor"); BiocManager::install("remotes")'
RUN R -e 'options("repos" = c(CRAN="https://mirrors.tuna.tsinghua.edu.cn/CRAN/")); options(BioC_mirror="https://mirrors.tuna.tsinghua.edu.cn/bioconductor"); install.packages("ggstatsplot")'

# 计算方差齐性需要car包，http://www.weinformatics.cn/r%e8%af%ad%e8%a8%80-%e6%96%b9%e5%b7%ae%e5%88%86%e6%9e%90/
RUN R -e 'options("repos" = c(CRAN="https://mirrors.tuna.tsinghua.edu.cn/CRAN/")); options(BioC_mirror="https://mirrors.tuna.tsinghua.edu.cn/bioconductor"); BiocManager::install("car")'
# R语言-UpSetR高级韦恩图制作
RUN R -e 'options("repos" = c(CRAN="https://mirrors.tuna.tsinghua.edu.cn/CRAN/")); options(BioC_mirror="https://mirrors.tuna.tsinghua.edu.cn/bioconductor"); BiocManager::install("UpSetR")'
# 扩展rstudio addins的功能，参见daattali/addinslist
RUN R -e 'options("repos" = c(CRAN="https://mirrors.tuna.tsinghua.edu.cn/CRAN/")); options(BioC_mirror="https://mirrors.tuna.tsinghua.edu.cn/bioconductor"); BiocManager::install("esquisse")'
RUN R -e 'options("repos" = c(CRAN="https://mirrors.tuna.tsinghua.edu.cn/CRAN/")); options(BioC_mirror="https://mirrors.tuna.tsinghua.edu.cn/bioconductor"); BiocManager::install("addinslist")'
RUN R -e 'options("repos" = c(CRAN="https://mirrors.tuna.tsinghua.edu.cn/CRAN/")); options(BioC_mirror="https://mirrors.tuna.tsinghua.edu.cn/bioconductor"); BiocManager::install("colourpicker")'
RUN R -e 'options("repos" = c(CRAN="https://mirrors.tuna.tsinghua.edu.cn/CRAN/")); options(BioC_mirror="https://mirrors.tuna.tsinghua.edu.cn/bioconductor"); BiocManager::install("ggedit")'
RUN R -e 'options("repos" = c(CRAN="https://mirrors.tuna.tsinghua.edu.cn/CRAN/")); options(BioC_mirror="https://mirrors.tuna.tsinghua.edu.cn/bioconductor"); BiocManager::install("ggExtra")'
RUN R -e 'options("repos" = c(CRAN="https://mirrors.tuna.tsinghua.edu.cn/CRAN/")); options(BioC_mirror="https://mirrors.tuna.tsinghua.edu.cn/bioconductor"); BiocManager::install("citr")'
RUN R -e 'options("repos" = c(CRAN="https://mirrors.tuna.tsinghua.edu.cn/CRAN/")); options(BioC_mirror="https://mirrors.tuna.tsinghua.edu.cn/bioconductor"); BiocManager::install("styler")'
RUN R -e 'options("repos" = c(CRAN="https://mirrors.tuna.tsinghua.edu.cn/CRAN/")); options(BioC_mirror="https://mirrors.tuna.tsinghua.edu.cn/bioconductor"); BiocManager::install("testthis")'
# GDCRNATools http://www.biotrainee.com/thread-2456-1-1.html
RUN R -e 'options("repos" = c(CRAN="https://mirrors.tuna.tsinghua.edu.cn/CRAN/")); options(BioC_mirror="https://mirrors.tuna.tsinghua.edu.cn/bioconductor"); BiocManager::install("GDCRNATools")'
# add dnet
RUN R -e 'options("repos" = c(CRAN="https://mirrors.tuna.tsinghua.edu.cn/CRAN/")); options(BioC_mirror="https://mirrors.tuna.tsinghua.edu.cn/bioconductor"); BiocManager::install("dnet")'
# add ELMER 参见case 4 http://www.bioconductor.org/packages/release/bioc/vignettes/TCGAbiolinks/inst/doc/casestudy.html
RUN R -e 'options("repos" = c(CRAN="https://mirrors.tuna.tsinghua.edu.cn/CRAN/")); options(BioC_mirror="https://mirrors.tuna.tsinghua.edu.cn/bioconductor"); BiocManager::install("ELMER")'
# add sesame 参见case 4 http://www.bioconductor.org/packages/release/bioc/vignettes/TCGAbiolinks/inst/doc/casestudy.html
RUN R -e 'options("repos" = c(CRAN="https://mirrors.tuna.tsinghua.edu.cn/CRAN/")); options(BioC_mirror="https://mirrors.tuna.tsinghua.edu.cn/bioconductor"); BiocManager::install("sesame")'
# 添加用户用于云计算，这个板块是添加用户专用
# RUN useradd --create-home --no-log-init --shell /bin/bash mynewuser
# RUN adduser mynewuser sudo
# RUN echo 'mynewuser:123456' | chpasswd
RUN useradd --create-home --no-log-init --shell /bin/bash mynewuser1
RUN adduser mynewuser1 sudo
RUN echo 'mynewuser1:1293456' | chpasswd

RUN useradd --create-home --no-log-init --shell /bin/bash mynewuser2
RUN adduser mynewuser2 sudo
RUN echo 'mynewuser2:1234506' | chpasswd

RUN useradd --create-home --no-log-init --shell /bin/bash mynewuser3
RUN adduser mynewuser3 sudo
RUN echo 'mynewuser3:1523456' | chpasswd

RUN useradd --create-home --no-log-init --shell /bin/bash mynewuser4
RUN adduser mynewuser4 sudo
RUN echo 'mynewuser4:123456' | chpasswd

RUN useradd --create-home --no-log-init --shell /bin/bash mynewuser5
RUN adduser mynewuser5 sudo
RUN echo 'mynewuser5:123456' | chpasswd

RUN useradd --create-home --no-log-init --shell /bin/bash mynewuser6
RUN adduser mynewuser6 sudo
RUN echo 'mynewuser6:1253456' | chpasswd

RUN useradd --create-home --no-log-init --shell /bin/bash mynewuser7
RUN adduser mynewuser7 sudo
RUN echo 'mynewuser7:1234556' | chpasswd

RUN useradd --create-home --no-log-init --shell /bin/bash mynewuser8
RUN adduser mynewuser8 sudo
RUN echo 'mynewuser8:123456' | chpasswd

RUN useradd --create-home --no-log-init --shell /bin/bash mynewuser9
RUN adduser mynewuser9 sudo
RUN echo 'mynewuser9:1233456' | chpasswd
