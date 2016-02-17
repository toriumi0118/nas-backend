module Lesson03
  ( start 
  )
  where

start :: IO ()
start = do
  putStrLn "[Lesson 03] vars"
  let n = 456
  print n
  -- n = 111 再代入は不可
  putStrLn ""
