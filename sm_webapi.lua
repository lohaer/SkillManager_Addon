Aweaver_api = {}
Player = Player
if (Player and Player.Profession==6) then
	Aweaver_api.t=Player:GetTarget()
end
--if you are an elementalist then player will get target

function Aweaver_api.EBKfdylq()
	Aweaver_api.p=Player
	Aweaver_api.t=Player:GetTarget()
end
--if you are player and target has been gotten from player

function Aweaver_api.AmIFacingTarget()
	local p=Player
	if not p then return false end
	local t=Player:GetTarget()
	if (not p or not t or not t.id or type(t.id)~="number") then return false end
	return p:IsFacingTarget(t.id)
end
--if you have gotten a target, then player will call upon the Isfacingtarget function on target


function Aweaver_api.BUlmvS()
	return Aweaver_api.AmIFacingTarget()
end
function Aweaver_api.iscUL()
	if (Aweaver_api.DeBuFuLa(35) or (Aweaver_api.NIeiE1() and Aweaver_api.SpellCooldown(45746) and Aweaver_api.SpellCooldown(45746)>1000)) then
		return true
	end
	return false
end
--^^if target's health is 35 DeBuFuLa or player has stun NIeiE then check Twist of Fate cooldown and if the cooldown is greater than 1000ms then return true else return false

function Aweaver_api.SpellCooldown(id)
	local p=Player
	if p and id and type(id) == "number" and p:GetSpellInfoByID(id) then
		return p:GetSpellInfoByID(id).cooldown or 999999
	end
	return 999999
end
--^^This is just saying that for the player retrieve the id which we will determine as number in string and p will call the GetSpellInfoByID to determine what is the cooldown of all skills that are usable by the player or set to 999999 if no cooldown of skills are detected then just return that value if first half isn't valid

function Aweaver_api.YwqcmsLJ(range)
	local count=0
	if not range then range=0 end
	local list = CharacterList("hostile,attackable,maxdistance="..range..",alive")
	if ( Player and list ) then
		local id,entry = next (list)
		if (id and entry) then
			count=count+1
		end
	end
	return count
end
--set enemy to 0, if no range on enemy then set to 0 and end, if range look inside the Character list for certain paramters, if Characterlist has a hostile with set parameters and player and range then check id list and entry for next list (another enemy) if detect another id and entry then make player count 1 and increment each time, return the count at the end of running

function Aweaver_api.UcNNWEip(range)
	if not Player then return false end
	local t=Player:GetTarget()
	local count=0
	if not t or not t.distance then return count end
	if not range then range=0 end
	local list = CharacterList("hostile,attackable,maxdistance="..t.distance+range..",alive")
	if ( list ) then
		local id,entry = next (list)
		if (id and entry) then
			if t.distance<range then
				count=count+1
			end
		end
	end
	return count
end
--first line if not player don't do this, if are then retrive player's target, set enemy count to 0, if not enemy or enemy has no distance then just end counting there, if there is no range on enemy then set range to 0 and end there, if from CharacterList detect an enemy with distance and range and other conditions, then add that enemy to the enemy count near player, if their distance is less than set range then add to enemy count.

function Aweaver_api.swhjsVFM(range)
	local count=0
	if not range or type(range) ~= "number" then range=0 end
	local list = CharacterList("hostile,attackable,maxdistance="..range..",alive")
	if ( Player and list ) then
		local id,entry = next (list)
		if (id and entry and not entry.downed) then
			count=count+1
		end
	end
	return count
end
--set enemy count to 0, if no range detected then set range to 0, if Character is detected then count that enemy as a viable target and increment count to 1 each time, make sure enemy is not downed

function Aweaver_api.AiQGtlwd(range)
	local list = CharacterList("friendly,maxdistance="..range..",player,alive")
	if ( Player and list ) then
		local id,e = next (list)
		if (id and e and not e.downed and e.health.percent<=50) then
			return true
		end
	end
	return false
end
--Pull from CharacterList in dev tool, if it is an id and is e (player me) and not downed and health is less than or equal to 50 percent return true else return false


function Aweaver_api.JodcipBp(range)
	local list = CharacterList("friendly,maxdistance="..range..",player,alive")
	if ( Player and list ) then
		local id,e = next (list)
		if (id and e and not e.downed and e.health.percent<=75 and (not e.buffs or not e.buffs[5587])) then
			return true
		end
	end
	return false
end
--Pull again from List friendly player, if actual id and e(player) not downed and health is less than or equal to 75 and no buffs specified or not specifically buff(soothing mist) then return true, else false


function Aweaver_api.LegitUnit()
	if not Player then return false end
	local t = Player:GetTarget()
	if t and not t.dead and not t.downed then
		if t.isplayer or not t.hasowner then
			return true
		end		
	end
	return false
end
--if not player then don't run on them, if player then retrieve target's info, if target is not dead and downed, and t is a plaer and to does not have a owner then return true, else false.


function Aweaver_api.MySpellCD(slotid)
	return Player:GetSpellInfo(slotid).cooldown
end
--basically just a simple method to call the function for spell cooldowns for a specified slot id on player.

function Aweaver_api.Wbmhh()
	local p = Player
	if not p then return false end
	local t = Player:GetTarget()
	if (t and (t.isclone or t.ispet)) then
		local c = CharacterList("hostile,attackable,maxdistance=900,alive,los")
		if ( table.valid(c) ) then 								
			local id,e = next(c)
			if id and e and not e.ispet and not e.isclone and e.id then
				p:SetTarget(e.id)
				return true
			end
		end
	end
	return false
end
--if are player then run, if not end. retrieve target's info, if target is a clone or target is a pet then retrieve info from CharacterList, if target's info fits set parameters then if actual id(s) are found and e(not a pet or not a clone) and actual enemy player id then player target enemy player id and return true, else false.


function Aweaver_api.ZXY(range)
	if not Player then return false end
	local t=Player:GetTarget()
	if range and type(range) == "number" then
		if range==1 then range=600 end
		if range==2 then range=360 end
		if range==3 then range=200 end
		if range==4 then range=450 end
		if range==5 then range=178 end
		if range==6 then range=225 end
		if t and t.distance and t.distance<range then
			return true
		end
	end
	return false
end
--if not player then don't run. retrieve target's info, then declare range and type range to be printed as number then set range to integer variable and declare that range, if target and target's distance is equal to the ranges specified above then retrun true else return false

function Aweaver_api.YXZ(range)
	if not Player then return false end
	if range and type(range) == "number" then
		if range==1 then range=600 end
		if range==2 then range=260 end
		if range==3 then range=300 end
		return Aweaver_api.YwqcmsLJ(range)
	end
	return 0
end
--if not player don't run this, set range and type of range to be printed as number, then declare variables as range then give that variable a value, at the end if pass the above set ranges, return the function YwqcmsLJ (basically the method you pass a range through and if that range is not 0  and matches conditions in characterlist then take that target and add it to enemy count), then return 0 if no range is found

function Aweaver_api.XYZ(range)
	if not Player then return false end
	if range and type(range) == "number" then
		if range==1 then range=1200 end
		if range==2 then range=360 end
		if range==3 then range=1500 end
		if range==4 then range=600 end
		return Aweaver_api.swhjsVFM(range)
	end
	return 0
end
--if not player then don't run, if there is a range and type of range then instantiate it as a number then declare ranges as a list with specific range variables, if no range given matches the ones above then run the method swhjsVFM(a method that determines that no enemy was found and so set range to 0 and just add id to enemy count if true) return 0 if nothing matches up at all.

function Aweaver_api.XXX(range)
	if not Player then return false end
	if range and type(range) == "number" then
		if range==1 then range=600 end
		if Aweaver_api.JodcipBp(range) then
			return true
		end
	end
	return false
end
--if not player then don't run, if find range then instantiate the type of range as a number then declare range if 1 then that range is 600 and end, if get past that step run JodcipBp(a method that says if are player(you) and you fit the certain conditions within that constructive method then return true, else false end)


function Aweaver_api.XXXX(range)
	if not Player then return false end
	if range and type(range) == "number" then
		if range==1 then range=240 end
		if Aweaver_api.AiQGtlwd(range) then
			return true
		end
	end
	return false
end
--if not player then don't run, if there is range then declare that range as a number and if that range equals 1 then that range is 240 and end program there, if get past this step then call AiQGtlwd (a method that if player is you and not downed and health is less than or equal to 50 percent return true )


function Aweaver_api.DeBuFuLa(val)
	if not Player then return false end
	if val and type(val) == "number" and Player and Player.health.percent and Player.health.percent<=val then
		return true
	end
	return false
end
--if not player then don't run, if find value then set that type of value as a number and it came from player and was player's health percent and player's health percent was less than or equal to the value we specified then return true else return false. 

function Aweaver_api.LaFuBuDe(val)
	if not Player then return false end
	if val and type(val) == "number" and Player and Player.health.percent and Player.health.percent>=val then
		return true
	end
	return false
end
--if not player then don't run, if find value then set that value as a number and if it came player and that value was the value of the player's health and that player's health is greater than or equal to the set value then return true, else false end

function Aweaver_api.ABdYGb(aid)
	if not Player then return false end
	if not id or type(id)~="number" then return false end
	local source = Player and Player.specs
	if (source) then							
		for i,s in pairs (source) do
			local traits=s.traits
			if (table.size(traits) > 0) then
				for k, t in pairs (traits) do
					if t.id==aid then
						return true
					end	
				end
			end
		end
	end
	return false
end
--if not player then don't run, if not id or type of id is not a number then return false and don't run, will call upon the source list and only want our Player's specs. If in player's source list something matches then we declare i and s as pair variable in source list and execute them (advanced loop meaning we are moving the pairs of information into i and s and matching them with key values we want), we will then call local list traits and declare that as s. We will then if the number of traits found is greater than 0 will make another pair of variables k, t and use an advaned loop again to match with key values we want, which in this case is if player id is equal to aid (probably means heal or rez will have to check github or ingame dev monitor) then return true else false. HAVE TO FIND OUT WHAT AID IS IN DEV MONITOR LOOKING UNDER SOURCE LIST

function Aweaver_api.dpVYGd()
	local p=Player
	if not Player then return false end
	if (not p or not p.incombat or not type(p.endurance)=="number" or p:GetTransformID()~=2) then return false end
	if ((p and p.incombat and p.endurance>=50 and p.health.percent<30) or (p and p.endurance>=95 and Aweaver_api.EYhAiw())) then
		return Aweaver_api.ABdYGb(238)
	end
	return false
end
-- declaring p as Player, if not player then don't run, if not player or player in combat or setting type of player endurance as a number or player's transform id is not attuned to water then return false. if get past this step then if player and player is in combat and player's endurance which set a number value is greater than or equal to 50 and player's health is less than 30 OR another set of parameters player and player's endurance is greater than or equal to 95 and call method EYhAiw (a method that calls upon specific buffs and counts them, if no buffs are found or the count of the buffs is not valid then won't return true) if either set of conditions returns true then call upon method ABdYGb passing it the value 238 (this method )

function Aweaver_api.iHxNqH()
	local p=Player
	if not p then return false end
	local t=p:GetTarget()
	if t and t.attackable and not t.isplayer and not t.ispet and not t.isclone and t.distance<1200 then return true end
	if ((t and t.distance and t.distance>350 and t.distance<1200) or (t and t.distance and t.distance>350 and Aweaver_api.UcNNWEip(180)) or (Aweaver_api.YwqcmsLJ(180)>=2)) then
		return true
	end
	return false
end
--declare p as player, if not player then return false and end there, retrieve target's info and if target is attackable and a player and not the target's pet and not target's clone and target is less than 1200 then return treu and there. if target and target distance is greater than 350 but less than 1200 OR target and target's distance is greater than 350 and call upon the method UcNNWEip passing it the parameter 180 (this method says to activate if enemy character has a range less than what is input) OR call upon the method YwqcmsLJ (this method says if enemy Character matches with conditions set up plus that range parameter being fulfilled through the passing of the paramater then add that enemy to enemy count) and if count is greater than 2 return true else false end.


function Aweaver_api.SyHMaY()
	if not BehaviorManager:Running() then return false end
	local p=Player
	if not p then return false end
	local t=p:GetTarget()
	local burn=false
	if t and t.buffs and t.buffs[737] then burn=true end
	if burn and Aweaver_api.ZXY(320) and Aweaver_api.AmIFacingTarget() then
		if p:GetSpellInfo(9).skillid==5557 then
			p:SetFacingExact(t.pos.x,t.pos.y,t.pos.z)
			p:CastSpellNoChecks(9)
			return true
		end
	end
	return false
end
--if bot no running then end here, declare p as Player, if not player then return false and end there, retrieve target's info, local burn (a condition that is listed in dev monitor or something) must return false, if target has buff 737 then burn will switch to true so end there. if burn (which is set to false) and method ZXY (a method that says if target and target's distance is equal to the ranges specified above then retrun true else return false) passing it a range parameter of 320 and AmIFacingTarget(method says if you are facing target return true) then move to next stop, if Player's Spell info slot is 9 and is equal to 5557 then call method SetFacingExact (a methat that says to make player direct itself towards opponent) and call method CastSpellNoChecks (a method that says to cast a skill without requiring conditions to be met) and pass it the parameter 9 for slot id) then of course return true


function Aweaver_api.OgoiNt()
	if not BehaviorManager:Running() then return false end
	local p=Player
	if not p then return false end
	local t=p:GetTarget()
	if ((t and t.attackable and not t.downed and Aweaver_api.ZXY(260)) or (t and t.attackable and t.health.percent>33 and Aweaver_api.ZXY(260)) or (Aweaver_api.YXZ(260)>=2)) then
		if p:GetSpellInfo(8).skillid==5691 then
			p:CastSpellNoChecks(8)
			return true
		end
	end
	return false
end
--if bot mode is not running end here, declare p as Player, if not p then return false and end, retrieve target's info, if target is attackable and not downed and call method ZXY and pass it parameter 260 (a method that says if target and target's distance is equal to the ranges specified above then retrun true else return false) OR target is attackable and target's health percent is greater than > 33 and call method ZXY with parameter of 260 (a method that says if target and target's distance is equal to the ranges specified above then retrun true else return false) OR call method YXZ (a method that says a different range of ranges and if matches up with those then return true) and must a range of greater than or equal to 2 (so 260-300) then Player call method CastSpellNoChecks (a method that says cast a skill in certain slot id without need to satsify conditions) and of course return true else return false

function Aweaver_api.EIKHGv()
	local p=Player
	if not p then return false end
	local t=Player:GetTarget()
	if (not p.buffs or not p.buffs[42086]) then
		if (Aweaver_api.XYZ(200)>1 or (t and t.distance<200 and (not t.downed or t.health.percent>30))) then
			return true
		end
	end
	return false
end
-- declare p as Player, retrieve target's info, if no player buffs OR not player's buff 42086() then if call method XYZ and pass it a range of 200 (a method that has a bunch of ranges to check with, if true then run) and must be greater than 1 (so range of 200-1200) OR target's distance is less then 200 and target is not downed and target's health is greater than 30 then return true, else return false. 

function Aweaver_api.jUBmxd()
	local p=Player
	if not p then return false end
	local t=Player:GetTarget()
	if (t and t.distance>=170 and t.distance<=600) then
		return true
	end
	return false
end
-- declare p as Player, retrieve target's info, if target's distance is greater than or equal to 170 and target's distance is less than or equal to 600 then return true else return false.


function Aweaver_api.FWwSJk()
	if not BehaviorManager:Running() then return false end
	local p=Player
	if not p then return false end
	local t=Player:GetTarget()
	if (p:GetTransformID()==1 and t and t.distance<=220) then
		if p:GetSpellInfo(7).skillid==44451 then
			p:CastSpellNoChecks(7)
		end
		return true
	end
	return false
end
-- if bot mode is not running then return false, declare p as Player, if not player than just return false, retrieve target's info, if player's transformID is fire and target's distance is 220 then Player's Spell's info is 7 for slot id and skill id must be equal to 44451 then call method CastSpellNoChecks (method say to cast whatever skill id is there without checking to see if conditions are satisfied) for slot id 7 end there, if get to end of loop before that point end else return false from start.

function Aweaver_api.mmAhjp()
	if not BehaviorManager:Running() then return false end
	local p=Player
	if not p then return false end
	local t=Player:GetTarget()
	if (p:GetTransformID()==3 and t and t.distance<=220) then
		if p:GetSpellInfo(7).skillid==43803 then
			p:CastSpellNoChecks(7)
		end
		return true
	end
	return false
end
--if bot mode is not running then just end here, declare p as Player, if not Player then end here. retrieve target's info, if Player's transformID is air and target's distance is less than or equal to 220 then get values from slod id 7 and if that skill id is equal to 43803 then without satsifying conditions in sm cast the skill in slot id 7

function Aweaver_api.ppcAHO(tmpx)
	if not BehaviorManager:Running() then return false end
	local p=Player
	if not p then return false end
	local t=Player:GetTarget()
	if ((t and t.distance and t.distance<220 and (not t.buffs or not t.buffs[1122])) or (Aweaver_api.DeBuFuLa(70) and p.castinfo.lastskillid==44405)) then
		if not tmpx and p:GetSpellInfo(8).skillid==5690 then
			p:StopMovement()
			p:CastSpellNoChecks(8)
		end
		return true
	end
	return false
end
--if bot mode not running then end here, declare p as Player, if not Player then end here, retrieve target's info, if target's distance is less than 220 and target has not buffs or target does not have buff 1122 (stability) or call method DeBuFuLa and pass it the parameter 70 (method says if find value then set that type of value as a number and it came from player and was player's health percent and player's health percent was less than or equal to the value we specified then return true else return false.) and Player's cast info skill id is equal to 44405 then move on to next step, if not a temporary variable x(will have to look up or ask) and Player's spell info is 8 for slot id and the skill id is equal to 5690 then call Playeer to stop movement and cast the slot id 8 without checking to satisfy thet skills conditions

function Aweaver_api.FCTueT(tmpx)
	if not BehaviorManager:Running() then return false end
	local p=Player
	if not p then return false end
	local t=Player:GetTarget()
	if Aweaver_api.YwqcmsLJ(290)>2 and p.health.percent>50 then
		if not tmpx and p:GetSpellInfo(8).skillid==5690 then
			p:StopMovement()
			p:CastSpellNoChecks(8)
		end
		return true
	end
	return false
end
--if bot mode is not running then just return false, declare p as player, if not Player than just end there, retrieve target's info, call method YwqcmsLJ and pass it 290 and enemy count must be greater than 2 (this method says this method says if enemy Character matches with conditions set up plus that range parameter being fulfilled through the passing of the paramater then add that enemy to enemy count) and player's health is greater than 50 then proceed, if not temporary value of x (don't know will have to check repository or with other devs) and Player's slot id is 8 and skillid is equal to 5690 then Player stop moving and cast the skill id in slot 8 without satsifying that skill's conditions return true end if loop statments

function Aweaver_api.WXGeom()
	if not BehaviorManager:Running() then return false end
	local p=Player
	if not p then return false end
	if p.health.percent<70 and p.incombat then
		if p:GetSpellInfo(9).skillid==5558 then
			p:CastSpellNoChecks(9)
		end
		return true
	end
	return false
end
--if bot mode not running then return false, declare p as Player, if not player than return false, if player's health i less than 70 and player is in combat then get Player's Spell id for slot 9 and if equal to 5558 then cast that skill in slot 9 without checking to see if satsifies the skill's conditions

function Aweaver_api.NfnfQE()
	if not BehaviorManager:Running() then return false end
	local p=Player
	if not p then return false end
	if Aweaver_api.YwqcmsLJ(900)>0 and p.health.percent<=85 and p.incombat then
		if p:GetSpellInfo(8).skillid==5520 then
			p:CastSpellNoChecks(8)
		end
		return true
	end
	return false
end
--if bot not running then return false, declare p as player, if not player then return false, if call method YwqcmsLJ passing a range of 900 (this method says to if range set then look inside the Character list for certain parameters, if Characterlist has a hostile with set parameters matched and player and range then check id list and entry for next list (another enemy) if detect another id and entry then make player count 1 and increment each time, return the count at the end of running) and if greater than 0 and player's health is less than or equal to 85 and player in combat then get Player's slot id 8 and if the skill id is equal to 5520 then cast what is in slot id 8 without satisfying the skill's conditions

function Aweaver_api.uRAfBM()
	local p=Player
	if not p then return false end
	if p:GetSpellInfo(8).skillid==51646 then
		p:CastSpellNoChecks(8)
		return true
	end
	return false
end
--declare p as Player, if not player then return false, if Player's slot id 8 and skill id is equal to 51646 then Player cast skill in slot id 8 without satisfying that skill's condition

function Aweaver_api.rmaKEG()
	if not BehaviorManager:Running() then return false end
	local p=Player
	if not p then return false end
	local t=Player:GetTarget()
	if p:GetSpellInfo(8).skillid==41167 then
		p:CastSpellNoChecks(8)
		return true
	end
	return false
end
--if bot mode no running then return false, declare p as Player, if not player then return false, retrieve target's info, if Player's slot id 8 and skill id is equal to 41167 then Player cast skill in slot id 8 without satisfying that skill's condition

function Aweaver_api.AjxiYp()
	if not BehaviorManager:Running() then return false end
	local p=Player
	if not p then return false end
	local t=Player:GetTarget()
	if t and t.attackable and p.incombat and t.distance and t.distance<178 then
		p:CastSpellNoChecks(5)
		return true
	end
	return false
end
--if bot mode no running then return false, declare p as player, if not player then return false, retrieve target's info, if target's attackable and player is in combat and target's distance is less than 178, then call no condition on skill id in slot id 5 and cast it.

function Aweaver_api.MoRKXr()
	if not BehaviorManager:Running() then return false end
	local p=Player
	if not p then return false end
	local t=Player:GetTarget()
	if Aweaver_api.AjxiYp() then
		return true
	end
	if p.health.percent<50 then
		p:CastSpellNoChecks(5)
		return true
	end
	return false
end
--if bot not running then return false, declare p as player, if not player then return false, retrieve target's info, if when call method AjxiYp (method saysif target's attackable and player is in combat and target's distance is less than 178, then call no condition on skill id in slot id 5 and cast it.) then return true and end, if player's health is less than 50 then cast autoattack skill id without checking conditions inside.

function Aweaver_api.ZnmTDj()
	local p=Player
	if not p then return false end
	local t=Player:GetTarget()
	if p.health.percent<100 or (p.incombat and t and t.attackable and t.distance and t.distance<178) then
		return true
	end
	return false
end
--decalre p as player, if not player then return false, retrieve target's info, if player's health is less than 100 or player is in combat and target's attackable and target's distance is less than 178 then return true

function Aweaver_api.uFAatM()
	if not BehaviorManager:Running() then return false end
	local p=Player
	if not p then return false end
	if Aweaver_api.ZXY(4) and Aweaver_api.BUlmvS() then
		if p:GetSpellInfo(6).skillid==45313 then
			p:CastSpellNoChecks(6)
			return true
		end
	end
	return false
end
--if bot mode not running then return false, declare p as player, if not player then return false, if call method ZXY and pas it parameter 4 (method says if target and target's distance is equal to the ranges specified then return true) and call method BUlmvS (method says if target's health is 35 DeBuFuLa or player has stun NIeiE then check Twist of Fate cooldown and if the cooldown is greater than 1000ms then return true else return false) then cast the skill in slot id 6 if equal to skill id 45313 then cast that skill without satisfying the skill's conditions

function Aweaver_api.Jppphu()
	if not BehaviorManager:Running() then return false end
	local p=Player
	if not p then return false end
	local t=Player:GetTarget()
	if t and t.distance and t.distance<178 then
		if p:GetSpellInfo(7).skillid==43074 then
			p:CastSpellNoChecks(7)
			return true
		end
	end
	return false
end
--if bot mode not running then return false, declare p as player, if not player then return false, retrieve target's info, if target's distance is less than 178 then if slot id is 7 and the skill id is equal to 43074 then cast taht skill without satisfying the skill's conditions

function Aweaver_api.ElTPZb()
	local p=Player
	if not p then return false end
	local t=p:GetTarget()
	if (p and p:GetTransformID()~=4 and p:GetLastTransformID()~=4) then
		if p.health.percent>65 and Aweaver_api.SpellCooldown(5522)<550 and Aweaver_api.SpellCooldown(5690)<50 and (Aweaver_api.ppcAHO(1) or Aweaver_api.FCTueT(1)) and Aweaver_api.YXZ(3)>1 then
			return true
		--elseif p.health.percent<=50 and (t.buffs and t.buffs[718] and not t.buffs[717]) then
		--	return true
		end
	end
	return false
end
--declare p as player, if not player then return false, retrieve target's info, if player and player's transform ID is not equal equal to earth and last tranform ID is not equal equal to earth then if player's health is greater than 65 and our Spell 5522's cooldown is less than 550ms and our Spell 5690's cooldown is less than 50ms and we call method ppcAHO passing it the parameter of 1 (method says if target's distance is less than 220 and target has not buffs or target does not have buff 1122 (stability) or call method DeBuFuLa and pass it the parameter 70 (method says if find value then set that type of value as a number and it came from player and was player's health percent and player's health percent was less than or equal to the value we specified then return true else return false.) and Player's cast info skill id is equal to 44405 then move on to next step, if not a temporary variable x(will have to look up or ask) and Player's spell info is 8 for slot id and the skill id is equal to 5690 then call Playeer to stop movement and cast the slot id 8 without checking to satisfy thet skills conditions) OR call method FCTueT (method says call method YwqcmsLJ and pass it 290 and enemy count must be greater than 2 (this method says this method says if enemy Character matches with conditions set up plus that range parameter being fulfilled through the passing of the paramater then add that enemy to enemy count) and player's health is greater than 50 then proceed, if not temporary value of x (don't know will have to check repository or with other devs) and Player's slot id is 8 and skillid is equal to 5690 then Player stop moving and cast the skill id in slot 8 without satsifying that skill's conditions) and call method YXZ and pass it the range parameter of 3 and enemy count is greater than 1 (this method says set range and type of range to be printed as number, then declare variables as range then give that variable a value, at the end if pass the above set ranges, return the function YwqcmsLJ (basically the method you pass a range through and if that range is not 0  and matches conditions in characterlist then take that target and add it to enemy count), then return 0 if no range is found ) then return true.
--ANOTHER PART OF THE CODE COULD BE: else if player's health is less than or equal to 50 and target's buff iss 718 and not buff 717 then return true

function Aweaver_api.mZFGrr()
	if not BehaviorManager:Running() then return false end
	local p=Player
	if (p) then
		local t=p:GetTarget()
		local transid=p:GetTransformID()
		if t and t.distance and t.distance<600 and transid and type(transid)=="number" and transid==2 and Aweaver_api.SpellCooldown(40170)<500 and Aweaver_api.SpellCooldown(42867)>=7500 then
			return true
		end
	end
	return false
end
--if bot mode not running then return false, declare p as player, if player then retrieve target's info, declare transid as retrieving player's TransformID, if target's distance is less than 600 and transformID is equal to 2 (water) and Our establish skill id 40170's cooldown is less than 500 and our established Skill id 42867's cooldown is greater than or equal to 7500 then return true else false

function Aweaver_api.MAKntp()
	local p=Player
	if not p then return false end
	local t=Player:GetTarget()
	local transid=p:GetTransformID()
	if (t and transid==3 and Aweaver_api.SpellCooldown(42867)<500 and t.distance and t.distance<=600 and t.distance>250 and (not t.buffs or not t.buffs[722]) and Aweaver_api.YVTSdPRF()) then
		return true
	end
	return false
end
--Gale Strike
--declare p as player, retrieve target's information, retrieve player's transformID (We established this variable earlier) if there is target and our transformID is air and our Skill id 42867's cooldown is less than 500 and target's distance is less than or equal to 600 and target's distance is greater than 250 and target has no buffs OR target has not buff 722 and call method YVTSdPRF (method says we declare p as player, retrieve target's info, if player has buff id 10269,then return false and end, if not temporary then declare temporary as t, if temporary is not equal nil and temporary buffs are somwhat nil, then create list of categories that create lists of skill ids declared to boolean parameters, and for lists merge them into one table, and if temporary buffs is not equal nil then return false else it will just stop if something matches and return true) then return true and end

function Aweaver_api.eKnvSd()
	local p=Player
	if not p then return false end
	local t=Player:GetTarget()
	local transid=p:GetTransformID()
	local lasttransid=p:GetLastTransformID()
	if (t and ((transid==3 and lasttransid==4) or (transid==4 and lasttransid==3)) and Aweaver_api.SpellCooldown(46295)<500 and t.distance and t.distance<=200 and Aweaver_api.YVTSdPRF()) then
		return true
	end
	return false
end
--Rust Frenzy
--declare p as player, if not player then return false and end, retrieve target's information, delcare transid as retrieving Player's transformID, declare lasttransid as retrieving player's last TransformID, if there is a target and tranformID is air and last Transform Id is earth OR transform ID is earth and last Transform ID is air and Player's skill id 46295's cooldown is less than 500ms, and target's distance is less than or equal to 200 and call method YVTSdPRF (method that says to call a table to check skill ids of enemy and see if returns true or false, if true that a temporary variable is found then check table, if the table finds a match that is a temporary buff then return true, if the temporary variable is a buff then return false and end) then return true end


function Aweaver_api.LVokGK()
	local p=Player
	if not p then return false end
	local t=Player:GetTarget()
	local transid=p:GetTransformID()
	local lasttransid=p:GetLastTransformID()
	if (t and transid==4 and lasttransid==4 and Aweaver_api.SpellCooldown(40139)<500 and t.distance and t.distance<=170 and Aweaver_api.YVTSdPRF()) then
		return true
	end
	return false
end
--Natural Frenzy
--declare p as player, if not player then return false and end, retrieve target's info, declare transid as retrieving Player's transformID, declare lasttransid as retrieving Player's last transform ID, if there is target and transformID is earth and last transformId is earth and skill id 40139's cooldown is less than 500 and target's distance is less than or equal to 170 and call method YVTSdPRF(method that says to call a table to check skill ids of enemy and see if returns true or false, if true that a temporary variable is found then check table, if the table finds a match that is a temporary buff then return true, if the temporary variable is a buff then return false and end) then return true end. 

function Aweaver_api.LVokGK()
	local p=Player
	if not p then return false end
	local t=Player:GetTarget()
	local transid=p:GetTransformID()
	local lasttransid=p:GetLastTransformID()
	if (t and ((transid==2 and lasttransid==4) or (transid==4 and lasttransid==2)) and Aweaver_api.SpellCooldown(40170)<500 and t.distance and t.distance<=650 and Aweaver_api.YVTSdPRF()) then
		return true
	end
	return false
end
--Twin Strike
--declare p as player, if not player then return false end, retrieve target's info, retrieve player's transform ID, retrieve player's last transformID, if there is target and transform ID is equal to water and last transform ID is equal to earth OR transformId is equal to earth and last transform ID is equal to water and Player's skill id 40170 is less than 500 and target's distance is less than or equal to 650 and call method YVTSdPRF (method that says to call a table to check skill ids of enemy and see if returns true or false, if true that a temporary variable is found then check table, if the table finds a match that is a temporary buff then return true, if the temporary variable is a buff then return false and end) then return true else false.

function Aweaver_api.VAuMku()
	local p=Player
	if not p then return false end
	local t=Player:GetTarget()
	local transid=p:GetTransformID()
	local lasttransid=p:GetLastTransformID()
	if (t and ((transid==1 and lasttransid==2) or (transid==2 and lasttransid==1)) and Aweaver_api.SpellCooldown(42271)<500 and t.distance and t.distance<=170 and Aweaver_api.YVTSdPRF()) then
		return true
	end
	return false
end
--Shearing Edge
--declare p as player, if not player then return false, retrieve target's info, retrieve Player's transform ID, retrieve player's last transformID, if there is target and transformID is fire and last transformID is water OR transformID is water and last TransformID is fire and skill id 42271 is less than 500 and target's distance is less than or equal to 170 and call method YVTSdPRF (method that says to call a table to check skill ids of enemy and see if returns true or false, if true that a temporary variable is found then check table, if the table finds a match that is a temporary buff then return true, if the temporary variable is a buff then return false and end) return true

function Aweaver_api.fPDBNo()
	local p=Player
	if not p then return false end
	local t=Player:GetTarget()
	local transid=p:GetTransformID()
	local lasttransid=p:GetLastTransformID()
	if (t and ((transid==2 and lasttransid==3) or (transid==3 and lasttransid==2)) and Aweaver_api.SpellCooldown(42867)<500 and t.distance and t.distance<=650 and Aweaver_api.YVTSdPRF()) then
		return true
	end
	return false
end
--Lava Skin
--declare p as player, retrieve target's info, retrieve player's transform id, retrieve player's last transformID, if there is target and transformID is water and last transformId is air OR transformId is air and last transformID is water and Skill id 42867's cooldown is less than 500 and target's distance is less than or equal to 650 and call method YVTSdPRF (method that says to call a table to check skill ids of enemy and see if returns true or false, if true that a temporary variable is found then check table, if the table finds a match that is a temporary buff then return true, if the temporary variable is a buff then return false and end) then return true

function Aweaver_api.WUHBJJ()
	local p=Player
	if not p then return false end
	local transid=p:GetTransformID()
	local lasttransid=p:GetLastTransformID()
	if (((transid==1 and lasttransid==4) or (transid==4 and lasttransid==1)) and Aweaver_api.SpellCooldown(46447)<500 and Aweaver_api.YVTSdPRF()) then
		return true
	end
	return false
end
--
--declare p as player, retrieve target's info, retrieve player's transform id, retrieve player's last transformID, if transformID is fire and last transformId is earth OR transformId is earth and last transformID is fire and Skill id 46447's cooldown is less than 500 and call method YVTSdPRF (method that says to call a table to check skill ids of enemy and see if returns true or false, if true that a temporary variable is found then check table, if the table finds a match that is a temporary buff then return true, if the temporary variable is a buff then return false and end) then return true

function Aweaver_api.GUVGQw()
	local p=Player
	if not p then return false end
	if p and p.incombat and p.health.percent>=75 then
		return true
	elseif p and not p.incombat and p:IsMoving() then
		return true
	elseif p and p.incombat and Aweaver_api.SpellCooldown(44405)>500 and p.buffs and p.buffs[718] and p.buffs[5587] then
		return true
	end
	return false
end
--declare p as player, if not player then return false, if player is in combat and player's health is greater than or equal to 75 then return true and end ,else if player is not in combat and player is moving then return true and end, else if player is combat and Player's skill id 44405's cooldown is greater than 500 and player's buff is 718 and 5587 then retrun true and end, return false if don't get through any if statement.

function Aweaver_api.HdrKVf()
	local p=Player
	if not p then return false end
	local transid=p:GetTransformID()
	local lasttransid=p:GetLastTransformID()
	if transid~=1 then return true end
	local t=Player:GetTarget()
	if (t and t.distance and t.distance<200 and transid and transid==1 and lasttransid and lasttransid~=1 and Aweaver_api.SpellCooldown(44451)<250 and Aweaver_api.SpellCooldown(43074)>1500) then
		return true
	end
	return false
end
--declare p as player, if not player then retrun false, retrieve player's transformID, retrieve player's last transformID, if transformID is not equal to fire then true and end, retrieve target's info, if target's distance is less than 200 and transformId is fire and last trasnformID is fire and last transformID is not equal to fire and player's skill id 44451's cooldown is less than 250mss and player's skill id 43074's cooldown is greater than 1500ms then return true

function Aweaver_api.GQwGUV()
	local p=Player
	if not p then return false end
	local t=Player:GetTarget()
	if p and p.incombat and p.health.percent>=75 then
		return true
	elseif p and not p.incombat and p:IsMoving() then
		return true
	elseif p and p.incombat and Aweaver_api.SpellCooldown(44405)>500 and p.buffs and p.buffs[718] and p.buffs[5587] then
		return true
	end
	return false
end
--declare p as player, if not player then return false, retrieve target's info, if player is combat and player's health is greater than or equal to 75 then return true and end there, else if player not in combat and player is moving then return true and end there, else if player is in combat and player's skill id 44405's cooldown is greater than 500ms and player's buff ids are 718 and  5587 then return true

function Aweaver_api.tzQOCY()
	if not BehaviorManager:Running() then return false end
	local p=Player
	if (p) then
		local t=Player:GetTarget()
		local transid=p:GetTransformID()
		local lasttransid=p:GetLastTransformID()
		if (t and t.distance and t.distance<200 and transid and type(transid)=="number" and transid==3 and lasttransid and type(lasttransid)=="number" and lasttransid~=3 and Aweaver_api.SpellCooldown(43803)<250 and Aweaver_api.SpellCooldown(43074)>1500) then
			return true
		end
	end
	return false
end
--if bot mode is not running then return false, declare p as player, if player then retrieve target's info, retrieve player's transformID, retrieve last transformID, if target's distance is less than 200 and transformID is equal to a type of number, and transformID is air and last transformID is equal to a type of number, and that last transformID is not equal to air and  player's skill id 43803 is less than 250ms and player's skill id 43074 is greater than 1500ms then return true end

function Aweaver_api.EYhAiw()
	local p=Player
	if not p then return false end
	local t=Player:GetTarget()
	if p and p.buffs then
		if ((p.buffs[721] or p.buffs[722]) and p:IsMoving()) or p.buffs[727] then return true end
		local count=0
		if p.buffs[737] then count=count+(p.buffs[737].stacks*1.5) end
		if p.buffs[861] then count=count+p.buffs[861].stacks*1.5 end
		if p.buffs[723] then count=count+p.buffs[723].stacks end
		if p.buffs[19426] then count=count+p.buffs[19426].stacks end
		if count>=4 then
			return true
		end
		if p.buffs[736] then count=count+p.buffs[736].stacks end
		if count>=5 then
			return true
		end
		count=0
		if p.buffs[738] then count=count+p.buffs[738].stacks end
		if count>=6 then
			return true
		end
	end
	return false
end
--setting p to declared as Player, if not player then don't run, retrieve target's info, if player and player has buffs then if player has the list of buffs 721(), 722() and player is moving OR another set of parameters is player has buff 727() then retrun true and end here.  We wil now set count to be equal to 0. If player has buff 737() then we will declare count to be count plus player's current buff and its list of stacks times 1.5 then end there. This goes on and on depending on what buff is on player. If the count is greater then or equal to 4 then return true and end there. If player's buff is 736() then declare count as count plus player's buff's stacks and end there, if count is greater than or equal to 5 then return true and end here. if there are not account anymore declare count as 0. if player has buff 738() then declare count as count plus player's buff's stacks and end there, if count is greather than or equal to 6 then return true, end. if nothing is true then return false by end. 

function Aweaver_api.vuNfsI()
	local p=Player
	if not p then return false end
	local t=Player:GetTarget()
	if p.castinfo.skillid~=40170 then return true end
	return false
end
----delcare p is player, if not player then return false, retrieve target's info, if player's casted skill id is not equal to 40170 then return true and end, else false

function Aweaver_api.ArdshQ(id)
	return Aweaver_api.vuNfsI()
end
--we are creating a constructive method that calls method vuNfsI (method says if player's casted skill id is not equal to 40170 then return true and end, else false)

function Aweaver_api.NIeiE()
	return true
end
--construtive method for NIeiE (why? will ask later)

function Aweaver_api.NIeiE1()
	if Aweaver_api.HaveStun() then
		return true
	end
	return false
end
--creating a constructor method that calls for method HaveStun (--declare a temporary variable, declare count instantiated at 0, for weapon skills in slots 5-9 retrieve spell info's cooldown, if temporary variable for all slots 5-9 weapons skill is greater than 0 then declare count as count plus 1 and end. if count is equal to 5 or Player has buff 872 then return true.) and if true then return true end

function Aweaver_api.HaveStun()
	--[[local tmp
	for i=5,9 do
		tmp=Player:GetSpellInfo(i).cooldown
		if tmp and type(tmp)=="number" and tmp<1000 then
			return false
		end
	end
	return true]]
	local tmp
	local count=0
	for i=5,9 do
		tmp=Player:GetSpellInfo(i).cooldown
		if tmp and tmp>0 then
			count=count+1
		end
	end
	--d("CDs: "..count)
	if count==5 or (Player.buffs and Player.buffs[872]) then --All weapon skills on cooldown or the 872 buff what the stun is
		return true
	end
	return false
end
--declare a temporary variable, declare count instantiated at 0, for weapon skills in slots 5-9 retrieve spell info's cooldown, if temporary variable for all slots 5-9 weapons skill is greater than 0 then declare count as count plus 1 and end. if count is equal to 5 or Player has buff 872 then return true.

function Aweaver_api.YVTSdPRF(tmp)
	local p=Player
	if not p then return false end
	local t=Player:GetTarget()
	if p and p.buffs[10269] then return false end	
	if not tmp then tmp=t end
	if (tmp ~= nil and tmp.buffs ~= nil) then
		local evades = { 40408, 10335 }
		local ignoreAttacks = { 9255, 5863, 787, 883, 5667, 10243, 27737, 21816, 43949 }
		local blockAttacks = { 9123, 756, 743 }
		local combat_skills = {
			block = {
				[29288] = true,
				[28262] = true,
				[14507] = true,
				[14400] = true,
				[14362] = true,
				[6054]  = true,
				[29840] = true,
				[12522] = true,
				[10276] = true,
				[10280] = true,
				[30769] = true,
				[29649] = true,
				[9102]  = true,
				[30661] = true,
			},
			evade = { 
				[27976] = true,
				[28978] = true,
				[26699] = true,
				[14395] = true,
				[14447] = true,
				[30665] = true,
				[12482] = true,
				[12488] = true,
				[12517] = true,
				[12481] = true,
				[12478] = true,
				[12521] = true,
				[31535] = true,
				[13006] = true,
				[13083] = true,
				[13016] = true,
				[13032] = true,
				[30520] = true,
				[30597] = true,
				[5680]  = true,
				[5644]  = true, 
				[5687]  = true,
				[44405] = true,
				[40709] = true,
				[10334] = true,
				[43761] = true,
				[13021] = true,
				[29209] = true,
				[12494] = true,
				[45142] = true,
				[14516] = true,
				[13035] = true,
				[43064] = true,
				[45746] = true,
				[5717]  = true,
				[5697]  = true,
				[42330] = true,
				[42181] = true,
				[46018] = true,
			}
		}
		local combat_buffs = {
			block = {
				[9123]  = true,
				[5640]  = true,
				[34256] = true,
			},
			nodmg = { 
				[883]   = true,
				[787]   = true,
			},
			evade = {
				[40408] = true,
				[13134] = true,
				[5543]  = true,
				[5667]  = true,
				[5863]  = true,
				[9255]  = true,
				[10243] = true,
			}
		}
		for _, v in pairs(table.merge(evades,table.merge(ignoreAttacks,blockAttacks,combat_buffs,combat_skills))) do
			if (tmp.buffs[v] ~= nil) then
				return false
			end
		end
	end
	return true
end
--we declare p as player, retrieve target's info, if player has buff id 10269,then return false and end, if not temporary then declare temporary as t, if temporary is not equal nil and temporary buffs are somwhat nil, then create list of categories that create lists of skill ids declared to boolean parameters, and for lists merge them into one table, and if temporary buffs is not equal nil then return false else it will just stop if something matches and return true
