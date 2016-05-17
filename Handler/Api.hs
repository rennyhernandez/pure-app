module Handler.Api where

import Import

getHealthR :: Handler Value
getHealthR = return $ object ["status" .= ("ok" :: String)]
