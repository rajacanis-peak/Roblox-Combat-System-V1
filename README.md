# Roblox Modular Combat System

A complete, modular, and easily configurable combat system for Roblox games. This system includes damage calculation, combo mechanics, cooldown management, weapon system, health/status effects, and more.

## Features

✅ **Modular Architecture** - Each component is independent and reusable
✅ **Configurable Values** - All balance settings in one central config file
✅ **Combo System** - Progressive damage multipliers for consecutive attacks
✅ **Cooldown Management** - Tracks cooldowns for all attack types
✅ **Health System** - Full health management with regeneration and status effects
✅ **Weapon System** - Multiple weapons with different stats and properties
✅ **Damage Calculator** - Advanced damage calculations including crits, elements, and modifiers
✅ **Status Effects** - Burn, Frozen, Poisoned, Slowed, Stunned
✅ **Element System** - Fire, Ice, Lightning damage with unique effects
✅ **Debug Mode** - Built-in debugging and logging

## Project Structure

```
RobloxCombatSystem/
├── src/
│   ├── modules/
│   │   ├── CombatConfig.lua          # Central configuration file
│   │   ├── CombatSystem.lua          # Main combat system
│   │   ├── HealthSystem.lua          # Health & damage management
│   │   ├── CooldownManager.lua       # Cooldown tracking
│   │   ├── ComboSystem.lua           # Combo mechanics
│   │   ├── DamageCalculator.lua      # Damage calculations
│   │   └── WeaponSystem.lua          # Weapon management
│   └── scripts/
│       ├── CombatClient.lua          # Client-side controller
│       └── CombatServer.lua          # Server-side management
└── README.md
```

## Installation

1. **Copy modules to ReplicatedStorage**
   - Create a folder: `ReplicatedStorage/CombatModules`
   - Copy all files from `src/modules/` into this folder

2. **Setup server script**
   - Copy `CombatServer.lua` to `ServerScriptService`
   - Ensure it requires modules from ReplicatedStorage

3. **Setup client script**
   - Copy `CombatClient.lua` to `StarterPlayer/StarterCharacterScripts`
   - It will automatically initialize for each player

## Configuration

All changeable values are in `CombatConfig.lua`:

### Player Stats
```lua
CombatConfig.PLAYER_BASE_HEALTH = 100
CombatConfig.PLAYER_HEALTH_REGEN = 0        -- per second
CombatConfig.PLAYER_HEALTH_REGEN_DELAY = 5  -- seconds before regen
```

### Damage Settings
```lua
CombatConfig.BASE_DAMAGE = 10
CombatConfig.CRITICAL_DAMAGE_MULTIPLIER = 1.5
CombatConfig.CRITICAL_CHANCE = 0.25  -- 25%
```

### Attack Cooldowns
```lua
CombatConfig.BASIC_ATTACK_COOLDOWN = 0.5
CombatConfig.HEAVY_ATTACK_COOLDOWN = 1.5
CombatConfig.SPECIAL_ATTACK_COOLDOWN = 3
```

### Combo System
```lua
CombatConfig.COMBO_RESET_TIME = 2          -- seconds before reset
CombatConfig.MAX_COMBO_COUNT = 5
CombatConfig.COMBO_DAMAGE_MULTIPLIER = 0.2 -- each combo adds 20% damage
```

### Weapons
```lua
CombatConfig.WEAPONS = {
    Sword = {
        name = "Sword",
        damage = 15,
        cooldown = 0.6,
        range = 12,
        knockback = 30,
        hitstun = 0.3,
    },
    -- Add more weapons...
}
```

### Status Effects
```lua
CombatConfig.STATUS_EFFECTS = {
    Stunned = { duration = 1, canMove = false, canAttack = false },
    Burned = { duration = 3, damagePerSecond = 2, canMove = true, canAttack = true },
    -- Add more effects...
}
```

## Usage

### Basic Attack
```lua
local success = combatSystem:basicAttack(targetCombatSystem)
if success then
    print("Attack hit!")
end
```

### Heavy Attack
```lua
local success = combatSystem:heavyAttack(targetCombatSystem)
```

### Switch Weapon
```lua
combatSystem:switchWeapon("Axe")
```

### Apply Damage
```lua
combatSystem.health:takeDamage(25, attacker, "BasicAttack")
```

### Heal Player
```lua
combatSystem.health:heal(50)
```

### Add Status Effect
```lua
combatSystem.health:addStatusEffect("Burned", 3)
```

### Check Cooldown
```lua
if not combatSystem.cooldowns:isOnCooldown("BasicAttack") then
    -- Can attack
end
```

## Events

### Combat System Events
```lua
combatSystem.attackPerformed:Connect(function(attackType, damage, isCritical)
    -- Handle attack UI
end)

combatSystem.enemyHit:Connect(function(targetCombatSystem, damage, isCritical)
    -- Handle hit feedback
end)
```

### Health System Events
```lua
combatSystem.health.damageTaken:Connect(function(damage, attacker, attackType)
    -- Handle damage
end)

combatSystem.health.healed:Connect(function(amount)
    -- Handle healing
end)

combatSystem.health.died:Connect(function(killer)
    -- Handle death
end)
```

### Combo System Events
```lua
combatSystem.combo.comboUpdated:Connect(function(comboCount)
    -- Update combo display
end)

combatSystem.combo.comboReset:Connect(function(finalCombo)
    -- Show combo ended
end)
```

## Debug Mode

Enable debug output in `CombatConfig.lua`:
```lua
CombatConfig.DEBUG_MODE = true
CombatConfig.SHOW_HITBOXES = true  -- Visualize hit detection
```

## Customization Guide

### Adding a New Weapon
1. Add to `CombatConfig.WEAPONS`:
```lua
CombatConfig.WEAPONS.Spear = {
    name = "Spear",
    damage = 20,
    cooldown = 0.7,
    range = 15,
    knockback = 35,
    hitstun = 0.4,
}
```

### Adding a New Status Effect
1. Add to `CombatConfig.STATUS_EFFECTS`:
```lua
CombatConfig.STATUS_EFFECTS.Silenced = {
    duration = 4,
    canAttack = false,
    canMove = true,
}
```

### Adding a New Element
1. Add to `CombatConfig.ELEMENTS`:
```lua
CombatConfig.ELEMENTS.Holy = {
    damageMultiplier = 1.25,
    -- Add custom properties
}
```

## Tips for Balance

- **Increase difficulty**: Increase `BASE_DAMAGE` and `CRITICAL_CHANCE`
- **Faster combat**: Decrease cooldown values
- **More forgiving**: Increase `PLAYER_BASE_HEALTH`
- **Combo-focused**: Increase `COMBO_DAMAGE_MULTIPLIER`
- **Weapon diversity**: Adjust individual weapon stats

## Known Limitations

- Hitbox detection is simplified (raycast implementation needed)
- Animations not included (hook into your animation system)
- Network replication simplified (needs RemoteEvent/RemoteFunction for full MP)
- Knockback uses placeholder (implement with AssemblyLinearVelocity or BodyVelocity)

## Future Improvements

- [ ] Advanced collision detection
- [ ] Particle effects for hits and effects
- [ ] Animation integration
- [ ] Sound effects
- [ ] Skill/ability system
- [ ] Loot/drop system
- [ ] Experience/leveling
- [ ] Equipment/armor system
- [ ] NPC combat AI
- [ ] PvP matchmaking

## License

Free to use and modify for your Roblox games!

## Support

For issues or questions:
1. Check debug mode output
2. Review configuration values
3. Verify module installation paths
4. Test in Studio first
