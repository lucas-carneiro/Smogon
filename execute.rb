require_relative 'teammaker'

team = ""

if(ARGV.empty? || ARGV[0] == "-h")
	puts "Team Maker Help\n" \
		 "You can use 'ruby execute.rb -r N', where N is the number of random pokemon you want.\n" \
		 "You can use 'ruby execute.rb [Pokemon number or name]'\n" \
		 "Exemple: 'ruby execute.rb Venusaur charizard Blastoise 150 151'\n" \
		 "This will return a team with Venusaur, Charizard, Blastoise, Mewtwo and Mew.\n" \
		 "For more help, read the README file."
else
	if(ARGV[0] == "-r" && ARGV[1] != nil && ARGV[1].to_i != 0)
		(1..ARGV[1].to_i).each do 
			puts "random!"
		end
	else
		ARGV.each do |pokemon|
			team = team + Teammaker.getMoveset(pokemon.to_s)
		end
	end
	IO.write("team.txt", team)
end