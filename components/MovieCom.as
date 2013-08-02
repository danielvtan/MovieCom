package components
{

	import starling.core.Starling;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.textures.Texture;
	
	/** Class: MovieCom
	 * 	MovieClip animation switcher for starling
	 * 	(start code)
	 * 	// initialize
	 * 	var jump:MovieCom = new MovieCom(fps);	
	 *  addChild(jump);
	 * 
	 * 	// add movieclip animation
	 * 	jump.addClip(jumpUpVectorTexture, "jumpUp", false);
	 * 	jump.addClip(jumpDownVectorTexture, "jumpDown", true);
	 * 
	 * 	// play
	 * 	jump.play("jumpUp");
	 * 
	 *  // returns the current movieclip and get the name
	 *  jump.getCurrentClip().name
	 * 
	 *  // returns the clip by name
	 *  jump.getClip("jumpUp");
	 * 
	 *  // shows the clip
	 *  jump.setClip("jumpDown");
	 * 
	 *  // select the clip by name then plays it
	 *  jump.gotoAndPlay("jumpUp", 10);
	 * 
	 *  // select the clop by name the stops it
	 *  jump.gotoAndStop("jumpDown", 5);
	 * 
	 *  // dispose children after use
	 *  jump.cleanUp();
	 * 	removeChild(jump);
	 * 	jump = null;
	 * 	(end)
	 */
	public class MovieCom extends Sprite
	{
		private var fps:int = 12;
		
		private var currentMc:MovieClip;
		
		/**
		 * Constructor: MovieCom
		 * 
		 * Parameter:
		 * fps - frame per second
		 * 
		 */
		public function MovieCom(fps:int = 12)
		{
			this.fps = fps;
			super();
			this.addEventListener(Event.REMOVED_FROM_STAGE, onRemoved);
		}
		/**
		 * Function: cleanUp
		 * removes all children
		 * 
		 */
		public function cleanUp():void {
			for(var i:int = 0; i < numChildren; ++i) {
				var child:MovieClip = MovieClip(getChildAt(0));
				removeChild(child);
				child.texture.dispose();
				child.dispose();
				child = null;
			}
		}
		private function onRemoved(e:Event):void {
			currentMc = null;
		}
		/**
		 * Function: addClip
		 * adds a clip with the specified name
		 * 
		 * Parameter:
		 * textures - vector of texture
		 * name - name of the clip to be used
		 * loop - loop the animation
		 * 
		 * Returns:
		 * Movieclip
		 */
		public function addClip(textures:Vector.<Texture>, name:String, loop:Boolean = true):MovieClip {
			var mc:MovieClip = new MovieClip(textures, fps);
			addChild(mc);
			mc.name = name;
			mc.loop = loop;
			if(this.numChildren > 1)
				mc.visible = false;
			else
				currentMc = mc;
			return mc;
		}
		/**
		 * Function: getCurrentClip
		 * get the current clip
		 * 
		 * Returns:
		 * MovieClip
		 */
		public function getCurrentClip():MovieClip {
			return currentMc;
		}
		/**
		 * Function: play
		 * play the movieclip based on the specified name
		 * 
		 * Parameters:
		 * name - name of the clip
		 * 
		 * Returns:
		 * MovieClip
		 * 
		 */
		public function play(name:String):MovieClip {
			hideMc();

			currentMc = getClip(name);
			gotoFrame(1).play();
			Starling.juggler.add(currentMc);
			
			return currentMc;
		}
		/**
		 * Function: getClip
		 * get the clip based on the specified name
		 * 
		 * Parameters:
		 * name - name of the clip
		 * 
		 * Returns:
		 * MovieClip
		 */
		public function getClip(name:String):MovieClip {
			return MovieClip(this.getChildByName(name));
		}
		/**
		 * Function: setClip
		 * set the clip
		 * 
		 * Parameters:
		 * name - name of the clip
		 * 
		 * Returns:
		 * MovieClip
		 */
		public function setClip(name:String):MovieClip {
			hideMc();
			currentMc = getClip(name);
			currentMc.visible = true;
			return currentMc;
		}
		/**
		 * Function: gotoAndPlay
		 * play the specified clip
		 * 
		 * Parameters:
		 * name - name of the clip
		 * frame - frame to start
		 * 
		 * Returns:
		 * MovieClip
		 * 
		 */
		public function gotoAndPlay(name:String, frame:int = 1):MovieClip {
			setClip(name);
			gotoFrame(frame).play();
			return currentMc;
		}
		/**
		 * Function: gotoAndStop
		 * stop the specified clip
		 * 
		 * Parameters:
		 * name - name of the clip
		 * frame - frame to start
		 * 
		 * Returns:
		 * MovieClip
		 * 
		 */
		public function gotoAndStop(name:String, frame:int = 1):MovieClip {
			setClip(name);
			gotoFrame(frame).pause();
			return currentMc;
		}
		private function gotoFrame(frameNum:int):MovieClip {
			currentMc.currentFrame = frameNum;
			return currentMc;
		}
		private function hideMc():void {
			currentMc.visible = false;
			currentMc.stop();
			Starling.juggler.remove(currentMc);
		}
			
	}
}