
-- parametros globais
screen_width, screen_height = canvas:attrSize()

local menu_itens = 8
local menu_text = false
local menu = false

-- dofile("lib_tables.lua")

--tab_acervo = tabelaMulherese(leiaTabela("media/tbl_episodios.txt"))


local menu_table = { "Sobre", "info", "negras", "idosas", "de rua",
"encarceradas", "deficientes", "mental", "lesbicas", "trans", "prostitutas",
"refugiadas", "do campo", "quilombolas", "jovens"}

MainMenu = { pos = 1, limit=#menu_table, pad=30, list=menu_table }
Text = { pos = 1, list=menu_table, first=false }
--MenuAcervo = {pos = 1, limit=26, pad=30, list=tab_acervo }

dofile("lib_menu.lua")
dofile("lib_text.lua")

--dofile("lib_acervo.lua")

evento = {
  class = 'ncl',
  type  = 'attribution',
  name  = 'propriedade'
}

s=MainMenu:new{}
s:draw(menu_itens)

t=Text:new{}

-- s=MenuAcervo:new{}
-- s:draw(itens)

function handler (evt)
  if (evt.class == 'key' and evt.type == 'press') then
    if evt.key == "CURSOR_LEFT" then
      menu = true
      s.pos=s:shift(s.pos,-1)
      s:draw(menu_itens)
    elseif evt.key == "CURSOR_RIGHT" then
      menu = true
      s.pos=s:shift(s.pos,1)
      s:draw(menu_itens)
    elseif evt.key == "ENTER" then
      menu_text = true
      t:draw(s.pos)
    elseif evt.key == "RED" then
      dofile("lib_easter.lua")
      for i=1, 100,1 do
        event.timer(1000,easter)
      end
    end
  end
end
event.register(handler)
