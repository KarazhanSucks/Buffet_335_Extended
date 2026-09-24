
----------------------
--      Locals      --
----------------------

local defaults = {macroHP = "#showtooltip\n%MACRO%", macroMP = "#showtooltip\n%MACRO%", preferSpeed = false, debug = false}
local ids, bests, allitems, items, dirty = LibStub("tekIDmemo"), {}, {}, {
	bandage = "38640:4100,34721:4800,34722:5800,2581:114,8545:1104,21991:3400,14530:2000,6451:640,3531:301,1251:66,8544:800,21990:2800,14529:1360,6450:400,3530:161",
	hstone = "36892:4280,36893:4708,36894:5136,36889:3500,36890:3850,36891:4200,14894:600,25881:400,23329:24,25883:1250,25880:180,15723:1400,11951:800,25882:640,25498:96,11952:425,11951:800,5509:500,5510:800,5511:250,5512:100,9421:1200,19004:110,19005:120,19006:275,19007:300,19008:550,19009:600,19010:880,19011:960,19012:1320,19013:1440,22103:2080,22104:2288,22105:2496",
	mstone = "36799:27606,33312:3415,14894:600,22354:60,23386:100,15723:1400,20520:1200,11952:425,35287:520,12662:1200,5513:600,5514:400,8007:850,8008:1100,22044:2400",
	hppot = "40077:3300,41166:3600,43569:1920,43531:2000,33447:3600,39671:2000,39327:2000,39327:2000,33934:2000,737:400,34440:2200,33092:2000,118:80,858:160,4596:160,929:320,1710:520,11562:670,3928:800,18839:800,13446:1400,31838:1400,31839:1400,31852:1400,31853:1400,28100:1400,23822:2000,22829:2000,32947:2000",
	mppot = "40077:4300,42545:4300,43570:500,43530:2400,33448:4300,40067:1050,33935:2400,737:400,34440:2200,33093:2400,2455:160,3385:320,3827:520,6149:800,13443:1200,18841:1200,13444:1800,31840:1800,31841:1800,31854:1800,31855:1800,28101:1800,23823:2400,22832:2400,32948:2400,31677:3200",
	water = "45932:15000,38431:7200,38430:5100,38429:2934,42777:12960,32668:7200,34760:12960,44750:7200,34761:12960,32455:4200,43236:12960,41731:12960,34759:12960,43086:9180,35954:7200,40357:7200,37253:7200,33444:9180,38698:9180,39520:12960,33445:12960,32722:5100,33042:7200,32453:7200,34780:7200,33053:7200,18300:4200,21071:315,21153:882,2682:294,3448:294,13724:4410,20031:4410,19301:4410,1401:60,159:151,1179:436,17404:436,1205:835,9451:835,19299:835,1708:1344,4791:1344,10841:1344,17405:1344,1645:1992,19300:1992,8766:2934,23161:2934,28399:5100,27860:7200,29395:7200,24007:4200,30457:7200,29454:5100,29401:7200,24006:2934,23585:2934",
	food = "67273:2148,67271:2148,67272:2148,65730:552,67270:2148,27230:243,65731:552,45932:18000,44608:13200,44072:15000,44071:15000,44049:15000,43087:15000,42778:15000,42434:15000,42433:13200,42431:15000,42430:13200,42429:15000,42428:13200,41729:15000,38428:7500,38427:4320,34747:15000,18633:243,18632:874,17408:1392,13893:1392,13755:874,11415:2148,11109:30,7097:61,6299:30,6807:874,961:61,44609:13200,5066:243,33048:7500,4656:61,18635:1392,42432:13200,44607:15000,44722:15000,1326:243,34760:15000,34761:15000,5057:61,44749:13200,34759:15000,41751:2148,38706:15000,35952:15000,35953:15000,35951:15000,35948:15000,40202:15000,35947:15000,35950:15000,33449:13200,33451:13200,40359:13200,37252:13200,40356:13200,33452:13200,40358:13200,33454:13200,33443:13200,35949:13200,32722:4320,34780:7500,33053:7500,21071:155,21153:567,2682:294,3448:294,13724:2148,20031:2550,19301:4410,3448:294,17344:61,5473:294,17407:874,19225:2148,733:552,5526:552,7228:552,6316:243,13933:2148,16166:61,16167:243,16170:552,16171:2148,18255:1392,29412:4320,24338:2148,24408:4320,21235:50,19995:50,2679:61,17407:874,19305:552,19224:874,19223:61,19304:243,117:61,2287:243,2681:61,2685:552,3770:552,3771:874,4599:1392,5478:552,6890:243,8952:2148,19306:1392,9681:1392,9681:61,29451:7500,30610:4320,27854:4320,23495:61,17119:243,11444:2148,32685:7500,32686:7500,4604:61,4605:243,4606:552,4607:874,4608:1392,8948:2148,27859:4320,30355:7500,29453:7500,29450:7500,19994:50,22324:2148,4536:61,4537:243,4538:552,4539:874,4602:1392,8953:2148,16168:1392,21033:2148,21031:2148,21030:1392,29393:4320,27856:4320,19696:50,20857:61,4540:61,4541:243,4542:552,4544:874,16169:874,4601:1392,8950:2148,23160:2148,29394:7500,27855:4320,28486:4320,24072:243,30816:61,29449:7500,2070:61,414:243,17406:243,422:552,1707:874,3927:1392,8932:2148,27857:4320,29448:7500,30458:4320,19996:50,6316:243,21552:1392,16766:1392,2682:294,4592:243,4593:552,4594:874,5095:243,6290:61,6887:1392,787:61,8364:874,8957:2148,13546:1392,13930:1392,13935:2148,27661:4320,27858:4320,12238:243,13933:2148,29452:7500",
	conjfood = "65499:22500,65517:4320,65516:2148,65515:1392,65500:972,43518:13200,43523:15000,28112:4410,34062:7500,1113:243,1114:552,1487:874,5349:61,8075:1392,8076:2148,22895:4320,22019:7500",
	conjwater = "65499:19200,65517:4200,65516:2934,65515:1992,65500:1494,43518:9180,43523:12960,28112:4410,34062:7200,5350:151,2288:436,2136:835,3772:1344,8077:1992,8078:2934,8079:4200,30703:5100,22018:7200",
	percfood = "19696:50,19994:50,19995:50,21235:50,19996:50,21537:100,20388:75,20389:75,20390:75,21215:100,130003:100",
	percwater = "19997:60,21537:100,20388:75,20389:75,20390:75,21215:100,130003:100",
}


------------------------------
--      Util Functions      --
------------------------------

local function TableStuffer(...)
	local t = {}
	for i=1,select("#", ...) do
		local id, v = string.split(":", (select(i, ...)))
		t[tonumber(id)] = tonumber(v) or 0
		allitems[tonumber(id)] = tonumber(v) or 0
	end
	return t
end
for i,v in pairs(items) do bests[i], items[i] = {}, TableStuffer(string.split(" ,", v)) end


--------------------------------
--      Restore scanner       --
--------------------------------

-- Food and water pools that compete on restore rate when "prefer speed" is on.
-- An item can sit in a health pool and a mana pool at once (a food-and-drink,
-- eg 45932 or 65499), so rates are tracked per resource and never per item.
local RATEPOOL, POOLNAME, parsed, awaiting = {}, {}, {}, {}
local ratebest, scanMax = {health = {}, mana = {}}, {}
local lastargs, lastsig, quiet, scanTip

for kind, sets in pairs{health = {"conjfood", "percfood", "food"}, mana = {"conjwater", "percwater", "water"}} do
	for _, set in ipairs(sets) do
		for id in pairs(items[set]) do
			local t = RATEPOOL[id]
			if t then
				t[kind] = true
				POOLNAME[id] = POOLNAME[id]..","..set
			else
				RATEPOOL[id], POOLNAME[id] = {[kind] = true}, set
			end
		end
	end
end


-- Folded to lower case so the patterns below only need one case: tooltips say
-- "Use: Restores ..." but hand-written server text may not.
local function Normalize(text)
	text = text:lower()
	text = text:gsub("\194\160", " ")     -- non-breaking space
	text = text:gsub("%s+", " ")
	return (text:gsub(" %%", "%%"))       -- "4 %" -> "4%"
end


-- enUS shapes.  One line can carry both resources:
--   flat      "Restores 22500 health over 30 sec"                (a total, divide by duration)
--   both      "Restores 22500 health and 19200 mana over 30 sec"
--   percent   "Restores 4% of your health and 3% of your mana per second for 25 sec"  (already a rate)
--   tick      "Restores 500 health every 5 sec for 25 sec"       (amount is per tick)
local function ParseRestoreLine(text, out)
	local dur = tonumber(text:match("for ([%d,%.]+) sec")) or tonumber(text:match("over ([%d,%.]+) sec"))
	local tick = tonumber(text:match("every ([%d,%.]+) sec"))
	local divisor = text:find("per second", 1, true) and 1 or tick or dur

	local function Add(kind, amount, isPercent)
		if out[kind] or not amount then return end
		amount = tonumber((amount:gsub(",", "")))
		if amount and amount > 0 then
			out[kind] = {amount = amount, isPercent = isPercent or nil, divisor = divisor, dur = dur, tick = tick}
		end
	end

	Add("health", text:match("([%d,%.]+)%% of your health") or text:match("([%d,%.]+)%% of health"), true)
	Add("mana", text:match("([%d,%.]+)%% of your mana") or text:match("([%d,%.]+)%% of mana"), true)

	-- One percentage covering both, as this server words the bathwater: "restoring
	-- 4% of your health and mana per second".  After the specific patterns, so a
	-- tooltip naming two different percentages still wins.
	local both = text:match("([%d,%.]+)%% of your health and mana")
		or text:match("([%d,%.]+)%% of your mana and health")
		or text:match("([%d,%.]+)%% of health and mana")
		or text:match("([%d,%.]+)%% of mana and health")
	Add("health", both, true)
	Add("mana", both, true)

	-- "restores", "restoring", "restored" — the usual word varies by server.
	Add("health", text:match("restor%a* ([%d,%.]+) health"))
	Add("mana", text:match("restor%a* ([%d,%.]+) mana") or text:match("and ([%d,%.]+) mana"))
end


-- Owner, clear, link: the order scanning tooltips use everywhere, owner first
-- because setting one clears the tooltip.  It is shown for the length of this
-- call only and hidden again before anything is parsed, so a bad tooltip can't
-- strand itself on screen, and nothing is ever drawn (frames render after the
-- current execution finishes, by which point it is hidden again).
local function TooltipLines(link)
	scanTip:SetOwner(WorldFrame, "ANCHOR_NONE")
	scanTip:ClearLines()
	scanTip:SetHyperlink(link)
	scanTip:Show()

	local lines, name = {}, scanTip:GetName()
	local n = math.min(scanTip:NumLines() or 0, 30)
	for i = 1, n do
		local fs = _G[name.."TextLeft"..i]
		local raw = fs and fs:GetText()
		if raw and raw ~= "" then lines[#lines + 1] = raw end
	end

	local regions = {scanTip:GetRegions()}
	if #lines == 0 then
		-- Some clients don't name or keep every line (TextLeft9+ come and go), so
		-- fall back to walking the tooltip's font strings directly.
		for i = 1, #regions do
			local fs = regions[i]
			if fs.GetObjectType and fs:GetObjectType() == "FontString" then
				local raw = fs:GetText()
				if raw and raw ~= "" then lines[#lines + 1] = raw end
			end
		end
	end
	scanTip:Hide()
	return lines, n, #regions
end


local function ReadTooltip(link)
	if not GetItemInfo(link) then return nil, "no item data" end

	if not scanTip then
		scanTip = CreateFrame("GameTooltip", "BuffetScanTip", UIParent, "GameTooltipTemplate")
	end

	-- A server-invented item whose link the client's own tooltip code chokes on
	-- must not take the whole scan down with it, so the read is guarded and the
	-- error comes back as the reason instead.
	local ok, lines, n, regions = pcall(TooltipLines, link)
	if not ok then
		pcall(scanTip.Hide, scanTip)
		return nil, "scan error: "..tostring(lines)
	end

	if #lines == 0 then return nil, "tooltip empty ("..n.." lines, "..regions.." regions)" end

	-- The notice stands alone when the client doesn't know the name yet, and sits
	-- under the name when it does, so look for it anywhere.  No real item
	-- description contains that string.
	for i = 1, #lines do
		if lines[i] == RETRIEVING_ITEM_INFO then return nil, "retrieving item data" end
	end

	local out = {lines = lines}
	for i = 1, #lines do ParseRestoreLine(Normalize(lines[i]), out) end
	return out
end


-- Never cache a failed read: a custom item whose data arrives late would then be
-- excluded forever.  parsed[id] only ever holds a completed read, and awaiting[id]
-- carries the reason so the dump can say what went wrong.
local function ParseCandidate(id, link)
	local out, why = ReadTooltip(link)
	if not out then awaiting[id] = why or "unreadable" return end
	awaiting[id] = nil
	parsed[id] = out
end


local function MaxFor(kind)
	if kind == "health" then return UnitHealthMax("player") end
	return (UnitPowerMax and UnitPowerMax("player", 0)) or (UnitManaMax and UnitManaMax("player"))
end


-- Percent items convert against the player's current max, so the rate is worked
-- out at pick time and never cached.
local function RateOf(entry, max)
	local amount = entry.amount
	if entry.isPercent then
		if not max or max <= 0 then return end
		amount = amount / 100 * max
	end
	if not entry.divisor or entry.divisor <= 0 then return end
	return amount / entry.divisor
end


-----------------------------
--      Event Handler      --
-----------------------------

Buffet = CreateFrame("frame")
Buffet:SetScript("OnEvent", function(self, event, ...) if self[event] then return self[event](self, event, ...) end end)
Buffet:RegisterEvent("ADDON_LOADED")
function Buffet:Print(...) ChatFrame1:AddMessage(string.join(" ", "|cFF33FF99Buffet|r:", ...)) end


function Buffet:ADDON_LOADED(event, addon)
	if addon:lower() ~= "buffet" then return end

	BuffetDB = setmetatable(BuffetDB or {}, {__index = defaults})
	self.db = BuffetDB

	self:UnregisterEvent("ADDON_LOADED")
	self.ADDON_LOADED = nil

	if IsLoggedIn() then self:PLAYER_LOGIN() else self:RegisterEvent("PLAYER_LOGIN") end
end


function Buffet:PLAYER_LOGIN()
	self:RegisterEvent("PLAYER_LOGOUT")

	self:RegisterEvent("PLAYER_REGEN_ENABLED")
	self:RegisterEvent("BAG_UPDATE")
	self:RegisterEvent("PLAYER_LEVEL_UP")
	pcall(self.RegisterEvent, self, "GET_ITEM_INFO_RECEIVED")   -- not on every client

	self:Scan()

	self:UnregisterEvent("PLAYER_LOGIN")
	self.PLAYER_LOGIN = nil
end


function Buffet:PLAYER_LOGOUT()
	for i,v in pairs(defaults) do if self.db[i] == v then self.db[i] = nil end end
end


function Buffet:PLAYER_REGEN_ENABLED()
	if dirty then self:Scan() end
end


function Buffet:BAG_UPDATE()
	dirty = true
	if not InCombatLockdown() then self:Scan() end
end
Buffet.PLAYER_LEVEL_UP = Buffet.BAG_UPDATE

-- Item data can land after we first see something in the bags; rescan so a
-- late arrival still gets parsed.
function Buffet:GET_ITEM_INFO_RECEIVED()
	if next(awaiting) then self:BAG_UPDATE() end
end


function Buffet:Scan()
	for _,t in pairs(bests) do for i in pairs(t) do t[i] = nil end end
	for _,t in pairs(ratebest) do t.id, t.rate, t.stack = nil, nil, nil end

	local mylevel = UnitLevel("player")
	local speed = self.db.preferSpeed
	if speed then scanMax.health, scanMax.mana = MaxFor("health"), MaxFor("mana") end

	for bag=0,4 do
		for slot=1,GetContainerNumSlots(bag) do
			local link = GetContainerItemLink(bag, slot)
			local id = link and ids[link]
			local reqlvl = link and select(5, GetItemInfo(link)) or 0
			if id and allitems[id] and reqlvl <= mylevel then
				local _, stack = GetContainerItemInfo(bag,slot)
				for set,setitems in pairs(items) do
					local thisbest, val = bests[set], setitems[id]
					if val and (not thisbest.val or (thisbest.val < val or thisbest.val == val and thisbest.stack > stack)) then
						thisbest.id, thisbest.val, thisbest.stack = id, val, stack
					end
				end
				if speed and RATEPOOL[id] then
					if parsed[id] == nil then ParseCandidate(id, link) end
					local entry = parsed[id]
					if entry then
						for kind in pairs(RATEPOOL[id]) do
							local rate = entry[kind] and RateOf(entry[kind], scanMax[kind])
							local best = ratebest[kind]
							if rate and (not best.rate or best.rate < rate or best.rate == rate and best.stack > stack) then
								best.id, best.rate, best.stack = id, rate, stack
							end
						end
					end
				end
			end
		end
	end

	-- A pure substitution: with the option off, or with nothing parseable, this
	-- is exactly the chain it has always been.
	local hp = speed and ratebest.health.id or bests.conjfood.id or bests.percfood.id or bests.food.id
	local mp = speed and ratebest.mana.id or bests.conjwater.id or bests.percwater.id or bests.water.id

	lastargs = {hp = hp, mp = mp, hppot = bests.hppot.id, hstone = bests.hstone.id, bandage = bests.bandage.id, mppot = bests.mppot.id, mstone = bests.mstone.id}

	self:Edit("AutoHP", self.db.macroHP, hp or bests.hstone.id or bests.hppot.id, bests.hppot.id, bests.hstone.id, bests.bandage.id)
	self:Edit("AutoMP", self.db.macroMP, mp or bests.mstone.id or bests.mppot.id, bests.mppot.id, bests.mstone.id)
	dirty = false

	if self.db.debug then
		local sig = table.concat({hp or 0, mp or 0, bests.hppot.id or 0, bests.hstone.id or 0, bests.bandage.id or 0, bests.mppot.id or 0, bests.mstone.id or 0}, ":")
		if sig ~= lastsig then
			lastsig = sig
			if not quiet then self:Dump() end
		end
	end
end


function Buffet:Edit(name, substring, food, pot, stone, shift)
	local macroid = GetMacroIndexByName(name)
	if not macroid then return end

	local body = "/use "
	if shift then body = body .. "[mod:shift,target=player] item:"..shift.."; " end
	if (pot and not stone) or (stone and not pot) then body = body .. "[combat] item:"..(pot or stone).."; " end
	body = body .. (pot and stone and "[nocombat] " or "").."item:"..(food or "6948")

	if pot and stone then body = body .. "\n/castsequence [combat,nomod] reset="..(stone == 22044 and "120/" or "").."combat item:"..stone..", item:"..pot end

	EditMacro(macroid, name, 1, substring:gsub("%%MACRO%%", body), 1)
end


------------------------------
--      Debug reporting     --
------------------------------

local function ForEachCandidate(func)
	for bag=0,4 do
		for slot=1,GetContainerNumSlots(bag) do
			local link = GetContainerItemLink(bag, slot)
			local id = link and ids[link]
			if id and allitems[id] then
				func(id, link, select(2, GetContainerItemInfo(bag, slot)))
			end
		end
	end
end


-- A percentage with no pool to measure it against (a warrior's mana, say) still
-- has a rate worth seeing, it just isn't in a unit any pick can compare, so it
-- reads as %/s instead of /s.
local function PercentRate(entry)
	if not entry.isPercent or not entry.divisor or entry.divisor <= 0 then return end
	return entry.amount / entry.divisor
end


local function RateString(id, kind)
	local entry = parsed[id] and parsed[id][kind]
	if not entry then return "-" end
	local rate = RateOf(entry, scanMax[kind])
	if rate then return string.format("%.1f/s", rate) end
	local pct = PercentRate(entry)
	-- RateOf only refuses a percentage when the pool is missing (0 or absent),
	-- so a rate here means there was nothing to convert against.
	if pct then return string.format("%.2f%%/s (no %s pool)", pct, kind) end
	return "no duration"
end


-- Which mechanism decided a pick: the rate comparison, or the pool order the
-- macro has always used.  Saying it beats inferring it from the ids.
local function Decided(kind, id)
	if not id then return "" end
	return ratebest[kind].id == id and " [rate]" or " [legacy]"
end


function Buffet:Dump()
	scanMax.health, scanMax.mana = MaxFor("health"), MaxFor("mana")

	local cands = {}
	ForEachCandidate(function(id, link, stack) cands[#cands+1] = {id = id, link = link, stack = stack} end)

	-- A missing pool doesn't suppress the report: without it percentages can't be
	-- converted, which is worth saying outright rather than leaving the mana side
	-- looking empty for a character that simply has no mana.
	local poolnotes = ""
	for _, kind in ipairs{"health", "mana"} do
		if not scanMax[kind] or scanMax[kind] <= 0 then
			poolnotes = poolnotes.." | no "..kind.." pool: percent "..kind.." items show as %/s and are left out of the rate pick"
		end
	end

	self:Print("prefer speed "..(self.db.preferSpeed and "ON" or "OFF").." | level "..UnitLevel("player").." | maxHP "..tostring(scanMax.health).." | maxMP "..tostring(scanMax.mana)..poolnotes..(InCombatLockdown() and " | in combat, macros not rescanned" or ""))

	-- Control read: the hearthstone, an item every client has.  If this comes back
	-- empty as well then the tooltip can't be read at all on this client, rather
	-- than something being wrong with the item links, and no amount of pattern
	-- fiddling will help.  It settles in one command what is otherwise guesswork.
	local ctrllink = select(2, GetItemInfo(6948)) or "|cffffffff|Hitem:6948:0:0:0:0:0:0:0|h[Hearthstone]|h|r"
	local clines, cwhy = ReadTooltip(ctrllink)
	self:Print("control read (hearthstone): "..(clines and (#clines.lines.." lines, first = "..tostring(clines.lines[1])) or ("failed, "..tostring(cwhy))))

	for _, c in ipairs(cands) do
		if RATEPOOL[c.id] then
			local entry, state = parsed[c.id]
			if awaiting[c.id] then state = "awaiting, "..awaiting[c.id]
			elseif not entry then state = "not attempted"
			elseif not (entry.health or entry.mana) then state = "no restore line"
			else
				local bits = {}
				for _, kind in ipairs{"health", "mana"} do
					local e = entry[kind]
					if e then
						local shape = e.divisor == 1 and "per second" or (e.tick and "every "..e.tick.."s" or "over "..tostring(e.divisor or "?").."s")
						bits[#bits+1] = string.format("%s %s%s %s", kind, e.amount, e.isPercent and "%" or "", shape)
					end
				end
				state = table.concat(bits, ", ")
			end
			self:Print(string.format("#%d %s x%d [%s] %s | hp %s | mp %s", c.id, GetItemInfo(c.link) or "?", c.stack, POOLNAME[c.id], state, RateString(c.id, "health"), RateString(c.id, "mana")))
			-- Show the raw tooltip whenever something the item's pools promise is
			-- missing, not just when nothing parsed at all: that text is the only
			-- way to tell a stale table entry (the item never had that resource)
			-- from a pattern that still needs work.
			if entry then
				local unexplained = not (entry.health or entry.mana)
				if not unexplained then
					for kind in pairs(RATEPOOL[c.id]) do
						if not entry[kind] then unexplained = true end
					end
				end
				if unexplained then
					for _, line in ipairs(entry.lines) do self:Print("    | "..line) end
				end
			end
		end
	end

	for _, kind in ipairs{"health", "mana"} do
		local ranked, unrated = {}, {}
		for _, c in ipairs(cands) do
			local rp = RATEPOOL[c.id]
			local entry = rp and rp[kind] and parsed[c.id] and parsed[c.id][kind]
			local rate = entry and RateOf(entry, scanMax[kind])
			if rate then
				ranked[#ranked+1] = {id = c.id, rate = rate}
			elseif entry then
				-- parsed, but this character's pool can't rate it
				local pct = PercentRate(entry)
				unrated[#unrated+1] = string.format("#%d %s", c.id, pct and string.format("%.2f%%/s", pct) or "no duration")
			end
		end
		table.sort(ranked, function(a, b) return a.rate > b.rate end)
		local bits = {}
		for i = 1, math.min(#ranked, 4) do bits[#bits+1] = string.format("#%d %.1f/s", ranked[i].id, ranked[i].rate) end
		local line = kind.." by rate: "..(#bits > 0 and table.concat(bits, " > ") or "(nothing rateable)")
		if #unrated > 0 then line = line.." | parsed, needs a "..kind.." pool: "..table.concat(unrated, ", ") end
		self:Print(line)
	end

	self:Print("legacy order: hp "..tostring(bests.conjfood.id or bests.percfood.id or bests.food.id).." | mp "..tostring(bests.conjwater.id or bests.percwater.id or bests.water.id))
	if lastargs then
		self:Print(string.format("picked: food %s%s pot %s stone %s bandage %s | water %s%s mstone %s mppot %s",
			tostring(lastargs.hp), Decided("health", lastargs.hp), tostring(lastargs.hppot), tostring(lastargs.hstone), tostring(lastargs.bandage),
			tostring(lastargs.mp), Decided("mana", lastargs.mp), tostring(lastargs.mstone), tostring(lastargs.mppot)))
	end
end


SLASH_BUFFET1 = "/buffet"
SlashCmdList["BUFFET"] = function(msg)
	if string.lower(msg or "") == "debug" then
		Buffet.db.debug = not Buffet.db.debug
		lastsig = nil
		Buffet:Print("debug output "..(Buffet.db.debug and "on" or "off"))
	end
	quiet = true
	Buffet:BAG_UPDATE()
	quiet = false
	Buffet:Dump()
end


