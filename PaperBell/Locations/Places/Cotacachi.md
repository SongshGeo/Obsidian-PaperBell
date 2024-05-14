---
location: [0.3005297707253397, -78.26421272091355]
name: Cotacachi
banner: "40 - Obsidian/附件/banners/global-tracking-banner.jpg"
banner_icon: 🌍
aliases: 
- 科塔卡奇
tags:
- city
- trip
---

```mapview
{"name":"Default","mapZoom":8,"centerLat":-0.1354278,"centerLng":-78.481999,"query":"","chosenMapSource":0}
```

```dataviewjs

let folderChoicePath = "00 - 每日日记/DailyNote"
const files = app.vault.getMarkdownFiles().filter(file => file.path.includes(folderChoicePath))
let names = dv.current().aliases ? dv.current().aliases : [];
names.push(dv.current().name)

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