# Copyright (c) 2022 Yuri Sarudiansky
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

tool
extends "res://addons/keh_dataasset/editor/propeditors/ped_composite.gd"


#######################################################################################################################
### Signals and definitions


#######################################################################################################################
### "Public" properties


#######################################################################################################################
### "Public" functions


#######################################################################################################################
### "Private" definitions


#######################################################################################################################
### "Private" properties
var _value: Quat = Quat()

#######################################################################################################################
### "Private" functions


#######################################################################################################################
### Event handlers
func _changed_x(nval: float) -> Quat:
	_value.x = nval
	return _value

func _changed_y(nval: float) -> Quat:
	_value.y = nval
	return _value

func _changed_z(nval: float) -> Quat:
	_value.z = nval
	return _value

func _changed_w(nval: float) -> Quat:
	_value.w = nval
	return _value

#######################################################################################################################
### Overrides
# Set value must be implemented in the "final class"
func set_value(value) -> void:
	if (_value != value):
		_value = value
	
	update_component(0, _value.x)
	update_component(1, _value.y)
	update_component(2, _value.z)
	update_component(3, _value.w)



# "Final class" MUST override this in order to create the instances within the "_component" array
func _init() -> void:
	create_component("x", "x", 0, "_changed_x")
	create_component("y", "y", 1, "_changed_y")
	create_component("z", "z", 2, "_changed_z")
	create_component("w", "w", 3, "_changed_w")
