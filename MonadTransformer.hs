import Control.Monad.Trans.Maybe
import Control.Monad.Trans.Class
import Control.Monad

askPassphrase :: MaybeT IO ()
askPassphrase = do
	lift $ putStrLn "Insert your new passphrase:"
	value <- getPassphraseT
	lift $ putStrLn "Storing in database..."

getPassphrase :: IO (Maybe String)
getPassphrase = do
    s <- getLine
    if isValid s
    then return $ Just s
    else return Nothing

getPassphraseT :: MaybeT IO String
getPassphraseT = do
    s <- lift getLine
    guard $ isValid s
    return s

isValid :: String -> Bool
isValid s = length s >= 8

