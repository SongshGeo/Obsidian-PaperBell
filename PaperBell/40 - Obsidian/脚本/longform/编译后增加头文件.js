module.exports = {
    description: {
      name: "Add YAML Metadata",
      description: "Prepends YAML metadata (title, date, author) to the manuscript.",
      availableKinds: ["Manuscript"],
      options: [
        {
          id: "title",
          name: "Title",
          description: "Title of the manuscript to include in YAML frontmatter",
          type: "Text",
          default: "Untitled",  // 默认留空，表示使用项目名称
        },
        {
          id: "author-name",
          name: "Author",
          description: "Name of the author to include in YAML frontmatter",
          type: "Text",
          default: "Unknown Author",
        },
      ],
    },
  
    compile: async function (input, context) {
      const title = context.optionValues["title"];  // 用户自定义标题或项目名称
      const date = new Date().toISOString().split('T')[0];  // 获取当前日期
      const author = context.optionValues["author-name"];  // 使用选项中的作者名
  
      // 构建 YAML 前言内容
      const yamlFrontmatter = `---
title: "${title}"
date: "${date}"
author: "${author}"
---
`;
  
      // 将 YAML 前言插入文稿的顶部
      const newContents = yamlFrontmatter + "\n" + input.contents;
  
      // 返回带有 YAML 信息的文稿
      return { contents: newContents };
    },
  };
