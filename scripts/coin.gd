extends Area

var rotationSpeed = 5;

func _ready():
	pass
	
func _physics_process(delta):
	rotate_y(deg2rad(rotationSpeed))


func _on_coin_body_entered(body):
	if body.name == "John":
		$Timer.start()


func _on_Timer_timeout():
	queue_free()
