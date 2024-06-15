class_name TNode
extends Node
## A "Traversable" Node.
##
## TODO: add description and fix brief description above
## (see: https://docs.godotengine.org/en/stable/tutorials/scripting/gdscript/gdscript_documentation_comments.html)
##

func traverseDF(fn_name: String, context: Variant) -> void:
	if has_method(fn_name):
		print("Visiting ", self.name)
		call(fn_name, context)

	for child in get_children():
		child.traverseDF(fn_name, context)

