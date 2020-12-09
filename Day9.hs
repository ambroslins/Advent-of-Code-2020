module Day9 where

import AdventOfCode
import Data.List (tails)

parse :: String -> [Int]
parse = map read . lines

solve :: Solution
solve input = let x = parse input in (show $ solve1 x, show $ solve2 x)

solve1 :: [Int] -> Int
solve1 = uncurry go . splitAt 25
  where
    go ys (x : xs) =
      if any (\(a, b) -> a /= b && a + b == x) $ pairs ys
        then go (tail ys ++ [x]) xs
        else x
    pairs [] = []
    pairs (x : xs) = map (\y -> (x, y)) xs ++ pairs xs

solve2 :: [Int] -> Maybe Int
solve2 input = case cont of
  Nothing -> Nothing
  Just c -> Just $ maximum c + minimum c
  where
    target = solve1 input
    go acc list
      | acc == target = Just []
      | otherwise = case list of
        (x : xs) | acc < target -> (x :) <$> go (acc + x) xs
        _ -> Nothing
    cont = asum $ map (go 0) $ tails input
