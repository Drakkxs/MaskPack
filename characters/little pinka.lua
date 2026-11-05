local lockDance = false

function onUpdatePost(elapsed)
    if keyPressed('up') and not lockDance then
        local curAni = getProperty('boyfriend.animation.name')
        if curAni == 'danceLeft' or curAni == 'danceRight' then
            playAnim('boyfriend', 'hey', true)
            setProperty('boyfriend.isSpecialAnim', true)
            lockDance = true
            runTimer('unlockDance', 1, 1)
        end
    end
end

function onTimerCompleted(name)
    if name == 'unlockDance' then
        lockDance = false
        setProperty('boyfriend.isSpecialAnim', false)
    end
end