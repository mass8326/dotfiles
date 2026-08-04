-- Default monitor in case nwg-displays has not been used yet
hl.monitor({
  output = "",
  mode = "preferred",
  position = "auto",
  scale = "auto",
})

-- Managed by nwg-displays
-- Make sure to disable any VR HMDs
require("monitors")
require("workspaces")

require("conf.autostart")
require("conf.binds")
require("conf.environment")
require("conf.variables")
require("conf.workspaces")
