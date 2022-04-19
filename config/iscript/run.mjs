#!/usr/bin/env zx

export const run = (cmds, arg) => {
  if (!arg[0] || arg[0] == "help") {
    for (var key in cmds) {
      console.log(key + "\t" + cmds[key].description);
    }
  } else {
    cmds[arg[0]].function(arg.slice(1));
  }
};
