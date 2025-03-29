extends Node2D

var onplanet = false
var quest = "none"
var killt = 0
var imper = 0

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
	
	
