extends KinematicBody

var velocity = Vector3(0,0,0)
const SPEED = 6
const ROT_SPEED = 7
const DAMPENING = 0.2

func _ready():
	pass

func _physics_process(delta):
	if Input.is_action_pressed("ui_right") and Input.is_action_pressed("ui_left"):
		velocity.x = 0
	elif Input.is_action_pressed("ui_right"):
		velocity.x = SPEED
		$MeshInstance.rotate_z(deg2rad(-ROT_SPEED))
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -SPEED
		$MeshInstance.rotate_z(deg2rad(ROT_SPEED))
	else:
		velocity.x = lerp(velocity.x, 0, DAMPENING)

	if Input.is_action_pressed("ui_up") and Input.is_action_pressed("ui_down"):
		velocity.z = 0
	elif Input.is_action_pressed("ui_up"):
		velocity.z = -SPEED
		$MeshInstance.rotate_x(deg2rad(-ROT_SPEED))
	elif Input.is_action_pressed("ui_down"):
		velocity.z = SPEED
		$MeshInstance.rotate_x(deg2rad(ROT_SPEED))
	else:
		velocity.z = lerp(velocity.z, 0, DAMPENING)

	if ((Input.is_action_pressed("ui_up") or Input.is_action_pressed("ui_down")) and (Input.is_action_pressed("ui_left") or Input.is_action_pressed("ui_right"))):
		velocity = velocity.normalized()
		velocity *= SPEED
	print (velocity)
	move_and_slide(velocity)
