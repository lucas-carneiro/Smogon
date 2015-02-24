# Team Maker

This fork uses the Smogon-API to get moveset data and make a team for Pokémon Showdown. All the modifications made on Smogon-API code have the purpose to be runnable using Ruby 1.9 and to be a valid output for Showdown team builder.

Use: ruby teammaker.rb [Pokémon]
Example: ruby teammaker.rb Venusaur Charizard Blastoise

All the teams generated are stored in a file called "team.txt". Each execution of the teammaker rewrites the file.

Example output:

Venusaur @ Venusaurite
Ability: Chlorophyll
EVs: 252 HP / 0 Atk / 240 Def / 0 SpA / 0 SpD / 16 Spe
Bold Nature
- Giga Drain
- Sludge Bomb
- Synthesis
- Hidden Power Fire

Charizard @ Charizardite X
Ability: Blaze
EVs: 144 HP / 252 Atk / 0 Def / 0 SpA / 0 SpD / 112 Spe
Adamant Nature
- Dragon Dance
- Dragon Claw
- Earthquake
- Roost

Blastoise @ Blastoisinite
Ability: Rain Dish
EVs: 56 HP / 0 Atk / 0 Def / 252 SpA / 0 SpD / 200 Spe
Modest Nature
- Hydro Pump
- Dark Pulse
- Aura Sphere
- Dragon Pulse

All the movesets generated are the first result for that pokémon on XY Smogon Moveset. If you want to make any changes, you only need to know the basics of Smogon-API.