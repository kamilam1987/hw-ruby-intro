# When done, submit this entire file to the autograder.

# Author: Kamila Michel
# Student id: g00340498

# ================================== Part 1 ===================================
# ============================ Arrays, Hashes, and Enumerables ================

=begin
Define a method sum(array) that takes an array of integers as an argument and 
returns the sum of its elements. 
For an empty array it should return zero. 
=end

def sum arr
  arr.inject(0, :+) #Returns sum of the elements in the array
end

=begin
Define a method max_2_sum(array) which takes an array of integers
as an argument and returns the sum of its two largest elements. 
For an empty array it should return zero. 
For an array with just one element, it should return that element. 
=end

def max_2_sum arr
  sum(arr.sort.last(2)) #Sorts the array and returns sum of two max elements
end

=begin
Define a method sum_to_n?(array, n) that takes an array of integers and
an additional integer, n, as arguments and returns true if any two elements
in the array of integers sum to n. sum_to_n?([], n) 
should return false for any value of n, by definition.
Source code adapted from: http://ruby.bastardsbook.com/chapters/enumerables/
=end

def sum_to_n? arr, n
  arr.each_index do |i| #Passes the index of the element
    for j in arr[i+1...arr.length] #Loops through the array
      if arr[i] + j == n #Checks if any two elements in the array of integers sum to n
        return true
      end
    end
  end
  return false
end
# ================================= End of Partt 1 =============================

# ================================== Part 2 ====================================
# ======================== Strings and Regular Expressions =====================

=begin
Define a method hello(name) that takes a string representing
a name and returns the string "Hello, " concatenated with the name. 
=end

def hello(name)
  "Hello, #{name}"
end

=begin
Define a method starts_with_consonant?(s) that takes a string and returns
true if it starts with a consonant and false otherwise.
Source code adapted from:
https://stackoverflow.com/questions/18406509/using-regexp-to-check-whether-a-string-starts-with-a-consonant
=end

def starts_with_consonant? s
  s =~ /\A(?=[^aeiou])(?=[a-z])/i
end
=begin
Define a method binary_multiple_of_4?(s) that takes a string and returns
true if the string represents a binary number that is a multiple of 4. 
=end

def binary_multiple_of_4? s
  return true if s == "0" #Returns true if string isn't 0
  /^[10]*00$/.match(s) != nil
end
# ============================End of Part 2 ====================================

# ==============================Part 3 =========================================
# ========================Object Oriented Basics ===============================

=begin
Define a class BookInStock which represents a book with an ISBN number,
isbn, and price of the book as a floating-point number, price, as attributes.
The constructor should accept the ISBN number as the first argument and price 
as second argument, and should raise ArgumentError if the ISBN number is the 
empty string or if the price is less than or equal to zero. 
Include the proper getters and setters for these attributes.
Include a method price_as_string that returns the price of the book formatted
with a leading dollar sign and two decimal places, that is, a price of 20 should
format as "$20.00" and a price of 33.8 should format as "$33.80"
=end
class BookInStock
  
  # Declare accessor for isnb and price
  attr_accessor:isbn
  attr_accessor:price
  
  # Method takes isnb and price arguments
  def initialize(isbn, price)
    #Raises error if isnb is empty string or price is less or equal to 0
    raise ArgumentError if isbn.empty? || price <= 0 
    # Declare getters and setters
    @isbn = isbn
    @price = price
  end

  def price_as_string
    # Returns formatted price
    "$%.2f" % @price
  end
end
