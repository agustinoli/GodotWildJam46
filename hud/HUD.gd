extends CanvasLayer


func _ready():
	$Life.set_text(str(100))
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
	$Life.set_text(str(hp))
