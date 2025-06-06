#Edward Yeboah
#SBU ID: 114385084
#netid: eyeboah

#!/usr/bin/env ruby


class Array
    #Overrides the arrayindex accessor method []
    # @param i Index position to access
    # @return [object] the element at index i, or null if out of bounds
    # If you ask for an index that's too large or negative, you'll get a \0 instead of an error.

    def [](i)
        if i >= 0 && i < self.length
            self.at(i)
        else
            '\0'
        end
    end

    #This works like the normal map function but lets you choose a specific section
    # if you don't specify a range, it works on the whole array like normal
    # If you give it a range, it only transforms those specific items

    def map(range = nil)
        if range.nil?
            result = []
            self.each do |item|
                result << item
            end
            result
        elsif range.is_a?(Range)
            result = []
            range.each do |i|
                if i >= 0 && i < self.length
                    result << yield(self[i])
                end
            end
            result
        else
            []
        end
    end
end


#Provided test cases
a = [1,2,34,5]
puts a[1] # 2
puts a[10] # '\0'
p a.map(2..4) { |i| i.to_f} # [34.0, 5.0]
p a.map { |i| i.to_f} # [1.0, 2.0, 34.0, 5.0]
b = ["cat", "bat", "mat", "sat"]
puts b[-1] # "sat"
puts b[5] # '\0'
p b.map(2..10) { |x| x[0].upcase + x[1,x.length] } # ["Mat", "Sat"]
p b.map(2..4) { |x| x[0].upcase + x[1,x.length] } # ["Mat", "Sat"]
p b.map(-3..-1) { |x| x[0].upcase + x[1,x.length] } # ["Bat", "Mat", "Sat"]
p b.map { |x| x[0].upcase + x[1,x.length] } # ["Cat", "Bat", "Mat", "Sat"]
