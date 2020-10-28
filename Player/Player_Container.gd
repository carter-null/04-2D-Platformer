extends Node2D

onready var Player = load("res://Player/Player.tscn")
var starting_position = Vector2(235.755,383.619)
onready var Backup = get_node("/root/Game/Player_Container/Backup_Camera")


func _ready():
	pass


func _physics_process(_delta):
	if not has_node("Player"):
		var player = Player.instance()
		player.position = starting_position
		add_child(player)

func _on_Save_pressed():
	pass # Replace with function body.

func die():
	Backup.current = false
	queue_free()

func _on_Area2D_area_entered(area):
	queue_free()


