#!/usr/bin/env zx

export const run = (cmds, arg) => {
  if (!arg[0] || arg[0] == "help") {
    for (var key in cmds) {
      let des = cmds[key].description ?? ""
      console.log(key + "\t" + des);
    }
  } else {
    cmds[arg[0]].function(arg.slice(1));
  }
};

// ---- ● message ● -----------------------------------------
export const message = async (m) => {
  // 全体の横幅が 60文字 になる
  console.log();
  console.log(
    chalk.yellow.bold(" ---- ● ") +
    chalk.bold(m) +
    chalk.yellow.bold(" ● " + "-".repeat(48 - m.length) + " ")
  );
}

