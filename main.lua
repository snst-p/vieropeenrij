require "checkWin"

function love.load()

	-- door speler laten bepalen at some point
	bord = {
		{0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0},
	}

	turn = 1

	love.graphics.setBackgroundColor(0.5, 0.5, 0.5)


end

win = 0;

function love.keypressed(key)
	x = tonumber(key)
	if x ~= nil then 
		for i = 6, 1, -1 do 
			if x > 0 and x < 8 then 
				if bord[x][i] == 0 then 
					bord[x][i] = turn
					
					if turn == 1 then 
						turn = 2 
					else 
						turn = 1 
					end 


					diaWin(bord)
					verticalWin(bord)
					horizontalWin(bord)


					return
				end 
			end
		end
	end
end

function love.draw()
	--[[for k, v in pairs(bord) do
		x = 0 + (k-1) * 20
	  for l, w in pairs(bord[k]) do 
	  	love.graphics.print(w, x, 0 + (l-1) * 20)
	  end
	end]]

	drawBoard()
	drawWin()
end

function drawWin()
	if win == 1 then
		love.graphics.print( "blauw wint", 230, 500, 0)
	elseif win == 2 then
		love.graphics.print( "rood wint", 230, 500)
	end
end

function drawBoard()
	for x, v in pairs(bord) do 
		for y, w in pairs(bord[x]) do 
			if w == 1 then love.graphics.setColor(0, 0, 1) end
			if w == 2 then love.graphics.setColor(1, 0, 0) end
			if w == 0 then love.graphics.setColor(1, 1, 1, 1) end
			love.graphics.rectangle('fill', x * 60, y * 60, 50, 50)
		end
	end
end