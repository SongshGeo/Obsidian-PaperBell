---
alias: "{{title}}"
journal: {% if journalAbbreviation %}"{{journalAbbreviation}}"{% else %}"{{autoJournalAbbreviation}}"{% endif %}
first_author: {% if creators[0].firstName %}"{{creators[0].firstName}} {{creators[0].lastName}}"{% else %}"{{creators[0].name}}"{% endif %}

add_date: {{dateAdded.format("Y-MM-DD")}}
mod_date: {{dateModified.format("Y-MM-DD")}}
import_date: {{importDate.format("Y-MM-DD")}}
paper_date: {{date.format("Y-MM-DD")}}

read_state: {% if "to-read" in allTags %}"to-read"{% elif "浏览" in allTags %}"browsed"{% elif "初读" in allTags %}"read-once"{% elif "精读" in allTags %}"read-more"{% endif %}
source: {% if "更新" in allTags %}"update"{% elif "推荐" in allTags %}"recommend"{% elif "检索" in allTags %}"search"{% elif "关联" in allTags %}"connected"{% endif %}
favorite: {% if "星标" in allTags %}True{% else %}False{% endif %}

unread: {% if "to-read" in allTags %}True{% else %}False{% endif %}
browsed: {% if "浏览" in allTags %}True{% else %}False{% endif %}
read: {% if "初读" in allTags %}True{% else %}False{% endif %}
dive: {% if "精读" in allTags %}True{% else %}False{% endif %}
update: {% if "更新" in allTags %}True{% else %}False{% endif %}
recommand: {% if "推荐" in allTags %}True{% else %}False{% endif %}
search: {% if "检索" in allTags %}True{% else %}False{% endif %}
connected: {% if "关联" in allTags %}True{% else %}False{% endif %}

collections: [{% for collection in collections%}"{{collection.name}}", {% endfor %}]

doi: {{DOI}}
url: {{url}}
type: {{itemType}}

banner: "https://songshgeo-picgo-1302043007.cos.ap-beijing.myqcloud.com/uPic/snju3Q.jpg"
banner_icon: 📄
rate: 
concepts:{% for tag in tags %}{% if tag.tag not in ["🌟星标", "🤔精读", "💻更新", "👀浏览", "✅初读", "📚推荐", "🔍检索", "⛓️关联"] %}
- {{tag.tag}} {% endif %}{% endfor %}
authors: {% for creator in creators %}
- {% if creator.firstName %}{{creator.firstName}} {{creator.lastName}}{% else %}{{creator.name}}{%endif%} {% endfor %}
tags:
- paper
---

## Information
{{bibliography}}
{{ pdfZoteroLink }}

### Tags
`=link(this.concepts)`

### Authors
`=link(this.authors)`

{% if abstractNote %}
### Abstract
{{abstractNote}}
{% endif %}

## 注释

### KeyPoints

{% for annotation in annotations %}{% if annotation.annotatedText and annotation.colorCategory in ["Yellow", "Red"] %}- ==[{{annotation.annotatedText}}]({{annotation.attachment.desktopURI}})==: {%if annotation.comment %}{{annotation.comment}}{%endif%}
{% endif %}{% endfor %}

### Sentences
{% for annotation in annotations %}{% if annotation.annotatedText and annotation.colorCategory in ["Green"] %}- ==[{{annotation.annotatedText}}]({{annotation.attachment.desktopURI}})==: {%if annotation.comment %}{{annotation.comment}}{%endif%}
{% endif %}{% endfor %}

### Questions
{% for annotation in annotations %}{% if annotation.annotatedText and annotation.colorCategory in ["Purple"] %}
- [{{annotation.annotatedText}}]({{annotation.attachment.desktopURI}}): {%if annotation.comment %}{{annotation.comment}}{%endif%} #Q {% endif %}{% endfor %} 

## 附件

{% for attachment in attachments %} {% if ".pdf" not in attachment %}
- [{{attachment.title}}]({{attachment.desktopURI}}) {% endif %} {% endfor %}