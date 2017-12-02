module.exports = {
  config: {
    // updateChannel: 'canary',

    // default font size in pixels for all tabs
    fontSize: 12,

    // font family with optional fallbacks
    fontFamily: '"Operator Mono", monospace',

    // terminal cursor background color and opacity (hex, rgb, hsl, hsv, hwb or cmyk)
    cursorColor: 'rgba(248,28,229,0.75)',

    // `BEAM` for |, `UNDERLINE` for _, `BLOCK` for █
    cursorShape: 'BLOCK',

    // color of the text
    foregroundColor: '#f8f8f2',

    // terminal background color
    backgroundColor: '#282a36',

    // border color (window, tabs)
    borderColor: '#333',

    // custom css to embed in the main window
    css: `
      .terms_terms {
        background-image: url(file:///Users/ambethia/.etc/misc/totoro.svg);
        background-position: right 95%;
        background-size: 16vh;
        background-repeat: no-repeat;
      }
    `,

    // custom css to embed in the terminal window
    termCSS: `

    `,

    // custom padding (css format, i.e.: `top right bottom left`)
    // padding: '12px 14px',

    // the full list. if you're going to provide the full color palette,
    // including the 6 x 6 color cubes and the grayscale map, just provide
    // an array here instead of a color map object
    colors: {
      // black: '#44475a',
      // red: '#ff5555',
      // green: '#50fa7b',
      // yellow: '#f1fa8c',
      // blue: '#6272a4',
      // magenta: '#ff79c6',
      // cyan: '#8be9fd',
      // brightBlack: '#999999',
      // brightWhite: '#ffffff'
      // white: '#d0d0d0',
      // lightBlack: '#808080',
      // lightRed: '#ff0000',
      // lightGreen: '#33ff00',
      // lightYellow: '#ffff00',
      // lightBlue: '#0066ff',
      // lightMagenta: '#cc00ff',
      // lightCyan: '#00ffff',
      // lightWhite: '#ffffff'
    },

    // the shell to run when spawning a new session (i.e. /usr/local/bin/fish)
    // if left empty, your system's login shell will be used by default
    shell: '/usr/local/bin/zsh'

    // for advanced config flags please refer to https://hyperterm.org/#cfg
  },

  // a list of plugins to fetch and install from npm
  // format: [@org/]project[#version]
  // examples:
  //   `hyperpower`
  //   `@company/project`
  //   `project#1.0.1`
  plugins: [
    'hyper-dracula',
    'hyperterm-tab-icons',
    'hypercwd',
    'hyperlinks',
    'hyperterm-open-devtools'
  ],

  // in development, you can create a directory under
  // `~/.hyperterm_plugins/local/` and include it here
  // to load it and avoid it being `npm install`ed
  localPlugins: []
}
