{-# LANGUAGE OverloadedStrings #-}

module Lib (
     webApp
) where

import Network.Wai
import Network.HTTP.Types
import Data.ByteString.Internal ( ByteString )
import Domain
import Data.Aeson(encode, FromJSON, ToJSON)

instance FromJSON User
instance ToJSON User

webApp :: Application
webApp request respond = respond $ case methodAndPath request of
    (methodGet, "/status") -> getStatus
    (methodGet, "/users") -> getUsers
    _ -> notFound

getStatus :: Response
getStatus = responseLBS
    status200
    [("Content-Type", "text/plain")]
    "OK"

getUsers :: Response
getUsers = responseLBS
    status200
    [("Content-Type", "application/json")]
    (encode allUsers)

notFound :: Response
notFound = responseLBS
    status404 
    [("Content-Type", "text/plain")]
    "404 - Not Found"

methodAndPath :: Request -> (Method, ByteString)
methodAndPath request = (requestMethod request, rawPathInfo request)