def solve_cipher(input)
	cipharray = input.split("")
	ciarrayord = []
	ciarraynum = []
	cipharray.each do |item|
		ciarrayord << item.gsub(/./) {|s| s.ord.to_s + ' '}
	end
	ciarrayord.each do |item|
		ciarraynum << item.to_i
	end
	charac = (ciarrayord.length)-1
	index =(0..charac)
	deciarraynum = []
	for i in index
		if ciarraynum [i] > 65 && ciarraynum [i] < 91 || ciarraynum [i] > 97 && ciarraynum [i] < 123
			deciarraynum << ciarraynum [i] - 1
		elsif ciarraynum [i] == 65 || ciarraynum [i] == 97
			deciarraynum << (ciarraynum [i]) + 25
		else
			deciarraynum << ciarraynum [i]
		end
	end
	deciarraystr = []
	deciarraynum.each do |item|
		deciarraystr << item.chr
	end
	decitext = deciarraystr.join

	puts "=> " + decitext
end

print "Enter a text to decipher (by Caesar cipher): "
text = gets.chomp
solve_cipher(text)
