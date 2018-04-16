module Main where

import Life
import System.Random
import System.Environment
import System.Exit
import System.Info (os)
import Control.Concurrent (threadDelay)
import Control.Exception

import System.Console.ANSI

fps = 30
width = 80
height = 40

main :: IO ()
main = do
    setTitle "Game of Life"
    clearScreen
    game fps height width showWorld `catch` \UserInterrupt -> exitGame

game fps h w display = do
    rng <- getStdGen
    let world = mkRandWorld rng h w
    mapM_ (frame fps . display) (generate world)
    where generate = iterate generation

exitGame = do
    clearScreen
    setCursorPosition 0 0

draw str = do
    hideCursor
    setCursorPosition 0 0
    putStrLn str

frame speed content = let delay = round (1e6 / speed)
                       in draw content >> threadDelay delay
