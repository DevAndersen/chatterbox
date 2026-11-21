# Chatterbox

Chatterbox is a plugin that lets you bring an interface-based companion with you on your adventures, providing relevant, fun, and occasionally useful, commentary.

## Development

This plugin's Lua code uses [Lua Language Server](https://luals.github.io/) (aka. "LuaLS") annotations.

### Repository structure

Location | Description
---|---
`definitions` | LuaLS definitions for dependencies and the plugin API.
`resources` | Audio files.
`scripts` | Helper scripts, not part of the actual plugin.
`src` | The code of the plugin.
`src/interfaces` | Interface and menu code.
`src/lines` | Voice line code.
`src/states` | Code for checking the state of the player (skills, items, etc.).

## Dependencies

This plugin relies on [PrettyUI](https://github.com/PrettyRS/prettyui), which makes interface work smooth and simple.

## Special thanks to

- J3sven, for making [PrettyUI](https://github.com/PrettyRS/prettyui).
- Kilsaaa, for their wonderful [Devtools](https://github.com/Kilsaaa/Devtools) plugin.

## License

Chatterbox is licensed under the [MIT license](./LICENSE).
