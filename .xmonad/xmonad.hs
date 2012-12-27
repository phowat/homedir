import XMonad
import qualified XMonad.StackSet as W
import XMonad.Util.EZConfig
 
main = do 

    spawn "/home/pedro/scripts/startup-scripts.sh"

    xmonad $ defaultConfig { 
        modMask = mod4Mask -- Use Super instead of Alt
        , terminal = "mate-terminal"
        -- more changes
        } `additionalKeysP` myKeys

modm = mod4Mask
 
myKeys =
    [
    -- other additional keys
    ]
    ++
    [ (mask ++ "M-" ++ [key], screenWorkspace scr >>= flip whenJust (windows . action))
         | (key, scr)  <- zip "we" [1,0] -- was [0..] *** change to match your screen order ***
         , (action, mask) <- [ (W.view, "") , (W.shift, "S-")]
    ]
