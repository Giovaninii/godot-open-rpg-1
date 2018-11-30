extends Node

class_name CombatAction

var initialized = false

var skill_to_use : Skill = null

# Since Actions can be instanced by code (ie skills) these
# actions doesn't have an owner, that's why we get the owner
# from it's parent (BattlerActions.gd)
onready var actor : Battler = get_parent().get_owner()

export var icon : Texture
export var description : String = "Base combat action"

func initialize(battler : Battler) -> void:
	actor = battler
	initialized = true

func execute(targets : Array):
	assert(initialized)
	print("%s missing overwrite of the execute method" % name)
	return false

func return_to_start_position():
	yield(actor.skin.return_to_start(), "completed")
