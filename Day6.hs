module Day6 where

import AdventOfCode
import qualified Data.Set as Set

type Group = [Set Char]

parseGroup :: Parser Group
parseGroup = (Set.fromList <$> many1 letter) `sepEndBy1` endOfLine

solve :: Solution
solve = solveParser (parseGroup `sepBy` endOfLine) solve1 solve2

solve1 :: [Group] -> Int
solve1 = sum . map (Set.size . foldr1 Set.union)

solve2 :: [Group] -> Int
solve2 = sum . map (Set.size . foldr1 Set.intersection)