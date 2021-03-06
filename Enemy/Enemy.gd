extends KinematicBody2D

var player = null
onready var ray = $RayCast2D
export var speed = 140
export var looking_speed = 130
	
func _physics_process(_delta):
	if player == null:
		player = get_node("/root/Game/Player_Container/Player")
	else:
		ray.cast_to = ray.to_local(player.global_position)
		var c = ray.get_collider()
		if c:
			var velocity = ray.cast_to.normalized()*looking_speed
			if c.name == "Player":
				velocity = ray.cast_to.normalized()*speed
			move_and_slide(velocity, Vector2(0,0))


func die():
	queue_free()


func _on_Area2D_area_entered(area):
	die()
