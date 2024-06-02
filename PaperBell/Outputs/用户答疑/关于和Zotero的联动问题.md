---
cate: 方法
date: 2024-06-12
tags:
  - output
  - project/PaperBell
banner: "40 - Obsidian/img/方法.jpg"
---

## 如何配置和Zotero的联动？

`PaperBell` 在1.0版本依赖 `Zotero Integration` 插件，在2.0版本依赖 `Zotlit` 插件。这两个插件都是为了让 Obsidian 和 Zotero 之间的联动更加方便。首先确认你的 `PaperBell` 参考的是哪个版本，然后按照对应插件的官方文档进行配置：

- [Zotero Integration GitHub 地址](https://github.com/mgmeyers/obsidian-zotero-integration)
- [ZotLit 教程](https://zotlit.aidenlx.top/zh-CN)

我个人认为后者更强大（要不然咱从 1.0 更新到 2.0 换工具了呢），也是咱们 `PKMer` 国内大佬 [AidenLx](https://github.com/aidenlx) 开发的，也有很好的中文教程，照着配置就好！

## 如何引用文献？

`PaperBell` 实现在 `Obsidian` 中引用文献的功能依赖于 [obsidian-pandoc-reference-list](https://github.com/mgmeyers/obsidian-pandoc-reference-list)插件，本质上是依赖于 `pandoc` 和 `BibTex` 的。前者是一种格式导入/导出的开源工具，后者是一套广为接受的参考文献引用系统。

前者基本可以不管，但我认为有必要对 `BibTex` 做简要了解。因为你的 `Zotero` 或其它参考文献软件进行导入/导出时，基本都是用这种格式进行数据交换。

- [BibTeX简单介绍](https://blog.ciaran.cn/2018/02/15/BibTeX%E7%AE%80%E5%8D%95%E4%BB%8B%E7%BB%8D/#:~:text=BibTex%20%E6%98%AF%E4%B8%80%E4%B8%AA%E7%94%A8%E4%BA%8E,BibTeX%E5%81%9A%E5%BC%95%E7%94%A8%E7%9A%84%E7%AE%A1%E7%90%86%E3%80%82)

> [!question]
> 
> Q: 如果我刚把一个文献通过浏览器插件导入zotero，它似乎没法很快在obsidian中用`[@`的方式引用。
> 
> A: `Zotero` 插件 `Better bibtex` 可以自动后台导出 `.bib` 文件到指定路径，你可以手动设置其刷新频率。刷新太频繁浪费内存，刷新太慢就更新不及时咯。

## 从 projects 里关联不到论文的问题

> [!bug] 已知问题
> `Projects` 插件会出现一个 bug，即从表格里打开某些导入的文献是空白，但在输入（Inputs 文件夹）里实际是有数据的：

![72iAX0](https://songshgeo-picgo-1302043007.cos.ap-beijing.myqcloud.com/uPic/72iAX0.jpg)

确实有这个bug，因此仅在视频和示例库里，为了演示好看我示例库里用标题，我个人的库会使用 `citekey` 作为笔记标题，而不是文献标题，这样更稳定：

![Bq7ka3](https://songshgeo-picgo-1302043007.cos.ap-beijing.myqcloud.com/uPic/Bq7ka3.png)
