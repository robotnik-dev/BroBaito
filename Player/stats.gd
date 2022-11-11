class_name Stats
extends Resource

signal attribute_changed(attribute, value)

export(float) var max_hp setget set_max_hp, get_max_hp
export(float) var hp_regen setget set_hp_regen, get_hp_regen
export(float) var lifesteal setget set_lifesteal, get_lifesteal
export(float) var damage setget set_damage, get_damage
export(float) var meele_damage setget set_meele_damage, get_meele_damage
export(float) var ranged_damage setget set_ranged_damage, get_ranged_damage
export(float) var elemental_damage setget set_elemental_damage, get_elemental_damage
export(float) var attack_speed setget set_attack_speed, get_attack_speed
export(float) var crit_chance setget set_crit_chance, get_crit_chance
export(float) var engineering setget set_engineering, get_engineering
export(float) var attack_range setget set_attack_range, get_attack_range
export(float) var armor setget set_armor, get_armor
export(float) var dodge setget set_dodge, get_dodge
export(float) var speed setget set_speed, get_speed
export(float) var luck setget set_luck, get_luck
export(float) var harvesting setget set_harvesting, get_harvesting
export(float) var hp setget set_hp, get_hp
export(float) var experience setget set_experience, get_experience
export(float) var money setget set_money, get_money

# shown to player via GUI
var max_hp_bonus = 0.0 setget set_max_hp_bonus, get_max_hp_bonus
var hp_regen_bonus = 0.0 setget set_hp_regen_bonus, get_hp_regen_bonus
var lifesteal_bonus = 0.0 setget set_lifesteal_bonus, get_lifesteal_bonus
var damage_bonus = 0.0 setget set_damage_bonus, get_damage_bonus
var meele_damage_bonus = 0.0 setget set_meele_damage_bonus, get_meele_damage_bonus
var ranged_damage_bonus = 0.0 setget set_ranged_damage_bonus, get_ranged_damage_bonus
var elemental_damage_bonus = 0.0 setget set_elemental_damage_bonus, get_elemental_damage_bonus
var attack_speed_bonus = 0.0 setget set_attack_speed_bonus, get_attack_speed_bonus
var crit_chance_bonus = 0.0 setget set_crit_chance_bonus, get_crit_chance_bonus
var engineering_bonus = 0.0 setget set_engineering_bonus, get_engineering_bonus
var attack_range_bonus = 0.0 setget set_attack_range_bonus, get_attack_range_bonus
var armor_bonus = 0.0 setget set_armor_bonus, get_armor_bonus
var dodge_bonus = 0.0 setget set_dodge_bonus, get_dodge_bonus
var speed_bonus = 0.0 setget set_speed_bonus, get_speed_bonus
var luck_bonus = 0.0 setget set_luck_bonus, get_luck_bonus
var harvesting_bonus = 0.0 setget set_harvesting_bonus, get_harvesting_bonus
var money_bonus = 0.0 setget set_money_bonus, get_money_bonus
var experience_bonus = 0.0 setget set_experience_bonus, get_experience_bonus

func reset() -> void:
	pass

func add_bonus(stat: String, value: float) -> void:
	var _old = call("get_" + stat + "_bonus")
	call("set_" + stat + "_bonus", _old + value)

func set_max_hp(value: float) -> void:
	max_hp = value
	emit_signal("attribute_changed", "max_hp", value)

func get_max_hp() -> float:
	return max_hp + max_hp_bonus

func set_hp_regen(value: float) -> void:
	hp_regen = value
	emit_signal("attribute_changed", "hp_regen", value)	

func get_hp_regen() -> float:
	return hp_regen + hp_regen_bonus

func set_lifesteal(value: float) -> void:
	lifesteal = value
	emit_signal("attribute_changed", "lifesteal", value)	

func get_lifesteal() -> float:
	return lifesteal + lifesteal_bonus

func set_damage(value: float) -> void:
	damage = value
	emit_signal("attribute_changed", "damage", value)

func get_damage() -> float:
	return damage + damage_bonus

func set_meele_damage(value: float) -> void:
	meele_damage = value
	emit_signal("attribute_changed", "meele_damage", value)

func get_meele_damage() -> float:
	return meele_damage + meele_damage_bonus

func set_ranged_damage(value: float) -> void:
	ranged_damage = value
	emit_signal("attribute_changed", "ranged_damage", value)

func get_ranged_damage() -> float:
	return ranged_damage + ranged_damage_bonus

func set_elemental_damage(value: float) -> void:
	elemental_damage = value
	emit_signal("attribute_changed", "elemental_damage", value)	

func get_elemental_damage() -> float:
	return elemental_damage + elemental_damage_bonus

func set_attack_speed(value: float) -> void:
	attack_speed = value
	emit_signal("attribute_changed", "attack_speed", value)	

func get_attack_speed() -> float:
	return attack_speed + attack_speed_bonus

func set_crit_chance(value: float) -> void:
	crit_chance = value
	emit_signal("attribute_changed", "crit_chance", value)	

func get_crit_chance() -> float:
	return crit_chance + crit_chance_bonus	

func set_engineering(value: float) -> void:
	engineering = value
	emit_signal("attribute_changed", "engineering", value)	

func get_engineering() -> float:
	return engineering + engineering_bonus

func set_attack_range(value: float) -> void:
	attack_range = value
	emit_signal("attribute_changed", "attack_range", value)	

func get_attack_range() -> float:
	return attack_range + ranged_damage_bonus

func set_armor(value: float) -> void:
	armor = value
	emit_signal("attribute_changed", "armor", value)

func get_armor() -> float:
	return armor + armor_bonus

func set_dodge(value: float) -> void:
	dodge = value
	emit_signal("attribute_changed", "dodge", value)	

func get_dodge() -> float:
	return dodge + dodge_bonus

func set_speed(value: float) -> void:
	speed = value
	emit_signal("attribute_changed", "speed", value)	

func get_speed() -> float:
	return speed + speed_bonus
	
func set_luck(value: float) -> void:
	luck = value
	emit_signal("attribute_changed", "luck", value)	

func get_luck() -> float:
	return luck + luck_bonus

func set_harvesting(value: float) -> void:
	harvesting = value
	emit_signal("attribute_changed", "harvesting", value)

func get_harvesting() -> float:
	return harvesting + harvesting_bonus

func set_experience(value: float) -> void:
	experience = value
	emit_signal("attribute_changed", "experience", value)	

func get_experience() -> float:
	return experience

func set_money(value: float) -> void:
	money = value
	emit_signal("attribute_changed", "money", value)

func get_money() -> float:
	return money

func set_hp(value: float) -> void:
	hp = clamp(value, value, self.max_hp)
	emit_signal("attribute_changed", "hp", value)	

func get_hp() -> float:
	return hp


# BONUS
func set_max_hp_bonus(value: float) -> void:
	max_hp_bonus = value

func get_max_hp_bonus() -> float:
	return max_hp_bonus

func set_hp_regen_bonus(value: float) -> void:
	hp_regen_bonus = value

func get_hp_regen_bonus() -> float:
	return hp_regen_bonus

func set_lifesteal_bonus(value: float) -> void:
	lifesteal_bonus = value

func get_lifesteal_bonus() -> float:
	return lifesteal_bonus

func set_damage_bonus(value: float) -> void:
	damage_bonus = value

func get_damage_bonus() -> float:
	return damage_bonus

func set_meele_damage_bonus(value: float) -> void:
	meele_damage_bonus = value

func get_meele_damage_bonus() -> float:
	return meele_damage_bonus

func set_ranged_damage_bonus(value: float) -> void:
	ranged_damage_bonus = value

func get_ranged_damage_bonus() -> float:
	return ranged_damage_bonus

func set_elemental_damage_bonus(value: float) -> void:
	elemental_damage_bonus = value

func get_elemental_damage_bonus() -> float:
	return elemental_damage_bonus

func set_attack_speed_bonus(value: float) -> void:
	attack_speed_bonus = value

func get_attack_speed_bonus() -> float:
	return attack_speed_bonus

func set_crit_chance_bonus(value: float) -> void:
	crit_chance_bonus = value

func get_crit_chance_bonus() -> float:
	return crit_chance_bonus

func set_engineering_bonus(value: float) -> void:
	engineering_bonus = value

func get_engineering_bonus() -> float:
	return engineering_bonus

func set_attack_range_bonus(value: float) -> void:
	attack_range_bonus = value

func get_attack_range_bonus() -> float:
	return attack_range_bonus

func set_armor_bonus(value: float) -> void:
	armor_bonus = value

func get_armor_bonus() -> float:
	return armor_bonus

func set_dodge_bonus(value: float) -> void:
	dodge_bonus = value

func get_dodge_bonus() -> float:
	return dodge_bonus

func set_speed_bonus(value: float) -> void:
	speed_bonus = value

func get_speed_bonus() -> float:
	return speed_bonus
	
func set_luck_bonus(value: float) -> void:
	luck_bonus = value

func get_luck_bonus() -> float:
	return luck_bonus

func set_harvesting_bonus(value: float) -> void:
	harvesting_bonus = value

func get_harvesting_bonus() -> float:
	return harvesting_bonus

func set_experience_bonus(value: float) -> void:
	experience_bonus = value

func get_experience_bonus() -> float:
	return experience_bonus

func set_money_bonus(value: float) -> void:
	money_bonus = value

func get_money_bonus() -> float:
	return money_bonus
