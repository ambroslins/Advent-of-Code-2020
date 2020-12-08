module AdventOfCode
  ( Solution,
    module Data.Attoparsec.Text,
    module Data.Maybe,
    module Data.Foldable,
    module Data.Text,
    module Control.Applicative,
    Map,
    Set,
    Vector,
    solveParser,
    sepEndBy,
    sepEndBy1,
    word,
    symbol,
  )
where

import Control.Applicative (many, some, (<|>))
import Data.Attoparsec.Text
  ( Parser,
    anyChar,
    char,
    choice,
    count,
    decimal,
    digit,
    double,
    endOfInput,
    endOfLine,
    inClass,
    letter,
    many1,
    manyTill,
    notChar,
    notInClass,
    option,
    parseOnly,
    satisfy,
    sepBy,
    sepBy1,
    signed,
    skip,
    skipMany,
    skipSpace,
    skipWhile,
    space,
    string,
    try,
  )
import Data.Foldable (asum, find)
import Data.Map (Map)
import Data.Maybe (fromMaybe)
import Data.Set (Set)
import Data.Text (Text, pack, unpack)
import Data.Vector (Vector)

type Solution = String -> (String, String)

solveParser :: (Show b, Show c) => Parser a -> (a -> b) -> (a -> c) -> Solution
solveParser p f1 f2 input = case parseOnly (p <* endOfInput) (pack input) of
  Left e -> (e, "")
  Right x -> (show $ f1 x, show $ f2 x)

sepEndBy p sep = p `sepBy` sep <* sep

sepEndBy1 p sep = p `sepBy1` sep <* sep

word = many1 letter <* skipSpace

symbol s = string s <* skipSpace
