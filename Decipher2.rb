def solve_cipher(input, shift)
	if shift < 0
		shift = -shift
		shift = shift%25
		shift = -shift
	else
		shift = shift%25
	end
	cipharray = input.split("")
	ciarrayord = []
	ciarraynum = []
	cipharray.each do |item|
		ciarrayord << item.gsub(/./) {|s| s.ord.to_s + ''}
	end
	ciarrayord.each do |item|
		ciarraynum << item.to_i
	end
	charac = (ciarrayord.length)-1
	index =(0..charac)
	deciarraynum = []
	for i in index
		if ciarraynum [i] > 64 && ciarraynum [i] < 91 || ciarraynum [i] > 96 && ciarraynum [i] < 123
			deciarraynum << ciarraynum [i] + shift
			if deciarraynum [i] < 65 || deciarraynum [i] < 97 && ciarraynum [i] > 96 
				deciarraynum [i] = deciarraynum [i] + 25
			elsif deciarraynum [i] > 90 && ciarraynum [i] < 91 || deciarraynum [i] > 122
				deciarraynum [i] = deciarraynum [i] - 25
			end
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
print "Enter the shift (shift left < 0, shift right > 0): "
shift = gets.chomp.to_i
solve_cipher(text, shift)