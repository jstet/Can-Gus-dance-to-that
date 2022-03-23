# Can Gus dance to that?

Simple shiny app that checks if [Gus Johnson](https://www.youtube.com/user/gustoonz) can dance to something. Not finished yet.

## Why?

I've noticed that when you mute the video "[I had a great day](https://www.youtube.com/watch?v=VUkxoREfiQQ)" and play some music different to what can be heard in the video, it still fits to Gus dance almost every time. So I had the idea to write an app that checks if a track fits and, if thats the case, plays the video while the track plays.

## How does it work?

The app uses Spotifys API to pull song metrics for "Boogie Wonderland" and then compares them to the song metrics of a song the user enters. 

## To do

- hide video at first, instead display something else
- show different videos when answer changes
- change playback speed of video -> calculate speed change through bpm
- cut video so it fits to bpm
- make spotify play the song
- when user pauses, video should pause too
- maybe optimize for mobile devices
