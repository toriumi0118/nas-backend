module Main where

import SimpleServer     ( launch )
import qualified DownloadSchedule ( main )

main :: IO ()
main = do
  DownloadSchedule.main
  launch
