# My Neovim Configuration

## A tour of the file structure

### `init.lua`
`init.lua` is a wrapper file used to import other lua files through **require** statement.
(**require** is like Python's **import**)
The format is as follows:
* implicitly looks into the `lua/` directory
* uses **.** instead of **/** in path names (Java?)
* needs _.lua_ ending omitted

### `lua/`
`lua/` is the configuration's root directory.

### `lua/plugins`
`lua/plugins` is the directory where plugin installation and configuration files should be stored.

### `lua/*.lua`
`lua/*.lua` files are files that natively configure neovim.

### `lua/config/lazy.lua`
`lua/config/lazy.lua` is the config for Lazy package manager itself. The only situation where you would want to edit this file is probably when you would like to change the name of the plugin directory.

## Adding new configurations

### Adding a new plugin
* put it in the `lua/plugins/` directory
* remember to have a **return** next to the boilerplate
  * (**require** imports what is **return**'ed by the file, and we want all of it returned)
* copy the installation boilerplate from the plugin's github
* if a **config** function parameter is there, define the function earlier (name it **configurations** or smth)

### Adding new generic configurations
* put it in the `lua` directly
* **require** it directly in `init.lua`
