module Handler.ApiSpec (spec) where

import TestImport
import Data.Aeson
spec :: Spec
spec = withApp $ do
    describe "valid request" $ do
        it "gives a 200" $ do
            get HealthR
            statusIs 200