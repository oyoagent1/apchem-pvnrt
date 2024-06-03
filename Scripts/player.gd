extends CharacterBody2D

# exports
@export var speed: float = 1

# Volume pressure and all that
var pressure: float = 1 # atm
var volume: float = 10 # L
var temp: float = 296 # kelvin
var mols: float = 10
const r: float = 0.0821

# lock bools, ONLY ONE ACTIVE AT A TIME PLEASE
var pressure_lock: bool
var volume_lock: bool
var temp_lock: bool
var mols_lock: bool

# Random shit idk 
var move_inputs = Vector2.ZERO
var enable_move: bool = true

# Called when the node enters the scene tree for the first time.
func _ready():
	calc_pressure()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# make sure not to move if not able to move wow
	if enable_move:
		_get_input()
		move(delta)
	display_values()

func display_values():
	$RichTextLabel.text = str("P = ", pressure)
	$RichTextLabel2.text = str("V = ", volume)
	$RichTextLabel3.text = str("n = ", mols)
	$RichTextLabel4.text = str("T = ", temp)
func _get_input():
	# get movement related inputs
	move_inputs.x = Input.get_axis("move_left", "move_right")
	move_inputs.y = Input.get_axis("move_up", "move_down")
	move_inputs = move_inputs.normalized()

# move function, im gonna kms stfg why did this not just work??
func move(delta):
	velocity = move_inputs * speed
	var col = move_and_collide(velocity)
	if col != null:
		temp += 8 * delta
		calc_volume()

# How the fuck is this supposed to workkkkkk killlll me, ok FOR NOW assume mols is constant to make this doable
func calc_volume():
	volume = (mols * r * temp) / pressure
	scale = Vector2(volume/10, volume/10)

func calc_pressure():
	pressure = (mols * r * temp) / volume
func calc_temp():
	temp = (pressure * volume) / (r * temp)

func change_mols():
	pass # TODO not the same as the others like just make it change the mols its dead simple
