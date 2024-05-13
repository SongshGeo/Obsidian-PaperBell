title: "<%= it.title %>"

citekey: "<%= it.citekey %>"

tags: [<%= it.tags.filter(t => t.name && t.name.startsWith('#')).map(t => '"' + t.name.slice(1) + '"').join(', ') %>]

read: <% let endings = ['浏览', '初读', '精读']; let filteredTags = it.tags.filter(t => t.name && endings.some(ending => t.name.endsWith(ending))); if (filteredTags.length === 1) { %> "<%= filteredTags[0].name %>" <% } else if (filteredTags.length > 1) { %> 错误：存在多个符合条件的标签。 <% } else { %> 错误：没有找到符合条件的标签。 <% } %>

source: <% let endings_2 = ['更新', '推荐', '关联', '检索']; let filteredTags_2 = it.tags.filter(t => t.name && endings_2.some(ending => t.name.endsWith(ending))); if (filteredTags_2.length === 1) { %> "<%= filteredTags_2[0].name %>" <% } else if (filteredTags_2.length > 1) { %> 错误：存在多个符合条件的标签。 <% } else { %> 错误：没有找到符合条件的标签。 <% } %>

authors: [<%= it.authors %>]

journal: <%= it.publicationTitle %>

date: <%= it.date %>

<%

let isImportant = it.tags.some(t => t.name === '🌟星标');

%>

important: <%= isImportant ? 'True' : 'False' %>

abstract: <%= it.abstractNote %>

ObsidianUIMode: "preview"
