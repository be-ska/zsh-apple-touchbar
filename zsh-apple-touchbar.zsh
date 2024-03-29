source ${0:A:h}/functions.zsh

set_state 'first'

function first_view() {
	remove_and_unbind_keys

	set_state 'first'

	create_key 1 '🔌 usb' 'ls /dev | grep tty.usb' '-s'
	create_key 2 '👨🏻‍💻 code' 'cd ~/code' '-s'
	create_key 3 '🤖 ap' 'cd ~/code/ardupilot' '-s'
	create_key 4 '🚜 ap-rov' 'cd ~/code/ardupilot-rover' '-s'
	create_key 5 'second view' 'second_view'
	create_key 6 'third view' 'third_view'
}

function second_view() {
	remove_and_unbind_keys

	set_state 'second'

	create_key 1 '👈 back' 'first_view'
	create_key 2 'current path' 'pwd' '-s'

	set_state 'first'
}

function third_view() {
	remove_and_unbind_keys

	set_state 'third'

	create_key 1 '👈 back' 'first_view'
	create_key 2 'ls' 'ls -la' '-s'
}

zle -N first_view
zle -N second_view
zle -N third_view

precmd_apple_touchbar() {
	case $state in
		first) first_view ;;
		second) second_view ;;
		third) third_view ;;
	esac
}

autoload -Uz add-zsh-hook

add-zsh-hook precmd precmd_apple_touchbar
