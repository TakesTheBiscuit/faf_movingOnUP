do
    local oldReceiveChat = ReceiveChat
    local forkedAnimRunning = false
    local textPrinter =
        import('/mods/faf_movingOnUP/lib/TextPrinter.lua').newInstance()
    local asciiMessages =
        import('/mods/faf_movingOnUP/lib/AsciiMessages.lua').newInstance(
            textPrinter)

    function ReceiveChat(sender, msg)
        oldReceiveChat(sender, msg)

        local bants = {
            'Jus who do you think you are?',
            'Take it like a man baby',
            'Movin on up',
            'Time to break free',
            'They brag a man has walked in space',
            'Movin on up, movin on up, movin on up'
        }
        -- Choose one of these at random
        -- they do not map text to sound because no one cares
        local bantsClips = {'up1', 'up2', 'up2', 'up3-goneTooFar', 'up4-upupup', 'up3-goneTooFar' }

        local rng = Random(1, 6)

        if msg.text == 'Starting T2' or msg.text == 'Starting T3' then
            print(bants[rng])
            PlaySound(Sound({Bank = 'upSoundBank', Cue = bantsClips[rng]}))
            LOG('Moving on up: Forking thread to spam chat')
            asciiMessages.startDisplay()
        end

    end

end
