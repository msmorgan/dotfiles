import XMonad
import XMonad.Hooks.DynamicLog

main = xmonad =<< xmobar defaultConfig
	{ terminal = myTerminal
	, modMask = myModMask
	, borderWidth = myBorderWidth
	}

myTerminal = "urxvtc"
myModMask = mod1Mask
myBorderWidth = 3

