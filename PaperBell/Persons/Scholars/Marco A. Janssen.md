---
name: Marco A. Janssen
alias:
gender: 男
birthday:
email: 
- Marco.Janssen@asu.edu
title:
- Professor
website: https://marcojanssen.info/
photo: "https://marcojanssen.info/wp-content/uploads/2016/09/Marco_Janssen_2014.jpg"
tags: scholar
institute:
- Arizona State University
---

## 基本信息

````ad-flex

<div>

<br>

🧑‍🔬`=(this.name)`
📮`=(this.email)`
🏫`=link(this.institute)`
🔗`=(this.website)`

</div>


<div>


`=("![](" + this.photo + ")")`


</div>

````
## 研究兴趣
- [[Social ecological system]]
- [[Agent-based model]]
## 相关论文
```dataviewjs
let names = dv.current().alias ? dv.current().alias : [];
names.push(dv.current().name)

// 参考 https://forum.obsidian.md/t/for-loops-and-dataviewjs/46284
// every: 每个要素都在；
// some: 某个要素在

dv.table(["论文","期刊","年份"],
dv.pages(`#paper`)
	.where(t => names.some(x => t.authors.includes(x)))
	.map(b => [b.file.link, b.journal, b.paper_date])
	.sort(b => b.paper_date, 'desc')
)
```
## 最新动态
```dataviewjs

let folderChoicePath = "00 - 每日日记/DailyNote"
const files = app.vault.getMarkdownFiles().filter(file => file.path.includes(folderChoicePath))



let arr = files.map(async(file) => { 
    const content = await app.vault.cachedRead(file) 
    let lines = await content.split("\n").filter(line => line.includes("Macro")) 
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
