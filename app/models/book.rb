class Book < ApplicationRecord
  belongs_to :user

  GRADE_LEVEL = {"J" => [1, 2], "K" => [2, 3], "L" => [2, 3], "M" => [2, 3], 
    "N" => [3, 4], "O" => [3, 4], "P" => [3, 4], "Q" =>[3, 4], 
    "R" => [3, 4], "S" => [4, 5], "T" => [4, 5], "U" => [4, 5], 
    "V" => [5], "W" => [5], "X" => [5], "Y" => [5], "Z" => [5]}
  
end
