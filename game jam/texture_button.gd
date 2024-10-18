extends TextureButton


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

@onready var rc_1: Sprite2D = $"../RC1"
@onready var rc_2: Sprite2D = $"../RC2"
@onready var rc_3: Sprite2D = $"../RC3"
@onready var rc_4: Sprite2D = $"../RC4"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

@export var sprite: Sprite2D
var rc1 = load("res://assets/RC/rc overalls skin tone 4.png")

#func _on_pressed() -> void:
	
	#sprite.texture = rc_1
	
	
	
