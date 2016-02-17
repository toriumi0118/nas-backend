module Lesson01 
  ( start 
  )
  where

main' :: IO ()
main' = do { putStrLn "hello"; putStrLn "world1" } -- ブロック{}でくくれば;区切りで記述できる

main'' :: IO ()
main'' = do putStrLn "hello"; putStrLn "world2" -- 一行で書くなら{}省略可

main''' :: IO ()
main''' = do putStrLn "hello"
             putStrLn "world3" -- doの最初のメソッドの行頭に揃える

start :: IO ()
start = do
  putStrLn "[Lesson 01] hello world"
  main'
  main''
  main''' -- 'に特に意味は無いです。ただ似たようなという意味の'記号です。
