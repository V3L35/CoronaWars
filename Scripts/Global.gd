extends Node

var noode_creation_parent = null
var player = null
var flame = false

var points = 0
var highscore = 0

func instance_node(node, location, parent):
	var node_instance = node.instance()
	parent.add_child(node_instance)
	node_instance.global_position = location
	return node_instance


func save():
	var save_dict = {
		'highscore': highscore
	}
	return save_dict

func save_game():
	var save_game_file = File.new()
	save_game_file.open_encrypted_with_pass("user://savegame.save", File.WRITE, "djokara0143")
	save_game_file.store_line(to_json(save()))
	save_game_file.close()
	
func load_game():
	var save_game_file = File.new()
	if not save_game_file.file_exists("user://savegame.save"):
		print("Jok more!")
		return
	
	save_game_file.open_encrypted_with_pass("user://savegame.save", File.READ, "djokara0143")
	
	var current_line = parse_json(save_game_file.get_line())
	
	highscore = current_line["highscore"]
