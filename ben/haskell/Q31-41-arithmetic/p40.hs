{-
Goldbach's conjecture.

Goldbach's conjecture says that every positive even number greater than 2 is the sum of two prime numbers. Example: 28 = 5 + 23. It is one of the most famous facts in number theory that has not been proved to be correct in the general case. It has been numerically confirmed up to very large numbers (much larger than we can go with our Prolog system). Write a predicate to find the two prime numbers that sum up to a given even integer.
-}

goldbach :: Int -> (Int, Int)
goldbach nb = head [(a,b) | a <- eratosthenes nb, 
                            b <- eratosthenes nb,
                            a + b == nb]

-- code from p39

eratosthenes :: Int -> [Int]
eratosthenes nb
    | nb < 2 = []
    | otherwise = removeMultiples [2..nb]

removeMultiples :: [Int] -> [Int]
removeMultiples [] = []
removeMultiples (x:xs) = x : (removeMultiples . filter (\a -> mod a x /= 0) $ xs)