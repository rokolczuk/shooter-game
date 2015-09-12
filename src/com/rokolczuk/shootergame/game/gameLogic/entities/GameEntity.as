/**
 * Created by rokolczuk on 12/09/15.
 */
package com.rokolczuk.shootergame.game.gameLogic.entities
{
import com.rokolczuk.shootergame.game.gameLogic.components.Component;

import flash.utils.Dictionary;

public class GameEntity
{
    private var _componentLookup:Dictionary = new Dictionary();
    private var _components:Vector.<Component> = new Vector.<Component>();

    function GameEntity(... components)
    {
        for (var i:int = 0; i < components.length; i++)
        {
            addComponent(components[i]);
        }
    }

    public function addComponent(component:Component):void
    {
        _components.push(component);
        component.entity = this;
    }

    public function getComponent(componentClass:Class):Component
    {
        if(_componentLookup[componentClass] != null)
        {
            return _componentLookup[componentClass];
        }

        for (var i:int = 0; i < _components.length; i++)
        {
            if(_components[i] is componentClass)
            {
                _componentLookup[componentClass] = _components[i];
                return _components[i];
            }
        }

        return null;
    }

    public function hasComponent(componentClass:Class):Boolean
    {
        if(_componentLookup[componentClass] != null)
        {
            return true;
        }

        for (var i:int = 0; i < _components.length; i++)
        {
            if(_components[i] is componentClass)
            {
                return true;
            }
        }

        return false;
    }
}
}
