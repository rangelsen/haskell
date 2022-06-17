import Control.Concurrent.Async
import Control.Concurrent

func1 = do
    putStrLn "func1 started"
    threadDelay 10000
    putStrLn "func1 exited"
