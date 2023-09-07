
---
abbr: USFQ
alias:
- 基多圣弗朗西斯科大学
website: https://www.usfq.edu.ec/en
location: [0.41219222429390345, -78.39830382347967]
logo: "https://upload.wikimedia.org/wikipedia/commons/f/f9/Escudo_usfq-01.png"
name: Universidad San Francisco de Quito
tags:
- university
---

## 相关学者
```dataviewjs
let name = dv.current().name

dv.table(["姓名","职称","主页","邮箱"],
dv.pages(`#scholar`)
	.where(b => b.institute.includes(name))
	.map(b => [b.file.link, b.title, ("[🔗]("+b.website+")"), b.email])
	.sort(b => b.paper_date, 'desc')
)
```
