# WzuCourseThesis-zsr

温州大学硕士课程论文 LaTeX 模板。模板按温州大学硕士课程论文 Word 模板制作，包含封面、目录、正文、公式、图表、参考文献和附代码示例，适合应用统计专业研究生课程论文写作。

维护联系邮箱：`zsrnog@yeah.net`

GitHub 仓库：`https://github.com/ZSRNOG/WzuCourseThesis-zsr`

## 特点

- 使用 `XeLaTeX + biber` 编译，适合中文课程论文。
- 封面信息集中写在 `front/metadata.tex`，日常使用不需要改类文件。
- 封面校名使用截图素材，课程名、题目、信息栏和日期按 Word 模板风格设置。
- 参考文献使用 GB/T 7714-2015 样式。
- 示例正文包含应用统计常用数学公式、模型写法、图表、代码和参考文献引用方法。

## 文件结构

```text
.
├── thesis.tex                 # 主入口文件
├── wzu-course-thesis.cls      # 模板类文件
├── assets/
│   └── wzu-school-name.png    # 封面校名截图
├── front/
│   └── metadata.tex           # 封面信息
├── chapters/                  # 正文内容
└── bib/
    └── references.bib         # BibTeX 参考文献库
```

## 快速编译

在模板目录中运行：

```powershell
latexmk -xelatex thesis.tex
```

生成文件为当前目录下的 `thesis.pdf`。

如果不用 `latexmk`，可以手动编译：

```powershell
xelatex thesis.tex
biber thesis
xelatex thesis.tex
xelatex thesis.tex
```

清理辅助文件：

```powershell
latexmk -c thesis.tex
```

## 修改封面信息

封面字段都在 `front/metadata.tex` 中修改，例如：

```tex
\wzucoursesetup{
  course = {时间序列分析},
  title = {基于状态空间模型的居民消费指数预测研究},
  college = {数理学院},
  major = {应用统计},
  author = {张三},
  student-id = {2024260101},
  advisor = {李四},
  date = {2026 年 6 月 16 日}
}
```

封面顶部“温州大学”使用 `assets/wzu-school-name.png`。如需替换校名截图，可以保持文件名不变，或在 `front/metadata.tex` 中增加：

```tex
school-image = {assets/your-school-name.png},
```

## 正文写作

- 正文内容：修改 `chapters/*.tex`。
- 章节顺序：在 `thesis.tex` 中调整 `\include{...}` 顺序。
- 附代码：修改或删除 `chapters/04-code.tex`。
- 参考文献：修改 `bib/references.bib`。

模板默认按课程论文常见结构组织：

```tex
\include{chapters/01-introduction}
\include{chapters/02-stat-models}
\include{chapters/03-writing-guide}
\include{chapters/04-code}
```

## 数学公式

模板已加载 `amsmath`、`amssymb`、`mathtools`、`bm`、`siunitx` 等常用宏包，并预定义了应用统计写作中常用的命令：

```tex
\Vector{x}
\Matrix{X}
\E
\Var
\Cov
\Prob
\argmin
\argmax
\logit
\diag
```

示例正文包含线性回归、岭回归、Logistic 回归、ARMA/SARIMA、状态空间模型、卡尔曼滤波、贝叶斯层级模型、Bootstrap 置信区间和定理证明。

## 图表

插入图片示例：

```tex
\begin{figure}[htbp]
  \centering
  \includegraphics[width=0.75\textwidth]{assets/demo.png}
  \caption{模型流程示意图}
  \label{fig:workflow}
\end{figure}
```

插入表格示例：

```tex
\begin{table}[htbp]
  \centering
  \caption{变量说明}
  \begin{tabular}{lll}
    \toprule
    变量 & 含义 & 类型 \\
    \midrule
    y & 因变量 & 数值型 \\
    x & 自变量 & 数值型 \\
    \bottomrule
  \end{tabular}
  \label{tab:variables}
\end{table}
```

正文中引用图表建议使用：

```tex
如 \cref{fig:workflow} 所示。
```

## 参考文献

参考文献条目写在 `bib/references.bib` 中，正文用 `\cite{key}` 引用。模板使用 `biblatex-gb7714-2015`，输出格式为 GB/T 7714-2015。

单篇文献引用：

```tex
\cite{box2015time}
```

多篇文献引用：

```tex
\cite{box2015time,gelman2013bayesian,rmanual2026}
```

BibTeX 条目示例：

```bibtex
@book{box2015time,
  author    = {Box, George E. P. and Jenkins, Gwilym M. and Reinsel, Gregory C. and Ljung, Greta M.},
  title     = {Time Series Analysis: Forecasting and Control},
  edition   = {5},
  location  = {Hoboken},
  publisher = {Wiley},
  year      = {2015}
}

@article{demo2026,
  author  = {王一帆 and 赵明},
  title   = {应用统计模型的稳健估计方法},
  journal = {统计研究},
  year    = {2026},
  volume  = {43},
  number  = {6},
  pages   = {1-12}
}
```

## 国内安装 TeX Live

推荐安装完整 TeX Live，不建议只安装精简版，否则中文字体、参考文献样式或宏包可能缺失。

1. 进入国内镜像站：
   - 清华大学开源软件镜像站：`https://mirrors.tuna.tsinghua.edu.cn/CTAN/systems/texlive/Images/`
   - 中科大开源软件镜像站：`https://mirrors.ustc.edu.cn/CTAN/systems/texlive/Images/`
2. 下载最新的 `texliveYYYY.iso`，其中 `YYYY` 为年份。
3. Windows 下右键挂载 ISO，运行 `install-tl-windows.bat`。
4. 安装方案选择默认完整安装。
5. 安装完成后打开新的 PowerShell，检查：

```powershell
xelatex --version
biber --version
latexmk --version
```

如果命令找不到，通常是环境变量没有刷新。重启终端或重启电脑后再试。

## 国内安装 TeXstudio

TeXstudio 是常用 LaTeX 编辑器，适合配合 TeX Live 使用。

1. 下载 TeXstudio：
   - 官方网站：`https://www.texstudio.org/`
   - GitHub Releases：`https://github.com/texstudio-org/texstudio/releases`
2. 安装后打开 TeXstudio。
3. 进入 `选项 -> 设置 TeXstudio -> 构建`。
4. 推荐设置：
   - 默认编译器：`XeLaTeX`
   - 默认文献工具：`Biber`
   - 默认构建命令：可选择 `txs:///xelatex | txs:///biber | txs:///xelatex | txs:///xelatex`
5. 打开 `thesis.tex`，点击构建按钮即可编译。

如果中文无法显示或编译失败，先确认 TeXstudio 调用的是 TeX Live 中的 `xelatex.exe`，不是其他旧发行版。

## 常见问题

### 为什么必须用 XeLaTeX？

模板使用 `ctex`、系统中文字体和 `fontspec`，需要 XeLaTeX。不要使用 pdfLaTeX。

### 参考文献没有显示怎么办？

确认至少运行过一次 `biber thesis`。推荐直接运行：

```powershell
latexmk -xelatex thesis.tex
```

### 如何添加额外宏包？

在 `thesis.tex` 导言区添加，例如：

```tex
\usepackage{mhchem}
\usepackage{pgfplots}
```

如果宏包会影响全局版式，再考虑写入 `wzu-course-thesis.cls`。

### 如何调整封面位置？

封面版式在 `wzu-course-thesis.cls` 的 `\makewzucoursecover` 中用 TikZ 绝对定位。如果只改论文信息，优先修改 `front/metadata.tex`，不要改类文件。

## 维护者

维护联系邮箱：`zsrnog@yeah.net`
