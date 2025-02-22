extends Node2D

var bullet_scene= preload("res://bullet.tscn")
var direction:int =0
var speed:int = 300
var shoot_time:float = 0.1
var shoot_colunter=0


func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	shoot_colunter+=delta;
	if Input.is_action_pressed("Attack") and shoot_colunter>=shoot_time:
		shoot_colunter=0
		var bullet_instance=bullet_scene.instantiate()
		bullet_instance.position.x=position.x
		bullet_instance.position.y=position.y-30
		get_parent().get_node("Bullets").add_child(bullet_instance)
		
	
	
	if Input.is_action_pressed("Move_left") and position.x>=16:
		direction=-1
	
	elif Input.is_action_pressed("Move_right") and position.x<=384:
		direction=1
	
	else:
		direction=0
	
	position.x += direction*speed*delta
	
