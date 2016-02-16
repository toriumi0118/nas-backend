{-# LANGUAGE OverloadedStrings #-}

module DownloadSchedule 
  ( main 
  )
  where

import Network.HTTP.Conduit (simpleHttp)
import Prelude hiding (concat, putStrLn) 
import qualified Prelude as Hi
import Data.Text (concat)
import Data.Text.IO (putStrLn)
import Text.HTML.DOM (parseLBS)
import Text.XML.Cursor (Cursor
--  , attributeIs
  , attribute
  , content
  , element
  , fromDocument
  , child
  , ($//)
  , (&//)
  , (&/)
  , (&|)
--  , (>=>)
  )

-- import qualified Data.ByteString.Lazy.Char8 as L

-- url
url = "http://www.nas-club.co.jp/kitatenjin/schedule/index.html"

-- 探すデータ
findNodes :: Cursor -> [Cursor]
-- findNodes = element "span" >=> attributeIs "id" "count" >=> child
-- findNodes = element "h3" &/ element "a"
findNodes = element "h3" &/ element "a"

-- 各ノードのExtract
extractData = concat . attribute "href"

-- データ要素リストに対する処理
-- processData = putStrLn . T.unpack . T.concat
processData = mapM_ putStrLn

cursorFor :: String -> IO Cursor
cursorFor u = do
  page <- simpleHttp u
  return $ fromDocument $ parseLBS page

-- test
main = do
  cursor <- cursorFor url
  putStr processData $ cursor $// findNodes &| extractData
  
  -- L.putStrLn . L.take 1000 =<< simpleHttp url
