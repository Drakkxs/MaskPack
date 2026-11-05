function onUpdatePost()
if keyPressed('up') then
if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
playAnim('boyfriend','hey',true)
setProperty('boyfriend.specialAnim',true)
setProperty('boyfriend.heyTimer',0.6)
end
end
end