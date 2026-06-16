local CombatConfig = {}

CombatConfig.PLAYER_BASE_HEALTH = 100
CombatConfig.PLAYER_HEALTH_REGEN = 0
CombatConfig.PLAYER_HEALTH_REGEN_DELAY = 5

CombatConfig.BASE_DAMAGE = 10
CombatConfig.CRITICAL_DAMAGE_MULTIPLIER = 1.5
CombatConfig.CRITICAL_CHANCE = 0.25

CombatConfig.BASIC_ATTACK_COOLDOWN = 0.5
CombatConfig.HEAVY_ATTACK_COOLDOWN = 1.5
CombatConfig.SPECIAL_ATTACK_COOLDOWN = 3

CombatConfig.COMBO_RESET_TIME = 2
CombatConfig.MAX_COMBO_COUNT = 5
CombatConfig.COMBO_DAMAGE_MULTIPLIER = 0.2

CombatConfig.KNOCKBACK_ENABLED = true
CombatConfig.BASIC_ATTACK_KNOCKBACK = 20
CombatConfig.HEAVY_ATTACK_KNOCKBACK = 50
CombatConfig.KNOCKBACK_DURATION = 0.3

CombatConfig.HITSTUN_ENABLED = true
CombatConfig.BASIC_ATTACK_HITSTUN = 0.2
CombatConfig.HEAVY_ATTACK_HITSTUN = 0.6

CombatConfig.BASIC_ATTACK_RANGE = 10
CombatConfig.HEAVY_ATTACK_RANGE = 15
CombatConfig.HIT_BOX_SIZE = Vector3.new(5, 5, 5) 

CombatConfig.WEAPONS = {
	Sword = {
		name = "Sword",
		damage = 15,
		cooldown = 0.6,
		range = 12,
		knockback = 30,
		hitstun = 0.3,
	},
	Axe = {
		name = "Axe",
		damage = 25,
		cooldown = 1.2,
		range = 10,
		knockback = 50,
		hitstun = 0.5,
	},
	Dagger = {
		name = "Dagger",
		damage = 8,
		cooldown = 0.3,
		range = 6,
		knockback = 15,
		hitstun = 0.15,
	},
	Hammer = {
		name = "Hammer",
		damage = 30,
		cooldown = 1.8,
		range = 14,
		knockback = 60,
		hitstun = 0.7,
	},
}

CombatConfig.ELEMENTS = {
	Fire = { damageMultiplier = 1.2, burnChance = 0.3, burnDamage = 2, burnDuration = 3 },
	Ice = { damageMultiplier = 1.1, slowChance = 0.4, slowDuration = 2, speedReduction = 0.5 },
	Lightning = { damageMultiplier = 1.3, chainChance = 0.2, chainRange = 20 },
	None = { damageMultiplier = 1.0 },
}

CombatConfig.STATUS_EFFECTS = {
	Stunned = { duration = 1, canMove = false, canAttack = false },
	Burned = { duration = 3, damagePerSecond = 2, canMove = true, canAttack = true },
	Frozen = { duration = 2, canMove = false, canAttack = false },
	Poisoned = { duration = 5, damagePerSecond = 1, canMove = true, canAttack = true },
	Slowed = { duration = 2, speedMultiplier = 0.5, canMove = true, canAttack = true },
}

CombatConfig.ENABLE_ANIMATIONS = true
CombatConfig.ATTACK_ANIMATION_SPEED = 1.2
CombatConfig.KNOCKBACK_ANIMATION_SPEED = 0.8

CombatConfig.DEBUG_MODE = false
CombatConfig.SHOW_HITBOXES = false
CombatConfig.INVINCIBILITY_MODE = false

return CombatConfig
