{-# LANGUAGE OverloadedStrings #-}

module Lib (
     webApp
) where

import Network.Wai
import Network.HTTP.Types
import Data.ByteString.Internal ( ByteString )

webApp :: Application
webApp request respond = respond $ case methodAndPath request of
    (methodGet, "/status") -> getStatus
    _ -> notFound
    
getStatus :: Response
getStatus = responseLBS
    status200
    [("Content-Type", "text/plain")]
    "OK"

notFound :: Response
notFound = responseLBS
    status404 
    [("Content-Type", "text/plain")]
    "404 - Not Found"

methodAndPath :: Request -> (Method, ByteString)
methodAndPath request = (requestMethod request, rawPathInfo request)