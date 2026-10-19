{ lib, inputs, ... }: {
  perSystem = { self', pkgs, ... }: {
    packages.niri-wrapped = inputs.wrapper-modules.wrappers.niri.wrap (
      {
        inherit pkgs;

        settings = {
          xwayland-satellite.path = lib.getExe pkgs.xwayland-satellite;

          spawn-at-startup = [
            (lib.getExe pkgs.noctalia)
          ];

          input = {
            keyboard = {
              xkb = {
                model = "pc104";
                layout = "us";
              };
            };

            touchpad = {
              dwt = _: { };
            };

            mouse = {
              accel-profile = "flat";
            };

            warp-mouse-to-focus = _: {};
            focus-follows-mouse = _: {
              props.max-scroll-amount = "0%";
            };
          };

          layout = {
            always-center-single-column = _: { };
            empty-workspace-above-first = _: { };

            default-column-width.proportion = 0.5;
          };

          recent-windows = {
            binds = { };
          };

          binds = {
            "Mod+Shift+Slash".show-hotkey-overlay = _: { };
            "Mod+Escape" = _: {
              props.allow-inhibiting = false;
              content.toggle-keyboard-shortcuts-inhibit = _: { };
            };

            # Opening windows

            "Mod+Space".spawn-sh = "${lib.getExe pkgs.noctalia} msg panel-toggle launcher";
            "Mod+N".spawn = lib.getExe self'.packages.alacritty-wrapped;
            "Mod+B".spawn = lib.getExe pkgs.firefox;

            # Navigation

            "Mod+H".focus-column-left = _: { };
            "Mod+J".focus-window-down = _: { };
            "Mod+K".focus-window-up = _: { };
            "Mod+L".focus-column-right = _: { };

            "Mod+Ctrl+H".move-column-left = _: { };
            "Mod+Ctrl+J".move-window-down = _: { };
            "Mod+Ctrl+K".move-window-up = _: { };
            "Mod+Ctrl+L".move-column-right = _: { };

            "Mod+Shift+H".focus-monitor-left = _: { };
            "Mod+Shift+J".focus-monitor-down = _: { };
            "Mod+Shift+K".focus-monitor-up = _: { };
            "Mod+Shift+L".focus-monitor-right = _: { };

            "Mod+Ctrl+Shift+H".move-column-to-monitor-left = _: { };
            "Mod+Ctrl+Shift+J".move-column-to-monitor-down = _: { };
            "Mod+Ctrl+Shift+K".move-column-to-monitor-up = _: { };
            "Mod+Ctrl+Shift+L".move-column-to-monitor-right = _: { };

            "Mod+U".focus-workspace-down = _: { };
            "Mod+I".focus-workspace-up = _: { };

            "Mod+Ctrl+U".move-column-to-workspace-down = _: { };
            "Mod+Ctrl+I".move-column-to-workspace-up = _: { };

            "Mod+Ctrl+Shift+U".move-workspace-down = _: { };
            "Mod+Ctrl+Shift+I".move-workspace-up = _: { };

            "Mod+WheelScrollDown".focus-workspace-down = _: { };
            "Mod+WheelScrollUp".focus-workspace-up = _: { };
            "Mod+Ctrl+WheelScrollDown".move-column-to-workspace-down = _: { };
            "Mod+Ctrl+WheelScrollUp".move-column-to-workspace-up = _: { };

            "Mod+Shift+WheelScrollDown".focus-column-right = _: { };
            "Mod+Shift+WheelScrollUp".focus-column-left = _: { };
            "Mod+Ctrl+Shift+WheelScrollDown".move-column-right = _: { };
            "Mod+Ctrl+Shift+WheelScrollUp".move-column-left = _: { };

            "Mod+C".center-column = _: { };

            "Mod+V".toggle-window-floating = _: { };
            "Mod+Shift+V".switch-focus-between-floating-and-tiling = _: { };

            # Window control

            "Mod+Q" = _: {
              props.repeat = false;
              content.close-window = _: { };
            };
            "Mod+F".maximize-column = _: { };
            "Mod+Shift+F".fullscreen-window = _: { };

            # Misc actions

            "Mod+O".toggle-overview = _: { };
            XF86AudioRaiseVolume = _: {
              props.allow-when-locked = true;
              content.spawn-sh = "${lib.getExe pkgs.noctalia} msg volume-up";
            };
            XF86AudioLowerVolume = _: {
              props.allow-when-locked = true;
              content.spawn-sh = "${lib.getExe pkgs.noctalia} msg volume-down";
            };
            XF86AudioMute = _: {
              props.allow-when-locked = true;
              content.spawn-sh = "${lib.getExe pkgs.noctalia} msg volume-mute";
            };

            "Print".screenshot = _: { };
          };
        };
      }
    );
  };
}
