module Lesson12
  ( start 
  )
  where

data Point = Pt Double Double
-- Eq contextを追加
instance Eq Point where
  (Pt x y) == (Pt x' y') = x == x' && y == y'

--data Value = V Double
--instance Eq Value where
--  (V v) == (V v') = v == v'
data Value = V Double deriving (Eq) -- メソッドの実装が自明である場合はderiving宣言を用いることができる
instance Ord Value where
  compare (V v) (V v') -- Ordはcompareを実装する必要がある
    | v == v'   = EQ
    | v < v'    = LT
    | otherwise = GT


start :: IO ()
start = do
  putStrLn "[Lesson 12] class type"
  -------------------
  -- 型クラス制約
  -- sum :: [Int] -> Int 狭すぎ
  -- sum :: [a] -> a     広すぎ
  -- sum :: Num a => [a] -> a ちょうどいい
  -- このNumは型クラスと呼ばれる。(type class)
  -- type classの実装した型構成子を型クラスのインスタンスと呼ぶ
  -- NumにはInt Integer Float Double 等がある
  --
  -- sumのシグネチャにおけるNum aは型aがNumクラスのインスタンスでなくてはならない
  -- という制約を意味し、contextまたは型クラス制約と呼ぶ
  -------------------

  -- Eq type classのインスタンスPoint
  print $ (Pt 1 2) == (Pt 2 3)
  print $ (Pt 1 2) /= (Pt 2 3)
  print $ (Pt 1 2) == (Pt 1 2)

  -- 値を表すValueにOrd type classを実装
  -- Ord type classはEq type classの拡張なのでEqも実装
  print $ (V 1) == (V 2)
  print $ (V 1) >= (V 2)
  print $ (V 1) <= (V 2)


  putStrLn ""
