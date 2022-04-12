{-# LANGUAGE DeriveGeneric #-}

module Domain(
    User(..),
    allUsers
) where

import GHC.Generics (Generic)

type UserId = Int

data User = User {
    id :: UserId,
    login :: String,
    password :: String,
    roles :: [String]
} deriving (Show, Eq, Generic)

allUsers :: [User]
allUsers =
    [
        User {
            Domain.id=1,
            login="admin",
            password="admin",
            roles=["ADMIN"]
        },
        User {
            Domain.id=2,
            login="user",
            password="user",
            roles=[]
        }
    ]