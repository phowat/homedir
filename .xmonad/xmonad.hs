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
    ("C-S-l", spawn "/usr/bin/xlock") 
    , ("C-S-j", spawn "/home/pedro/scripts/background.pl dir1") 
    , ("C-S-k", spawn "/home/pedro/scripts/background.pl dir2") 
    , ("C-S-h", spawn "/home/pedro/scripts/background.pl dir3") 
    , ("C-S-g", spawn "/home/pedro/scripts/background.pl dir4") 
    ]
    ++
    [ (mask ++ "M-" ++ [key], screenWorkspace scr >>= flip whenJust (windows . action))
         | (key, scr)  <- zip "we" [1,0] -- was [0..] *** change to match your screen order ***
         , (action, mask) <- [ (W.view, "") , (W.shift, "S-")]
    ]
