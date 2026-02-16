extends KinematicBody2D

var increase = 100
var speed = 500
var velocity = Vector2.ZERO
var xSpeed
var ySpeed

func _ready():
	randomize()
	change_speed()
	
func _physics_process(delta):
	var collision_object = move_and_collide(velocity * speed * delta)
	if collision_object:
		velocity = velocity.bounce(collision_object.normal)
	
func speed_increase():
	speed += 1
func stop_ball():
	speed = 0
	
func restart_ball():
	speed = 500
	change_speed()

func change_speed():
	xSpeed = rand_range(0.5, 1.5) 
	ySpeed = rand_range(0.5, 1.5) 
	velocity.x = [-xSpeed,xSpeed][randi() % 2]
	velocity.y = [-ySpeed,ySpeed][randi() % 2]
	print(str(xSpeed) + " " + str(ySpeed))
func _on_SpeedChange_timeout():
	speed_increase()
