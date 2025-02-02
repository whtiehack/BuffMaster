local _
local BuffMaster_e2834e0a7893ec83a826b8dd5c13163d = 8; local BuffMaster_7f5efba01c95612f5e29b811158e740f = {
    ["pet"] =
        PetFrame,
    ["party1"] = PartyMemberFrame1,
    ["party2"] = PartyMemberFrame2,
    ["party3"] = PartyMemberFrame3,
    ["party4"] =
        PartyMemberFrame4,
}; local BuffMaster_e2102cef7e78b885d7075bb10028e39f = {
    [1] = PetFrame,
    [2] =
        PartyMemberFrame1PetFrame,
    [3] = PartyMemberFrame2PetFrame,
    [4] = PartyMemberFrame3PetFrame,
    [5] =
        PartyMemberFrame4PetFrame,
}; local BuffMaster_133104d326d458eda34112321a734dac, BuffMaster_00d06be9b74a81db92d9a9da1a57b650, BuffMaster_7738894b0053175295e6fef354231fea
local BuffMaster_cc3105e145f6df0060a4d4779ae40c0e, BuffMaster_a31fc3bbeb1eca3cba8bda3cafca137b
local function BuffMaster_c31924e73a2e21b7c72a19121ea9200d(button, isPet)
    GameTooltip:SetOwner(button, "ANCHOR_RIGHT"); local bType
    if BuffMaster_a31fc3bbeb1eca3cba8bda3cafca137b then
        bType = "PLAYER"
    else
        bType = "HELPFUL"
    end
    if isPet then
        GameTooltip:SetUnitAura("pet", button:GetID(), bType);
    else
        GameTooltip:SetUnitAura(
            "party" .. button:GetParent():GetID(), button:GetID(), bType);
    end
end
local function CreatePartyBuffFrmae(unit, parent)
    if (not unit or not parent) then return; end
    local fname = "BuffMaster" .. unit .. "BuffFrame"; local frame = CreateFrame("Frame", fname, parent); frame:SetID(
        parent:GetID()); frame:SetHeight(20); frame:SetWidth(150); frame:SetPoint("TOPLEFT", parent, "TOPLEFT", 47, -41); local lastbutton, bname; for i = 1, MAX_PARTY_TOOLTIP_BUFFS do
        bname = fname .. "Buff" .. i; local button = CreateFrame("Frame", bname, frame, "PartyBuffFrameTemplate"); button
            :SetID(i); if not lastbutton then
            button:SetPoint("TOPLEFT");
        else
            button:SetPoint("LEFT", lastbutton,
                "RIGHT", 2, 0);
        end
        if (unit == "pet") then
            button:SetScript("OnEnter",
                function() BuffMaster_c31924e73a2e21b7c72a19121ea9200d(button, 1); end);
        else
            button:SetScript("OnEnter",
                function() BuffMaster_c31924e73a2e21b7c72a19121ea9200d(button); end);
        end
        lastbutton = button;
    end
end
local function CreatePartyDebuff(unit, parent)
    if (not parent) then return; end
    for i = 5, BuffMaster_e2834e0a7893ec83a826b8dd5c13163d do
        local name = parent:GetName() .. "Debuff" .. i; local button = CreateFrame("Frame", name, parent,
            "PartyBuffFrameTemplate"); local lastbutton = getglobal(parent:GetName() .. "Debuff" .. (i - 1)); button
            :SetPoint("LEFT", lastbutton, "RIGHT", 2, 0); button:SetID(i);
    end
end
local function CreateTargetDebuff()
    local button, lastbutton; for i = 5, BuffMaster_e2834e0a7893ec83a826b8dd5c13163d do
        local name = "TargetofTargetFrameDebuff" .. i; if _G[name] then
            button = CreateFrame("Frame", name, TargetofTargetFrame, "TargetofTargetDebuffFrameTemplate"); button:SetID(
                i); if not lastbutton then
                button:SetPoint("TOPLEFT", TargetofTargetFrameDebuff1, "BOTTOMLEFT", 0, -1);
            else
                button:SetPoint("LEFT", lastbutton, "RIGHT", 1, 0);
            end
            lastbutton = button;
        end
    end
end
local function CreatePetDebuff(parent)
    local lastbutton; for i = 5, BuffMaster_e2834e0a7893ec83a826b8dd5c13163d do
        local name = parent:GetName() .. "Debuff" .. i; local button = CreateFrame("Frame", name, parent,
            "PartyBuffFrameTemplate"); button:SetID(i); lastbutton = getglobal(parent:GetName() .. "Debuff" .. (i - 1)); button
            :SetPoint("LEFT", lastbutton, "RIGHT", 2, 0);
    end
end
local function BuffMaster_17107aa3a9294eaac1b70bf7d4e141f8(BuffMaster_5e57c2750895232501d674704d8ef219)
    local BuffMaster_a22192947cbcf5f27a4eaf500379d03d, BuffMaster_9a992620b1ab448fb232dcdc06401e99; BuffMaster_a22192947cbcf5f27a4eaf500379d03d =
        ceil(BuffMaster_5e57c2750895232501d674704d8ef219 / 60); BuffMaster_9a992620b1ab448fb232dcdc06401e99 = mod(
        BuffMaster_5e57c2750895232501d674704d8ef219, 60); if BuffMaster_a22192947cbcf5f27a4eaf500379d03d >= 2 then
        return ("%d m")
            :format(BuffMaster_a22192947cbcf5f27a4eaf500379d03d)
    else
        return ("%d s"):format(
            BuffMaster_9a992620b1ab448fb232dcdc06401e99);
    end
end
local function BuffMaster_5862405e86a346b90bd821f493df30ca(BuffMaster_5e57c2750895232501d674704d8ef219)
    local BuffMaster_a22192947cbcf5f27a4eaf500379d03d, BuffMaster_9a992620b1ab448fb232dcdc06401e99; BuffMaster_a22192947cbcf5f27a4eaf500379d03d =
        floor(BuffMaster_5e57c2750895232501d674704d8ef219 / 60); BuffMaster_9a992620b1ab448fb232dcdc06401e99 = mod(
        BuffMaster_5e57c2750895232501d674704d8ef219, 60); if BuffMaster_a22192947cbcf5f27a4eaf500379d03d >= 1 then
        return ("%d:%02d")
            :format(BuffMaster_a22192947cbcf5f27a4eaf500379d03d, BuffMaster_9a992620b1ab448fb232dcdc06401e99)
    else
        return ("%d s")
            :format(BuffMaster_9a992620b1ab448fb232dcdc06401e99);
    end
end
local function BuffMaster_4903ba6fc20fb685cdeed62d86bf1ebe()
    if (BuffMaster_00d06be9b74a81db92d9a9da1a57b650) then
        PartyMemberBuffTooltip:Hide();
    end
end
local BuffMaster_Eventer = BLibrary("BEvent"); local function BuffMaster_7c8ac5ae1087c3f9729423abcf45b74a(
    BuffMaster_fd724fd3c5e25aaf3b4226e1dae5257c, BuffMaster_411b8aa6d5954c6020f0b9c9e80e847a)
    local name, icon, bType; if BuffMaster_a31fc3bbeb1eca3cba8bda3cafca137b then bType = "PLAYER" else bType = "HELPFUL" end
    for i = 1, MAX_PARTY_TOOLTIP_BUFFS do
        name, icon = UnitAura(BuffMaster_fd724fd3c5e25aaf3b4226e1dae5257c, i, bType); if name then
            _G[BuffMaster_411b8aa6d5954c6020f0b9c9e80e847a .. "Buff" .. i .. "Icon"]:SetTexture(icon); _G
                [BuffMaster_411b8aa6d5954c6020f0b9c9e80e847a .. "Buff" .. i]:Show();
        else
            _G[BuffMaster_411b8aa6d5954c6020f0b9c9e80e847a .. "Buff" .. i]:Hide();
        end
    end
end
local function BuffMaster_1a92d5dc80e48e09f7d29aaaab46094b(buffButton, timeLeft)
    if (not BuffMaster_7738894b0053175295e6fef354231fea) then return; end
    local duration = getglobal(buffButton:GetName() .. "Duration"); if timeLeft then
        if BuffMaster_da98fb50047ebbc8f6a22e222b93ef46 then
            duration:SetText(BuffMaster_5862405e86a346b90bd821f493df30ca(
                timeLeft));
        else
            duration:SetText(BuffMaster_17107aa3a9294eaac1b70bf7d4e141f8(timeLeft));
        end
        if (timeLeft < BUFF_WARNING_TIME) then
            duration:SetVertexColor(RED_FONT_COLOR.r, RED_FONT_COLOR.g,
                RED_FONT_COLOR.b);
        elseif (timeLeft < BUFF_DURATION_WARNING_TIME) then
            duration:SetVertexColor(
                HIGHLIGHT_FONT_COLOR.r, HIGHLIGHT_FONT_COLOR.g, HIGHLIGHT_FONT_COLOR.b);
        else
            duration:SetVertexColor(0, 1, 0);
        end
        duration:Show();
    else
        duration:Hide();
    end
end
local function BuffMaster_cfd39af31951c0ec4dc60d7b4dd5feb4(self, elapsed)
    if (not BuffMaster_7738894b0053175295e6fef354231fea) then return; end
    local hasMainHandEnchant, _, mainHandCharges, _, hasOffHandEnchant, _, offHandCharges = GetWeaponEnchantInfo()
    if hasOffHandEnchant then
        if (offHandCharges and offHandCharges > 0) then
            TempEnchant1Count:SetText("|cff00ff00" .. offHandCharges .. "|r"); TempEnchant1Count:Show();
        else
            TempEnchant1Count:Hide();
        end
    end
    if hasMainHandEnchant then
        if (mainHandCharges > 0) then
            TempEnchant2Count:SetText("|cff00ff00" .. mainHandCharges .. "|r"); TempEnchant2Count:Show();
        else
            TempEnchant2Count:Hide();
        end
    end
end
local function BuffMaster_81244f624fe0b105f47a78834d1c8775(buttonName, index, filter)
    if (not BuffMaster_7738894b0053175295e6fef354231fea) then return; end
    local buffName = buttonName .. index; local buffDuration = getglobal(buffName .. "Duration"); if not buffDuration then return end
    local unit = PlayerFrame.unit; local name, _, _, _, _, expirationTime = UnitAura(unit, index, filter); if (name and (not expirationTime or expirationTime == 0)) then
        buffDuration:Show(); buffDuration:SetText("|cff00ff00N/A|r");
    else
        buffDuration:Hide();
    end
    local font = buffDuration:GetFont()
    buffDuration:SetFont(font, 12)
end
local function BufferMasterPartyBuffFrame_OnEvent(BuffMaster_d0708241b607c9a9dd1953c812fadfb7,
                                                  BuffMaster_fd724fd3c5e25aaf3b4226e1dae5257c)
    local BuffMaster_8983c60d66c8593ec7165ea9dbedb584; if (BuffMaster_d0708241b607c9a9dd1953c812fadfb7 == "GROUP_ROSTER_UPDATE") then
        BuffMaster_8983c60d66c8593ec7165ea9dbedb584 = UnitName("party1"); if (BuffMaster_8983c60d66c8593ec7165ea9dbedb584 and BuffMaster_Eventer.name1 ~= BuffMaster_8983c60d66c8593ec7165ea9dbedb584) then
            BuffMaster_Eventer.name1 = BuffMaster_8983c60d66c8593ec7165ea9dbedb584; BuffMaster_7c8ac5ae1087c3f9729423abcf45b74a(
                "party1", "BuffMasterparty1BuffFrame");
        end
        BuffMaster_8983c60d66c8593ec7165ea9dbedb584 = UnitName("party2"); if (BuffMaster_8983c60d66c8593ec7165ea9dbedb584 and BuffMaster_Eventer.name2 ~= BuffMaster_8983c60d66c8593ec7165ea9dbedb584) then
            BuffMaster_Eventer.name2 = BuffMaster_8983c60d66c8593ec7165ea9dbedb584; BuffMaster_7c8ac5ae1087c3f9729423abcf45b74a(
                "party2", "BuffMasterparty1BuffFrame");
        end
        BuffMaster_8983c60d66c8593ec7165ea9dbedb584 = UnitName("party3"); if (BuffMaster_8983c60d66c8593ec7165ea9dbedb584 and BuffMaster_Eventer.name3 ~= BuffMaster_8983c60d66c8593ec7165ea9dbedb584) then
            BuffMaster_Eventer.name3 = BuffMaster_8983c60d66c8593ec7165ea9dbedb584; BuffMaster_7c8ac5ae1087c3f9729423abcf45b74a(
                "party3", "BuffMasterparty1BuffFrame");
        end
        BuffMaster_8983c60d66c8593ec7165ea9dbedb584 = UnitName("party4"); if (BuffMaster_8983c60d66c8593ec7165ea9dbedb584 and BuffMaster_Eventer.name4 ~= BuffMaster_8983c60d66c8593ec7165ea9dbedb584) then
            BuffMaster_Eventer.name4 = BuffMaster_8983c60d66c8593ec7165ea9dbedb584; BuffMaster_7c8ac5ae1087c3f9729423abcf45b74a(
                "party4", "BuffMasterparty1BuffFrame");
        end
    elseif (BuffMaster_d0708241b607c9a9dd1953c812fadfb7 == "UNIT_AURA") then
        if (BuffMaster_fd724fd3c5e25aaf3b4226e1dae5257c == "pet") then
            BuffMaster_7c8ac5ae1087c3f9729423abcf45b74a("pet", "BuffMasterpetBuffFrame");
        elseif (BuffMaster_fd724fd3c5e25aaf3b4226e1dae5257c == "party1") then
            BuffMaster_7c8ac5ae1087c3f9729423abcf45b74a("party1", "BuffMasterparty1BuffFrame");
        elseif (BuffMaster_fd724fd3c5e25aaf3b4226e1dae5257c == "party2") then
            BuffMaster_7c8ac5ae1087c3f9729423abcf45b74a("party2", "BuffMasterparty2BuffFrame");
        elseif (BuffMaster_fd724fd3c5e25aaf3b4226e1dae5257c == "party3") then
            BuffMaster_7c8ac5ae1087c3f9729423abcf45b74a("party3", "BuffMasterparty3BuffFrame");
        elseif (BuffMaster_fd724fd3c5e25aaf3b4226e1dae5257c == "party4") then
            BuffMaster_7c8ac5ae1087c3f9729423abcf45b74a("party4", "BuffMasterparty4BuffFrame");
        end
    end
end
local function BufferMasterPartyBuffFrame_RefreshAll()
    BuffMaster_7c8ac5ae1087c3f9729423abcf45b74a("pet", "BuffMasterpetBuffFrame"); BuffMaster_7c8ac5ae1087c3f9729423abcf45b74a(
        "party1", "BuffMasterparty1BuffFrame"); BuffMaster_7c8ac5ae1087c3f9729423abcf45b74a("party2",
        "BuffMasterparty2BuffFrame"); BuffMaster_7c8ac5ae1087c3f9729423abcf45b74a("party3", "BuffMasterparty3BuffFrame"); BuffMaster_7c8ac5ae1087c3f9729423abcf45b74a(
        "party4", "BuffMasterparty4BuffFrame");
end
BuffMaster_Eventer:Init { name = "BuffMaster", func = function()
    for BuffMaster_63a9ce6f1eeac72ef41293b7d0303335, BuffMaster_8d0644c92128c1ff68223fd74ba63b56 in pairs(BuffMaster_7f5efba01c95612f5e29b811158e740f) do
        CreatePartyBuffFrmae(BuffMaster_63a9ce6f1eeac72ef41293b7d0303335, BuffMaster_8d0644c92128c1ff68223fd74ba63b56); CreatePartyDebuff(
            BuffMaster_63a9ce6f1eeac72ef41293b7d0303335, BuffMaster_8d0644c92128c1ff68223fd74ba63b56);
    end
    for BuffMaster_e914904fab9d05d3f54d52bfc31a0f3f, BuffMaster_8d0644c92128c1ff68223fd74ba63b56 in ipairs(BuffMaster_e2102cef7e78b885d7075bb10028e39f) do
        CreatePetDebuff(BuffMaster_8d0644c92128c1ff68223fd74ba63b56);
    end
    if TargetofTargetFrameDebuff3 and TargetofTargetFrameDebuff2 then
        TargetofTargetFrameDebuff3:ClearAllPoints(); TargetofTargetFrameDebuff3:SetPoint("LEFT",
            TargetofTargetFrameDebuff2, "RIGHT", 1, 0);
    end
    CreateTargetDebuff();
end };

function BuffMaster_ToggleBuffInfo(toggle)
    if toggle == 1 then
        BuffMaster_7738894b0053175295e6fef354231fea = true;
        if (not BuffBuffMaster_ToggleShowPartyMaster_cc3105e145f6df0060a4d4779ae40c0e) then
            hooksecurefunc("AuraButton_UpdateDuration", BuffMaster_1a92d5dc80e48e09f7d29aaaab46094b);
            hooksecurefunc(
                "AuraButton_Update", BuffMaster_81244f624fe0b105f47a78834d1c8775);
            hooksecurefunc(
                "TempEnchantButton_OnUpdate", BuffMaster_cfd39af31951c0ec4dc60d7b4dd5feb4);
            BuffMaster_cc3105e145f6df0060a4d4779ae40c0e = true;
        end
    else
        BuffMaster_7738894b0053175295e6fef354231fea = nil;
    end
end

function BuffMaster_ToggleDetailTimeLeft(toggle)
    if toggle == 1 then
        BuffMaster_da98fb50047ebbc8f6a22e222b93ef46 = true;
    else
        BuffMaster_da98fb50047ebbc8f6a22e222b93ef46 = nil;
    end
end

function BuffMaster_ToggleMyBuffs(flags)
    if flags == 1 then
        BuffMaster_a31fc3bbeb1eca3cba8bda3cafca137b = true
    else
        BuffMaster_a31fc3bbeb1eca3cba8bda3cafca137b = false
    end
end

function BuffMaster_ToggleShowParty(toggle)
    if toggle == 1 then
        BuffMaster_Eventer:RegisterEvent("GROUP_ROSTER_UPDATE", BufferMasterPartyBuffFrame_OnEvent);
        BuffMaster_Eventer:RegisterEvent("PARTY_MEMBER_ENABLE", BufferMasterPartyBuffFrame_OnEvent);
        BuffMaster_Eventer:RegisterEvent(
            "PARTY_MEMBER_DISABLE", BufferMasterPartyBuffFrame_OnEvent);
        BuffMaster_Eventer:RegisterEvent("UNIT_AURA",
            BufferMasterPartyBuffFrame_OnEvent);
        BuffMasterparty1BuffFrame:Show();
        BuffMasterparty2BuffFrame:Show();
        BuffMasterparty3BuffFrame:Show();
        BuffMasterparty4BuffFrame:Show();
        for i = 1, 4 do
            local button = getglobal("PartyMemberFrame" .. i .. "Debuff1");
            local parent = getglobal("PartyMemberFrame" .. i);
            button:ClearAllPoints();
            parent:RegisterAnchorFrame(button, 9, "TOPLEFT", "TOPRIGHT", 23, 6, 0);
            if (not BuffMaster_133104d326d458eda34112321a734dac) then
                parent:HookScript("OnEnter", BuffMaster_4903ba6fc20fb685cdeed62d86bf1ebe);
            end
        end
        if not BuffMaster_133104d326d458eda34112321a734dac then
            PetFrame:HookScript("OnEnter", BuffMaster_4903ba6fc20fb685cdeed62d86bf1ebe);
        end
        BuffMaster_133104d326d458eda34112321a734dac = true; 
        BuffMaster_00d06be9b74a81db92d9a9da1a57b650 = true; 
        BufferMasterPartyBuffFrame_RefreshAll();
    else
        BuffMaster_Eventer:UnregisterEvent("GROUP_ROSTER_UPDATE"); BuffMaster_Eventer:UnregisterEvent(
            "PARTY_MEMBER_ENABLE"); BuffMaster_Eventer:UnregisterEvent("PARTY_MEMBER_DISABLE"); BuffMaster_Eventer
            :UnregisterEvent("UNIT_AURA"); BuffMasterparty1BuffFrame:Hide(); BuffMasterparty2BuffFrame:Hide(); BuffMasterparty3BuffFrame
            :Hide(); BuffMasterparty4BuffFrame:Hide(); for i = 1, 4 do
            local button = getglobal("PartyMemberFrame" .. i .. "Debuff1"); local parent = getglobal("PartyMemberFrame" ..
                i); button:ClearAllPoints(); button:SetPoint("TOPLEFT", parent, "TOPLEFT", 48, -32); parent
                :UnregisterAnchorFrame(button);
        end
        BuffMaster_00d06be9b74a81db92d9a9da1a57b650 = nil;
    end
end

local frame = CreateFrame("Frame")
frame:RegisterEvent("ADDON_LOADED")
frame:SetScript("OnEvent", function(self, event, name)
    if event == "ADDON_LOADED" and name == "BuffMaster" then
        C_Timer.After(0.1, function ()
            BuffMaster_ToggleShowParty(1)
        end)
        -- 取消注册事件
        frame:UnregisterEvent("ADDON_LOADED")

        -- 释放Frame占用的资源
        frame:SetScript("OnEvent", nil) -- 清除事件处理脚本
        frame:Hide() -- 隐藏Frame
        frame = nil -- 解除frame的引用
    end
end)

