{-# LANGUAGE FlexibleInstances #-}

module Model where

import ClassyPrelude.Yesod
import Database.Persist.Quasi
import qualified Data.Text as T( pack, unpack)
import Database.Persist.Quasi
import Data.Typeable (Typeable)
import Data.Time (UTCTime)
import Data.ByteString (ByteString)
import Data.Aeson (withText, Value(..), ToJSON(..), FromJSON(..))
import Data.Text.Encoding (encodeUtf8, decodeUtf8)
import qualified Data.ByteString.Char8 as BC (pack, unpack)


-- You can define all of your database entities in the entities file.
-- You can find more information on persistent and how to declare entities
-- at:
-- http://www.yesodweb.com/book/persistent/
share [mkPersist sqlSettings, mkMigrate "migrateAll"]
    $(persistFileWith lowerCaseSettings "config/models")

instance ToJSON ByteString where
  toJSON = String . T.pack . BC.unpack

instance FromJSON ByteString where
 parseJSON = withText "ByteString" $  pure . BC.pack . T.unpack

