{
  description = "NixOS dotfiles and templates";

  outputs = { self }: {
    templates.blank = {
      path = ./templates/blank;
      description = "Blank NixOS configuration template";
    };
    templates.default = self.templates.blank;
  };
}
