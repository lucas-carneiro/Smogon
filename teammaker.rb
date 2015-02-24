require_relative 'smogon-api/lib/smogon'

team = ""

ARGV.each do |pokemon|
	movesets = Smogon::Movesetdex.get pokemon.to_s, nil, 'xy'
	if (!movesets[0].nil?)
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
	end
	team = team + text + "\n\n" 
end

IO.write("team.txt", team)