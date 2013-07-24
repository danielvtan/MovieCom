
MovieClip animation switcher for starling

// initialize
var jump:MovieClip = new MovieCom(fps);
addChild(jump);

// add movieclip animation
jump.addClip(jumpUpTexture, "jumpUp", false);
jump.addClip(jumpDownTexture, "jumpDown", true);

// play
jump.play("jumpUp");