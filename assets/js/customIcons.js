const plugin = require("tailwindcss/plugin")
const fs = require("fs")
const path = require("path")

module.exports = plugin(function({matchComponents, theme}) {
  let iconsDir = path.join(__dirname, "../../priv/static/icons")
  let values = {}
  let icons = [
    ["", "/"]
  ]
  icons.forEach(([suffix, dir]) => {
    fs.readdirSync(path.join(iconsDir, dir)).forEach(file => {
      let name = path.basename(file, ".svg") + suffix
      values[name] = {name, fullPath: path.join(iconsDir, dir, file)}
    })
  })
  matchComponents({
    "custom-icon": ({name, fullPath}) => {
      let content = fs.readFileSync(fullPath).toString().replace(/\r?\n|\r/g, "")
      content = encodeURIComponent(content)
      let size = theme("spacing.6")
      return {
        [`--custom-icon-${name}`]: `url('data:image/svg+xml;utf8,${content}')`,
        "-webkit-mask": `var(--custom-icon-${name})`,
        "mask": `var(--custom-icon-${name})`,
        "mask-repeat": "no-repeat",
        "background-color": "currentColor",
        "vertical-align": "middle",
        "display": "inline-block",
        "width": size,
        "height": size
      }
    }
  }, {values})
})
