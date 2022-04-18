#!/usr/bin/env zx

// export const fzfCmd = $`fzf --ansi --height 40% --reverse --exit-0 --tiebreak=index`;

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
  if (!arg[0] || arg[0] == "comp") {
    for (var key in cmds) {
      console.log(key + "\t" + cmds[key].description);
    }
  } else {
    cmds[arg[0]].function(arg.slice(1));
  }
};
