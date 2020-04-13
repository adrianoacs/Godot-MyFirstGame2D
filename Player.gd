extends KinematicBody2D

var motion = Vector2()
var life = 3
const UP = Vector2(0, -1)
const GRAVITY = 20
const SPEED = 200
const JUMP_HEIGHT = -550

func _ready():
	get_node("CanvasLayer/lblQtdVidas").text = str(life)
	
func _physics_process(delta):	
	motion.y += GRAVITY
	if Input.is_action_pressed("ui_right"):		
		motion.x = SPEED
		$Sprite.play("Run")
		$Sprite.flip_h = false
	elif Input.is_action_pressed("ui_left"):
		motion.x = -SPEED
		$Sprite.play("Run")
		$Sprite.flip_h = true
	else:
		motion.x = 0
		$Sprite.play("Idle")
	
	if is_on_floor():
		if Input.is_action_pressed("ui_up"):
			motion.y = JUMP_HEIGHT;
	else:
		$Sprite.play("Jump")
	motion = move_and_slide(motion, UP)


func _on_pes_body_entered(body):
	body.Dano()
	motion.y = JUMP_HEIGHT;


func _on_dano_body_entered(body):
	life -= 1
	get_node("CanvasLayer/lblQtdVidas").text = str(life)
	if (life == 0):
		$".".queue_free()
		get_tree().change_scene("res://Menu.tscn")
	print(life)
