p "Staircase 2!"

# Function takes in 3 params
# steps: amount of steps on staircase
# m: maximum amount of steps that can be taken at once
# array: We will use dynamic programming to store results here.
# Return number of ways to reach top of staircase
def staircase_2 steps, m, array=[]
	# If staircase has 0-1 steps, only one way to reach top
	if steps <= 1
		return 1
	end
	
	# If we already found answer from before, its in array.
	if array[steps]
		return array[steps]
	end

	# Add up results in this variable.
	result = 0

	# Ex: answer to steps 4 equals staircase(3-1) + staircase(3-2) + ...staircase(3-m)
	for i in 1..m
		# Only if steps >= 0
		if steps - i >= 0
			result += staircase_2 steps - i, m, array
		end
	end

	# Store result in array before returning
	array[steps] = result

	result			
end	

p staircase_2 3, 3 # 4

p staircase_2 4, 2 # 5

p staircase_2 3, 2 # 3

p staircase_2 0, 3 # 1

p staircase_2 1, 2 # 1

p staircase_2 3, 5 # 4