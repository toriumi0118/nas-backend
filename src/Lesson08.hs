module Lesson08 
  ( start 
  )
  where

start :: IO ()
start = do
  putStrLn "[Lesson 08] 中置演算子" -- + や - などの値の間において使う演算子
  print $ 1 + 2
  print $ (+) 1 2 -- ()で囲むと前置できる
  print $ 5 `mod` 2 -- 引数が二つある関数は``で囲むと中置できる
  putStrLn ""

