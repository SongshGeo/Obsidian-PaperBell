---
cate: 方法
date: 2024-05-14
tags:
  - output
  - project/PaperBell
banner: "40 - Obsidian/img/方法.jpg"
---

根据 `PaperBell` 的[[设计理念]]，我们提倡将笔记分为[[设计理念#输入资料|输入资料]]、[[设计理念#日常记录|日常记录]]、和[[设计理念#输出笔记|输出笔记]]三大类，本文主要讨论如何利用 `PaperBell` 更好地整理**输入资料**的笔记。

> [!info] 相关资料
> - 日常记录：[[使用PaperBell进行日常记录]]
> - 输出笔记：[[使用PaperBell整理输出笔记]]

## 论文阅读笔记

在 Zotero 中阅读论文，并按照这样的格式进行高亮批注，`PaperBell`将自动整理它们：

![[阅读论文标注方法.png]]

> [!info] 转换后的笔记示例
> 查看改论文高亮转换后的示例笔记：[[社会—生态系统适应性治理研究进展与展望]]

Zotero 里条目带的标签也会被根据以下规则转换：

- **阅读进展标签**：有几种标签被我用来指示阅读进度 “浏览”，“初读”，“精读”，“to-read”，导入论文笔记时，这些标签会被自动划分为笔记的“read”属性。
- **文献来源标签**：有几种标签被我用来指示文献来源 “更新”，“推荐”，“检索”，“关联”，导入论文笔记时，这些标签会被自动划分为笔记的“source”属性。
- **星标标记**：标签 “星标” 代表一个重要文献，带有这个标签的文献笔记会自动勾选 “important” 复选框 ☑️
- `#`标签：任何以 `#` 符号开头的标签都会被作为文献笔记的 “tags” 属性保存，一个常见的应用场景是，在 Zotero 里阅读文献并标记上 `#projectA` 指示这个文献可能对自己的某个项目有参考价值。在导入后，该文献笔记就会自动被项目 `#projectA` 所检索到。
- **其它概念标签**：其余所有 Zotero 条目里的标签，会被储存进文献笔记的 “concepts” 属性里，概念卡片里的笔记会根据该属性，自动关联相关的论文。

> [!tip] 小贴士
> 推荐使用 Zotero 的 [`Zotero-Style` 插件](https://github.com/MuiseDestiny/zotero-style)，可以对 `#` 标签和其它概念标签分开渲染，并提供和 Obsidian 保持一致的嵌套标签功能。

## 增加图书笔记

按 `Command(ctrl) + P` 触发 Obsidian 的命令行窗口，输入 `QuickAdd: 豆瓣读书` 可以触发命令，依照提示输入信息即可。
## 增加学者档案

按 `Command(ctrl) + P` 触发 Obsidian 的命令行窗口，输入 `QuickAdd: 添加学者` 可以触发命令，依照提示输入信息即可。

## 增加机构档案

按 `Command(ctrl) + P` 触发 Obsidian 的命令行窗口，输入 `QuickAdd: 添加机构` 可以触发命令，依照提示输入信息即可。

## 增加术语卡片

按 `Command(ctrl) + P` 触发 Obsidian 的命令行窗口，输入 `QuickAdd: 添加术语` 可以触发命令，依照提示输入信息即可。

> [!tip] 小贴士
> 如果该概念有别名，可以在创建好卡片笔记后，为笔记的 `aliases` 属性增加别名，那么在关联该概念卡片所有的检索中，中文翻译和别名都会被考虑在内。
> 
> 如术语 “social-ecological system”，中文一般译为“社会-生态系统”，也有别名“socio-ecological system”...

## 收藏网页文章

[Cubox](https://cubox.pro/) 是一个高亮阅读器，提供剪藏网页、高亮、批注等功能，通过[自定义快捷动作](https://help.cubox.pro/reader/3b06/)可以将批注和高亮内容自动转发到 Obsidian.

> [!info] 相关资料
> 下面是我常用的一个快捷动作链接，仅供参考：
> `obsidian://advanced-uri?vault=这里替换成你的仓库名&filepath=/Inputs/Cubox/[card_title].md&mode=overwrite&data=[annote_markdown]%0A%5BCubox%20Link%5D%28[cubox_url]%29`
