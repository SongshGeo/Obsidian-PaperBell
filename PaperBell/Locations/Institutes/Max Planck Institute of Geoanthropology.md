---
abbr: MPI-GEA
aliases:
-
website: https://www.gea.mpg.de/
location: [50.92878, 11.5899]
logo: https://songshgeo-picgo-1302043007.cos.ap-beijing.myqcloud.com/uPic/Max-Planck-Gesellschaft-logo-F65A54F835-seeklogo.com.png
name: Max Planck Institute of Geoanthropology
tags:
- university
---

# [Max Planck Institute of Geoanthropology](https://www.gea.mpg.de/)

## Overview

```mapview
{"name":"Default","mapZoom":8,"centerLat":50.92878,"centerLng":11.5899,"query":"","chosenMapSource":0}
```

## Affiliated Scholars

```dataviewjs
let name = dv.current().name

dv.table(["Name", "Title", "Website", "Email"],
dv.pages(`#scholar`)
  .where(b => b.institute.includes(name))
  .map(b => [b.file.link, b.title, ("[🔗]("+b.website+")"), b.email])
  .sort(b => b.paper_date, 'desc')
)
```
