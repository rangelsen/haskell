import Control.Monad.State.Lazy

data TurnstileState = Locked | Unlocked deriving Show
data TurnstileOutput = Thank | Tut | Open deriving Show

push, coin :: TurnstileState -> (TurnstileOutput, TurnstileState)
coin _ = (Thank, Unlocked)

push Locked = (Tut, Locked)
push Unlocked = (Open, Locked)

