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
            secrets = [ "ELLIE_API_KEY" ];
          };

          clank = {
            skill = ./skills/clank.md;
            packages = [ clank.packages.${system}.default ];
            secrets = [ "CLANK_API" ];
          };

          piper-tts = {
            skill = ./skills/piper-tts.md;
            packages = [ pkgs.piper-tts ];
            secrets = [ ]; # No secrets required
          };

          whisper = {
            skill = ./skills/whisper.md;
            packages = [ pkgs.openai-whisper ];
            secrets = [ ]; # No secrets required
          };

          # === Steipete tools ===
          # Skill files are in the steipete-tools source tree

          summarize = {
            skill = "${steipete-tools}/tools/summarize/skills/summarize/SKILL.md";
            packages = [ steipete.summarize ];
            secrets = [ ]; # Uses configured LLM provider
          };

          oracle = {
            skill = "${steipete-tools}/tools/oracle/skills/oracle/SKILL.md";
            packages = [ steipete.oracle ];
            secrets = [ ]; # Uses configured LLM provider
          };

          gogcli = {
            skill = "${steipete-tools}/tools/gogcli/skills/gog/SKILL.md";
            packages = [ steipete.gogcli ];
            secrets = [ ]; # No secrets required
          };

          sonoscli = {
            skill = "${steipete-tools}/tools/sonoscli/skills/sonoscli/SKILL.md";
            packages = [ steipete.sonoscli ];
            secrets = [ ]; # No secrets required
          };
        }
      );

      # ============ FORMATTER ============

      formatter = eachSystem (system: nixpkgs.legacyPackages.${system}.nixfmt);
    };
}
