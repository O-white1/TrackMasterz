extends VehicleBody3D

@export var MAX_STEER = .4
@export var level = ""
var MAX_RPM = 300
var MAX_TORQUE = 350
var HORSE_POWER = 350
const Gravity = 9.8


func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

func calc_engine_force(accel, rpm):
	return accel*MAX_TORQUE*(1 - rpm / MAX_RPM)

func _physics_process(delta):
	
	
	Reset()
	HardReset()
	steering = lerp(steering, Input.get_axis("ui_right", "ui_left") * MAX_STEER, delta * 5)
	var accel = Input.get_axis("ui_down", "ui_up") * HORSE_POWER
	$backLeft.engine_force = calc_engine_force(accel, abs($backLeft.get_rpm()))
	$backRight.engine_force = calc_engine_force(accel, abs($backRight.get_rpm()))
	 # Ben what is this? 
	#       |
	#       v
	"""  
	if Input.is_action_pressed("ui_accept"):
		MAX_RPM = 1200
		MAX_TORQUE = 800
		HORSE_POWER = 800
	else:
		MAX_RPM = 600
		MAX_TORQUE = 400
		HORSE_POWER = 400
	"""
	
	steering = lerp(steering, Input.get_axis("ui_right", "ui_left") * MAX_STEER, delta * 5)
	
	
	
	
	$backLeft.engine_force = calc_engine_force(accel, abs($backLeft.get_rpm()))
	$backRight.engine_force = calc_engine_force(accel, abs($backRight.get_rpm()))
	
	var fwd_mps = abs((self.linear_velocity * self.transform.basis).z)
	#$Label.text = "%d MPH" % (fwd_mps * 2.23694)
	
	$centerMass.global_position = $centerMass.global_position.lerp(self.global_position, delta * 20.0)
	$centerMass.transform = $centerMass.transform.interpolate_with(self.transform, delta * 5.0)
func HardReset():
	if Input.is_action_just_pressed("HardReset"):
		get_tree().change_scene_to_file("res://"+level+".tscn")
func Reset():
	if Input.is_action_pressed("Restart"):
		check_and_right_vehicle()
func check_and_right_vehicle():
	var current_rotation = self.rotation_degrees
	current_rotation.x = 0
	current_rotation.z = 0
	self.rotation_degrees = current_rotation




