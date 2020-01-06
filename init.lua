local log = hs.logger.new('mspm', 'debug')

local mspm = {
    name = 'MicrosoftSurfacePrecisionMouse',
    version = '1',
    author = 'spoon16',
    homepage = 'github.com/spoon16/MicrosoftSurfacePrecisionMouse.spoon',
    license = 'https://opensource.org/licenses/MIT'
}

function mspm:init()
    log.i('init')

    overrideOtherMouseDown = hs.eventtap.new({ hs.eventtap.event.types.otherMouseDown }, function(e)
        local downMouseButton = e:getProperty(hs.eventtap.event.properties['mouseEventButtonNumber'])
        log.i('mouse down', downMouseButton);
        return false
    end):start()

    overrideOtherMouseUp = hs.eventtap.new({ hs.eventtap.event.types.otherMouseUp }, function(e)
        local upMouseButton = e:getProperty(hs.eventtap.event.properties['mouseEventButtonNumber'])
        log.i('mouse up', upMouseButton)
    
        if upMouseButton == 3 then
            log.i('keystroke', 'cmd-[')
            hs.eventtap.keyStroke({'command'}, '[')
            return true
        end
    
        if upMouseButton == 4 then
            log.i('keystroke', 'cmd-]')
            hs.eventtap.keyStroke({'command'}, ']')
            return true
        end
    
        return false
    end):start()
end

return mspm