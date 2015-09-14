/**
 * Created by rokolczuk on 12/09/15.
 */
package com.rokolczuk.shootergame
{
import flash.display.Sprite;

[SWF(backgroundColor="#000000", frameRate="60", width="300", height="650")]
public class ApplicationMain extends Sprite
{
    private var _context:ShooterGameContext;

    public function ApplicationMain()
    {
        super();
        _context = new ShooterGameContext(this);
    }
}
}
