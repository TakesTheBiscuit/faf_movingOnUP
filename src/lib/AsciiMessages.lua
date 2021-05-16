newInstance = function(textPrinter)
    local FRAME_DURATION = 1

    local function newPrinter(durationInSeconds)
        local textOptions = {
            color = "ffb4ffd4",
            duration = durationInSeconds,
            location = "leftcenter"
        }
       
        local this = {}

        this.print = function(text)
            textPrinter.print(string.rep(" ", 1) .. text, textOptions)
        end

        this.printBlankLine = function()
            textPrinter.printBlankLine(textOptions)
        end

        return this
    end

    local function showAsciiFrames(printer)
        -- whitespace in faf doesnt seem to act like a sane beast at all
        local frame1 = {
            '     /$           /$$    /$$ /$$$$$$$            /$   ',
            '   /$$$        | $$  |  $$| $$__  $$           /$$$  ',
            '  /$$ $$      | $$  |  $$| $$    \\ $$         /$$ $$ ',
            ' /$$\\  $$     | $$  |  $$| $$$$$$/         /$$\\   $$',
            '|__/ \\__/     | $$  |  $$| $$___/          |__/  \\__/',
            '                  | $$   | $$| $$                     ',
            '                  | $$$$$/|  $$                     ',
            '                   \\______/ |_/                     '
        }
        local frame2 = {
            '      ',
            '      ',
            '      ',
            '      ',
            '      ',
            '      ',
            '      ',
            '      '
        }
        -- the best blink effect i could do right now
        local frames = {frame1, frame2, frame1}
        
        -- for now we just want three frames
        
        LOG('Moving on up: ASCII Frames loaded')
        LOG(frames)
    

        for i = 1, table.getn(frames) do
            local frameLines = frames[i]
            
            for x = 1, table.getn(frameLines) do
                LOG(frameLines[x])
                textPrinter.print(string.rep(" ", 1) .. frameLines[x], {
                    color = "ffafdde4",
                    duration = 0.1,
                    location = "center",
                    size = 35
                })
            end
            WaitSeconds(FRAME_DURATION + 2)
        end

    end

    return {
        startDisplay = function()
            ForkThread(function()
                showAsciiFrames(newPrinter(FRAME_DURATION))
            end)
        end
    }
end
