extends Node2D

var onplanet = false
var quest = "none"

func enterplanet():
	if quest == "none":
		onplanet = true
		get_tree().paused = true
		$"CanvasLayer/ZVDANIE/1 меню".position = Vector2(0, 0)
	
	



func _on_button_2_pressed():
	get_tree().paused = false
	$"CanvasLayer/ZVDANIE/1 меню".position = Vector2(7777, 7777)


func _on_button_pressed():
	$"CanvasLayer/ZVDANIE/1 меню".position = Vector2(7777, 7777)
	$"CanvasLayer/ZVDANIE/2 меню".position = Vector2(0, 0)


func _on_button_3_button_down():
	get_tree().paused = false
	quest = "goide"
	$Player.quest = "goide"
	$CanvasLayer/Label.text = '''Задания:
		Убить 5 врагов'''
	$"CanvasLayer/ZVDANIE/2 меню".position = Vector2(7777, 7777)


func _on_button_4_button_down():
	get_tree().paused = false
	$"CanvasLayer/ZVDANIE/2 меню".position = Vector2(7777, 7777)
