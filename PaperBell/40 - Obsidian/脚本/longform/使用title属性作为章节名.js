module.exports = {
    description: {
      name: "Rename scenes to aliases",
      description: "Retitles scenes to their scene_alias property, if present",
      availableKinds: ["Scene"],
      options: [],
    },
    compile(scenes) {
      return scenes.map((scene) => {
        const fm = scene.metadata.frontmatter;
        if (!fm) {
          return scene;
        }
        return {
          ...scene,
          name: fm["scene_alias"] || scene.name,
        };
      });
    },
  };
