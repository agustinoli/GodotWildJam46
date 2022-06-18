extends CanvasLayer

var life_indicator_rect_size: Vector2 =  Vector2(300,10)

func _ready():
	$Background/RedOrbSprite.visible = false
	$Background/GreenOrbSprite.visible = false
	$Background/BlueOrbSprite.visible = false
	$Background/RedOrbSprite.modulate.a = 0.4
	$Background/GreenOrbSprite.modulate.a = 0.4
	$Background/BlueOrbSprite.modulate.a = 0.4

func set_current_orb(orb):
	$Background/RedOrbSprite.modulate.a = 0.4
	$Background/GreenOrbSprite.modulate.a = 0.4
	$Background/BlueOrbSprite.modulate.a = 0.4
	
	match orb:
		'RED':
			$Background/RedOrbSprite.modulate.a = 1
		'GREEN':
			$Background/GreenOrbSprite.modulate.a = 1
		'BLUE':
			$Background/BlueOrbSprite.modulate.a = 1

func set_orb_picked(orb):
	match orb:
		'RED':
			$Background/RedOrbSprite.visible = true
		'GREEN':
			$Background/GreenOrbSprite.visible = true
		'BLUE':
			$Background/BlueOrbSprite.visible = true


func _on_Player_hp_changed(hp):
	print_debug(hp)
	$LifeIndicator._set_size(Vector2(life_indicator_rect_size.x*(hp/100),life_indicator_rect_size.y))
