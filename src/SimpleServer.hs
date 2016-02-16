module SimpleServer 
  ( launch 
  ) where

--module SimpleServer
--    ( someFunc
--    ) where

import Network.Wai (responseLBS, Application)
import Network.HTTP.Types (status200)
import Network.Wai.Handler.Warp (run, Port)
import System.Environment (getEnvironment)
import Data.List (lookup)
import Data.Maybe
import qualified Data.ByteString.Lazy.Char8 as BS

server :: Application
server req respond = respond $ responseLBS status200 [] $ BS.pack "Hello wai"

getPort :: IO Port
getPort = getEnvironment >>= return . port
  where
    port = fromMaybe defaultPort . fmap read . lookup "PORT"

defaultPort :: Port
defaultPort = 3000

launch :: IO ()
launch = do
  port <- getPort
  putStr "start server: http://localhost:"
  print port
  run port server
