extends CanvasLayer

func _ready():
	$CurrentOrbLabel.text = 'Current Orb: -'
	$BlueOrbSprite.modulate.a = 0.2
	$GreenOrbSprite.modulate.a = 0.2
	$RedOrbSprite.modulate.a = 0.2

func set_current_orb(orb):
	$CurrentOrbLabel.text = str('Current Orb: ',orb)

func set_orb_picked(orb):
	match orb:
		'BLUE':
			$BlueOrbSprite.modulate.a = 1
		'GREEN':
			$GreenOrbSprite.modulate.a = 1
		'RED':
			$RedOrbSprite.modulate.a = 1
