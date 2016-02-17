module Lesson11
  ( start 
  )
  where

import Debug.Trace

data Point = Pt Double Double 
-- Pointは型構成子、Ptはデータ構成子
-- どちらも頭文字は大文字で
norm :: Point -> Double             
norm (Pt x y) = sqrt(x * x + y * y)

data Pointv2 = Pt2D Double Double | Pt3D Double Double Double
-- 複数のデータ構成子を定義することも可能
norm' :: Pointv2 -> Double             
norm' (Pt2D x y)   = sqrt(x * x + y * y)
norm' (Pt3D x y z) = sqrt(x * x + y * y + z * z)

data Tuple a b = T a b
-- type: Tuple, data: T(a b)
-- aやbのことを型引数と呼び、具体型で置き換えられる
-- javaとかのジェネリック型と似たようなもの
first :: Tuple a b -> a
first (T x _) = x
second :: Tuple a b -> b
second (T _ y) = y

data List a = Elem a (List a) | Nil
-- Elemはデータ構成子のため自由に変えてOK
-- List Int は [Int]に相当
length' :: List a -> Int
length' Nil = 0
length' (Elem x xs) = 1 + length' xs

-- 型シノニム
-- 型へのシンボリックリンク的な扱い
-- type String = [Char]

-- newtype
-- 型シノニムに似てるけど、
-- 別なものとして取り扱うために宣言できる
newtype DigitString = DigitStr String
atoi :: DigitString -> Int
atoi (DigitStr xs) = read xs

-- フィールドラベル
data Person = Person {name :: String, age :: Int}
sayHello :: Person -> String
sayHello (Person n a) = "Hello, I'm" ++ n ++ ", age is " ++ show a
birthday :: Person -> Person
birthday p = let newage = age p + 1 in p { age = newage }

start :: IO ()
start = do
  putStrLn "[Lesson 11] データ型 (structに近い）"
  ---------------------
  -- data宣言
  ---------------------
  print $ norm (Pt 1 2)
  print $ norm' (Pt2D 3 4)
  print $ norm' (Pt3D 5 6 7)
  
  ---------------------
  -- 多層型data宣言
  ---------------------
  print $ first  (T 10 11)
  print $ second (T 10 11)

  ---------------------
  -- 再帰型data宣言
  ---------------------
  print $ length' Nil
  print $ length' $ Elem 1 ( Elem 2 ( Elem 3 Nil))
  
  ---------------------
  -- newtype
  ---------------------
  print $ atoi (DigitStr "0123")

  ---------------------
  -- フィールドラベル
  ---------------------
  let toriumi = Person "toriumi" 30
  putStrLn $ name toriumi
  putStrLn $ sayHello toriumi

  -- birthday
  putStrLn $ sayHello $ birthday toriumi
  -- or
  let agedToriumi = birthday toriumi
  putStrLn $ sayHello $ agedToriumi
  putStrLn ""
