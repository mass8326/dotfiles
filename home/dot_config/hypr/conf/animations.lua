hl.curve("cubic_out", {
  type = "bezier",
  points = { { 0.45, 1 }, { 0.55, 1 } },
})

hl.animation({
  leaf = "global",
  enabled = true,
  speed = 2,
  bezier = "cubic_out",
})

hl.animation({
  leaf = "workspaces",
  enabled = true,
  speed = 2,
  bezier = "cubic_out",
  style = "slidefadevert 20%",
})
