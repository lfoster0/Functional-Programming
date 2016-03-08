-- Question 15
subList 0 _ = [[]]
subList _ [] = []
subList k (x:xs) = (map (x:) (subList (k-1) xs)) ++ (subList k xs)

-- Question 16
isSubList xs ys = (containsList xs (subList (length xs) ys)) where
    containsList x (y:[]) = x == y
    containsList x (y:ys) = (x == y) || containsList x ys

-- Question 17
question17 = let
    question17' [] = []
    question17' (x:xs) = if (isCorrectList x)
        then x
        else question17' xs
    in question17' (subList 10 [1..40])

isCorrectList (2:x:4:y:z:xs) = if x+y+z == 16
    then True
    else False
isCorrectList (x:xs) = False
