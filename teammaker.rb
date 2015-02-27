require 'csv'
require_relative 'smogon-api/lib/smogon'

module Teammaker
	# Gets a pokemon name or number and returns the first moveset for it on Smogon MovesetDex.
	# By default, uses the OU tier and the XY metagame. Can be modified by parameters.
	# Gen parameter can receive a string ("XY") or an array (["XY", "BW"]). It will search for a moveset respecting the array order.
	# If you set tryagainTIER, it will search for a moveset in any tier (if dont found any set for the specified tier).
	# If you use an array for Gen and tryagainTIER=true, first it will search in any tier. After that, will search in another gen.
	# Use noLC to get or discard Little Cup movesets.
	# Use random to get a random moveset between the smogon sets for that pokemon (using tier and gen)
	def self.getMoveset(pokemon, tier="OU", gen="XY", random=false, noLC=true, tryagainTIER)
		if (tier == "LC")
			noLC = false
		end
		if (pokemon.respond_to?("to_i") && pokemon.to_i != 0)
			pokemon = Tools.nationalNumToName(pokemon.to_i)
		end
		pokemon = pokemon.capitalize
		if (pokemon == "Meowstic")
			pokemon = "Meowstic-m"
		end
		text = ""
		if (gen.is_a? Array)
			movesets = Smogon::Movesetdex.get pokemon, tier, gen.first
		else
			movesets = Smogon::Movesetdex.get pokemon, tier, gen
		end
		if(movesets == nil)
			puts "#{pokemon} is not a pokemon!"
			puts "Check your spelling and your GEN choice."
			return ""
		end
		if (!movesets.empty?)
			moveset = nil
			if(random)
				moveset = movesets[Random.new().rand(0...movesets.length)]
			else
				movesets.each do |set|
					if (set.ability[0] != nil && set.item[0] != nil && set.nature[0] != nil)
						moveset = set
						break
					end
				end
			end
			if (moveset == nil)
				moveset = movesets[0]
			end
			if (moveset.tier == "LC" && noLC)
				puts "#{pokemon} is tier Little Cup!"
				return ""
			end
			if (pokemon == "Meowstic-m")
				pokemon = "Meowstic"
			end
			if (moveset.ability[0] == nil)
				moveset.ability[0] = Smogon::Pokedex.get(pokemon).abilities[0]
			end
			text =  "#{pokemon} @ #{moveset.item[0]}\n" \
					"Ability: #{moveset.ability[0]}\n" \
					"EVs: #{moveset.evs}\n" \
					"#{moveset.nature[0]} Nature\n"
			moveset.moves.each do |move|
				text = text + "- #{move[0]}\n"
			end
			puts text
		else
			if (tryagainTIER)
				return getMoveset(pokemon, nil, gen, false)
			else
				if (gen.is_a?(Array) && gen.length > 1)
					gen.delete_at(0)
					return getMoveset(pokemon, tier, gen, false)
				end
				puts "#{pokemon} has no movesets!"
				puts "Try another Tier/Gen!"
				return ""
			end
		end
		text = text + "\n"
		return text
	end

	# Class with tools for Team Maker.
	class Tools
	# Gets a national dex number and returns its name.
		def self.nationalNumToName(number)
			pokedex = CSV.read("pokemon.csv")
			return pokedex[number][1]
		end
	end
end