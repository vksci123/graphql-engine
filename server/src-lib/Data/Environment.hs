
module Data.Environment
    ( Environment()
    , getEnvironment
    , lookupEnv)
where

import           Hasura.Prelude

import qualified System.Environment

newtype Environment = Environment [(String, String)] deriving (Eq, Show)

getEnvironment :: IO Environment
getEnvironment = Environment <$> System.Environment.getEnvironment

lookupEnv :: Environment -> String -> Maybe String
lookupEnv (Environment es) k = lookup k es