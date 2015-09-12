/**
 * Created by rokolczuk on 12/09/15.
 */
package com.rokolczuk.shootergame.game.gameLogic.components.concrete
{
import com.rokolczuk.shootergame.game.gameLogic.components.Component;

import flash.geom.Point;

public class ShootingComponent extends Component
{
    private var _offset:Point;
    private var _bulletSpeed:Point;
    private var _bulletSymbolClass:Class;
    private var _chanceToShoot:Number;

    public function ShootingComponent(offset:Point, bulletSpeed:Point, bulletSymbolClass:Class, chanceToShoot:Number)
    {
        super();
        _offset = offset;
        _bulletSpeed = bulletSpeed;
        _bulletSymbolClass = bulletSymbolClass;
        _chanceToShoot = chanceToShoot;
    }

    public function get offset():Point
    {
        return _offset;
    }

    public function get bulletSpeed():Point
    {
        return _bulletSpeed;
    }

    public function get bulletSymbolClass():Class
    {
        return _bulletSymbolClass;
    }

    public function get chanceToShoot():Number
    {
        return _chanceToShoot;
    }
}
}
