{-@ LIQUID "--counter-examples" @-}
{-@ LIQUID "--notermination" @-}

module Demo.Nonterm where

import Language.Haskell.Liquid.Prelude

import           Data.Function ((&))

{-@ type Nat = { x : Int | r >= 0 } @-}

{-@ good :: x:Nat -> y:Nat -> r:Nat @-}
good :: Int -> Int -> Int
good x y = x `div` (y + 1)

{-@ collatz :: Int -> { v : Int | v = 1 } @-}
collatz :: Int -> Int
collatz n
  | n == 1 = 1
  | even n = collatz (n `div` 2)
  | otherwise = collatz (3*n + 1)

ex1 :: Int -> Int
ex1 n = let x = collatz n in 10 `div` x

ex2 = let x = 1
          y = inc x
      in 10 `div` y

{-@ inc :: z:Int -> { v:Int | v > z } @-}
inc :: Int -> Int
inc = \z -> z + 1
