module Main where

import Life
import System.Random
import System.Environment
import System.Exit
import System.Info (os)
import System.Process (callCommand)
import Control.Concurrent (threadDelay)

fps = 60
width = 80
height = 40

draw str = callCommand (clear os) >> putStrLn str
    where clear "linux" = "clear"
          clear _       = "cls"


frame speed content = let delay = round (1e6 / speed)
                       in draw content >> threadDelay delay

generate = iterate generation

showw = showWorldUsing defaultLifeSign

main :: IO ()
main = do
    --getArgs >>= (putStrLn . show)
    rng <- getStdGen
    let world = mkRandWorld rng height width
    mapM_ (frame fps . showw) (generate world)

