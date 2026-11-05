local dadAnchorPoint = {0, 0};
local legPosY = {13, 7, -3, -1, -1, 2, 7, 9, 7, 2, 0, 0, 3, 1, 3, 7, 13};

function onCreatePost()
makeAnimatedLuaSprite('dadlegs', 'characters/bullock leg', 0, 0)
addAnimationByIndices('dadlegs', 'danceLeft', "leg", '0,1,2,3,4,5,6,7,8,9,10', 25);
addAnimationByIndices('dadlegs', 'danceRight', "leg", '10,11,12,13,14,15,16,17,18,19,20,21', 25);
addOffset('dadlegs', 'danceLeft', 50, -550);
addOffset('dadlegs', 'danceRight', 50, -550);
setGraphicSize('dadlegs',Std.int(getProperty('dadlegs.width') * 1),nil,false)
updateHitbox('dadlegs');
addLuaSprite('dadlegs', false)
setObjectOrder('dadlegs', getObjectOrder('dadGroup')-1)
playAnim('dadlegs','danceRight')

setProperty('dadlegs.x',getProperty('dad.x'))
setProperty('dadlegs.y',getProperty('dad.y'))

dadAnchorPoint[2] = getProperty('boyfriend.y');
end

function onUpdatePost()
if getProperty('dad.curCharacter') == 'bullock run' then
setProperty('dad.y',dadAnchorPoint[2] + legPosY[getProperty('dadlegs.animation.curAnim.curFrame')+1])
end
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
playAnim('dadlegs', 'danceRight')
else
playAnim('dadlegs', 'danceLeft')
end
end
end

Std = {};
Std_Std = Std;
function Std.int( x, y ) -- Fix for tail-call generator bug, TODO fix
	local z = y or x
	return z > 0 and math.floor(z) or math.ceil(z)
end