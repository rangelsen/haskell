import Control.Concurrent.Async
import Control.Concurrent

importantWork :: IO Int
importantWork = do
    putStrLn "func1 started"
    threadDelay 2000000
    putStrLn "func1 exited"
    return 70

runImportantWork :: IO ()
runImportantWork = do
    withAsync importantWork $ \i -> do
        asyncRes <- wait i
        putStrLn $ "Important work result: " ++ show asyncRes
    putStrLn "Exiting..."
