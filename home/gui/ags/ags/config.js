import brightness from "./brightness.js";
import theme from "./theme.js";

const hyprland = await Service.import("hyprland");
// const notifications = await Service.import("notifications")
const powerProfiles = await Service.import("powerprofiles");
const audio = await Service.import("audio");
const battery = await Service.import("battery");
const systemtray = await Service.import("systemtray");
const network = await Service.import("network");

const Separator = () =>
  Widget.Label({
    class_name: "separator",
    label: "|",
  });

const Brightness = () => {
  const setBrightness = (value) => {
    brightness.screen_value = Math.max(value, 0.1);
  };
  const slider = () =>
    Widget.Slider({
      draw_value: false,
      class_name: "slider",
      widthRequest: 100,
      on_change: (self) => setBrightness(self.value),
      // @ts-ignore
      value: brightness.bind("screen_value"),
    });

  return Widget.Box({
    class_name: "brightness",
    children: [slider()],
  });
};

const Network = () => {
  const WifiIndicator = () =>
    Widget.Box({
      spacing: 4,
      children: [
        Widget.Label({
          label: `${network.wifi.strength}`,
        }),
        Widget.Icon({
          class_name: "icon",
          icon: network.wifi.bind("icon_name"),
        }),
      ],
    });

  const WiredIndicator = () =>
    Widget.Icon({
      icon: network.wired.bind("icon_name"),
    });

  return Widget.Stack({
    children: {
      wifi: WifiIndicator(),
      wired: WiredIndicator(),
    },
    shown: network.bind("primary").as((p) => p || "wifi"),
  });
};

const Battery = () => {
  const BatteryPercentage = () =>
    Widget.Label({
      class_name: "battery-percentage",
      label: battery.bind("percent").as((p) => (p > 0 ? `${p}%` : `${0}`)),
    });

  const BatteryIcon = () =>
    Widget.Icon({
      icon: battery.bind("icon_name"),
    });

  return Widget.Box({
    spacing: 4,
    class_name: "battery-indicator",
    children: [BatteryPercentage(), BatteryIcon()],
  });
};

function SysTray() {
  const items = systemtray.bind("items").as((items) =>
    items.map((item) =>
      Widget.Button({
        child: Widget.Icon({ icon: item.bind("icon") }),
        on_primary_click: (_, event) => item.activate(event),
        on_secondary_click: (_, event) => item.openMenu(event),
        tooltip_markup: item.bind("tooltip_markup"),
      }),
    ),
  );

  return Widget.Box({
    children: items,
  });
}

function NormalWorkspaces() {
  const activeId = hyprland.active.workspace.bind("id");

  const Normal = () => {
    const workspaces = hyprland.bind("workspaces").as((ws) => {
      function filterNormal(space) {
        return space.id <= 10 && space.id > 0;
      }

      const filtered = ws.filter(filterNormal);

      const normalWorkspaces = filtered.map(({ id }) =>
        Widget.Button({
          on_clicked: () => hyprland.messageAsync(`dispatch workspace ${id}`),
          child: Widget.Label(""),
          class_name: activeId.as((i) => `${i === id ? "focused" : ""}`),
        }),
      );

      return normalWorkspaces;
    });
    return Widget.Box({
      class_name: "workspaces",
      children: workspaces,
    });
  };
  const Special = () => {
    const specialWorkspaces = hyprland.bind("workspaces").as((ws) => {
      function filterSpecial(space) {
        return space.id > 10 || space.id <= 0;
      }

      const filtered = ws.filter(filterSpecial);

      const specialWorkspaces = filtered.map(() =>
        Widget.Button({
          on_clicked: () =>
            hyprland.messageAsync(`dispatch togglespecialworkspace magic`),
          child: Widget.Label(""),
        }),
      );
      return specialWorkspaces;
    });
    return Widget.Box({
      class_name: "specialWorkspaces",
      children: specialWorkspaces,
    });
  };
  return Widget.Box({
    spacing: 2,
    children: [Normal(), Special()],
  });
}

const DateTime = () => {
  const date = Variable("", {
    poll: [1000, 'date "+%b %e"'],
  });

  const time = Variable("", {
    poll: [1000, 'date "+%H:%M"'],
  });

  const Icon = () =>
    Widget.Label({
      label: "",
    });

  const ClockText = () =>
    Widget.Label({
      class_name: "clock",
      label: time.bind(),
    });

  const Clock = () =>
    Widget.Box({
      spacing: 6,
      class_name: "time",
      children: [ClockText(), Icon()],
    });

  const Date = () =>
    Widget.Label({
      class_name: "date",
      label: date.bind(),
    });

  const DateBox = () =>
    Widget.Box({
      spacing: 8,
      children: [Date(), Separator(), Clock()],
    });

  return Widget.Button({
    child: DateBox(),
  });
};

const Volume = () => {
  const VolumeBox = () =>
    Widget.Box({
      spacing: 4,
      class_name: "volume-box",
      children: [VolumePercentage(), VolumeIcon()],
    });

  const VolumePercentage = () =>
    Widget.Label().hook(audio.speaker, (self) => {
      const vol = audio.speaker.volume * 100;
      self.label = `${Math.floor(vol)}%`;
    });

  const VolumeIcon = () =>
    Widget.Icon().hook(audio.speaker, (self) => {
      const vol = audio.speaker.volume * 100;
      const icon = [
        [101, "overamplified"],
        [67, "high"],
        [34, "medium"],
        [1, "low"],
        [0, "muted"],
        // @ts-ignore
      ].find(([threshold]) => threshold <= vol)?.[1];

      self.icon = `audio-volume-${icon}-symbolic`;
      self.tooltip_text = `Volume ${Math.floor(vol)}%`;
    });

  return Widget.Button({
    on_clicked: () => (audio.speaker.is_muted = !audio.speaker.is_muted),
    class_name: "volume-indicator",
    child: VolumeBox(),
  });
};

const Cpu = () => {
  const divide = ([total, free]) => free / total;

  const cpu = Variable(0, {
    // @ts-ignore
    poll: [
      2000,
      "top -b -n 1",
      (out) =>
        divide([
          100,
          out
            .split("\n")
            .find((line) => line.includes("Cpu(s)"))
            .split(/\s+/)[1]
            .replace(",", "."),
        ]),
    ],
  });

  const cpuProgress = () =>
    Widget.LevelBar({
      class_name: "cpu",
      widthRequest: 50,
      value: cpu.bind().as((value) => value),
    });

  const cpuIcon = () =>
    Widget.Label({
      label: "",
    });

  return Widget.Box({
    spacing: 12,
    children: [cpuIcon(), cpuProgress()],
  });
};

const Ram = () => {
  const divide = ([total, free]) => free / total;

  const ram = Variable(0, {
    // @ts-ignore
    poll: [
      2000,
      "free",
      (out) =>
        divide(
          out
            .split("\n")
            .find((line) => line.includes("Mem:"))
            .split(/\s+/)
            .splice(1, 2),
        ),
    ],
  });

  const ramProgress = () =>
    Widget.LevelBar({
      class_name: "ram",
      widthRequest: 50,
      value: ram.bind().as((value) => value),
    });

  const ramIcon = () =>
    Widget.Label({
      label: "",
    });
  return Widget.Box({
    spacing: 12,
    children: [ramIcon(), ramProgress()],
  });
};

const PowerProfile = () => {
  const label = () => {
    const text = powerProfiles.bind("active_profile").as((value) => {
      switch (value.toString()) {
        case "balanced":
          return "";
        case "performance":
          return "";
        case "power-saver":
          return "";
        default:
          return "";
      }
    });

    return Widget.Label({
      label: text,
    });
  };

  const powerProfileBox = () =>
    Widget.Box({
      children: [label()],
    });

  return Widget.Button({
    class_name: "power-profile",
    on_clicked: () => {
      switch (powerProfiles.active_profile.toString()) {
        case "balanced":
          powerProfiles.active_profile = "performance";
          break;
        case "performance":
          powerProfiles.active_profile = "power-saver";
          break;
        case "power-saver":
          powerProfiles.active_profile = "balanced";
          break;
        default:
          powerProfiles.active_profile = "balanced";
          break;
      }
    },
    child: powerProfileBox(),
  });
};

const leftBox = () => {
  return Widget.Box({
    spacing: 8,
    class_name: "left-box",
    hpack: "end",
    children: [Cpu(), Separator(), Ram(), Separator(), PowerProfile()],
  });
};

function Left() {
  return Widget.Box({
    spacing: 8,
    children: [leftBox()],
  });
}

function Center() {
  return Widget.Box({
    spacing: 8,
    children: [NormalWorkspaces()],
  });
}

const rightBox = () =>
  Widget.Box({
    spacing: 8,
    class_name: "right-box",
    hpack: "end",
    children: [
      Volume(),
      Separator(),
      Brightness(),
      Separator(),
      Network(),
      Separator(),
      Battery(),
      Separator(),
      DateTime(),
      //        SysTray()
    ],
  });

function Right() {
  return Widget.Box({
    spacing: 0,
    hpack: "end",
    children: [rightBox()],
  });
}

const Bar = () =>
  Widget.Window({
    name: "bar",
    anchor: ["top", "left", "right"],
    exclusivity: "exclusive",
    child: Widget.CenterBox({
      class_name: "top-bar",
      // homogeneous: false,
      start_widget: Left(),
      center_widget: Center(),
      end_widget: Right(),
    }),
  });

const stylePath = theme.bind("theme-changed").as((value) => {
  return "./style.css";
});

App.config({
  style: "./style.css",
  windows: [Bar()],
});

export {};
