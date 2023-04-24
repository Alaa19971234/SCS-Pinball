extends Label


var blink_timer = 0.0
const blink_interval = 0.5

func _process(delta):
	blink_timer += delta
	if blink_timer >= blink_interval:
		blink_timer = 0.0
		if $"/root/MainScreen/MAIN MENU/start_label".modulate.a <= 0:
			$"/root/MainScreen/MAIN MENU/start_label".modulate.a = 1
		else:
			$"/root/MainScreen/MAIN MENU/start_label".modulate.a = 0
