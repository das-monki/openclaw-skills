{
  description = "Openclaw skills and plugins collection";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    systems.url = "github:nix-systems/default";

    # External CLI tools
    ellie-cli = {
      url = "github:das-monki/ellie-cli";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    clank = {
      url = "github:das-monki/clank";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    steipete-tools = {
      url = "github:openclaw/nix-steipete-tools";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      systems,
      ellie-cli,
      clank,
      steipete-tools,
    }:
    let
      eachSystem = nixpkgs.lib.genAttrs (import systems);
    in
    {
      # ============ PLUGINS ============
      # Each plugin bundles a skill file with its required CLI packages

      plugins = eachSystem (
        system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
          steipete = steipete-tools.packages.${system};
        in
        {
          # === Local skills ===

          ellie = {
            skill = ./skills/ellie.md;
            packages = [ ellie-cli.packages.${system}.default ];
          };

          clank = {
            skill = ./skills/clank.md;
            packages = [ clank.packages.${system}.default ];
          };

          piper-tts = {
            skill = ./skills/piper-tts.md;
            packages = [ pkgs.piper-tts ];
          };

          whisper = {
            skill = ./skills/whisper.md;
            packages = [ pkgs.openai-whisper ];
          };

          # === Steipete tools ===
          # Skill files are in the steipete-tools source tree

          summarize = {
            skill = "${steipete-tools}/tools/summarize/skills/summarize/SKILL.md";
            packages = [ steipete.summarize ];
          };

          oracle = {
            skill = "${steipete-tools}/tools/oracle/skills/oracle/SKILL.md";
            packages = [ steipete.oracle ];
          };

          gogcli = {
            skill = "${steipete-tools}/tools/gogcli/skills/gog/SKILL.md";
            packages = [ steipete.gogcli ];
          };

          sonoscli = {
            skill = "${steipete-tools}/tools/sonoscli/skills/sonoscli/SKILL.md";
            packages = [ steipete.sonoscli ];
          };
        }
      );

      # ============ FORMATTER ============

      formatter = eachSystem (system: nixpkgs.legacyPackages.${system}.nixfmt);
    };
}
