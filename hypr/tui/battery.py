import os

from textual.app import App, ComposeResult
from textual.containers import Container, Horizontal, Vertical
from textual.reactive import reactive
from textual.widgets import Button, Digits, Label


# --- 1. Data Logic ---
def get_battery_data():
    BAT_PATH = "/sys/class/power_supply/BAT0"

    def read_file(name):
        try:
            with open(f"{BAT_PATH}/{name}", "r") as f:
                return f.read().strip()
        except:
            return None

    data = {"percent": "0", "time": "...", "icon": "󰂃", "status_icon": ""}

    if not os.path.exists(BAT_PATH):
        return data

    status = read_file("status")
    capacity = read_file("capacity")
    energy_now = read_file("energy_now")
    energy_full = read_file("energy_full")
    power_now = read_file("power_now")

    if capacity:
        data["percent"] = str(int(capacity))
        p = int(capacity)
        data["icon"] = "󰁹" if p > 90 else "󰂀" if p > 60 else "󰁾" if p > 40 else "󰁻"

    try:
        current_energy = int(energy_now) if energy_now else 0
        max_energy = int(energy_full) if energy_full else 0
        power = int(power_now) if power_now else 0

        if status == "Charging":
            data["status_icon"] = "⚡"
            data["icon"] = ""

            if power > 0 and max_energy > 0:
                hours_left = (max_energy - current_energy) / power
                h = int(hours_left)
                m = int((hours_left - h) * 60)
                data["time"] = f"Full in {h}h {m}m"
            else:
                data["time"] = "Charging..."

        elif status == "Discharging":
            data["status_icon"] = ""
            if power > 0:
                hours_left = current_energy / power
                h = int(hours_left)
                m = int((hours_left - h) * 60)
                data["time"] = f"{h}h {m}m remaining"
            else:
                data["time"] = "Calculating..."
        elif status == "Full":
            data["time"] = "Fully Charged"
            data["status_icon"] = "󰁹"

    except:
        data["time"] = "Math Error"

    return data


INITIAL_DATA = get_battery_data()


# --- 2. The UI ---
class PowerMenu(App):
    # --- KEY BINDINGS ---
    BINDINGS = [
        ("escape", "quit", "Close"),
        ("q", "quit", "Close"),
        # MAP ARROW KEYS TO FOCUS MOVEMENT
        ("down", "focus_next", "Next Button"),
        ("up", "focus_previous", "Prev Button"),
        ("j", "focus_next", "Next Button"),  # Vim style down
        ("k", "focus_previous", "Prev Button"),  # Vim style up
    ]

    CSS = """
    Screen { align: center middle; background: #000; }

    #battery-container {
        width: 100%;
        height: auto;
        margin-bottom: 0;
        margin-top: 2;
        align: center middle;
    }

    #hero-row {
        width: auto;
        height: auto;
        align: center middle;
        margin-bottom: 1;
    }

    Digits {
        width: auto;
        color: #a6e3a1;
        margin-right: 0;
    }

    #suffix-label {
        color: #a6e3a1;
        text-style: bold;
        padding-top: 1;
        padding-left: 1;
        content-align: center middle;
    }

    #time { color: #bac2de; padding-bottom: 2; text-align: center; }

    #buttons { height: auto; width: 100%; align: center middle; }

    Button {
        width: 30;
        height: 5;
        margin: 1 0;
        content-align: center middle;
        border: wide #1e1e2e;
    }

    .sleep { background: #89b4fa; color: #11111b; }
    .reboot { background: #f9e2af; color: #11111b; }
    .off { background: #f38ba8; color: #11111b; }

    Button:hover { opacity: 0.8; }
    Button:focus { text-style: bold; border: wide #ffffff; }

    .sleep:focus { background: #89b4fa; }
    .reboot:focus { background: #f9e2af; }
    .off:focus { background: #f38ba8; }
    """

    battery_val = reactive(INITIAL_DATA["percent"])
    suffix_text = reactive(f"%   {INITIAL_DATA['status_icon']} {INITIAL_DATA['icon']}")
    battery_time = reactive(INITIAL_DATA["time"])

    def compose(self) -> ComposeResult:
        with Container(id="battery-container"):
            with Horizontal(id="hero-row"):
                yield Digits(self.battery_val)
                yield Label(self.suffix_text, id="suffix-label")
            yield Label(self.battery_time, id="time")

        with Vertical(id="buttons"):
            yield Button("󰒲  Sleep", id="sleep", classes="sleep")
            yield Button("󰜉  Reboot", id="reboot", classes="reboot")
            yield Button("  Power Off", id="off", classes="off")

    def on_button_pressed(self, event: Button.Pressed) -> None:
        btn_id = event.button.id
        if btn_id == "sleep":
            os.system("systemctl suspend")
        elif btn_id == "reboot":
            os.system("systemctl reboot")
        elif btn_id == "off":
            os.system("systemctl poweroff")
        self.exit()


if __name__ == "__main__":
    app = PowerMenu()
    app.run()
