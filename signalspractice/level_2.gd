extends Node2D

func _ready() -> void:
	$Coin2.coin_collected.connect(print_message)

func print_message(body, coinid):
	print(coinid + " has been collected by " + body)
