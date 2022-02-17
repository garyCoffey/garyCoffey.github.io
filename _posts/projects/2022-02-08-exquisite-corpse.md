---
layout: post
title: "Exquisite Corpse"
description: A collaborative art contribution app where you draw a section of a creature (head, torso, or legs) which, once completed, can be viewed as a whole with the contributions of two other members.
categories: projects
img: /images/exquisite-corpse/dougFunny.png
alt: sketch of doug Funny looking character
---
#### Exquisite Corpse

This project was a group effort completed at the end of my time in a coding bootcamp. The [project is hosted](https://exquisite-corpse-cp.herokuapp.com/), but at the time of this writing it seems like some of the pages are currently broken. On the brightside, you can see the supposed to be easter egg of what happens when a 500 internal server error occurs (also recommend going to `/gibberish` to see the 404).

#### Technologies

This project has a Rails backend, React frontend, and hosting is on Heroku. It also uses some 3rd part packages for the drawing features. 

The idea behind the game is that 3 different players will complete 1 piece of a drawing (either head/torso/legs) without seeing the other 2 pieces until the entire drawing is complete. Like a Frankenstein type creature. It was really cool and actually presented some pretty advanced issues with game play. Issues like the players being presented the same game on 2 different frontends allowing 1 player to effectively erase the others work. We also had to think about issues where someone would start the torso portion but never submit, meaning the drawing would be lost forever (potentially very upsetting if someone spent a lot of time on their portion). We only had 1 week to get this project fully completed as well which was difficult with it being the first project anyone in my group had worked on collaboratively before.

I looked into what I completed for this group project. I remember working heavily on the backend database/controller as well as building out the infrastuctre for the app (hosting/heroku settings). Below are some of my prs from the project (if nothing else I have come a long way with my pr naming skills):

Backend PRs:

![Backend PRs](/images/exquisite-corpse/be-prs.png)

Frontend PRs:

![Frontend PRs](/images/exquisite-corpse/fe-prs.png)

