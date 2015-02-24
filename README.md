# Team Maker

This fork uses the Smogon-API to get moveset data and make a team for Pokémon Showdown. All the modifications made on Smogon-API code have the purpose to be runnable using Smogon-API locally (without gem install) and to be a valid output for Showdown team builder.

Use: ruby execute.rb [Pokémon Name or Number]
Example: ruby execute.rb Venusaur Charizard Blastoise 151

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
EVs: 236 HP / 0 Atk / 0 Def / 252 SpA / 0 SpD / 20 Spe
Modest Nature
- Rapid Spin
- Hydro Pump
- Dark Pulse
- Aura Sphere

Mew @ Leftovers
Ability: Synchronize
EVs: 252 HP / 0 Atk / 104 Def / 0 SpA / 0 SpD / 152 Spe
Impish Nature
- Defog
- Soft-Boiled
- Will-O-Wisp
- Knock Off

All the movesets generated are the first result for that pokémon on XY Smogon Moveset. If you want to make any changes, you only need to know the basics of Smogon-API.