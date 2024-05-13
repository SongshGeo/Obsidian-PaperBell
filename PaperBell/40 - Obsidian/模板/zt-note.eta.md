# <%= it.title %>

| Zotero | File | Journal |
| ---- | ---- | ---- |
| [Zotero](<%= it.backlink %>) | <%= it.fileLink %> | [<%= it.publicationTitle %>](<%= it.url%>) |

> [!Abstract]
> 
> <%= it.abstractNote %>

---
## Annotations

<%~ include("annots", it.annotations) %>