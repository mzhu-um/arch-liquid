{-@ LIQUID "--counter-examples" @-}

module Demo.Subtyping where

import Language.Haskell.Liquid.Prelude

import           Data.Function ((&))

{-@ type Nat = { x : Int | r >= 0 } @-}

{-@ good :: x:Nat -> y:Nat -> r:Nat @-}
good :: Int -> Int -> Int
good x y = x `div` (y + 1)

ex2 = let x = 1
          y = inc x
      in 10 `div` y

{-@ inc :: z:Int -> { v:Int | v > z } @-}
inc :: Int -> Int
inc = \z -> z + 1
