Timer = Class {}

local STATES = {STARTED = 0, PAUSED = 1, FINISHED = 2}

function Timer:init(maxTime)
    self.m_current = maxTime
    self.m_max = maxTime
    self.m_state = STATES.FINISHED
end

function Timer:update(dt)
    if (self.m_state == STATES.STARTED) then
        print(self.m_current)
        self.m_current = math.max(0, self.m_current - dt)
    end

    if (self.m_current == 0) then self:setState("finish") end
end

function Timer:start() self.m_state = STATES.STARTED end
function Timer:pause() self.m_state = STATES.PAUSED end
function Timer:reset() self.m_current = self.m_max end
function Timer:finished() return (self.m_state == STATES.FINISHED) and true or false end

function Timer:setState(stateName)
    if (stateName == "start") then self:start() end
    if (stateName == "pause") then self:pause() end
    if (stateName == "finish") then 
        self:reset()
        self.m_state = STATES.FINISHED
    end
end