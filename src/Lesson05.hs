module Lesson05 
  ( start 
  )
  where

add :: Int -> Int -> Int 
-- funcname :: args1type -> arg2type -> ... -> returntype
add x y = x + y

start :: IO ()
start = do
  putStrLn "[Lesson 05] func"
  let added = add 1 2
  print added
  print (add 3 4)
  print $ add 5 6 -- 短く書くなら。$は括弧の省略
  putStrLn ""
