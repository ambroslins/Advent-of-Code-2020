module AdventOfCode
  ( Solution,
    module Data.Attoparsec.Text,
    module Data.Maybe,
    module Data.Foldable,
    module Data.Text,
    module Control.Applicative,
    Map,
    Set,
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

type Solution = String -> (String, String)