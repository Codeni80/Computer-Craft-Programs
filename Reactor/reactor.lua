--Codeni's Extreme reactors control code.
--This code will automatically turn on and turn off an extreme reactors 
--reactor based on how much energy you have stored to ensure that you are
--not wasting resources or any of that sweet sweet power. 
--This is very a very basic control that is perfectly functional
--The only thing that it is missing currently to be usable for most people
--is that I have not added any buttons for manual turn off and turn on.
--With that being said;
--WIP:
--Manual control buttons (manual on/off)
--Manual turn on and turn off levels (allowing you to change turnOffAt and turnOnAt within the program itself,
--instead of having to alter the code to do so.

storage = peripheral.find("draconic_rf_storage")
monitor = peripheral.find("monitor")
reactor = peripheral.find("BigReactors-Reactor")

local energy = 0
local stored = 0
local maxE = 0
local energyPercent = 0
local turnOnAt = 25
local turnOffAt = 95

--Turning off the reactor
function turn_off()
    reactor.setActive(false)
end

--Turning on the reactor
function turn_on()
    reactor.setActive(true)
end

--Borrowed from Direwolf20's reactor code, formats values
function comma_value(amount)
    local formatted = amount
    local swap = false
    if formatted < 0 then
        formatted = formatted - 1
        swap = true
    end
    while true do
        formatted, k = string.gsub(formatted, "^(%d+)(%d%d%d)", '%1,%2')
        if k == 0 then
            break
        end
    end
    if swap then
        formatted = formatted
    end
    return formatted
end

--Gets percentage of how full the energy cube is
function checkLevel()
    stored = storage.getEnergyStored()
    maxE = storage.getMaxEnergyStored()
    energyPercent = math.floor((stored/maxE)*100)
    tempEnergy = storage.getEnergyStored()
    sleep(0.1)
    energy = (storage.getEnergyStored()-tempEnergy)/2
end

--Displays how much energy is being used/how much energy is being made
--to the attached monitor
function displayUse()
    monitor.clear()
    monitor.setCursorPos(1,1)
    monitor.write("Energy Use: ")
    if energy < 0 then
        monitor.setTextColor(colors.red)
    else
        monitor.setTextColor(colors.green)
    end
    monitor.setCursorPos(1,2)
    monitor.write(comma_value(math.floor(energy)).. "RF/t")
    monitor.setTextColor(colors.white)
    monitor.setCursorPos(1,3)
    monitor.write("Energy Stored: ")
    monitor.setCursorPos(1,4)
    monitor.write(energyPercent .. "%")
end

--Displays the screen to the monitor
function displayScreen()
    checkLevel()
    displayUse()
end

--Main loop
while true do
    displayScreen()
    if energyPercent > turnOffAt then
        turn_off()
    end
    if energyPercent < turnOnAt then
        turn_on()
    end
end