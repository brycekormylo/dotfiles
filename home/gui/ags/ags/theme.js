const colors = `~/.config/home-manager/colors.css`;

class ThemeService extends Service {
  // every subclass of GObject.Object has to register itself

  static {
    // takes three arguments
    // the class itself
    // an object defining the signals
    // an object defining its properties
    Service.register(
      this,
      {
        // 'name-of-signal': [type as a string from GObject.TYPE_<type>],
        "theme-changed": ["float"],
      },
      {
        // 'kebab-cased-name': [type as a string from GObject.TYPE_<type>, 'r' | 'w' | 'rw']
        // 'r' means readable
        // 'w' means writable
        // guess what 'rw' means
        "theme-path": ["float", "rw"],
      },
    );
  }

  constructor() {
    super();

    Utils.monitorFile(colors, () => this.#onChange());

    // initialize
    this.#onChange();
  }

  #onChange() {
    this.emit("theme-changed", 0.0);
  }

  // overwriting the connect method, let's you
  // change the default event that widgets connect to
  connect(event = "theme-changed", callback) {
    return super.connect(event, callback);
  }
}

// the singleton instance
const service = new ThemeService();

// export to use in other modules
export default service;
