import Control.Monad.Reader

data Environment = Environment
	{ param1 :: Int
	, param2 :: String
	} 

f = do
	let env = Environment 5 "sup"
	let str = runReader func env
	print str

func :: Reader Environment Int
func = do
	env <- ask
	return $ param1 env
