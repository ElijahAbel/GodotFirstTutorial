extends CanvasLayer
# Notifies Main that the start button has been pressed
signal start_game

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func show_message(text):
	$Message.text = text
	$Message.show()
	$MessageTimer.start()
	
func show_game_over():
	show_message("GAME OVER")
	await $MessageTimer.timeout
	
	$Message.text = "Dodge the \nCreeps!"
	$Message.show()
	
	await get_tree().create_timer(1.0).timeout
	$StartButton.show()

func _on_start_button_pressed():
	$StartButton.hide()
	start_game.emit()


func _on_message_timer_timeout():
	$Message.hide()
	

func update_score(newScore):
	$ScoreLabel.text = str(newScore)
