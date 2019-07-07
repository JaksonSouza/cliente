function init()
  connect(g_game, { onGameEnd = onGameEnd })
 -- ProtocolGame.registerExtendedOpcode(105, function(protocol, opcode, buffer)

    catchWindow = g_ui.displayUI('catch')
    catchWindow:hide()

    ProtocolGame.registerExtendedOpcode(51, function(protocol, opcode, buffer)
    catchWindow:show()
    --catchWindow:setImageSource(buffer)
    print(buffer)
    end)
end

function terminate()
  disconnect(g_game, { onGameEnd = onGameEnd })

  ProtocolGame.unregisterExtendedOpcode(51)
  catchWindow:destroy()
end

function onGameEnd()
  if catchWindow:isVisible() then
     catchWindow:hide()
  end
end
function hide()
  catchWindow:hide()
end