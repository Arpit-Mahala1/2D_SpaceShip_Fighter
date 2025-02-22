extends Node2D

var Enemy_scene= preload("res://enemy.tscn")

func _ready() -> void:
	get_node("Boundary").connect("area_entered", _game_end)
	var timer=Timer.new()
	add_child(timer)
	timer.wait_time=1.5
	timer.connect("timeout", _create_enemy)
	timer.start()



func _process(delta: float) -> void:
	pass

func _create_enemy():
	var enemy_intance=Enemy_scene.instantiate()
	get_node("Enemies").add_child(enemy_intance)

func _game_end(body:Node):
	if body is Enemy:
		get_tree().set_pause(true)
	
