extends Node2D


signal ChangeScene    	#Pass location of next scene file
signal Exit           	#Triggers closing the game

onready var CurrentScene = null
var NextScene

var loader: = ResourceAsyncLoader.new()

func _ready()->void:
	print_debug("Game singleton ready")
	connect("Exit",			self, "on_Exit")
	connect("ChangeScene",	self, "on_ChangeScene")

func on_ChangeScene(scene)->void:
	if ScreenFade.state != ScreenFade.IDLE:
		return
	ScreenFade.state = ScreenFade.OUT
	if loader.can_async:
		NextScene = yield(loader.load_start( [scene] ), "completed")[0]				#Using ResourceAsyncLoader to load in next scene - it takes in array list and gives back array
	else:
		NextScene = loader.load_start( [scene] )[0]
	if NextScene == null:
		print(' Game.gd 36 - Loaded.resource is null')
		return
	if ScreenFade.state != ScreenFade.BLACK:
		yield(ScreenFade, "fade_complete")
	switch_scene()
	ScreenFade.state = ScreenFade.IN

func switch_scene()->void: #handles actual scene change
	CurrentScene = NextScene
	NextScene = null
	get_tree().change_scene_to(CurrentScene)

func restart_scene()->void:
	if ScreenFade.state != ScreenFade.IDLE:
		return
	get_tree().reload_current_scene()


func on_Exit()->void:
	if ScreenFade.state != ScreenFade.IDLE:
		return
	get_tree().quit()
