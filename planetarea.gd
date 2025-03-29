extends Area2D

var random = RandomNumberGenerator.new()
var canenter = true

func _ready():
	if randi_range(1, 5) == 1:
		$"../Сыктыфкар".visible = true
	elif randi_range(1, 5) == 1:
		$"../Planet-Stigma".visible = true
	elif randi_range(1, 5) == 1:
		$"../Planet-Solemn".visible = true
	elif randi_range(1, 5) == 1:
		$"../Planet-Barbek".visible = true
	else:
		$"../Planet-arc'han".visible = true

func _on_body_entered(body):
	if body.is_in_group('player') and canenter:
		body.enterplanet()
		canenter = false
		$"../Timer".start()


func _on_timer_timeout():
	canenter = true
