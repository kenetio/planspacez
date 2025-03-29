extends Node2D

var onplanet = false
var quest = "none"
var killt = 0
var imper = 0
@export var ememy : PackedScene
@export var elt : PackedScene

@export var player: Node2D  # Узел игрока
@export var planet_scene: PackedScene  # Сцена планеты
@export var spawn_count: int = 5  # Количество планет
@export var spawn_range: Vector2 = Vector2(500, 300)  # Диапазон спавна

var planets_list = []  # Список планет
var nearest_planet_x: float = 0  # X ближайшей планеты
var nearest_planet_y: float = 0  # Y ближайшей планеты

func _ready():
	# Спавн планет при старте
	spawn_planets()

func spawn_planets():
	planets_list.clear()
	for i in range(spawn_count):
		if planet_scene:
			var planet = planet_scene.instantiate()
			var random_x = randf_range(-spawn_range.x, spawn_range.x)
			var random_y = randf_range(-spawn_range.y, spawn_range.y)
			planet.position = position + Vector2(random_x, random_y)  # Спавн относительно текущего узла

			# Добавляем планету в список
			planets_list.append(planet)
			add_child(planet)  # Добавляем в сцену

# Поиск ближайшей планеты к ИГРОКУ
func find_nearest_planet():
	if planets_list.is_empty():
		return  # Если планет нет, просто выходим

	if not player:
		print("Игрок не найден!")
		return

	var nearest_planet = null
	var min_distance = INF
	var player_pos = player.position  # Координаты игрока

	# Ищем ближайшую планету
	for planet in planets_list:
		var distance = player_pos.distance_to(planet.position)
		if distance < min_distance:
			min_distance = distance
			nearest_planet = planet

	# Если нашли ближайшую планету, сохраняем её координаты
	if nearest_planet:
		nearest_planet_x = nearest_planet.position.x
		nearest_planet_y = nearest_planet.position.y
		print("Ближайшая планета (X, Y):", nearest_planet_x, nearest_planet_y)
	if imper >= 100:
		get_tree().change_scene_to_file("res://end.tscn")

func enterplanet():
	if quest == "none":
		onplanet = true
		get_tree().paused = true
		$"CanvasLayer/ZVDANIE/1 меню".position = Vector2(0, 0)
		$"CanvasLayer/ZVDANIE/3 меню".position = Vector2(0, 0)
	
	
func _process(delta):
	if $Player.lives <= 0:
		get_tree().change_scene_to_file("res://game over.tscn")
	if quest == "goide":
		$CanvasLayer/Label.text = '''Задания:
			Убить 5 врагов ('''+str(killt)+"/5)"
		if killt >= 5:
			quest = "none"
			imper += 10
			$CanvasLayer/Label.text = "Задания:"
			$"CanvasLayer/ZVDANIE/4 меню/Label2".text = "Текущая репутация империи: "+str(imper)
			$"CanvasLayer/ZVDANIE/3 меню/Label2".text = str(imper)
			$"CanvasLayer/ZVDANIE/4 меню".position = Vector2(0, 0)
			get_tree().paused = true
		


func _on_button_2_pressed():
	get_tree().paused = false
	$"CanvasLayer/ZVDANIE/1 меню".position = Vector2(7777, 7777)
	$"CanvasLayer/ZVDANIE/3 меню".position = Vector2(0, 5000)


func _on_button_pressed():
	$"CanvasLayer/ZVDANIE/1 меню".position = Vector2(7777, 7777)
	$"CanvasLayer/ZVDANIE/2 меню".position = Vector2(0, 0)


func _on_button_3_button_down():
	get_tree().paused = false
	killt = 0
	quest = "goide"
	$Player.quest = "goide"
	$CanvasLayer/Label.text = '''Задания:
		Убить 5 врагов'''
	$"CanvasLayer/ZVDANIE/2 меню".position = Vector2(7777, 7777)
	$"CanvasLayer/ZVDANIE/3 меню".position = Vector2(0, 5000)


func _on_button_4_button_down():
	get_tree().paused = false
	$"CanvasLayer/ZVDANIE/2 меню".position = Vector2(7777, 7777)
	$"CanvasLayer/ZVDANIE/3 меню".position = Vector2(0, 5000)


func _on_buttonss_button_down():
	get_tree().paused = false
	$"CanvasLayer/ZVDANIE/4 меню".position = Vector2(0, 5000)
	
	
func _on_timer_timeout() -> void:
	find_nearest_planet()
	

func _on_timer_2_timeout() -> void:
	var b = ememy.instantiate()
	get_tree().root.add_child(b)
	b.position = Vector2($Player.position.x, $Player.position.y+700)
	var b1 = ememy.instantiate()
	get_tree().root.add_child(b1)
	b1.position = Vector2($Player.position.x, $Player.position.y-700)
	var b2 = ememy.instantiate()
	get_tree().root.add_child(b2)
	b2.position = Vector2($Player.position.x+1400, $Player.position.y)
	var b3 = ememy.instantiate()
	get_tree().root.add_child(b3)
	b3.position = Vector2($Player.position.x-1400, $Player.position.y)


func _on_timerelt_timeout():
	var b = elt.instantiate()
	get_tree().root.add_child(b)
	b.position = Vector2($Player.position.x, $Player.position.y-700)
