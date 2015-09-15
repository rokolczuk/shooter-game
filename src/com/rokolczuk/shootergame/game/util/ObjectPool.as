/**
 * Created by rokolczuk on 15/09/15.
 */
package com.rokolczuk.shootergame.game.util
{
public class ObjectPool
{
    private var instances:Array = [];
    private var _objectClass:Class;
    private var _autoSize:Boolean;
    private var _initialised:Boolean = false;
    private var _size:uint;

    public function ObjectPool(size:uint, objectClass:Class, autoSize:Boolean)
    {
        _objectClass = objectClass;
        _autoSize = autoSize;
        _size = size;

    }

    private function initPool(size:uint):void
    {
        while(size-- > 0)
        {
            instances.push(new _objectClass);
        }

        _initialised = true;
    }

    public function get():IReusable
    {
        if(!_initialised)
        {
            initPool(_size)
        }

        if(instances.length > 0)
        {
            return instances.pop();

        } else if(_autoSize)
        {
            ++_size;
            return new _objectClass;
        }
        else
        {
            throw new Error("ObjectPool error: ran out of instances.");
        }

        return null;
    }

    public function put(object:IReusable):void
    {
        object.reuse();

        if(object is _objectClass)
        {
            instances.push(object);
        }
        else
        {
            throw new Error("ObjectPool error: wrong object type");
        }
    }
}
}
