
<h1> MovieCom </h1>
MovieClip animation switcher for starling

<h2>How to user</h2>
<pre>
// initialize
var jump:MovieCom = new MovieCom(fps);
addChild(jump);

// add movieclip animation
jump.addClip(jumpUpVectorTexture, "jumpUp", false);
jump.addClip(jumpDownVectorTexture, "jumpDown", true);

// play
jump.play("jumpUp");

// returns the current movieclip and get the name
jump.getCurrentClip().name

// returns the clip by name
jump.getClip("jumpUp");

// shows the clip
jump.setClip("jumpDown");

// select the clip by name then plays it
jump.gotoAndPlay("jumpUp", 10);

// select the clip by name then stops it
jump.gotoAndStop("jumpDown", 5);

// dispose children after use
jump.cleanUp();
removeChild(jump);
jump = null;
</pre>