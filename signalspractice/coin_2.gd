extends Area2D
signal coin_collected(body, coinid)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	body_entered.connect(myfunction)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func myfunction(body):
	coin_collected.emit(body.name,self.name)
	queue_free()
