{-@ LIQUID "--prune-unsorted" @-}

module Demo.LHMeasures where

-- {-@ reflect fib @-}
-- {-@ fib :: i:Nat -> Nat @-}
-- fib i | i == 0    = 0 
--       | i == 1    = 1 
--       | otherwise = fib (i-1) + fib (i-2)

-- Determines if given list of Integers contains only positivenumbers
{-@ measure allPos @-}
allPos :: [Int] -> Bool
allPos [] = True
allPos (h:t) = (h > 0) && (allPos t)

{-@ type PosIntList = {l : [Int] | allPos l} @-}

{-@ type PosIntListNE = {l : PosIntList | len l > 0} @-}

{-@ head :: PosIntListNE -> { i : Int | i > 0 } @-}
head :: [Int] -> Int
head (h:_) = h

{-@ tail :: PosIntListNE -> PosIntList @-}
tail :: [Int] -> [Int]
tail (_:t) = t
