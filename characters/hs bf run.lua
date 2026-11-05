local bfAnchorPoint = {0, 0};
local legPosY = {13, 7, -3, -1, -1, 2, 7, 9, 7, 2, 0, 0, 3, 1, 3, 7, 13};

function onCreatePost()
makeAnimatedLuaSprite('bfLegs', 'characters/hs bf run legs', 0, 0)
addAnimationByIndices('bfLegs', 'danceLeft', "run legs", '0,1,2,3,4,5,6,7,8,9', 30);
addAnimationByIndices('bfLegs', 'danceRight', "run legs", '10,11,12,13,14,15,16,17,18,19,20', 30);
addOffset('bfLegs', 'danceLeft', 220, -205);
addOffset('bfLegs', 'danceRight', 220, -205);
setGraphicSize('bfLegs',Std.int(getProperty('bfLegs.width') * 0.9),nil,false)
updateHitbox('bfLegs');
addLuaSprite('bfLegs', false)
setObjectOrder('bfLegs', getObjectOrder('boyfriendGroup')-1)
playAnim('bfLegs','danceRight')

makeAnimatedLuaSprite('bfLegsmiss', 'characters/hs bf run legs', 0, 0)
addAnimationByIndices('bfLegsmiss', 'danceLeft', "miss run legs", '11,12,13,14,15,16,17,18,19,20', 30);
addAnimationByIndices('bfLegsmiss', 'danceRight', "miss run legs", '1,2,3,4,5,6,7,8,9', 30);
addOffset('bfLegsmiss', 'danceLeft', 190, -205);
addOffset('bfLegsmiss', 'danceRight', 190, -205);
setGraphicSize('bfLegsmiss',Std.int(getProperty('bfLegsmiss.width') * 0.9),nil,false)
updateHitbox('bfLegsmiss');
addLuaSprite('bfLegsmiss', false)
setObjectOrder('bfLegsmiss', getObjectOrder('boyfriendGroup')-1)
playAnim('bfLegsmiss','danceRight')

setProperty('bfLegs.x',getProperty('boyfriend.x'))
setProperty('bfLegs.y',getProperty('boyfriend.y'))
setProperty('bfLegsmiss.x',getProperty('boyfriend.x'))
setProperty('bfLegsmiss.y',getProperty('boyfriend.y'))

bfAnchorPoint[2] = getProperty('boyfriend.y');
end

function onUpdatePost()
if stringEndsWith(getProperty('boyfriend.animation.curAnim.name'),'miss') then
setProperty('bfLegsmiss.alpha',1)
setProperty('bfLegs.alpha',0)
else
setProperty('bfLegsmiss.alpha',0)
setProperty('bfLegs.alpha',1)
end
setProperty('boyfriend.y',bfAnchorPoint[2] + legPosY[getProperty('bfLegs.animation.curAnim.curFrame')+1])
end

local danced = false;

function onBeatHit()
if curBeat % 1 == 0 then
if not danced then
danced = true;
else
danced = false;
end
if danced then
playAnim('bfLegs', 'danceRight')
playAnim('bfLegsmiss', 'danceRight')
else
playAnim('bfLegs', 'danceLeft')
playAnim('bfLegsmiss', 'danceLeft')
end
end
if curBeat % 1 == 0 then
if stringEndsWith(getProperty('boyfriend.animation.curAnim.name'),'miss') then
characterDance('bf')
end
end
end

Std = {};
Std_Std = Std;
function Std.int( x, y ) -- Fix for tail-call generator bug, TODO fix
	local z = y or x
	return z > 0 and math.floor(z) or math.ceil(z)
end