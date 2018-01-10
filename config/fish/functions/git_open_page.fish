function git_open_page -d "open github page"

	argparse -n __git_open_page 'p/pr' 'i/issue' -- $argv
	or return 1

	if command git rev-parse --is-inside-work-tree >/dev/null 2>&1
		set -l url ( git config --get remote.origin.url \
			| sed -e "s;ssh://git@;http://;g" \
			| sed -e 's/.git$//g' \
		)
		
		if set -lq _flag_pr
			set url "$url/pulls"
		end
		
		if set -lq _flag_issue
			set url "$url/issues"
		end
		
		open $url
	else
		echo "no git directory!"
		return
	end
end
