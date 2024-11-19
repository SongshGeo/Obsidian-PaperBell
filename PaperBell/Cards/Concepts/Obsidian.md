---
tags:
- concept
---
## 定义

>[!bot]
> Obsidian是一款基于Markdown的知识管理和笔记软件。它具有很强的自定义性和强大的插件生态，使用户可以更高效地组织和连接他们的想法和知识。该软件帮助用户通过各种功能和插件实现知识的建立、整理、链接与发现。Obsidian结构化地显示和连接笔记，支持双向链接、标签和文件夹等功能，使得用户可以更便捷地管理和利用自己的知识。

## 相关论文

```dataviewjs

let names = dv.current().aliases ? dv.current().aliases : [];
names.push(dv.current().name)

// 参考 https://forum.obsidian.md/t/for-loops-and-dataviewjs/46284
// every: 每个要素都在；
// some: 某个要素在

dv.table(["论文","期刊","年份"],
dv.pages(`#paper`)
	.where(t => names.some(x => t.concepts.includes(x)))
	.map(b => [b.file.link, b.journal, b.paper_date])
	.sort(b => b.paper_date, 'desc')
)
```
## 相关想法

```dataviewjs

let folderChoicePaths = ["00 - 每日日记/DailyNote", "Inputs", "Outputs", "Projects"];
const specificTag = "#SC/想法"; // 指定要检查的标签，可以更改

const files = app.vault.getMarkdownFiles().filter(file => folderChoicePaths.some(path => file.path.includes(path)) );

let names = dv.current().aliases ? dv.current().aliases : [];
names.push(dv.current().name);
names.push(dv.current().ch);

let arr = files.map(async(file) => { 
    const content = await app.vault.cachedRead(file);
    // 确保文件内容包含特定标签
    if (content.includes(specificTag)) {
        let lines = content.split("\n").filter(line => names.some(name => line.includes(name)));
        return ["[[" + file.name.split(".")[0] + "]]", lines];
    }
    return null; // 如果不包含标签，返回 null
}); 

Promise.all(arr).then(values => { 
    // 过滤掉 null 结果
    const filteredValues = values.filter(value => value != null);

    const beautify = filteredValues.map(value => { 
        const temp = value[1].map(line => line); // 美化处理
        return [value[0], temp]; 
    });

    const exists = beautify.filter(value => value[1][0] && value[0] != "[[未命名 10]]")
        .sort((a, b) => a[0].localeCompare(b[0])); // 排序处理修正为 localeCompare

    dv.table(["日期", "动态"], exists);
});

```
