-- parametros globais
screen_width, screen_height = canvas:attrSize()
grid = screen_width/32

local menu_itens = 9

-- dofile("lib_tables.lua")

--tab_acervo = tabelaMulherese(leiaTabela("media/tbl_episodios.txt"))

local menu_table = { "Mulhere-se", "Informe-se", "Mulheres Idosas","Mulheres Negras", "Mulheres em situação de rua", "Mulheres Encarceradas","Mulheres Deficientes", "Mulheres Usuárias da saúde mental", "Mulheres Lésbicas", "Mulheres Trans", "Mulheres Prostitutas", "Mulheres Refugiadas", "Mulheres do campo", "Mulheres Quilombolas", "Mulheres Jovens"}

MainMenu = { pos = 1, limit=#menu_table, pad=30, list=menu_table, debug=false, settings=false }
Text = { pos = 1, page=1, list=menu_table, first=false }

--MenuAcervo = {pos = 1, limit=26, pad=30, list=tab_acervo }

dofile("lib_menu.lua")
dofile("lib_text.lua")

--dofile("lib_acervo.lua")

evento = {
  class = 'ncl',
  type  = 'attribution',
  name  = 'propriedade'
}


-- start 
m=MainMenu:new{}
m:draw(menu_itens)

t=Text:new{}
t:draw(m.pos)

-- s=MenuAcervo:new{}
-- s:draw(itens)

function handler (evt)
  if (evt.class == 'key' and evt.type == 'press') then
    if evt.key == "CURSOR_LEFT" then
      m.pos=m:shift(m.pos,-1)
      t.page=1
      m:draw(menu_itens)
      t:draw(m.pos)
    elseif evt.key == "CURSOR_RIGHT" then
      m.pos=m:shift(m.pos,1)
      t.page=1
      m:draw(menu_itens)
      t:draw(m.pos)
    elseif evt.key == "CURSOR_UP" then

      t:draw(m.pos,1)
    elseif evt.key == "CURSOR_DOWN" then
      
      t:draw(m.pos,-1)
--    elseif evt.key == "ENTER" then
      --t:draw(m.pos)
-- easter egg
    elseif evt.key == "BLUE" then
      dofile("lib_easter.lua")
      for i=1, 100,1 do
        event.timer(1000,easter)
      end
    elseif evt.key == "RED" then
      m:settings()
    end
  end
end
event.register(handler)
