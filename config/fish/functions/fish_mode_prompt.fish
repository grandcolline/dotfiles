function fish_mode_prompt
	if test "$fish_key_bindings" = "fish_vi_key_bindings"
		or test "$fish_key_bindings" = "fish_hybrid_key_bindings"
		switch $fish_bind_mode
    		case default
				set_color -b 'purple'
				set_color 'white'
				echo -n "[N]"
			case insert
				set_color -b 'green'
				set_color 'white'
				echo -n "[I]"
			case replace_one
				set_color -b 'white'
				set_color 'white'
				echo -n "[R]"
			case visual
				set_color -b '#d787af'
				set_color 'white'
				echo -n "[V]"
		end
		set_color -b normal
		set_color normal
    end
end

