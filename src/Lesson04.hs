module Lesson04 
  ( start 
  )
  where

start :: IO ()
start = do
  putStrLn "[Lesson 04] type"
  let b = True                     -- boolean
      i = 1                        -- int
      f = 0.5                      -- float
      d = 2 / 1000000000 :: Double -- double
      c = "c"                      -- char
      s = "str"                    -- string
      t = ("t", False, 8)          -- tuple
      unit = ()                    -- unit
      l = ["l", "i", "s", "t"]     -- list
  print b
  print i
  print f
  print d
  print c
  print s
  print t
  print unit
  print l
  putStrLn ""
