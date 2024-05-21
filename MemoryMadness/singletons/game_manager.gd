extends Node

const GROUP_TILE: String = "tile"

const LEVELS: Dictionary = {
	1: { "rows": 2, "cols": 2 },
	2: { "rows": 3, "cols": 4 },
	3: { "rows": 4, "cols": 4 },
	4: { "rows": 4, "cols": 6 },
	5: { "rows": 5, "cols": 6 },
	6: { "rows": 6, "cols": 6 }
}

func get_level_selection(level_num: int) -> LevelData:
	var data = LEVELS[level_num]
	return LevelData.new(data.rows, data.cols)

func clear_nodes_of_group(group_name: String) -> void:
	for n in get_tree().get_nodes_in_group(group_name):
		n.queue_free()
