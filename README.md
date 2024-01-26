# Enhancing your Pal Adventure: Auto Cooking, Mining, Chopping, and More!

<img src="./img/palworld.png" alt="MarineGEO circle logo" />

Yesterday afternoon, I embarked on an exciting journey into the captivating realm of Palworld, and before i knew it, as i stole a glance at the clock, it was already 8pm. I hadn't checked off a single item on my to-do list all day. While fully engrossed in the game, a brilliant idea struck me - why not streamline my time efficiency by automating tedious tasks?
Now, i know what you're thinking, as the game progresses, your pals - creatures reminiscent of Pokémon - typically take on these monotonous tasks. However, there's a chance that you might lack the suitable pals for specific tasks, especially at the beginning of your journey. Imagine the hassle of preparing 50 berries, enduring the process one painstaking berry at a time.

Enter AutoHotKey (AHK) - an open-source custom scripting language that allows you to automate tasks by sending simulated keystrokes and mouse clicks. With just a few lines of code, you can easily automate repetitive actions, including holding down keys.
Let's build the script together,
Cooking with ease:

First, it's essential to establish that this script operates conditionally, specifically when the active window bears the title Pal. You only want the script to run when you're playing Palworld.
This is done using this line of code:

```
#IfWinActive, Pal
```

Next, let's set up a hotkey, ensuring that the following block of code is executed only when the user presses the specified key.
In our case, the key combination Ctrl + f:

```
#IfWinActive, Pal

; Define a hotkey: Ctrl + f
^f:: 
```

Note, we can add comments to our script using a semicolon, anything following the semicolon is ignored by the script.

When the key combination Ctrl + f is pressed, we want to control the toggle variable, ToggleF. This variable can hold values of either true or false, using the assignment operator ' := '. The exclamation mark later in the expression is known as the logical NOT operator, when applied to a Boolean value, it negates it, similar to a light switch - turning off if its on, and turning on if it's off, as illustrated below.

```
#IfWinActive, Pal

^f:: 
    ToggleF := !ToggleF
```

This is where the magic happens, triggered by a keypress event using the send command. The %ToggleF% is a conditional expression that, based on the state of ToggleF, can result in an empty string or the actual value of ToggleF. This is followed by { f down  }, which replicates the event of pressing and holding down the f key physically.
Finally, the return marks the end of the hotkey definition. It's like saying, "we're done defining what happens when Ctrl + f is pressed in the Pal window".



```
#IfWinActive, Pal
^f:: 
    ToggleF := !ToggleF
    Send, %ToggleF%{ f down }
return
```


No more tedious berry-by-berry cooking - just toggle and enjoy the show!

2. Mining and chopping on autopilot
We can add a new section in our script using an alterative hotkey; in this case, we can opt for a shift + left mouse click. This triggers the ClickAndHold function.


```
#IfWinActive, Pal

; 1. Cooking with ease

^f:: 
    ToggleF := !ToggleF
    Send, %ToggleF%{ f down }
return

; 2. Mining and chopping on autopilot

; Define a hotkey: shift + left mouse click
+LButton:: 
    ClickAndHold()      ; Function
    return

```

The ClickAndHold function is responsible for simulating a continuous click. It presses the mouse button down using Click down, holds it for 10 seconds with Sleep 10000, releases the click with Click up, sleeps for 5 seconds, and then recursively calls itself to repeat the process, as shown below.
Finally, we want to reset the context sensitivity, ensuring that the subsequent hotkeys are not restricted to a specific window title.

```
#IfWinActive, Pal

; 1. Cooking with ease

^f:: 
    ToggleF := !ToggleF
    Send, %ToggleF%{ f down }
return

; 2. Mining and chopping on autopilot

+LButton:: 
    ClickAndHold()
    return

#IfWinActive

ClickAndHold() 
{
    Click down
    Sleep 10000          
    Click up
    Sleep 5000           
    ClickAndHold()       
}    
```

Say goodbye to the manual grind of resource collection! Free yourself from worries about shortages of wood and stone, allowing you to direct your focus toward exploration and the crafting of extraordinary creations.

To sum it up, weaving this AutoHotKey script into your Palworld experience not only saves precious time but also adds an extra layer of enjoyment. With the convenient cooking toggle and the smooth automation of mining and chopping, your gaming efficiency gets a significant boost. Give it a shot and let the magic of automation unfold seamlessly in your Palworld adventure!