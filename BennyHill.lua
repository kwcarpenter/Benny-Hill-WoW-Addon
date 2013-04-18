function SlashCmdList_AddSlashCommand(name, func, ...)
    SlashCmdList[name] = func
    local command = ''
    for i = 1, select('#', ...) do
        command = select(i, ...)
        if strsub(command, 1, 1) ~= '/' then
            command = '/' .. command
        end
        _G['SLASH_'..name..i] = command
    end
end

SlashCmdList_AddSlashCommand('BENNY_HILL', function(msg)
 
 PlaySoundFile("Interface\\AddOns\\BennyHill\\benny_hill.mp3");
end, 'bennyhill', 'bh')

local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_LOGIN")
frame:SetScript("OnEvent", function(self, event, ...)
	ChatFrame1:AddMessage(UnitName("Player") ..' has logged in.')
end)