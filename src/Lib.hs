{-# LANGUAGE OverloadedStrings #-}

module Lib (
     webApp
) where

import Network.Wai
import Network.HTTP.Types

webApp :: Application
webApp request respond = respond $ case rawPathInfo request of
    "/status" -> getStatus
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
