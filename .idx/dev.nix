# To learn more about how to use Nix to configure your environment
# see: https://firebase.google.com/docs/studio/customize-workspace
{ pkgs, ... }: {
  # Which nixpkgs channel to use.
  channel = "unstable";

  # Use https://search.nixos.org/packages to find packages
  packages = [
    pkgs.jdk17
    pkgs.maven
    pkgs.flutter
    pkgs.nodejs_20
    # Provides essential Android command-line tools like sdkmanager
    pkgs.android-tools
    # Required for the Android emulator
    pkgs.xorg.libX11
    pkgs.xorg.libXrandr
    pkgs.xorg.libXcursor
    pkgs.xorg.libXinerama
  ];

  # Sets environment variables in the workspace
  env = {
    JAVA_HOME = "${pkgs.jdk17}";
    ANDROID_HOME = "$HOME/Android/sdk";
    PATH = [
      "$HOME/Android/sdk/emulator"
      "$HOME/Android/sdk/cmdline-tools/latest/bin"
      "$HOME/Android/sdk/platform-tools"
    ];
  };
  idx = {
    # Search for the extensions you want on https://open-vsx.org/ and use "publisher.id"
    extensions = [
      # "vscodevim.vim"
    ];

    # Enable previews
    previews = {
      enable = true;
      previews = {
        # web = {
        #   # Example: run "npm run dev" with PORT set to IDX's defined port for previews,
        #   # and show it in IDX's web preview panel
        #   command = ["npm" "run" "dev"];
        #   manager = "web";
        #   env = {
        #     PORT = "$PORT";
        #   };
        # };
      };
    };
  };
}
