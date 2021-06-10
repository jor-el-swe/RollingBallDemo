extends KinematicBody

var velocity = Vector3(0,0,0)
var rotationVector = Vector3(0,0,0)
const SPEED = 9
const ROT_SPEED = 8
const DAMPENING = 0.1

func _ready():
	pass

func _physics_process(delta):
	rotationVector.x = 0
	rotationVector.y = 0
	rotationVector.z = 0
	if Input.is_action_pressed("ui_right") and Input.is_action_pressed("ui_left"):
		velocity.x = 0
	elif Input.is_action_pressed("ui_right"):
		velocity.x = SPEED
		rotationVector.z = deg2rad(-ROT_SPEED)
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -SPEED
		rotationVector.z = deg2rad(ROT_SPEED)
	else:
		velocity.x = lerp(velocity.x, 0, DAMPENING)

	if Input.is_action_pressed("ui_up") and Input.is_action_pressed("ui_down"):
		velocity.z = 0
	elif Input.is_action_pressed("ui_up"):
		velocity.z = -SPEED
		rotationVector.x = deg2rad(-ROT_SPEED)
	elif Input.is_action_pressed("ui_down"):
		velocity.z = SPEED
		rotationVector.x = deg2rad(ROT_SPEED)
	else:
		velocity.z = lerp(velocity.z, 0, DAMPENING)

	if ((Input.is_action_pressed("ui_up") or Input.is_action_pressed("ui_down")) and (Input.is_action_pressed("ui_left") or Input.is_action_pressed("ui_right"))):
		velocity = velocity.normalized()
		velocity *= SPEED
		rotationVector = rotationVector.normalized()
		rotationVector *= deg2rad(ROT_SPEED)
	$MeshInstance.rotate_x(rotationVector.x)
	$MeshInstance.rotate_z(rotationVector.z)
	move_and_slide(velocity)


func _on_enemy_body_entered(body):
	if body.name == "John":
		print("hit enemy", body)
		get_tree().change_scene("res://GameOver.tscn")
