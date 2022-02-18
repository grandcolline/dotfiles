#!/usr/bin/env zx

/**
 * .my/script.mjs main handler
 *
 * @example
 *   const cmds = {
 *     "test": {
 *       description: "",
 *       function: (arg) => test("", arg[0])
 *     },
 *   };
 *   run(cmds, argv._.slice(1));
 */
export const run = (cmds, arg) => {
  if (arg[0] == "comp") {
    for (var key in cmds) {
      console.log(key + "\t" + cmds[key].description);
    }
  } else {
    cmds[arg[0]].function(arg.slice(1));
  }
}

