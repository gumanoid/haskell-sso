{-# LANGUAGE DeriveGeneric #-}

module Domain(
    User(..),
    allUsers,
    admin,
    findById
) where

import Data.List
import GHC.Generics (Generic)

type UserId = Int

data User = User {
    userId :: UserId,
    login :: String,
    password :: String,
    roles :: [String]
} deriving (Show, Eq, Generic)

admin = User {
    userId=1,
    login="admin",
    password="admin",
    roles=["ADMIN"]
}

allUsers :: [User]
allUsers =
    [
        admin,
        User {
            userId=2,
            login="user",
            password="user",
            roles=[]
        }
    ]

findById :: [User] -> UserId -> Maybe User
findById users uId = find (hasId uId) users

hasId :: Int -> User -> Bool
hasId i user = userId user == i    