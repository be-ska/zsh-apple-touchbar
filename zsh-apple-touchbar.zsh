source ${0:A:h}/functions.zsh

set_state 'first'

function first_view() {
	remove_and_unbind_keys

	set_state 'first'

	create_key 1 '🔌 usb' 'ls /dev | grep tty.usb' '-s'
	create_key 2 '👨🏻‍💻 code' 'cd ~/code' '-s'
	create_key 3 '🚁 ap' 'cd ~/code/ardupilot' '-s'
	create_key 4 '🚜 ap-rov' 'cd ~/code/ardupilot-rover' '-s'
	create_key 5 '🤖 ap-sim' 'Tools/autotest/sim_vehicle.py -v Copter --console --map' '-s'
	create_key 6 '✈️ proxy' 'cd ~/code/Lua-script-Align && mavproxy.py --master=/dev/tty.usbmodem14101 --baudrate=115200 --console' '-s'
	create_key 7 '📂 path' 'pwd' '-s'
	create_key 8 '🦚 VSC' 'code .' '-s'
}

zle -N first_view

precmd_apple_touchbar() {
	case $state in
		first) first_view ;;
	esac
}

autoload -Uz add-zsh-hook

add-zsh-hook precmd precmd_apple_touchbar
