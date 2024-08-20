---
cate: 方法
date: 2024-08-20
tags: 
- output
- project/PaperBell
banner: "40 - Obsidian/img/方法.jpg"
longform: true
---

## 理论基础

当你需要将 `MarkDown` 笔记转化为其它格式时，首先要明白有哪些通常的做法^[感谢Obsidian for Science交流群群友皮皮的推荐]：

![MarkDown文档的导出方式类型](https://songshgeo-picgo-1302043007.cos.ap-beijing.myqcloud.com/uPic/e4MVc4.png)

其中，我尝试使用过 `Pandoc`, `obsidian-pandoc-filters` 两种方案：

- ”吹爆“的 `obsidian-pandoc-filters` 其实也是基于 “先转 `LaTeX`，再输出 `PDF`” 的核心思路。只是它用了最先进的 `LuaLaTeX`，结合漂亮的模板，的确在输出 `PDF` 的美观程度上无人能及。
- Pandoc: 文档转化的瑞士军刀，可以说是最流行的文档转化方案。不仅可以转化 `.pdf`，还可以处理很多其它格式，如 `.docx`。而它在转化为 `PDF` 的时候核心也是用了 `LaTeX` 做中转，所以爱折腾的话也能弄出漂亮格式。而且你可以自由选择编译模板、编译方式等等，所以 `PaperBell` 这里使用 `Pandoc` 作为输出工具。

## Enhancing Export

`Enhancing Export` 是一个让用户更加灵活使用 Pandoc 的 Obsidian 插件。你可以在其中预定义许多命令，并存为模板，在导出时直接调用。举例来说，示例项目中的本笔记就可以轻松被导出成PDF，如以下效果：

这里介绍一下相关参数，以便用户做定制：


| 参数                      | 默认值                                   | 参数含义                                                                                                                         |
| ----------------------- | ------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------- |
| --data-dir              | "${vaultDir}/40 - Obsidian/脚本/pandoc" | 从哪里读取Pandoc的数据文件（如模板），PaperBell提供了一个文件夹供参考，你也可以使用你自己的文件夹路径，或删掉该参数，以使用默认值。                                                    |
| --resource-path         | "${currentDir}"                       | 资源路径，可以设置多个。${currentDir} 指的是当前文件夹，PaperBell 默认从以下位置找你的附件：(1) 当前文件夹 (2) Obsidian Vault 的附件文件夹 (3) 当前文件夹下的 "img" 或 "imgs" 文件夹 |
| --bibliography          | "${vaultDir}/40 - Obsidian/mybib.bib" | 从哪里读参考文献列表（`.bib`文件），`PaperBell`这里使用和 Pandoc Reference List 插件相同的存放路径。                                                       |
| --pdf-engine            | xelatex                               | 可选：xelatex, pdflatex, lualatex。建议 xelatex 对中文支持最友好。                                                                          |
| --template              | eisvogel                              | 使用的 [[#LaTeX 模板]]，板名称一定要在 --data-dir 参数路径下的 templates 文件夹中以 `.latex` 的后缀名存在。`eisvogel` 是 `PaperBell` 提供的模板。                  |
| reference-section-title | References                            | 参考文献小节的标题                                                                                                                    |
| --listings              |                                       | 允许处理代码块格式                                                                                                                    |
| --number-sections       |                                       | 小节标题带序号                                                                                                                      |

>[!note]
> 本手册无法穷极所有功能，具体的细节请参考 [Pandoc 的相关文档](https://pandoc.org/MANUAL.html)。

## LaTeX 模板

`PaperBell` 提供了一个导出模板 “eisvogel”，这是基于一个流行的 [pandoc-to-latex 模板](https://github.com/Wandmalfarbe/pandoc-latex-template) 改编的中文适配版。你也可以[参考这里](https://pandoc.org/MANUAL.html#templates)定制你自己的模板，存放在 `40 - Obsidian/脚本/pandoc/templates` 文件夹中，然后使用 `--template=<模板名>` 命令来调用。
