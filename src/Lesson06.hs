module Lesson06 
  ( start 
  )
  where

fact :: Int -> Int -- 階乗
fact 0 = 1 -- 記述の順番は大切 ifとかと同様に先にマッチした処理が行われる
fact x = x * fact (x-1)

start :: IO ()
start = do
  putStrLn "[Lesson 06] recursive" -- ループは存在しないらしいので再帰処理
  print $ fact 5
  putStrLn ""
