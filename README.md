# Team Maker

This fork uses the Smogon-API to get moveset data and make a team for Pokémon Showdown. All the modifications made on Smogon-API code have the purpose to be runnable using Smogon-API locally (without gem install) and to be a valid output for Showdown team builder.


For any help with commands, use "ruby execute.rb -h".

Use: ruby execute.rb [Pokémon Name or Number]

Example: ruby execute.rb Venusaur Charizard Blastoise 151

All the teams generated are stored in a file called "team.txt". Each execution of the teammaker rewrites the file.

Output Example:


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


If you want a random team, you can use "ruby execute.rb -r N", where N = team size. Using "ruby execute.rb -r" will generate a 6 team.


All the movesets generated are the first result for that pokémon on XY OU Smogon Moveset. If you want to make any changes, just edit the teammaker file.