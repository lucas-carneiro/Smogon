require_relative 'teammaker'

team = ""

ARGV.each do |pokemon|
	team = team + Teammaker.getMoveset(pokemon.to_s)
end

IO.write("team.txt", team)