class_name Item
extends Resource

export(String) var name
export(String, MULTILINE) var description
export(String, MULTILINE) var effect

export(Texture) var image

export(Dictionary) var Bonuses = {
	"max_hp" : 0,
	"hp_regen" : 0,
	"lifesteal" : 0,
	"damage" : 0,
	"meele_damage" : 0,
	"ranged_damage" : 0,
	"elemental_damage" : 0,
	"attack_speed" : 0,
	"crit_chance" : 0,
	"engineering" : 0,
	"attack_range" : 0,
	"armor" : 0,
	"dodge" : 0,
	"speed" : 0,
	"luck" : 0,
	"harvesting" : 0,
	"money" : 0,
	"experience" : 0
}
