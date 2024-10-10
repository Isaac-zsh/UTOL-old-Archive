extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var discord: Discord.Core
var activities: Discord.ActivityManager

var unix_time = OS.get_unix_time()
# Called when the node enters the scene tree for the first time.
func _ready():
	
	discord = Discord.Core.new()

	var result: int = discord.create(
		938496952201519124,
		Discord.CreateFlags.NO_REQUIRE_DISCORD
	)
	
	if result != Discord.Result.OK:
		#print("Failed to initialise SDK: ", result)
		discord = null
		return

	activities = discord.get_activity_manager()
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _update_status(state, li, lt):
	var activity := Discord.Activity.new()
	activity.state = state
	activity.assets.large_image = li
	activity.assets.large_text = lt
	activity.timestamps.start = unix_time
	activities.update_activity(activity, self, "_update_activity_callback")

func _process(_delta: float) -> void:
	if discord:
		var result: int = discord.run_callbacks()
		if result != Discord.Result.OK:
			#print("Failed to run callbacks: ", result)
			discord = null
			activities = null
			
func _update_activity_callback(result: int) -> void:
	if result != Discord.Result.OK:
		#print("Failed to update activity: ", result)
		return

	#print("Updated Game Activity!")
