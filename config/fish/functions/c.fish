function c -d "curl command generator"

	set -l CMD "curl -s -X $argv[1] $argv[3..-1]"
	if [ $argv[2] = "json" ]
		set CMD "$CMD | jq ."
	end

	echo -e "Run: \e[33m$CMD\e[m"
	echo "::---------------------------------------------------------------------::"
	eval $CMD
end

function __c_subcommand
    set cmd (commandline -opc)
    if [ (count $cmd) -eq 1 ]
        set -l METHODS GET POST PUT DELETE
        for M in $METHODS
            echo $M
        end
    else if [ (count $cmd) -eq 2 ]
        set -l FORMAT json no
        for F in $FORMAT
            echo $F
        end
    else if [ (count $cmd) -eq 3 ]
        set -l URL http:// https://
        for P in $URL
            echo $P
        end
	else
		set -l OPTION "-H" "-d"
		for O in $OPTION
			echo $O
		end
	end
end

complete -f -c c -a "(__c_subcommand)"
