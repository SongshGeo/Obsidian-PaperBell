---
aliases:
  - multi-agents model
  - Agent-based modelling
  - 多主体模型
  - 多主体建模
ch: 多主体模型
tags:
  - concept
---
## Description

# M #S

多主体建模是一个计算方法。一个多主体模型（通常也称为ABM）是一个由多种主体组成的计算程序，它们的行为不是集中控制的，而是多样性地与其它主体或环境交互的。程序的模拟随着时间进行，每一个时间步或每一个事件发生时，主体根据他们内部属性或者他们对其它主体的行为或环境变化产生的反应来进行决策。许多主体在微观层面的互动将形成宏观层次上的格局和动态，而这种宏观变化是分析的重点。

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
const specificTag = "#想法"; // 指定要检查的标签，可以更改

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
