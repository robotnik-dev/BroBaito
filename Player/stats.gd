class_name Stats
extends Resource

signal attribute_changed(attribute, value)
signal attribute_bonus_changed(bonus, value)

# default stats
export(float) var default_max_hp = 10.0
export(float) var default_speed = 200.0

var max_hp: float = default_max_hp setget , get_max_hp
var speed: float = default_speed setget , get_speed
var hp: float = default_max_hp setget set_hp, get_hp
var experience: float = 0.0 setget set_experience, get_experience
var money: float = 0.0 setget set_money, get_money

# limits
var speed_bonus_min: float = -90.0
var speed_bonus_max: float = 300.0
var dodge_bonus_min: float = -100.0
var dodge_bonus_max: float = 60.0
var armor_bonus_min: float = -100.0
var armor_bonus_max: float = 100.0


var max_hp_bonus: float = 0.0 setget set_max_hp_bonus, get_max_hp_bonus
var hp_regen_bonus: float = 0.0 setget set_hp_regen_bonus, get_hp_regen_bonus
var lifesteal_bonus: float = 0.0 setget set_lifesteal_bonus, get_lifesteal_bonus
var damage_bonus: float = 0.0 setget set_damage_bonus, get_damage_bonus
var meele_damage_bonus: float = 0.0 setget set_meele_damage_bonus, get_meele_damage_bonus
var ranged_damage_bonus: float = 0.0 setget set_ranged_damage_bonus, get_ranged_damage_bonus
var elemental_damage_bonus: float = 0.0 setget set_elemental_damage_bonus, get_elemental_damage_bonus
var attack_speed_bonus: float = 0.0 setget set_attack_speed_bonus, get_attack_speed_bonus
var crit_chance_bonus: float = 0.0 setget set_crit_chance_bonus, get_crit_chance_bonus
var engineering_bonus: float = 0.0 setget set_engineering_bonus, get_engineering_bonus
var attack_range_bonus: float = 0.0 setget set_attack_range_bonus, get_attack_range_bonus
var armor_bonus: float = 0.0 setget set_armor_bonus, get_armor_bonus
var dodge_bonus: float = 0.0 setget set_dodge_bonus, get_dodge_bonus
var speed_bonus: float = 0.0 setget set_speed_bonus, get_speed_bonus
var luck_bonus: float = 0.0 setget set_luck_bonus, get_luck_bonus
var harvesting_bonus: float = 0.0 setget set_harvesting_bonus, get_harvesting_bonus
var money_bonus: float = 0.0 setget set_money_bonus, get_money_bonus
var experience_bonus: float = 0.0 setget set_experience_bonus, get_experience_bonus

func reset() -> void:
	self.hp = self.max_hp
	self.max_hp_bonus = 0.0
	self.hp_regen_bonus = 0.0
	self.lifesteal_bonus = 0.0
	self.damage_bonus = 0.0
	self.meele_damage_bonus = 0.0
	self.ranged_damage_bonus = 0.0
	self.elemental_damage_bonus = 0.0
	self.attack_speed_bonus = 0.0
	self.crit_chance_bonus = 0.0
	self.engineering_bonus = 0.0
	self.attack_range_bonus = 0.0
	self.armor_bonus = 0.0
	self.dodge_bonus = 0.0
	self.speed_bonus = 0.0
	self.luck_bonus = 0.0
	self.harvesting_bonus = 0.0
	self.money_bonus = 0.0
	self.experience_bonus = 0.0

func add_bonus(stat: String, value: float) -> void:
	var _old = call("get_" + stat + "_bonus")
	call("set_" + stat + "_bonus", _old + value)

func get_stats() -> Array:
	var stats: Array = []
	stats.append({
		"display_name": "Max HP",
		"name": "max_hp",
		"value": self.max_hp + self.max_hp_bonus})
	stats.append({
		"display_name": "HP regeneration",
		"name": "hp_regen",
		"value": self.hp_regen_bonus})
	stats.append({
		"display_name": "Lifesteal",
		"name": "lifesteal",
		"value": self.lifesteal_bonus})
	stats.append({
		"display_name": "Damage",
		"name": "damage",
		"value": self.damage_bonus})
	stats.append({
		"display_name": "Meele Damage",
		"name": "meele_damage",
		"value": self.meele_damage_bonus})
	stats.append({
		"display_name": "Ranged Damaged",
		"name": "ranged_damage",
		"value": self.ranged_damage_bonus})
	stats.append({
		"display_name": "Elemental Damage",
		"name": "elemental_damage",
		"value": self.elemental_damage_bonus})
	stats.append({
		"display_name": "Attack Speed",
		"name": "attack_speed",
		"value": self.attack_speed_bonus})
	stats.append({
		"display_name": "Crit Chance",
		"name": "crit_chance",
		"value": self.crit_chance_bonus})
	stats.append({
		"display_name": "Engineering",
		"name": "engineering",
		"value": self.engineering_bonus})
	stats.append({
		"display_name": "Range",
		"name": "attack_range",
		"value": self.attack_range_bonus})
	stats.append({
		"display_name": "Armor",
		"name": "armor",
		"value": self.armor_bonus})
	stats.append({
		"display_name": "Dodge",
		"name": "dodge",
		"value": self.dodge_bonus})
	stats.append({
		"display_name": "Speed",
		"name": "speed",
		"value": self.speed_bonus})
	stats.append({
		"display_name": "Luck",
		"name": "luck",
		"value": self.luck_bonus})
	stats.append({
		"display_name": "Harvesting",
		"name": "harvesting",
		"value": self.harvesting_bonus})
	
	return stats

func leveled() -> bool:
	#TODO
	return false

func get_max_hp() -> float:
	return max_hp

func get_speed() -> float:
	return speed

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
	emit_signal("attribute_bonus_changed", "max_hp", value)

func get_max_hp_bonus() -> float:
	return max_hp_bonus

func set_hp_regen_bonus(value: float) -> void:
	hp_regen_bonus = value
	emit_signal("attribute_bonus_changed", "hp_regen", value)	

func get_hp_regen_bonus() -> float:
	return hp_regen_bonus

func set_lifesteal_bonus(value: float) -> void:
	lifesteal_bonus = value
	emit_signal("attribute_bonus_changed", "lifesteal", value)

func get_lifesteal_bonus() -> float:
	return lifesteal_bonus

func set_damage_bonus(value: float) -> void:
	damage_bonus = value
	emit_signal("attribute_bonus_changed", "damage", value)

func get_damage_bonus() -> float:
	return damage_bonus

func set_meele_damage_bonus(value: float) -> void:
	meele_damage_bonus = value
	emit_signal("attribute_bonus_changed", "meele_damage", value)

func get_meele_damage_bonus() -> float:
	return meele_damage_bonus

func set_ranged_damage_bonus(value: float) -> void:
	ranged_damage_bonus = value
	emit_signal("attribute_bonus_changed", "ranged_damage", value)

func get_ranged_damage_bonus() -> float:
	return ranged_damage_bonus

func set_elemental_damage_bonus(value: float) -> void:
	elemental_damage_bonus = value
	emit_signal("attribute_bonus_changed", "elemental_damage", value)

func get_elemental_damage_bonus() -> float:
	return elemental_damage_bonus

func set_attack_speed_bonus(value: float) -> void:
	attack_speed_bonus = value
	emit_signal("attribute_bonus_changed", "attack_speed", value)

func get_attack_speed_bonus() -> float:
	return attack_speed_bonus

func set_crit_chance_bonus(value: float) -> void:
	crit_chance_bonus = value
	emit_signal("attribute_bonus_changed", "crit_chance", value)

func get_crit_chance_bonus() -> float:
	return crit_chance_bonus

func set_engineering_bonus(value: float) -> void:
	engineering_bonus = value
	emit_signal("attribute_bonus_changed", "engineering", value)

func get_engineering_bonus() -> float:
	return engineering_bonus

func set_attack_range_bonus(value: float) -> void:
	attack_range_bonus = value
	emit_signal("attribute_bonus_changed", "attack_range", value)

func get_attack_range_bonus() -> float:
	return attack_range_bonus

func set_armor_bonus(value: float) -> void:
	value = clamp(value, armor_bonus_min, armor_bonus_max)	
	armor_bonus = value
	emit_signal("attribute_bonus_changed", "armor", value)

func get_armor_bonus() -> float:
	return armor_bonus

func set_dodge_bonus(value: float) -> void:
	value = clamp(value, dodge_bonus_min, dodge_bonus_max)
	dodge_bonus = value
	emit_signal("attribute_bonus_changed", "dodge", value)

func get_dodge_bonus() -> float:
	return dodge_bonus

func set_speed_bonus(value: float) -> void:
	value = clamp(value, speed_bonus_min, speed_bonus_max)
	speed_bonus = value
	emit_signal("attribute_bonus_changed", "speed", value)

func get_speed_bonus() -> float:
	return speed_bonus
	
func set_luck_bonus(value: float) -> void:
	luck_bonus = value
	emit_signal("attribute_bonus_changed", "luck", value)

func get_luck_bonus() -> float:
	return luck_bonus

func set_harvesting_bonus(value: float) -> void:
	harvesting_bonus = value
	emit_signal("attribute_bonus_changed", "harvesting", value)

func get_harvesting_bonus() -> float:
	return harvesting_bonus

func set_experience_bonus(value: float) -> void:
	experience_bonus = value
	emit_signal("attribute_bonus_changed", "experience", value)

func get_experience_bonus() -> float:
	return experience_bonus

func set_money_bonus(value: float) -> void:
	money_bonus = value
	emit_signal("attribute_bonus_changed", "money", value)

func get_money_bonus() -> float:
	return money_bonus
