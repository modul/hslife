module Main where

import Life
import System.Random
import System.Environment
import System.Exit

width = 80
height = 40
showw = showWorldUsing defaultLifeSign

generate = iterate generation

main :: IO ()
main = do
    --getArgs >>= (putStrLn . show)
    rng <- getStdGen
    let world = mkRandWorld rng height width
    mapM_ (putStrLn . showw) (generate world)
  
