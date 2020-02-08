function clone -d "git clone in GOPATH and move"
	set -l path ( echo "$argv" \
		| sed -e "s;https://;;g" \
		| sed -e "s;git@github.com:;github.com/;g" \
		| sed -e 's/.git$//g' \
	)
	git clone "$argv" $GOPATH/src/$path
	cd $GOPATH/src/$path
end
