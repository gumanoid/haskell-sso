{-# LANGUAGE OverloadedStrings #-}

import Test.Hspec
import Network.Wreq
import Control.Lens
import Lib ( webApp )
import Network.Wai.Handler.Warp (testWithApplication)

main :: IO ()
main = hspec $ do
    describe "HTTP server" $ do
        it "returns 200 on /status" $ do
            testWithApplication (return webApp) $ \ port -> do
                resp <- get ("http://localhost:" ++ show port ++  "/status")
                resp ^. responseStatus . statusCode `shouldBe` 200
