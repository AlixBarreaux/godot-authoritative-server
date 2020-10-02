# godot-authoritative-server
A demo of a multiplayer game running between a server and multiple clients able to join at runtime.

# Introduction
Before you start anything, you must understand the structure of the project.
This project is divided in 2 different parts:

* SERVER: It is contained in the folder at the root at the repository in the folder named "authoritative_server_client"
* CLIENT: It is contained in the folder at the root at the repository in the folder named "authoritative_server_server"

# Running the server and connecting to it
* Method 1:
Obviously you can't connect to the server with a client if the server is not started.
That's why you must start the server at first. You can open project.godot in the server folder and execute it with godot and then just run the main scene.

In order to join th server, you can just run

* Method 2:
Export both projects and run the server executable only once, otherwise your port and your IP adress will be in use already and it will cause some issues while trying to create another server on the same machine. You may notice the grey window opening when you launch it. I will make a no gui version in a terminal/command line prompt later for optimization's sake.

Once the server is started, you can run the client executable. You can try to run it several times but you might get an error for the same reason explained just before for the server, I didn't test it myself though.

# NOTES:
* I didn't add a feature to modify the IP adress you want to connect to with the client nor did I make the server create itself with the IP adress of the machine. (be it internet or LAN) It is bound instead to the loopback adress which is 127.0.0.1 for now.
See: https://en.wikipedia.org/wiki/Localhost and https://en.wikipedia.org/wiki/Loopback

* I'm developping this project as I go and I'm learning at the same time, it'll take some time to get something up and running and I'm not responsible of anything you do with anything in this project. Please check the LICENSE file at the root of the respository.
