module Day1 (solve) where

import AdventOfCode
import Data.Foldable (asum, find)
import Data.Maybe (fromMaybe)

parse :: String -> [Int]
parse = map read . lines

solve = (show . solve1 . parse, show . solve2 . parse)

solve1 :: [Int] -> Int
solve1 xs = fromMaybe 0 $ asum $ map f xs
  where
    f :: Int -> Maybe Int
    f x = (* x) <$> find ((== 2020) . (+ x)) xs

solve2 :: [Int] -> Int
solve2 = maybe 0 (\(a, b, c) -> a * b * c) . find (\(a, b, c) -> a + b + c == 2020) . triples
  where
    pairs [] = []
    pairs (x : xs) = map (\y -> (x, y)) xs ++ pairs xs
    triples [] = []
    triples (x : xs) = map (\(y, z) -> (x, y, z)) (pairs xs) ++ triples xs