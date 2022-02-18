#!/usr/bin/env zx

export const fmt_des = "prettier write";
export const fmt = (filename) => {
  const file = filename || ".";
  $`unbuffer npx prettier --write ${file}`;
};

export const test_des = "jest";
export const test = (option, filename) => {
  const opt = option || "";
  const file = filename ?? "";
  $`unbuffer npx jest ${opt} ${file}`;
};

// FIXME
export const cleanup_des = "";
export const cleanup = () => {
  $`find . -name ".DS_Store" -print -delete`;
  $`find bin -name "*.d.ts" -print -delete`;
  $`find bin -name "*.js" -print -delete`;
  $`find lib -name "*.d.ts" -print -delete`;
  $`find lib -name "*.js" -print -delete`;
  $`find test -name "*.d.ts" -print -delete`;
  $`find test -name "*.js" -print -delete`;
};

