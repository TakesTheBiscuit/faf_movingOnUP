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
            'Jus who do you think you are?', 'Take it like a man baby',
            'Movin on up', 'Time to break free',
            'They brag a man has walked in space',
            'Movin on up, movin on up, movin on up'
        }
        local bantsClips = {'up1', 'up2', 'up1', 'up2', 'up1', 'up2'}

        local rng = Random(1, 6)

        if msg.text == 'Starting T2' or msg.text == 'Starting T3' then
            print(bants[rng])
            PlaySound(Sound({Bank = 'upSoundBank', Cue = bantsClips[rng]}))

            LOG('Moving on up: Chatting to alll to say moving on up')

            SessionSendChatMessage({
                to = 'allies',
                Chat = true,
                text = "MOVING ON UP"
            })

            LOG(
                'Moving on up: Finished calling moving on up chat msg to oldreceivechat method')

            LOG('Moving on up: Forking thread to spam chat')
            asciiMessages.startDisplay()
        end

    end

end
