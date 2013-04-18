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
	if UnitName("Player") == "Nakazz" then
		SendChatMessage("My name's Nakazz and I hit stuff with other stuff", "YELL")
	elseif UnitName("Player") == "Portapotion" then
		SendChatMessage("My name's Portapotion and I'm gonna do pet battles", "YELL", "THALASSIAN")
	elseif UnitName("Player") == "Farmform" then
		SendChatMessage("My name's Farmform and I farm things.", "YELL", "TAURAHE")
	else
		SendChatMessage("This is sheer craziness!", "YELL")
	end
	ChatFrame1:AddMessage("|cFFFF2222Benny Hill time!|r")
	PlaySoundFile("Interface\\AddOns\\BennyHill\\benny_hill.mp3", "Music");
end, 'bennyhill', 'bh')

local frame = CreateFrame("FRAME")
frame:RegisterEvent("CHAT_MSG_YELL")

frame:SetScript("OnEvent", function(self, event, ...)
	--ChatFrame1:AddMessage("Testing")
	-- msg, author, lang, chatline, guid
	local msg = select(1, ...)
	local author = select(2, ...)
	--ChatFrame1:AddMessage(msg .. " was said by " .. author)
	if msg == "This is sheer craziness!" and UnitName("Player") ~= author then
		PlaySoundFile("Interface\\AddOns\\BennyHill\\benny_hill.mp3", "Music");
	end
end)