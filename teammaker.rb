require 'csv'
require_relative 'smogon-api/lib/smogon'

module Teammaker
	# Gets a pokemon name or number and returns the first moveset for it on Smogon MovesetDex.
	# By default, uses the OU tier and the XY metagame. Can be modified by parameters.
	# If you set tryagain (for tier and/or gen), it will research for a moveset in any tier/gen.
	def self.getMoveset(pokemon, tier="OU", gen="XY", tryagainTIER, tryagainGEN)
		if (pokemon.respond_to?("to_i") && pokemon.to_i != 0)
			pokemon = Tools.nationalNumToName(pokemon.to_i)
		end
		pokemon = pokemon.capitalize
		text = ""
		movesets = Smogon::Movesetdex.get pokemon, tier, gen
		if(movesets == nil)
			puts "#{pokemon} is not a pokemon!"
			return ""
		end
		if (!movesets.empty?)
			moveset = movesets[0]
			text =  "#{pokemon} @ #{moveset.item[0]}\n" \
					"Ability: #{moveset.ability[0]}\n" \
					"EVs: #{moveset.evs}\n" \
					"#{moveset.nature[0]} Nature\n" \
					"- #{moveset.moves[0][0]}\n" \
					"- #{moveset.moves[1][0]}\n" \
					"- #{moveset.moves[2][0]}\n" \
					"- #{moveset.moves[3][0]}"
			puts text
		else
			if (tryagainTIER)
				if (tryagainGEN)
					return getMoveset(pokemon, nil, nil, false, false)
				else
					return getMoveset(pokemon, nil, gen, false, false)
				end
			else
				if (tryagainGEN)
					return getMoveset(pokemon, tier, nil, false, false)
				end
				puts "#{pokemon} has no movesets!"
				return ""
			end
		end
		text = text + "\n\n"
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