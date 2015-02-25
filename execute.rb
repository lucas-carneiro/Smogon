require_relative 'teammaker'

team = ""

if(ARGV.empty? || ARGV[0] == "-h")
	puts "Team Maker Help\n" \
		 "You can use 'ruby execute.rb -r N', where N is the number of random pokemon you want.\n" \
		 "If you dont use N, it will be generated a team with 6 random pokémon.\n" \
		 "You can use 'ruby execute.rb [Pokemon number or name]'\n" \
		 "Exemple: 'ruby execute.rb Venusaur charizard Blastoise 150 151'\n" \
		 "This will return a team with Venusaur, Charizard, Blastoise, Mewtwo and Mew.\n" \
		 "For more help, read the README file."
else
	if(ARGV[0] == "-r")
		prng = Random.new()
		if (ARGV[1] != nil && ARGV[1].to_i != 0)
			i = ARGV[1].to_i
		else
			i = 6
		end
		(1..i).each do
			dexnumber = prng.rand(1..740)
			pokemon = Teammaker.getMoveset(dexnumber, false, true)
			while (pokemon == "") do
				dexnumber = prng.rand(1..740)
				pokemon = Teammaker.getMoveset(dexnumber, false, true)
			end
			team = team + pokemon
		end
	else
		ARGV.each do |pokemon|
			team = team + Teammaker.getMoveset(pokemon.to_s, false, true)
		end
	end
	IO.write("team.txt", team)
end