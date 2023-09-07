---
name: social ecological system
alias:
- "social-ecological system"
- 社会-生态系统
ch: 社会-生态系统
tags:
- concept
---
## Description
社会-生态系统是典型的复杂系统 #S

## 相关论文
```dataviewjs
let names = dv.current().alias ? dv.current().alias : [];
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

let folderChoicePath = "00 - 每日日记/DailyNote"
const files = app.vault.getMarkdownFiles().filter(file => file.path.includes(folderChoicePath))

let names = dv.current().alias ? dv.current().alias : [];
names.push(dv.current().name)
names.push(dv.current().ch)


let arr = files.map(async(file) => { 
    const content = await app.vault.cachedRead(file) 
    let lines = await content.split("\n").filter(line => names.some(name => line.includes(name)))
    //console.log(lines) 
    return ["[["+file.name.split(".")[0]+"]]", lines] 
}) 

Promise.all(arr).then(values => { 
    const beautify = values.map(value => { 
        const temp = value[1].map(line => { return line }) //美化要重写
        return [value[0],temp] 
    }) 
    const exists = beautify.filter(value => value[1][0] && value[0] != "[[未命名 10]]") .sort(value => value[0],'desc') 
    dv.table(["日期", "动态"], exists) 
})
```