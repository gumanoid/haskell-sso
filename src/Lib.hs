{-# LANGUAGE OverloadedStrings #-}

module Lib (
     webApp
) where

import Network.Wai
import Network.HTTP.Types ( status200, status404, Method )
import Data.Text ( Text, unpack )
import Domain
import Data.Aeson(encode, FromJSON, ToJSON)
import qualified Text.Read as Data.Text
import Text.Read

instance FromJSON User
instance ToJSON User

webApp :: Application
webApp request respond = respond $ handle (requestMethod request) (pathInfo request)

handle :: Method -> [Text] -> Response

handle methodGet ["status"] = responseLBS
    status200
    [("Content-Type", "text/plain")]
    "OK"

handle methodGet ["users"]  = responseLBS
    status200
    [("Content-Type", "application/json")]
    (encode allUsers)

handle methodGet ["user", uId] = 
    case findUserById uId of
        Just user -> responseLBS
            status200
            [("Content-Type", "application/json")]
            (encode user)
        Nothing -> responseLBS
            status404
            [("Content-Type", "application/json")]
            "404 - User Not Found"

handle _ _ = responseLBS
    status404
    [("Content-Type", "text/plain")]
    "404 - Path Not Found"

findUserById :: Text -> Maybe User
findUserById uId = do
        parsedId <- readMaybe (unpack uId)
        allUsers `findById` parsedId