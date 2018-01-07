
#
# ステータス表示
#
function prompt_status -d "the symbols for a non zero exit status, root and background jobs"
	set -g prompt_status_flg 0
	set_color -b black

	# status
	if [ $RETVAL -ne 0 ]
		set -g prompt_status_flg 1
		set_color red
		echo -n " ✘"
	end

	# if superuser (uid == 0)
	set -l uid (id -u $USER)
	if [ $uid -eq 0 ]
		set -g prompt_status_flg 1
		set_color yellow
		echo -n " ⚡ "
	end

	# Jobs
	if [ (jobs -l | wc -l) -gt 0 ]
		set -g prompt_status_flg 1
		set_color cyan
		echo -n " ⚙"
	end

	# separator
	if [ $prompt_status_flg -ne 0 ]
		echo -n '  '
		set_color -b 'green'
		set_color 'black'
		echo -n '⮀'
	end
end

# 
# ディレクトリ表示
# 
function prompt_dir -d "Display the current directory"
	set_color -b 'green'
	set_color 'white'
	echo -n " "(prompt_pwd)" "
end

#
# git表示
#
function prompt_git -d "Display the current git state"
	# git管理下かどうか
	if command git rev-parse --is-inside-work-tree >/dev/null 2>&1

		# ブランチ名取得
		set ref (command git symbolic-ref HEAD 2> /dev/null)
		set -l branch (echo $ref | sed  "s-refs/heads/--")

		# 背景色を決める
		# デフォルトは緑
		set -l bg_color 'blue'
		# HEADがあり、indexされていたら黄色
		if git rev-parse --quiet --verify HEAD >/dev/null 2>&1; and not git diff-index --cached --quiet --exit-code --ignore-submodules=dirty HEAD
			set bg_color 'purple'
		end
		# コンフリクトなど TODO:もっとしっかり感知したい
		if [ "$branch" = "" ]
			set bg_color 'red'
		end

		# 差分表示
		set -l diff_display ""
		set -l diff_check (command git status -sb | awk 'NR==1' | awk '{for(i=3;i<=NF;i++){printf("%s%s",$i,OFS="")}}')
		if string match '*commitsyeton*' "$diff_check" > /dev/null
			set diff_display " [Initial]"
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
		set_color 'green'
		echo -n '⮀ '
		set_color 'white'
		echo -n $branch
		echo -n $diff_display
		if [ "$dirty_change" -eq 1 ]
			set_color 'yellow'
			echo -n "●"
		end
		if [ "$dirty_add" -eq 1 ]
			set_color 'red'
			echo -n "●"
		end
		echo -n " "
		set_color -b normal
		set_color $bg_color
		echo -n '⮀ '
	else
		# 表示
		echo -n " "
		set_color -b normal
		set_color 'green'
		echo -n '⮀ '
	end
end


function fish_prompt
	set -g RETVAL $status
	prompt_status
	prompt_dir
	prompt_git
	set_color -b normal
	set_color normal
end
