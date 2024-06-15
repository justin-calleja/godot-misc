class_name TNode
extends Node
## A Node that be visited and its children to run logic.
##
## TODO: add description and fix brief description above
## (see: https://docs.godotengine.org/en/stable/tutorials/scripting/gdscript/gdscript_documentation_comments.html)
##

func traverseBF(fn_name: String, context: Variant) -> void:
	if has_method(fn_name):
		print("Visiting ", self.name)
		call(fn_name, context)

	for child in get_children():
		child.traverseBF(fn_name, context)

