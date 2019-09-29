--*****************************************************************************
--* File: lua/modules/ui/menus/main.lua
--* Author: Chris Blackwell, Evan Pongress
--* Summary: create main menu screen
--*
--* Copyright © 2005 Gas Powered Games, Inc.  All rights reserved.
--*****************************************************************************

local UIUtil = import('/lua/ui/uiutil.lua')
local LayoutHelpers = import('/lua/maui/layouthelpers.lua')
local EffectHelpers = import('/lua/maui/effecthelpers.lua')
local Bitmap = import('/lua/maui/bitmap.lua').Bitmap
local MenuCommon = import('/lua/ui/menus/menucommon.lua')
local MultiLineText = import('/lua/maui/multilinetext.lua').MultiLineText
local Button = import('/lua/maui/button.lua').Button
local Group = import('/lua/maui/group.lua').Group
local Prefs = import('/lua/user/prefs.lua')
local Tooltip = import('/lua/ui/game/tooltip.lua')
local MapUtil = import('/lua/ui/maputil.lua')
local TooltipInfo = import('/lua/ui/help/tooltips.lua')
local Movie = import('/lua/maui/movie.lua').Movie
local Mods = import('/lua/mods.lua')

local mapErrorDialog = false

local TOOLTIP_DELAY = 1
local menuFontColor = 'feff77' #'FFbadbdb' (default grey-blue) #feff77 (light yellow) #edd570 (gold)
local menuFontColorTitle = 'EEEEEE'
local menuFontColorAlt = 'feff77' #currently the same as menuFontColor

local initial = true
local animation_active = false

--[[
function CreateBackMovie(parent)
    local backMovie = Movie(parent)
    backMovie:Set('')
    LayoutHelpers.AtCenterIn(backMovie, parent)
    
    backMovie:Loop(true)
    backMovie:Play()

    backMovie.Height:Set(parent.Height)
    backMovie.Width:Set(function()
        local ratio = parent.Height() / 1024
        return 1824 * ratio
    end)
    return backMovie
end
--]]

function CreateUI()
   
    UIUtil.SetCurrentSkin('uef')
    import('/lua/ui/game/gamemain.lua').supressExitDialog = false
    local mainMenu = {}

    -- this should be shown if there are no profiles
    if not GetPreference("profile.current") then
        profileDlg = import('/lua/ui/dialogs/profile.lua').CreateDialog(function()
           	CreateUI()
        end)
        return
    end
    
    # to disable any button on the menu, just comment/delete the "action" key/value pair or set to nil
    local menuExtras = {
        title = '<LOC tooltipui0355>Extras',
        {
            name = '<LOC _Replay>',
            tooltip = 'mainmenu_replay',    
            action = function() ButtonReplay() end,
            color = menuFontColorAlt,
        },
        {
            name = '<LOC _Mod_Manager>',
            tooltip = 'mainmenu_mod',    
            action = function() ButtonMod() end,
            color = menuFontColorAlt,
        },
        {
            name = '<LOC OPTIONS_0073>Credits',
            tooltip = 'options_credits',
            action = function() ButtonCredits() end,
            color = menuFontColorAlt,
        },
        {
            name = '<LOC OPTIONS_0086>EULA',
            tooltip = 'options_eula',    
            action = function() ButtonEULA() end,
            color = menuFontColorAlt,
        },
        {
            name = '<LOC _Back>',
            action = function() ButtonBack() end,
            color = menuFontColorAlt,
        },            
    }
    local menuTop = {
        title = '<LOC main_menu_0000>Forged Alliance',
#        {
#            name = '<LOC _Campaign>',
#            tooltip = 'mainmenu_campaign',    
#            action = function() ButtonCampaign() end, 
#            color = menuFontColorAlt,
#        },
        {
            name = '',
            tooltip = 'mainmenu_skirmish',    
            action = function() ButtonSkirmish() end,
            color = menuFontColorAlt,
            image = '/scx_menu/scta/Single',
        },
        {
            name = '',
            tooltip = 'mainmenu_mp',    
            action = function() ButtonLAN() end, 
            color = menuFontColorAlt,
            image = '/scx_menu/scta/Multi',
        },
        {
            name = '',
            tooltip = 'mainmenu_options',    
            action = function() ButtonOptions() end,
            color = menuFontColorAlt,
            image = '/scx_menu/scta/Options',
        },
        {
            name = '',
            tooltip = 'mainmenu_exit',    
            action = function() ButtonExit() end,
            color = menuFontColorAlt,
            image = '/scx_menu/scta/Exit',
        },
        {
            name = 'Extras',
            tooltip = 'mainmenu_extras',
            action = function() ButtonExtras() end,
            color = menuFontColorAlt,
        },
    }

    local largestMenu = menuTop
    local mainMenuSize = table.getn(largestMenu)

    # BACKGROUND
    local parent = UIUtil.CreateScreenGroup(GetFrame(0), "Main Menu ScreenGroup")
    
--[[
    local backMovie = false
    if Prefs.GetOption("mainmenu_bgmovie") then
        backMovie = CreateBackMovie(parent)
    end  
--]]
    local darker = Bitmap(parent)
    LayoutHelpers.FillParent(darker, parent)
    darker:SetSolidColor('200000')
    darker:SetAlpha(.5)
    darker:Hide()
    
    # BORDER, LOGO and TEXT
    local border = Group(parent, "border")
    LayoutHelpers.FillParent(border, parent)
    
    # SupCom logo resizes to current resolution
    local logo = Bitmap(border, UIUtil.UIFile('/scx_menu/logo/logo.dds'))
    LayoutHelpers.AtHorizontalCenterIn(logo, border)
    LayoutHelpers.AtTopIn(logo, border)
    logo.Depth:Set(60)

    # version text
    local versionText = UIUtil.CreateText(border, GetVersion(), 14, UIUtil.bodyFont)
    versionText:SetColor('677983')
    LayoutHelpers.AtRightTopIn(versionText, border, 0, 0)
    
    local versionTextBG = Bitmap(versionText)
    versionTextBG:SetSolidColor('ff000000')
    LayoutHelpers.FillParent(versionTextBG, versionText)
    versionTextBG.Depth:Set(function() return versionText.Depth() - 1 end)
    
    # Borders
    local topBorder = Bitmap(logo, UIUtil.UIFile('/scx_menu/main-menu/border-console-top_bmp.dds'))
    LayoutHelpers.AtHorizontalCenterIn(topBorder, border)
    LayoutHelpers.AtTopIn(topBorder, border)
    topBorder.Depth:Set(function() return logo.Depth() - 1 end)
    
    local botBorderLeft = Bitmap(logo, UIUtil.UIFile('/scx_menu/main-menu/border-bot-left.dds'))
    LayoutHelpers.AtLeftIn(botBorderLeft, border)
    LayoutHelpers.AtBottomIn(botBorderLeft, border)
    
    local botBorderRight = Bitmap(logo, UIUtil.UIFile('/scx_menu/main-menu/border-bot-right.dds'))
    LayoutHelpers.AtRightIn(botBorderRight, border)
    LayoutHelpers.AtBottomIn(botBorderRight, border)
    
    local botBorderMiddle = Bitmap(logo, UIUtil.UIFile('/scx_menu/main-menu/border-bot-mid.dds'))
    LayoutHelpers.AtBottomIn(botBorderMiddle, border)
    botBorderMiddle.Left:Set(botBorderLeft.Right)
    botBorderMiddle.Right:Set(botBorderRight.Left)
    
    local scrollingBG = Bitmap(botBorderLeft)
    scrollingBG:SetSolidColor('ff000000')
    scrollingBG.Left:Set(function() return botBorderLeft.Right() - 30 end)
    scrollingBG.Right:Set(function() return botBorderRight.Left() + 30 end)
    scrollingBG.Height:Set(20)
    LayoutHelpers.AtBottomIn(scrollingBG, border)
    
    # legal text
    local legalText = UIUtil.CreateText(botBorderLeft, LOC(import('/lua/ui/help/eula.lua').LEGAL_TEXT), 9, UIUtil.bodyFont)
    legalText:SetColor('ffa5a5a5')
    legalText.Depth:Set(function() return botBorderLeft.Depth() - 1 end)
    scrollingBG.Depth:Set(function() return legalText.Depth() - 1 end)
    LayoutHelpers.AtBottomIn(legalText, border, 3)
    legalText.Left:Set(botBorderRight.Right)
    legalText:SetDropShadow(true)
    legalText:SetNeedsFrameUpdate(true)
    legalText.OnFrame = function(self, delta)
        local newLeft = math.floor(self.Left() - (delta * 50))
        if newLeft + self.Width() < botBorderLeft.Left() then
            newLeft = botBorderRight.Right()
        end
        self.Left:Set(newLeft)
    end

    local taBackdrop = Bitmap(parent, UIUtil.UIFile('/scx_menu/scta/taMain.dds'))
    LayoutHelpers.AtHorizontalCenterIn(taBackdrop, parent)
    LayoutHelpers.AtTopIn(taBackdrop, parent)
    taBackdrop.Left:Set(function() return botBorderLeft.Left() end)
    taBackdrop.Right:Set(function() return botBorderRight.Right() end)
    taBackdrop.Height:Set(function() return parent.Height() end)
    taBackdrop.Depth:Set(1)
    taBackdrop:Show()
        
    # music
    local ambientSoundHandle = PlaySound(Sound({Cue = "DRONE2", Bank = "TA_Sound",}))

--[[
    local musicHandle = false
    function StartMusic()
        if not musicHandle then
            musicHandle = PlaySound(Sound({Cue = "DRONE2", Bank = "TA_Sound",}))
        end
    end
    
    function StopMusic()
        if musicHandle then
            StopSound(musicHandle)
            musicHandle = false
        end
    end
    --]]
    parent.OnDestroy = function()
        if ambientSoundHandle then
            StopSound(ambientSoundHandle)
            ambientSoundHandle = false
        end
        --StopMusic()
    end
    
    --StartMusic()
    
    # TOP-LEVEL GROUP TO PARENT ALL DYNAMIC CONTENT
    local topLevelGroup = Group(border, "topLevelGroup")
    LayoutHelpers.FillParent(topLevelGroup, border)
    topLevelGroup.Depth:Set(100)

    # MAIN MENU  
    local mainMenuGroup = Group(topLevelGroup, "mainMenuGroup")
    mainMenuGroup.Width:Set(0)
    mainMenuGroup.Height:Set(0)
    mainMenuGroup.Left:Set(0)
    mainMenuGroup.Top:Set(0)
    mainMenuGroup.Depth:Set(101)

    # TODO: don't destroy the whole menu. just destroy the buttons, then you only have to set the top once.
    function MenuBuild(menuTable, center)
        if menuTable == 'home' then
            menuTable = menuTop
        end
    
        # title
        mainMenu.titleBack = Bitmap(mainMenuGroup, UIUtil.UIFile('/menus/main03/panel-top_bmp.dds'))
        LayoutHelpers.AtHorizontalCenterIn(mainMenu.titleBack, mainMenuGroup)
	mainMenu.titleBack.Top:Set(function() return parent.Height() * 0.65 end)
        
        mainMenu.titleTxt = UIUtil.CreateText(mainMenu.titleBack, GetPreference("profile.current"), 26)
        LayoutHelpers.AtCenterIn(mainMenu.titleTxt, mainMenu.titleBack, 3)
        mainMenu.titleTxt:SetText(LOC(menuTable.title))
        mainMenu.titleTxt:SetNewColor(menuFontColorTitle)
        mainMenu.titleTxt:Hide()
                
        # profile button
        
        local profileDlg = nil
        
        mainMenu.profile = UIUtil.CreateButtonStd(mainMenu.titleBack, '/menus/main02/profile-edit', LOC("<LOC _Change_Profile>Change Profile"), 12)
        LayoutHelpers.CenteredBelow(mainMenu.profile, mainMenu.titleBack, -25)
        mainMenu.profile.OnRolloverEvent = function(self, event)
            if event == 'exit' then
                self.label:SetColor(UIUtil.fontColor)
            else
                self.label:SetColor('ff000000')
            end
        end
    
        function SetNameToCurrentProfile()
            local currentProfile = GetPreference("profile.current")
            if currentProfile then
                local profiles = GetPreference("profile.profiles")
                if profiles[currentProfile] != nil then
                    mainMenu.titleTxt:SetFont(UIUtil.titleFont, 26)
                    mainMenu.titleTxt:SetText(profiles[currentProfile].Name)
                    ForkThread(function()
                        if mainMenu.titleTxt.Width() > mainMenu.titleBack.Width() - 40 then
                            mainMenu.titleTxt:SetFont(UIUtil.titleFont, 14)
                        else
                            mainMenu.titleTxt:SetFont(UIUtil.titleFont, 26)
                        end
                        mainMenu.titleTxt:Show()
                    end)
                else
                    SetPreference("profile.current", 0) -- if current profile is damaged, reset to 0
                end
             end
        end
        
        mainMenu.profile.HandleEvent = function(self, event)
            if animation_active then
                return true
            end
            if event.Type == 'MouseEnter' then
                Tooltip.CreateMouseoverDisplay(self, "profile", 5, true)
            elseif event.Type == 'MouseExit' then
                Tooltip.DestroyMouseoverDisplay()
            end
            Button.HandleEvent(self, event)
        end
        
        mainMenu.profile.SetItemAlpha = function(self, alpha)
            self:SetAlpha(alpha)
            self.label:SetAlpha(alpha)
            mainMenu.titleBack:SetAlpha(alpha)
            mainMenu.titleTxt:SetAlpha(alpha)
        end
        
        mainMenu.profile:SetItemAlpha(1)
        mainMenu.profile:EnableHitTest()
    
        SetNameToCurrentProfile()
    
        mainMenu.profile.OnClick = function(self)
            MenuHide(function()
                if not profileDlg then
                    profileDlg = import('/lua/ui/dialogs/profile.lua').CreateDialog(function()
                       	SetNameToCurrentProfile()
                       	profileDlg = nil
                       	MenuShow()
                    end)
                end
            end)
        end
        
        # menu buttons
        local buttonHeight = nil
        for k, v in menuTable do
            if k != 'title' then
                mainMenu[k] = {}
		if v.name then
		    if v.image and v.name == '' then
                        mainMenu[k].btn = UIUtil.CreateButtonStd(mainMenuGroup, v.image, v.name, 18, 2, 0, "UI_Menu_MouseDown", "UI_Menu_Rollover")
                    else
                        mainMenu[k].btn = UIUtil.CreateButtonStd(mainMenuGroup, '/scx_menu/large-no-bracket-btn/large', v.name, 18, 2, 0, "UI_Menu_MouseDown", "UI_Menu_Rollover")
                    end
                end
                if v.color and mainMenu[k].btn.label then
                    # mainMenu[k].btn.label:SetColor(v.color)
                end

                mainMenu[k].btn:UseAlphaHitTest(false)
		mainMenu[k].btn.Height:Set(function() return parent.Height() * 0.05 end)
		mainMenu[k].btn.Width:Set(function() return parent.Width() * 0.155 end)

		buttonHeight = mainMenu[k].btn.Height()
                if k == 1 then #MP
			mainMenu[k].btn.Left:Set(function() return parent.Width() * 0.215 end)
			mainMenu[k].btn.Top:Set(function() return parent.Height() * 0.815 end)

                elseif k == 2 then #Extras
			mainMenu[k].btn.Left:Set(function() return parent.Width() * 0.215 end)
			mainMenu[k].btn.Top:Set(function() return parent.Height() * 0.895 end)

		elseif k == 3 then #Options
			mainMenu[k].btn.Left:Set(function() return parent.Width() * 0.638 end)
			mainMenu[k].btn.Top:Set(function() return parent.Height() * 0.815 end)

		elseif k == 4 then #Exit
			mainMenu[k].btn.Left:Set(function() return parent.Width() * 0.638 end)
			mainMenu[k].btn.Top:Set(function() return parent.Height() * 0.895 end)

		elseif k == 5 then #Back, Extras menu
			mainMenu[k].btn.Left:Set(function() return parent.Width() * 0.42 end)
			mainMenu[k].btn.Top:Set(function() return parent.Height() * 0.895 end)
                end                
                if v.action then
                    mainMenu[k].btn.clickfunc = v.action
                    mainMenu[k].btn:EnableHitTest()
		    mainMenu[k].btn.OnClick = v.action
                    mainMenu[k].btn._enable = true
                    if v.tooltip then Tooltip.AddButtonTooltip(mainMenu[k].btn, v.tooltip, TOOLTIP_DELAY) end
                else
                    LOG('DISABLING MAIN MENU BUTTON')
                    mainMenu[k].btn:Disable()
                end
                
                mainMenu[k].btn:SetAlpha(1, true)
            end
        end
        
        local numButtons = table.getn(mainMenu)        
        local lastBtn = mainMenu[numButtons].btn
        
        if initial then
            initial = false
        end
        
        # set ESC key functionality depending on menu layer        
        if menuTable == 'home' or menuTable == menuTop then
            SetEscapeHandle(ButtonExit)
        else
            SetEscapeHandle(ButtonBack)
        end

        # set final dimensions/placement of mainMenuGroup
        mainMenuGroup.Height:Set(function() return (mainMenuSize * buttonHeight) + mainMenu.titleBack.Height() end)
        mainMenuGroup.Width:Set(mainMenu.titleBack.Width)
        LayoutHelpers.AtHorizontalCenterIn(mainMenuGroup, border)
        
        mainMenuGroup.Top:Set(function()
            --return math.floor(logo.Bottom() + (border_lm.Top() + 14 - logo.Bottom() - mainMenuGroup.Height() ) / 2 ) # includes offset for alpha on border_lm
            return math.floor(logo.Bottom() - 18)
        end)
    end


   
    function SetEscapeHandle(action)
        import('/lua/ui/uimain.lua').SetEscapeHandler(function() action() end)
    end

    function MenuHide(callback)
            EffectHelpers.FadeIn(darker, 1, 0, .4)
--[[
            if backMovie then
                backMovie:Stop()
            end
--]]
            mainMenuGroup:Hide()
            logo:Hide()
            mainMenuGroup.Depth:Set(50)        # setting depth below topLayerGroup (100) to avoid the button glow persisting when overlays are up
            if callback then callback() end
    end
    
    function MenuShow()
        mainMenuGroup.Depth:Set(101)    # and setting it back again
        mainMenuGroup:Show()
        logo:Show()
        legalText:Show()
        EffectHelpers.FadeOut(darker, 1, .4, 0)
    end
    
    function MenuDestroy(callback, skipSlide)
            for k, v in mainMenu do
                if v.btn then
                    v.btn:Destroy()
                else
                    v:Destroy()
                end
            end
            mainMenu = {}
            if callback then callback() end
    end

    # BUTTON FUNCTIONS
    function TutorialPrompt(callback)
        if Prefs.GetFromCurrentProfile('MenuTutorialPrompt') then
            callback()
        else
            Prefs.SetToCurrentProfile('MenuTutorialPrompt', true)
            UIUtil.QuickDialog(GetFrame(0), "<LOC EXITDLG_0006>This appears to be your first time playing Supreme Commander: Forged Alliance. Would you like to play the tutorial before you begin?", 
                "<LOC _Yes>", function()
                        --StopMusic()
                        parent:Destroy()
                        LaunchSinglePlayerSession(
                            import('/lua/SinglePlayerLaunch.lua').SetupCampaignSession(
                                import('/lua/ui/maputil.lua').LoadScenario('/maps/X1CA_TUT/X1CA_TUT_scenario.lua'), 
                                2, nil, nil, true
                            )
                        )
                    end,
                "<LOC _No>", callback,
                nil, nil,
                true,  {worldCover = true, enterButton = 1, escapeButton = 2})
        end
    end
    
    function ButtonCampaign()
        TutorialPrompt(function()
            MenuAnimation(false, function()
                --StopMusic()
                parent:Destroy()
                import('/lua/ui/campaign/selectcampaign.lua').CreateUI()
            end)
        end)
    end

    function ButtonMP()
        MenuDestroy(function()
            MenuBuild(menuMultiplayer)
        end)
    end

    function ButtonLAN()
        MenuHide(function()
            import('/lua/ui/lobby/gameselect.lua').CreateUI(topLevelGroup, function() MenuShow() SetEscapeHandle(ButtonExit) end)
        end)
    end

    function ButtonSkirmish()
        TutorialPrompt(function()
            MenuHide(function()
                local function StartLobby(scenarioFileName)
                    local playerName = Prefs.GetCurrentProfile().Name or "Unknown"
                    local lobby = import('/lua/ui/lobby/lobby.lua')
                    lobby.CreateLobby('None', 0, playerName, nil, nil, topLevelGroup, function() MenuShow() SetEscapeHandle(ButtonExit) end)
                    lobby.HostGame(playerName .. "'s Skirmish", scenarioFileName, true)
                end
                local lastScenario = Prefs.GetFromCurrentProfile('LastScenario') or UIUtil.defaultScenario
                StartLobby(lastScenario)
            end)
        end)
    end

    function ButtonReplay()
        MenuHide(function()
            import('/lua/ui/dialogs/replay.lua').CreateDialog(topLevelGroup, true, function() MenuShow() SetEscapeHandle(ButtonBack) end)
        end)
    end

    function ButtonMod()
        MenuHide(function()
            local function OnOk(selectedmods)
                Mods.SetSelectedMods(selectedmods)
                MenuShow()
                SetEscapeHandle(ButtonBack)
            end
            import('/lua/ui/dialogs/modmanager.lua').CreateDialog(topLevelGroup, false, OnOk)
        end)
    end

    function ButtonOptions()
        MenuHide(function()
            import('/lua/ui/dialogs/options.lua').CreateDialog(topLevelGroup, function() MenuShow() SetEscapeHandle(ButtonExit) end)    
        end)
    end

    function ButtonExtras()
        MenuDestroy(function()
            MenuBuild(menuExtras)
        end, true)
    end

    function ButtonCredits()
        parent:Destroy()
        import('/lua/ui/menus/credits.lua').CreateDialog(function() import('/lua/ui/menus/main.lua').CreateUI() end)
    end

    function ButtonEULA()
        MenuHide(function()
            import('/lua/ui/menus/eula.lua').CreateEULA(topLevelGroup, function() MenuShow() SetEscapeHandle(ButtonBack) end)
        end)
    end

    function ButtonBack()
        MenuDestroy(function()
            ESC_handle = nil
            MenuBuild('home', true)
        end, true)
    end

    local exitDlg = nil

    function ButtonExit()
        
        if not exitDlg then
            exitDlg = UIUtil.QuickDialog(GetFrame(0), "<LOC EXITDLG_0003>Are you sure you'd like to exit?", 
                        "<LOC _Yes>", function()
                            --StopMusic()
                            parent:Destroy()
                            ExitApplication()
                            end,
                        "<LOC _No>", function() exitDlg = nil end,
                        nil, nil,
                        true,  {worldCover = true, enterButton = 1, escapeButton = 2})
        end                        
    end

    # START

    MenuBuild('home', true)

    FlushEvents()
end
