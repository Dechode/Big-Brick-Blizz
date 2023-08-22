extends Control


@onready var credits_text = $HBoxContainer/Credits/ScrollContainer/CreditsText
@onready var credits = $HBoxContainer/Credits
@onready var title = $Title


func _ready() -> void:
	var text := "
	Gameplay:
	Copyright (c) 2023 Veeti Väisänen
	
	THIRD PARTY LICENSES
	--------------------------------------
	
	FreeType:
	Portions of this software are copyright © 2022 The FreeType Project (www.freetype.org). All rights reserved.
	
	
	ENet:
	Copyright (c) 2002-2020 Lee Salzman
	
	Permission is hereby granted, free of charge, to any person obtaining a copy of this software and
	associated documentation files (the \"Software\"), to deal in the Software without restriction, including
	without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
	copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to
	the following conditions:

	The above copyright notice and this permission notice shall be included in all copies or substantial
	portions of the Software.
	
	THE SOFTWARE IS PROVIDED \"AS IS\", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
	INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
	PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
	HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF
	CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE
	OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
	
	
	Mbed TLS:
	Copyright The Mbed TLS Contributors

	Licensed under the Apache License, Version 2.0 (the \"License\"); you may not use this file except in
	compliance with the License. You may obtain a copy of the License at

	http://www.apache.org/licenses/LICENSE-2.0

	Unless required by applicable law or agreed to in writing, software distributed under the License is
	distributed on an0 \"AS IS\" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express
	or implied. See the License for the specific language governing permissions and limitations under the
	License.\n\n"
	
	credits_text.text = text
	credits_text.text += "\nGodot:\n%s" % Engine.get_license_text()
	print_debug(credits_text)
	


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("launch"):
		hide()


func _on_play_button_pressed() -> void:
	hide()


func _on_quit_button_pressed() -> void:
	get_tree().quit()


func _on_credits_button_pressed() -> void:
	credits.visible = not credits.visible
	title.visible = not credits.visible
	
