require 'csv'
require_relative 'smogon-api/lib/smogon'

module Teammaker
	# Gets a pokemon name or number and returns the first moveset for it on Smogon MovesetDex.
	# By default, uses the OU tier and the XY metagame. Can be modified by parameters.
	# If the function dont found any moveset for the specified tier, it will search for any moveset.
	def self.getMoveset(pokemon, tier="OU", gen="XY")
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
			movesets = Smogon::Movesetdex.get pokemon, nil, gen
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