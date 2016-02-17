module Lesson07 
  ( start 
  )
  where

absolute :: Int -> Int
absolute x = if x < 0 then -x else x
-- if cond then func1 else func2
-- ifは文ではなく式なので値を持つ
-- そのためfunc1とfunc2は同じ型である必要がある
-- 比較演算子は ==, /=, >, <, >=, <=

start :: IO ()
start = do
  putStrLn "[Lesson 07] if"
  print $ absolute 5
  print $ absolute (-5)
  putStrLn ""
