

--- Menu Acervo

function MenuAcervo:new (o)
   o = o or {}
   setmetatable(o, self)
   self.__index = self
   return o
end

function MenuAcervo:shift(x,v)
   -- not as num?
   if v == nil then v = 0 end
   if x + v < 1 then
      return x + v +self.limit
   elseif  x + v > self.limit  then
      return x + v - self.limit
   else
      return x+v
   end
end

function MenuAcervo:draw(t)
   canvas:attrColor('white')
   canvas:drawRect('fill', 0, 0, screen_width, screen_height )
   for i=1,t  do
      if i==1 then
	 self:draw_item(self:shift(self.pos-1,i),i,true)
      else
	 self:draw_item(self:shift(self.pos-1+i),i)
      end
   end
   canvas:flush()
end

function MenuAcervo:draw_item(t, slot, ativo)
   local padding = 80
   local item_h = 136
   local font_size = 22
   --canvas:clear( )
   --
   if ativo then
      canvas:attrColor(242,241,241,255)
      canvas:drawRect('fill', 2, padding*slot, screen_width, item_h )
      canvas:attrFont("vera", font_size,"bold")
      canvas:attrColor(40,18,67,255)
   else
      canvas:attrColor(153,132,186,255)
      canvas:drawRect('fill', 2, padding*slot, screen_width-10, item_h )
      canvas:attrColor(40,18,67,255)
      canvas:drawRect('fill', screen_width-10, padding*slot, screen_width, item_h )
      canvas:attrFont("vera", font_size,"bold")
      canvas:attrColor(242,241,241,255)
   end
--   canvas:drawText(8, padding*slot+24,  t ..  " - " .. self.list[t]["nome"]  )  canvas:flush()
end

