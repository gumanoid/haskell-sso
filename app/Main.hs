module Main where

import Lib ( webApp )
import Network.Wai.Handler.Warp ( run )

main :: IO ()
main = do
    let port = 8080
    putStrLn ("Starting on port " ++ show port)
    run port webApp
