Pastebin code: hf8rYn3i (https://pastebin.com/hf8rYn3i)

To download this program, type "pastebin get hf8rYn3i reactor" into your computercraft computer. 
Ensure you have a 3x3 of monitors attached and that you have an extreme reactors reactor as well as a power storage device attached to your network (with modems). 

If you are not using draconics as your power storage device, you will have to change "storage = peripheral.find("draconic_rf_storage")" on line 14 to 
"storage = peripheral.find("<name of your storage device")"

That should be the only change you need to make. Once that is done all you have to do is run reactor and you should be all set to go.
If you want your computer to run the program when your server starts, or when the computer reboots (to ensure that it is always running), make sure to enter
"edit startup"
then type into the computer "shell.run("reactor")"
After this is done, make sure to save the file and exit.
Then hold ctrl + R to reboot the computer and your program should start running.
