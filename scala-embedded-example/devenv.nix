{ pkgs, lib, config, inputs, ... }:

{
  # https://devenv.sh/basics/
  # env.GREET = "devenv";
  env.LD_LIBRARY_PATH = "${pkgs.stdenv.cc.cc.lib}/lib/";

  # https://devenv.sh/packages/
  packages = [
    pkgs.git
    pkgs.just
    pkgs.sbt

    # lang servers
    pkgs.metals
    pkgs.nil
  ];

  # https://devenv.sh/languages/
  languages.scala.enable = true;
  languages.scala.package = pkgs.scala_2_13;
  languages.java.enable = true;

  # https://devenv.sh/processes/
  # processes.cargo-watch.exec = "cargo-watch";

  # https://devenv.sh/services/
  # services.postgres.enable = true;

  # https://devenv.sh/scripts/
  scripts.hello.exec = ''
  '';

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

  # https://devenv.sh/pre-commit-hooks/
  # pre-commit.hooks.shellcheck.enable = true;

  # See full reference at https://devenv.sh/reference/options/
}
