extends Node
# Singelton scene switcher

var game_over = false
var won = false
var current_scene = null
var score : int 
var level : int 
var shoot_speed : float
var time_sec : int = 0

func _ready():
	level = 1
	var root =  get_tree().root
	current_scene = root.get_child(root.get_child_count() -1)

func switch_scene(res_path):
	call_deferred("_deferrend_switch_scene", res_path)
	
func _deferrend_switch_scene(res_path):
	current_scene.free()
	var scen = load(res_path)
	current_scene = scen.instantiate()
	get_tree().root.add_child(current_scene)
	get_tree().current_scene = current_scene
	
