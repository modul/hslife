module Main where

import Life
import System.Random

width = 80
height = 40
showw = showWorldUsing defaultLifeSign

generate = iterate generation

main :: IO ()
main = do
    rng <- getStdGen
    let world = mkRandWorld rng height width
    mapM_ putStrLn . map showw . generate $ world
  
