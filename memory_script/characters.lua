base_dir = "C:\\apps\\speedrun\\FFX\\"

gil_addr = 0xD307D8
gil_filename = "gil.txt"

time_addr = 0xD2CB4C
time_filename = "time.txt"

hp_addr = 0xD32078
mp_addr = 0xD3207C
slvl_addr = 0xD32097
tslvl_addr = 0xD32098
function char_calc(addr, number)
	return addr + (0x94 * number)
end
local character_names = {"tidus", "yuna", "auron", "kimahri", "wakka", "lulu", "rikku", "seymour_guado"}
function char_base_file(number)
	return base_dir .. character_names[number + 1] .. ".txt"
end
function char_file(file, number)
	return base_dir .. character_names[number + 1] .. "/" .. file .. ".txt"
end

char_count = 0