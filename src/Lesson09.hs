module Lesson09 
  ( start 
  )
  where

double :: Int -> Int
double x = 2 * x

square :: Int -> Int
square x = x * x

summation :: (Int -> Int) -> Int -> Int -- f(1) + f(2) + ... + f(n)
summation f 1 = f 1
summation f n = f n + summation f (n - 1)

-- add func lambda ver
add = \ x y -> x + y

-- 部分適用可能な関数(カリー化された関数と呼ぶ)
multiply :: Int -> Int -> Int 
multiply x y = x * y

-- 非カリー化version multiply
multiply' :: (Int, Int) -> Int 
multiply' (x, y) = x * y

-- 関数合成
toInt :: String -> Int
toInt s = read s :: Int

twice :: Int -> Int
twice x = x * 2

toStr :: Int -> String
toStr x = show x :: String

emphasize :: String -> String
emphasize s = "<<" ++ s ++ ">>"

start :: IO ()
start = do
  putStrLn "[Lesson 09] higher order function(高階関数)"
  -------------------------------
  -- map
  -- mapは関数とリストを引数にとり、要素に関数を適用する
  -------------------------------
  print $ map double [1,2,3,4,5]
  print $ map square [1,2,3,4,5]
  print $ summation square 3

  -------------------------------
  -- lambda関数
  -- \ arg1 arg2 .... -> definition
  -------------------------------
  print $ map ( \x -> x * x) [1,2,3,4,5] -- map square [1,2,3,4,5]と同義
  print $ add 1 2

  -------------------------------
  -- 関数の部分適用
  -- haskellのデフォルトでは関数は左結合である
  -- すなわち、multiply 2 3 は (multiply 2) 3 である
  -- この(multiply 2)を関数multiplyの部分適用と呼ぶ
  -------------------------------
  let triple = multiply 3
  print $ triple 10
  print $ triple 20

  -------------------------------
  -- カリー化
  -- 部分適用可能な関数にすること
  -------------------------------
  -- let triple = multiply' 3 引数2つが必須なので部分適用できない
  print $ multiply 4 5 
  
  -------------------------------
  -- セクション
  -- 中置関数の部分適用
  -------------------------------
  print $ map (2 +) [1,2,3,4,5] -- 全ての値に2 +する

  -------------------------------
  -- $演算子
  -- ($) :: (a -> b) -> a -> b
  -- 引数aで返り値bを取る関数を引数として
  -- a -> bとなる部分関数を生成する
  -- f $ x = f x
  -------------------------------
  print(square (double (2 * 4)))
  print(square $ double $ 2 * 4)

  -------------------------------
  -- 関数合成
  -- g :: a -> b
  -- f :: b -> c
  -- この二つの関数を合成することをf.gと書く
  -- (f.g)xとf(gx)は等価である
  -------------------------------
  let special = emphasize . toStr . twice . toInt
  print $ special "777"
  -- toInt String -> Int
  -- twice Int -> Int
  -- toStr Int -> String
  -- emphasize String -> String
  -- special String -> String -> Int -> Int -> String
  -- すなわち String -> String
  putStrLn ""
