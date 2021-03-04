-- IMPORTS
import XMonad
import Data.Monoid
import XMonad.Util.SpawnOnce
import XMonad.Util.Run
import XMonad.Util.EZConfig (checkKeymap, additionalKeys, additionalKeysP)
import XMonad.Hooks.ManageDocks
import System.Exit
import XMonad.Hooks.DynamicLog (dynamicLogWithPP, wrap, xmobarPP, sjanssenPP, xmobarColor, shorten, PP(..))
import XMonad.Actions.CycleWS (toggleWS, prevWS, nextWS)

import qualified XMonad.StackSet as W
import qualified Data.Map        as M
import qualified XMonad.Layout.ToggleLayouts as T (toggleLayouts, ToggleLayout(Toggle))

------------------------------------------------------------------------
-- Variables
myTerminal      = "alacritty"
myModMask       = mod4Mask -- "windows key"
myWorkspaces    = ["home","code","files","web"] ++ map show [5..9]

-- Border colors for unfocused and focused windows, respectively.
myNormalBorderColor  = "#cfd5d6"
myFocusedBorderColor = "#48c0d6"

-- Help message
help :: String
help = unlines ["keybindings:",
    "",
    "-- launching and killing programs",
    "mod-Enter        Launch terminal",
    "mod-r            Launch rofi run",
    "mod-w            Switch window using rofi",
    "mod-p            Run program using rofi",
    "mod-o            Run dmenu_extended_run",
    "mod-s            Show keybinding help",
    "mod-b            Toggle dock gaps",
    -- "mod-Shift-p      Launch gmrun",
    "mod-Shift-q      Close/kill the focused window",
    "mod-Space        Rotate through the available layout algorithms",
    "mod-Shift-Space  Reset the layouts on the current workSpace to default",
    "mod-n            Resize/refresh viewed windows to the correct size",
    "",
    "-- move focus up or down the window stack",
    "mod-Tab        Move focus to the next window",
    "mod-Shift-Tab  Move focus to the previous window",
    "mod-j          Move focus to the next window",
    "mod-k          Move focus to the previous window",
    "mod-m          Move focus to the master window",
    "",
    "-- modifying the window order",
    "mod-Ctrl-Enter Swap the focused window and the master window",
    "mod-Shift-j  Swap the focused window with the next window",
    "mod-Shift-k  Swap the focused window with the previous window",
    "",
    "-- resizing the master/slave ratio",
    "mod-h  Shrink the master area",
    "mod-l  Expand the master area",
    "",
    "-- floating layer support",
    "mod-t  Push window back into tiling; unfloat and re-tile it",
    "",
    "-- increase or decrease number of windows in the master area",
    "mod-=   Increment the number of windows in the master area",
    "mod--   Deincrement the number of windows in the master area",
    "",
    "-- quit, or restart",
    "mod-Shift-Esc  Quit xmonad",
    "mod-Ctrl-r        Restart xmonad",
    "mod-[1..9]   Switch to workSpace N",
    "",
    "-- Workspaces & screens",
    "mod-Shift-[1..9]   Move client to workspace N",
    "mod-[1..9]        Switch to workspace N",
    "",
    "-- Mouse bindings: default actions bound to mouse events",
    "mod-button1  Set the window to floating mode and move by dragging",
    "mod-button2  Raise the window to the top of the stack",
    "mod-button3  Set the window to floating mode and resize by dragging"]

-- Whether focus follows the mouse pointer.
myFocusFollowsMouse :: Bool
myFocusFollowsMouse = True

-- Whether clicking on a window to focus also passes the click to the window
myClickJustFocuses :: Bool
myClickJustFocuses = False

-- Width of the window border in pixels.
--
myBorderWidth   = 1

------------------------------------------------------------------------
-- Event handling

-- * EwmhDesktops users should change this to ewmhDesktopsEventHook
--
-- Defines a custom handler function for X Events. The function should
-- return (All True) if the default handler is to be run afterwards. To
-- combine event hooks use mappend or mconcat from Data.Monoid.
--
myEventHook = mempty

------------------------------------------------------------------------
-- Status bars and logging

-- Perform an arbitrary action on each internal state change or X event.
-- See the 'XMonad.Hooks.DynamicLog' extension for examples.
--
-- myLogHook = return ()

------------------------------------------------------------------------
-- Key bindings
myEZKeys :: [(String, X())]
myEZKeys =
  -- Xmonad
     [ ("M-C-r", spawn "xmonad --recompile; pkill xmobar; xmonad --restart")
     , ("M-S-<Escape>", io (exitWith ExitSuccess))  -- Quits Xmonad

  -- Windows & Tiling
     , ("M-S-q", kill) -- kill focused window
     , ("M-h", sendMessage Shrink) -- Shrink the master area
     , ("M-l", sendMessage Expand) -- Expand the master area
     -- Increment the number of windows in the master area
     --, ("M-<KP_Equal>", sendMessage (IncMasterN 1)) -- FIXME doesn't work
     -- Deincrement the number of windows in the master area
     --, ("M-<KP_Subtract>", sendMessage (IncMasterN (-1))) -- FIXME
     , ("M-t", withFocused $ windows . W.sink)  -- Push floating window back to tile

  -- Windows Navigation
     , ("M-m", windows W.focusMaster)  -- Move focus to the master window
     , ("M-j", windows W.focusDown) -- Move focus to the next window
     , ("M-k", windows W.focusUp  ) -- Move focus to the previous window
     , ("M-S-m", windows W.swapMaster) -- Swap the focused window and the master window
     , ("M-S-j", windows W.swapDown)   -- Swap focused window with next window
     , ("M-S-k", windows W.swapUp)     -- Swap focused window with prev window

     , ("M-<Left>", prevWS)     -- jump to previous workspace
     , ("M-<Right>", nextWS)     -- jump to previous workspace
     , ("M-<Tab>", toggleWS)     -- jump to last workspace

  -- Layouts
     -- Rotate through the available layout algorithms
     , ("M-<Space>", sendMessage NextLayout)
     --  Reset the layouts on the current workspace to default
     --, ("M-S-<Space>", setLayout $ XMonad.layoutHook conf)

  -- Misc
     ,("M-b", sendMessage ToggleStruts) -- toggle structs, e.g. xmobar
     ,("M-<F1>", spawn ("echo \"" ++ help ++ "\" | xmessage -file -"))

  -- Launcher
     , ("M-r", spawn "rofi -show run") -- run
     , ("M-p", spawn "rofi -show drun -display-drun 'Program'") -- programs

  -- Applications
     , ("M-<Return>", spawn myTerminal) -- terminal
     , ("M-S-<Return>", spawn (myTerminal ++ " -e fish -c 'tmux_load_or_new_session Daily'")) -- tmux "Daily"
     , ("M-M1-f", spawn "firefox")
     , ("M-M1-x", spawn "emacsclient -nc")
     , ("M-M1-e", spawn "rofiunicode")
     , ("M-M1-p", spawn "passmenu")

  -- System
     , ("M-S-<Page_Down>", spawn "oblogout")
     , ("<XF86PowerOff>", spawn "oblogout") -- PowerOff show oblogout
     , ("M-S-s", spawn "i3lock.sh && systemctl suspend") -- suspend
     , ("M-S-l", spawn "i3lock.sh") -- lock

      -- Volume Keys
     , ("<XF86AudioLowerVolume>", spawn "amixer -q -D pulse sset Master 5%-")
     , ("<XF86AudioRaiseVolume>", spawn "amixer -q -D pulse sset Master 5%+")
     , ("<XF86AudioMute>", spawn "amixer -D pulse set Master 1+ toggle")
      -- Media Keys
     , ("<XF86AudioPlay>", spawn "mpc toggle")
     , ("<XF86AudioStop>", spawn "mpc stop")
     , ("<XF86AudioNext>", spawn "mpc next")
     , ("<XF86AudioPrev>", spawn "mpc prev")
      -- Screen Brightness Control
     , ("<XF86MonBrightnessDown>", spawn "light -U 5")
     , ("<XF86MonBrightnessUp>", spawn "light -A 5")
      -- Screenshot Keys
     , ("<Print>", spawn "flameshot gui")
      -- Keyboard LED
     , ("<Scroll_lock>", spawn "xset led 3")
     , ("S-<Scroll_lock>", spawn "xset j-led 3")
      -- Touchpad Toggle
     , ("<XF86TouchpadToggle>", spawn "~/.scripts/toggletouchpad.sh")
     ]

------------------------------------------------------------------------
-- Mouse bindings: default actions bound to mouse events
--
myMouseBindings (XConfig {XMonad.modMask = modm}) = M.fromList $

    -- mod-button1, Set the window to floating mode and move by dragging
    [ ((modm, button1), (\w -> focus w >> mouseMoveWindow w
                                       >> windows W.shiftMaster))

    -- mod-button2, Raise the window to the top of the stack
    , ((modm, button2), (\w -> focus w >> windows W.shiftMaster))

    -- mod-button3, Set the window to floating mode and resize by dragging
    , ((modm, button3), (\w -> focus w >> mouseResizeWindow w
                                       >> windows W.shiftMaster))

    -- you may also bind events to the mouse scroll wheel (button4 and button5)
    ]

------------------------------------------------------------------------
-- Layouts:

-- You can specify and transform your layouts by modifying these values.
-- If you change layout bindings be sure to use 'mod-shift-space' after
-- restarting (with 'mod-q') to reset your layout state to the new
-- defaults, as xmonad preserves your old layout settings by default.
--
-- The available layouts.  Note that each layout is separated by |||,
-- which denotes layout choice.
--
myLayout = avoidStruts (tiled ||| Mirror tiled ||| Full)
  where
     -- default tiling algorithm partitions the screen into two panes
     tiled   = Tall nmaster delta ratio

     -- The default number of windows in the master pane
     nmaster = 1

     -- Default proportion of screen occupied by master pane
     ratio   = 1/2

     -- Percent of screen to increment by when resizing panes
     delta   = 3/100

------------------------------------------------------------------------
-- Window rules:

-- Execute arbitrary actions and WindowSet manipulations when managing
-- a new window. You can use this to, for example, always float a
-- particular program, or have a client always appear on a particular
-- workspace.
--
-- To find the property name associated with a program, use
-- > xprop | grep WM_CLASS
-- and click on the client you're interested in.
--
-- To match on the WM_NAME, you can use 'title' in the same way that
-- 'className' and 'resource' are used below.
--
myManageHook = composeAll
    [ className =? "MPlayer"        --> doFloat
    , className =? "Gimp"           --> doFloat
    , resource  =? "desktop_window" --> doIgnore
    , resource  =? "kdesktop"       --> doIgnore ]

------------------------------------------------------------------------
-- Startup hook

-- Perform an arbitrary action each time xmonad starts or is restarted
-- with mod-q.  Used by, e.g., XMonad.Layout.PerWorkspace to initialize
-- per-workspace layout choices.
--
-- By default, do nothing.
myStartupHook = do
  return ()
  checkKeymap myConfig myEZKeys
  spawnOnce "~/.fehbg &"
  spawnOnce "fcitx"
  spawnOnce "picom -b"
  spawnOnce "thunar --daemon"

myConfig = def {
      -- simple stuff
        terminal           = myTerminal,
        focusFollowsMouse  = myFocusFollowsMouse,
        clickJustFocuses   = myClickJustFocuses,
        borderWidth        = myBorderWidth,
        modMask            = myModMask,
        workspaces         = myWorkspaces,
        normalBorderColor  = myNormalBorderColor,
        focusedBorderColor = myFocusedBorderColor,

      -- key bindings
        --keys               = myKeys,
        mouseBindings      = myMouseBindings,

      -- hooks, layouts
        layoutHook         = myLayout,
        manageHook         = myManageHook,
        handleEventHook    = myEventHook,
        startupHook        = myStartupHook
    }
    `additionalKeysP` myEZKeys
    `additionalKeys`
    [((myModMask  , xK_equal ), sendMessage (IncMasterN 1)) -- Increment the number of windows in the master area
    , ((myModMask , xK_minus ), sendMessage (IncMasterN (-1))) -- Decrement the number of windows in the master area
    ]

-- Main
main :: IO ()
main = do
  xmproc <- spawnPipe "xmobar ~/.config/xmobar/xmobarrc"
  xmonad $ docks myConfig {
        logHook = dynamicLogWithPP $ sjanssenPP {
            ppOutput = hPutStrLn xmproc
        }
      }
