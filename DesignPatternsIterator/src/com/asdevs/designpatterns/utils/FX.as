package com.asdevs.designpatterns.utils
{
	import br.pedromoraes.btween.BTween;
	import br.pedromoraes.btween.ISequenceable;
	import br.pedromoraes.btween.properties.color.FadeProperty;
	
	import com.robertpenner.easing.linear.easeLinear;
	
	import flash.display.DisplayObject;
	
	public final class FX
	{
		public static function scaleHeight( target:DisplayObject, endValue:Number, easeFunction:Function = null, time:int = 300, delay:int = 0 ):ISequenceable
		{
			return BTween.make( time, easeFunction, delay ).start( { target: target, height: endValue } ); 
		}
		
		public static function scaleWidth( target:DisplayObject, endValue:Number, easeFunction:Function = null, time:int = 300, delay:int = 0 ):ISequenceable
		{
			return BTween.make( time, easeFunction, delay ).start( { target: target, width: endValue } ); 
		}
		
		public static function scaleY( target:DisplayObject, endScale:Number, easeFunction:Function = null, time:int = 300, delay:int = 0 ):ISequenceable
		{
			return BTween.make( time, easeFunction, delay ).start( { target: target, scaleY: endScale } ); 
		}
		
		public static function scaleX( target:DisplayObject, endScale:Number, easeFunction:Function = null, time:int = 300, delay:int = 0 ):ISequenceable
		{
			return BTween.make( time, easeFunction, delay ).start( { target: target, scaleX: endScale } ); 
		}
		
		public static function slideX( target:DisplayObject, endX:Number, easeFunction:Function = null, time:int = 300, delay:int = 0 ):ISequenceable
		{
			return BTween.make( time, easeFunction, delay ).start( { target: target, x: endX } ); 
		}
		
		public static function slideY( target:DisplayObject, endY:Number, easeFunction:Function = null, time:int = 300, delay:int = 0 ):ISequenceable
		{
			return BTween.make( time, easeFunction, delay ).start( { target: target, y: endY } ); 
		}
		
		public static function fadeIn( target : DisplayObject, time : int = 300, delay : int = 0, amount:Number = 1 ) : ISequenceable
		{
			target.visible = true;
			return BTween.make( time, easeLinear, delay ).start( new FadeProperty( target, amount ) );
		}
		
		public static function fadeOut( target : DisplayObject, time : int = 300, amount : Number = 0, delay:uint = 0 ) : ISequenceable
		{
			return BTween.make( time, easeLinear, delay ).start( new FadeProperty( target, amount ) );
		}  
		
		public static function crossFade( outObject:DisplayObject, inObject:DisplayObject, duration:int = 300, delay:int = 0 ):ISequenceable
		{
			var bt:BTween = new BTween( duration );
			
			bt.add( new FadeProperty( outObject, 0 ) );
			bt.add( new FadeProperty( inObject, 1 ) );
			
			return bt.start( );
		}
	}
}