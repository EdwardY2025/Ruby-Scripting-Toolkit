#Edward Yeboah
#SBU ID: 114385084
#netid: eyeboah

#Makes a secret code from numbers by taking consecutive sums of an array sequence over and over
def findEncryption(numbers)
  while numbers.length > 2
    encrypted_numbers = [] #Stores the encrypted numbers
    i = 0 #Starts at the beginning of the list

    #Iterates over the array values and neighboring elements
    while i < numbers.length - 1
      sum = numbers[i] + numbers[i + 1]
      #Only keep the last digit (like 7+8 = 15 --> keep 5)
      last_digit = sum % 10
      #Save this new number for the next round
      encrypted_numbers << last_digit
      i += 1 #move to the next pair
    end
    #Now the encrypted numbers for the next round
    numbers = encrypted_numbers

  end
  #when only 2 numbers are left, join them to make the final code
  numbers.join
end
#Provided test cases
puts findEncryption([4, 9, 1, 7, 3])
puts findEncryption([5])
puts findEncryption([4, 9])
