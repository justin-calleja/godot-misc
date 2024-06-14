class_name TNode
extends Node
## A Node that be visited and its children to run logic.
##
## TODO: add description and fix brief description above
## (see: https://docs.godotengine.org/en/stable/tutorials/scripting/gdscript/gdscript_documentation_comments.html)
##

func traverseBF(fn_name: String, rootNode: TNode) -> void:
	if has_method(fn_name):
		call(fn_name, rootNode)

	for child in get_children():
		child.traverseBF(fn_name, rootNode)

