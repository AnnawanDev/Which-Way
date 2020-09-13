# Which Way?
Which Way? is an app made as part of the OSU Hackathon project, Sept 10-13th.


### OSU Hackathon
OSU Hackathon Slack: http://osu-hackathon.slack.com

Hacathon page on DevPost: https://beaverhacks-fall-2020.devpost.com/

The focus on the hackathon is "health" which I took as promoting a healthy lifestyle by encouraging fitness and getting outdoors.  This app addresses the issue of not being able to find the golf flag (or pin) while on a course.  Sometimes there are hills, trees, or other obstacles that block view of where exactly the pin is located and you as the player don't know where to hit the ball.  This helps the golfer orient toward the flag.

### Team
* Annawan Dev (aka Ed Wied)


### Technologies used
* Swift


### App overview
The app is divided into three sections:
* hole finder
* about
* admin screen

##### Hole Finder
The user chooses a course, followed by a hole, then they are taken to a page where they can see the distance to the pin and get a 3d orientation on where to hit toward.

In practice, the holes would be maintained by a golf course admin who would mark the GPS locations of the holes using the app.

A 3D marker is placed in the augmented reality view, but the actual orientation is not updated.  This was unfinished.

###### About
The about us page simply presents information about the app

##### Admin Screen
The admin screen allows an admin to add/update hole GPS positions.  Golf courses regularly change the hole position on the green, so this would enable an admin to update GPS locations over time.


### Demo
* TBD


### Technologies learned
This hackathon was a great opportunity for some deep diving on technologies.  I focused on the following areas:
* Core Location for iOS
* ARKit for iOS


### Future direction
* Hole information either persisted locally or using API to load and store off-app (or both).
* Move away from using singleton pattern for sharing data - useful but can be difficult to maintain/scale, possible source of bugs later.
* Admin authentication off-app (must).
* Admin web site to add/manage admin users
* Golf course choices are for show only.  The hole data is not linked to a particular course.  Need to tie different hold GPS data to different courses.  Need back-end API to save data.
* Add MapKit to give overview view of where player is in relation to pin


### Challenges:
* Can overlap button on top of ARSceneView, but buttons weren't responding to touch events - need to move toward making ARSceneView full screen.  
* Getting the orientation to destination - major purpose of the app
* (Annoyance)Using AR means you can't use the simulator and so you have to constantly build to device to test


### Feature Rundown:
* Get device location: :white_check_mark:
* Ability to add destination GPS locations: :white_check_mark:
* Ability to tell direction from user to destination: :white_check_mark:
* Ability to add 3D Augmented Reality marker on screen: :white_check_mark:
* Ability to render and update AR marker toward destination: :x:
* Ability to persist/retrieve data remotely: :x:


### Final thoughts
Adding CoreLocation was easy.  I found it pretty straightforward to get the current device location.  I dived into some [AR (augmented reality) tutorials on Udemy](https://www.udemy.com/course/ios-augmented-reality-the-complete-course-on-arkit/) and found it a lot easier than I thought to add AR.  The real tricky part was getting the bearing to the target location and then constantly updating that visually in the screen.  That'll have to be a future todo in fleshing out this project post-hackathon.  The other thought is that the data is not persisted, so while it's fine for a hackathon, you need a real back-end system to store the data.  Altogether it was a fun couple days of coding.
