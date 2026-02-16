extends KinematicBody2D

var speed = 600
var velocity = Vector2(5,5)

func _ready():
	randomize()
	velocity.x = [-1,1][randi() % 10000]
	velocity.y = [-0.8,0.8][randi() % 10000]

func _physics_process(delta):
	move_and_slide(velocity * speed + 10)
