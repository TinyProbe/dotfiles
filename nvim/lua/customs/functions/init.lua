-- mapping key with display description(if format is correctly)
-- desc[ "_:..." | "...:_" ]: _[n|v|i]: what a mode when just before echo
-- "_:...": do echo before action, "...:_": do echo after action
-- if matched display format, act can only be string
function displayKeymap(mode, opt, key, act)
  local printCmd = function(mode, desc)
    local cmd = "<cmd>lua print('"..desc.."')<cr>"
    if mode == "v" then
      cmd = "<esc>"..cmd.."gv"
    elseif mode == "i" then
      cmd = "<esc>`^"..cmd.."i"
    end
    return cmd
  end
  local cmd = ""
  if opt.desc == nil then
    cmd = act
  elseif string.sub(opt.desc, 2, 2) == ":" and
  string.find("nvi", string.sub(opt.desc, 1, 1)) ~= nil then
    cmd = printCmd(string.sub(opt.desc, 1, 1), string.sub(opt.desc, 3, -1))..act
  elseif string.sub(opt.desc, -2, -2) == ":" and
  string.find("nvi", string.sub(opt.desc, -1, -1)) ~= nil then
    cmd = act..printCmd(string.sub(opt.desc, -1, -1), string.sub(opt.desc, 1, -3))
  else
    cmd = act
  end
  vim.keymap.set(mode, key, cmd, opt)
end
