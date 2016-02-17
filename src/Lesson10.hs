module Lesson10
  ( start 
  )
  where

power :: Int -> Double -> Double
power 0 _             = 1.0
power x y | x > 0     = y * power (x - 1) y
          | otherwise = 1.0 / power (- x) y

power' :: Int -> Double -> Double
power' x y = case (x, y) of 
             (0, _)             -> 1.0
             (x, y) | x > 0     -> y * power (x - 1) y
                    | otherwise -> 1.0 / power (- x) y

fst' :: (a,b) -> a
fst' (x, _) = x
snd' :: (a,b) -> b
snd' (_, y) = y

prod' :: [Int] -> Int
prod' []     = 1 -- 空に一致
prod' [x]    = x -- 要素数1つのリストに一致
prod' (x:xs) = x * prod' xs -- xは最初の要素,xsは残りの要素にbind

trim :: [Char] -> [Char]
-- str@でstrにstring全体,cに最初の要素,csに残りの要素がbindされる
trim str@(c:cs) | c == '0'  = trim cs 
                | otherwise = str

(/==) :: Char -> String -> Bool
(/==) c "" = False
(/==) c (x:xs) 
  | c == x  = True
  | otherwise = (/==) c xs

start :: IO ()
start = do
  putStrLn "[Lesson 10] パターンマッチ"
  -- パターンマッチ
  -- 関数定義内で引数が一致するものを処理するようになっているが
  -- そのマッチング処理に関して　
  print $ power 8 2.0 
  print $ power (-3) 2.0 
  print $ power' (-3) 2.0 

  -- for tuple
  print $ fst' (1,2)
  print $ snd' (1,2)

  -- for list
  print $ prod' [1,2,3,4,5]
  print $ prod' []
  -- as binding
  print $ trim "0012345"

  -- original operator
  print $ (/==) 'o' "Hello World"
  print $ (/==) 'g' "Hello World"
  print $ 'o' /== "Hello World"
  print $ 'g' /== "Hello World"

  putStrLn ""
