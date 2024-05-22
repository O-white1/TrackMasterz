extends VehicleBody3D

@export var MAX_STEER = .4
@export var level = ""
var MAX_RPM = 300
var MAX_TORQUE = 350
var HORSE_POWER = 350
const Gravity = 9.8
var timer = 500
var used = false

func rounds(num, digit):
	return round(num * pow(10.0, digit)) / pow(10.0, digit)

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

func calc_engine_force(accel, rpm):
	return accel*MAX_TORQUE*(1 - rpm / MAX_RPM)

func _physics_process(delta):
	
	if Input.is_action_pressed("goatedWithTheSWAWS") and not used:
		if timer == 0:
			used = true
		MAX_RPM = 400
		MAX_TORQUE = 450
		HORSE_POWER = 450
		if timer > 0:
			timer -= 1
	else:
		MAX_RPM = 300
		MAX_TORQUE = 350
		HORSE_POWER = 350
		if timer == 500:
			used = false
		if timer < 500 and used:
			timer += 1
	
		
	Reset()
	HardReset()
	steering = lerp(steering, Input.get_axis("ui_right", "ui_left") * MAX_STEER, delta * 5)
	var accel = Input.get_axis("ui_down", "ui_up") * HORSE_POWER
	$backLeft.engine_force = calc_engine_force(accel, abs($backLeft.get_rpm()))
	$backRight.engine_force = calc_engine_force(accel, abs($backRight.get_rpm()))

	
	
	steering = lerp(steering, Input.get_axis("ui_right", "ui_left") * MAX_STEER, delta * 5)
	
	
	$ProgressBar.value = timer
	
	
	$backLeft.engine_force = calc_engine_force(accel, abs($backLeft.get_rpm()))
	$backRight.engine_force = calc_engine_force(accel, abs($backRight.get_rpm()))
	
	var fwd_mps = abs((self.linear_velocity * self.transform.basis).z)
	$Label.text = "Speed: " + str(rounds(fwd_mps,2))
	
	
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




