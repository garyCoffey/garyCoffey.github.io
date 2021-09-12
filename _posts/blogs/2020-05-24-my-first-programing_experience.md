---
layout: post
title: "My First Programming Experience"
categories: blogs
---
My first introduction to code was during my time in the Air Force.

While working as a *Linux System Admin*, my colleague decided to write a script to make our jobs easier. One of our tasks involved comparing flight data figures to set limits. If the data exceeded the limits in some way the 💣er would possibly have to receive special maintenance.

This was a terrible task to do manually as it was difficult to retrieve all of the data, and then you would have to do some complicated math for certain parts. It was a perfect task to teach a computer to do though. My coworker (who now works for Facebook) noticed that and went to work. In his spare time he developed a Pearl script that would do the analyses for us. It was awesome and super simple to use. We actually worked closely with the developers of the application we used to read the flight data and they even incorporated directly into the application so it was just a button press away. Everything was working great!

....Fast forward a year later. At this time my coworker and got out of the Air Force and was working as a contractor building his own career skills. Main point was that he was gone and the flight data application was receiving a software update. Although the new update was great, it broke this very important in-house tool. We could no longer easily analyze the data. This was a problem that I was told to solve. At this point, I still had the belief that software was not something mere mortals could understand and work on. Only super geniuses could do this sort of thing. All the same, I figured I would give it a shot and I opened up the scripting code.

Looking at this file full of what seemed at first to be complete gibberish, I thought... This will be impossible.

![Always Sunny Charlie Day looking confused](https://media.giphy.com/media/kyhw6BlG5ip2YEHliO/giphy.gif)

But I was in the Air Force and this mission needed to be accomplished (the new people on the team didn't even know the old way of doing this task). So I got to work and started reading. Surprisingly I picked up on a key detail. Within the first line of code, I seen a familiar file name. See, one of the steps of getting the software to work was first to export some data and save it to your desktop with a specific file name/extension. I seen this same filename here in the code. Then I realized that the new application had changed the default file extension for these files to something else. Out of sheer curiosity, I changed the script to look for the file with the new extension. And, to my surprise, this fixed the issue.

![Star Wars A New Hope](https://media.giphy.com/media/3o84sqj1jnLWlbZhn2/giphy.gif)

This is when I started thinking, hey this is something I can do. Granted, this fix was mostly luck and was a super easy change. But this is the day that really set me on the path to become a software engineer. I felt pretty awesome that I was able to solve a serious real world problem and save the rest of my team from having to hit the books and remember how to do some crazy math analyses.
