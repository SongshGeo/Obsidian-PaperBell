<% const label = {
  "red": "Conclusion",
  "orange": "Question",
  "yellow": "Highlight",
  "gray": "Comment",
  "green": "Quote",
  "cyan": "Task",
  "blue": "Definition",
  "navy": "Definition",
  "purple": "Question",
  "brown": "Source",
  "magenta": "To Do",
};

let noteLabel = label[it.colorName] ? label[it.colorName] : 'Note';
%>

[!<%= noteLabel %>] Page <%= it.pageLabel %>

<%= it.imgEmbed %><%= it.text %>
<% if (it.comment) { %>
---
<%= it.comment %>
<% } %>
