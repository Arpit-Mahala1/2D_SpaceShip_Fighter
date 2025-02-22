class_name Enemy
extends Area2D

var speed:int=100

func _ready() -> void:
	randomize()
	position= Vector2(randf_range(16,384),0)



func _process(delta: float) -> void:
	position.y+=speed*delta



func _on_area_entered(area: Area2D) -> void:
	if area.name=="BulletArea":
		area.get_parent().queue_free()
		queue_free()
