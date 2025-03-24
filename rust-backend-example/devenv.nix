{ pkgs, lib, config, inputs, ... }:

{
  # https://devenv.sh/basics/
  env.RUST_LOG = "info";

  # https://devenv.sh/packages/
  packages = [
    pkgs.git
    pkgs.just
  ];

  # https://devenv.sh/languages/
  languages.rust.enable = true;
  languages.rust.channel = "stable";
  languages.java.enable = true;

  # https://devenv.sh/processes/
  # processes.cargo-watch.exec = "cargo-watch";

  # https://devenv.sh/services/
  # services.postgres.enable = true;

  # https://devenv.sh/scripts/

  enterShell = ''
  '';

  # https://devenv.sh/tasks/
  # tasks = {
  #   "myproj:setup".exec = "mytool build";
  #   "devenv:enterShell".after = [ "myproj:setup" ];
  # };

  # https://devenv.sh/tests/
  enterTest = ''
  '';

  # https://devenv.sh/git-hooks/
  # git-hooks.hooks.shellcheck.enable = true;

  # See full reference at https://devenv.sh/reference/options/
}
