# -------------------
# ディレクトリ表示
# -------------------
function prompt_dir -d "Display the current directory"
  set -g bg_color 'green'
	set_color -b $bg_color
	set_color 'white'
	echo -n " "(prompt_pwd)" "
end

# -------------------
# git表示
# -------------------
function prompt_git -d "Display the current git state"
	# git管理下かどうか
	if command git rev-parse --is-inside-work-tree >/dev/null 2>&1

		# ブランチ名取得
		set ref (command git symbolic-ref HEAD 2> /dev/null)
		set -l branch (echo $ref | sed  "s-refs/heads/--")

		# 背景色を決める
		# デフォルトは青
		set -g bg_color 'blue'
		# HEADがあり、indexされていたら紫
		if git rev-parse --quiet --verify HEAD >/dev/null 2>&1; and not git diff-index --cached --quiet --exit-code --ignore-submodules=dirty HEAD
			set -g bg_color 'magenta'
		end
		# コンフリクトなど TODO:もっとしっかり感知したい
		if [ "$branch" = "" ]
			set bg_color 'red'
		end

		# 差分表示
		set -l diff_display ""
		set -l diff_check (command git status -sb | awk 'NR==1' | awk '{for(i=3;i<=NF;i++){printf("%s%s",$i,OFS="")}}')
		if string match '*commitsyeton*' "$diff_check" > /dev/null
			set diff_display "[Initial]"
		else
			set diff_display (command echo $diff_check | sed "s-ahead-↑ -g" | sed "s-behind-↓ -g" | sed "s-,- -g")
		end

		# ローカル変更
		# 変更/削除があるか
		set -l dirty_change 0
		if not git diff --no-ext-diff --ignore-submodules=dirty --quiet --exit-code
			set dirty_change 1
		end
		# 追加があるか
		set -l dirty_add 0
		if [ (command git ls-files --other --exclude-standard | wc -l) -gt 0 ]
			set dirty_add 1
		end

		# 表示
		set_color -b $bg_color
		set_color 'white'
		echo -n ' '
		echo -n $branch
		echo -n $diff_display
		echo -n ' '
		if [ "$dirty_change" -eq 1 ]
			set_color 'yellow'
			echo -n "●"
		end
		if [ "$dirty_add" -eq 1 ]
			set_color 'red'
			echo -n "●"
		end
		if [ "$dirty_change" -eq 1 ]; or [ "$dirty_add" -eq 1 ]
			echo -n ' '
		end
	end
end

# -------------------
# ステータス表示
# -------------------
function prompt_status -d "the symbols for a non zero exit status, root and background jobs"
	# status
	if [ $RETVAL -ne 0 ]
		# set -g prompt_status_flg 1
		set -g bg_color 'red'
		set_color -b $bg_color
		set_color black
		echo -n " ✘ "
	end
end

# -------------------
# プロンプト表示
# -------------------
function fish_prompt
	set -g RETVAL $status
	prompt_dir
	prompt_git
	prompt_status
	set_color -b normal
	set_color $bg_color
	echo -n ' '
	set_color normal
end
