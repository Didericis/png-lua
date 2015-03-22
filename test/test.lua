local pngImage = require("../png")
local testVals = {
    example1 = {
        path = "test/Example1.png",
        pixelCoords = { x = 10, y = 10},
        pixelColor = "R: 131, G: 116, B: 102, A: 255",
        width = 50,
        height = 54,
        depth = 8
    },
    example2 = {
        path = "test/Example2.png",
        pixelCoords = { x = 10, y = 10},
        pixelColor = "R: 123, G: 132, B: 129, A: 255",
        width = 300,
        height = 300,
        depth = 8
    }
}

function printProg(line, totalLine)
	-- print(line .. " of " .. totalLine)
end

local function getPixelStr(pixel)
    return string.format("R: %d, G: %d, B: %d, A: %d", pixel.R, pixel.G, pixel.B, pixel.A)
end

local function runTests(testVal)
    print("-----"..testVal.path.."-----")
    local img = pngImage(testVal.path, printProg)
    local pixel = img:getPixel(testVal.pixelCoords.x, testVal.pixelCoords.y)

    print("-----Test-----")
    if (testVal.width ~= img.width) then
        error("Test failed: width")
    elseif (testVal.height ~= img.height) then
        error("Test failed: height")
    elseif (testVal.depth ~= img.depth) then
        error("Test failed: depth")
    elseif (testVal.pixelColor ~= getPixelStr(pixel)) then
        error("Test failed: color")
    else
        print("Tests passed!")
    end
end

for k, v in pairs(testVals) do
    runTests(v)
end

-- DEC_HEX(pixelData.R)*0x10000 + DEC_HEX(pixelData.G)*0x100 + DEC_HEX(pixelData.B)