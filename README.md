
<h1> MovieCom </h1>
MovieClip animation switcher for starling

<pre>
// initialize
var jump:MovieCom = new MovieCom(fps);
addChild(jump);

// add movieclip animation
jump.addClip(jumpUpTexture, "jumpUp", false);
jump.addClip(jumpDownTexture, "jumpDown", true);

// play
jump.play("jumpUp");
</pre>