module Main where

import AdventOfCode
import Control.Monad (forM_)
import qualified Data.IntMap as IntMap
import qualified Day1
import qualified Day2
import qualified Day3
import qualified Day4
import qualified Day5
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
printSolution i s = do
  input <- readFile $ "input/" ++ show i ++ ".txt"
  putStrLn $ "Day " ++ show i ++ ":"
  let (s1, s2) = s input
  putStrLn $ s1
  putStrLn $ s2

solutions :: IntMap.IntMap Solution
solutions =
  IntMap.fromList
    [ (1, Day1.solve),
      (2, Day2.solve),
      (3, Day3.solve),
      (4, Day4.solve),
      (5, Day5.solve)
    ]
