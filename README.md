# Which Way?
Which Way? is an app made as part of the OSU Hackathon project, Sept 10-13th.


### OSU Hackathon
OSU Hackathon Slack: http://osu-hackathon.slack.com

Hacathon page on DevPost: https://beaverhacks-fall-2020.devpost.com/



### Goal
The focus on the hackathon is "health" which I took as promoting healthy lifestyles by encouraging fitness.  This app addresses the issue of not being able to find the golf flag (or pin) while on a course.  Sometimes there are hills, trees, or other obstacls that block view of exactly where the pin is located.  This helps the golfer orient toward the flag.

### Team
* Ed Wied


### Technologies used
* Swift


### Demo
* TBD


### Future direction
* Hole information either persisted locally or using API to load and store off-app (or both).
* Move away from using singleton pattern for sharing data - useful but can be difficult to maintain/scale, possible source of bugs later.
* Admin authentication off-app (must).
* Admin web site to add/manage admin users
* Golf course choices are for show only.  The hole data is not linked to a particular course.  Need to tie different hold GPS data to different courses.  Need back-end API to save data.


### Challenges:
* can overlap button on top of ARSceneView, but buttons weren't responding to touch events
* getting the orientation to destination
