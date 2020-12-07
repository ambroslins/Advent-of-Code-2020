module Main where

import AdventOfCode
import Control.Monad (forM_)
import qualified Data.IntMap as IntMap
import qualified Day1
import System.Environment
import Text.Read (readMaybe)

main :: IO ()
main =
  getArgs >>= \case
    [] -> mapM_ (uncurry printSolution) $ IntMap.toList solutions
    xs -> forM_ xs $ \arg -> case readMaybe arg of
      Nothing -> putStrLn $ arg ++ " is not a number"
      Just x ->
        maybe (putStrLn $ "day " ++ show x ++ " not implemented") (printSolution x) $
          IntMap.lookup x solutions

printSolution :: Int -> Solution -> IO ()
printSolution i (f1, f2) = do
  input <- readFile $ "input/" ++ show i ++ ".txt"
  putStrLn $ "Day " ++ show i ++ ":"
  putStrLn $ f1 input
  putStrLn $ f2 input

solutions :: IntMap.IntMap Solution
solutions =
  IntMap.fromList
    [ (1, Day1.solve)
    ]
