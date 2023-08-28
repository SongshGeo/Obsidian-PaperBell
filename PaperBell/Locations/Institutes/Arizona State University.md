---
name: Arizona State University
abbr: ASU
alias:
- 亚利桑那州立大学
website: https://www.asu.edu/
location: [33.4213174, -111.93315932269833]
logo: "https://upload.wikimedia.org/wikipedia/en/thumb/a/a1/Arizona_State_University_seal.svg/1200px-Arizona_State_University_seal.svg.png"
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
