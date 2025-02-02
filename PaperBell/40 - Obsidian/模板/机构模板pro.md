---
abbr: {{ppb.institute.abbr}}
aliases:
{{ppb.institute.aliases}}
website: {{ppb.institute.website}}
location: [{{ppb.institute.lat}}, {{ppb.institute.lon}}]
logo: {{ppb.institute.logo}}
name: {{ppb.institute.name}}
tags:
- university
---

# [{{ppb.institute.name}}]({{ppb.institute.website}})

## Overview

```mapview
{"name":"Default","mapZoom":8,"centerLat":{{ppb.institute.lat}},"centerLng":{{ppb.institute.lon}},"query":"","chosenMapSource":0}
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
