extends Node2D

func _on_area_2d_area_entered(area):
	if area.name == "GrappleColider":
		area.get_parent().get_parent().hooked = true
		area.get_parent().get_parent().hook = self
	if area.name == "PlayerHurtbox":
		area.get_parent().get_node("GrappleManager").hooked = false
		area.get_parent().get_node("GrappleManager").grapling = false
		area.get_parent().get_node("GrappleManager").get_node("GrappleBody").hooked = false
		area.get_parent().grappling_no_speed_cap = false
		area.get_parent().grappling_effects = false
		area.get_parent().get_node("GrappleManager").get_node("CooldownTimer").start()
		area.get_parent().get_node("GrappleManager").hook = null
