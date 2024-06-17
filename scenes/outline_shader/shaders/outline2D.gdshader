shader_type canvas_item;

uniform vec4 line_color : source_color = vec4(1.0); // White color
uniform float line_thickness : hint_range(0, 10) = 1.0;
//
const vec2 OFFSETS[8] = {
	vec2(-1, -1), vec2(-1, 0), vec2(-1, 1), vec2(0, -1), vec2(0, 1),
	vec2(1, -1), vec2(1, 0), vec2(1, 1)
};


void fragment() {
	vec2 size = TEXTURE_PIXEL_SIZE * line_thickness;
	float outline = 0.0;

	for (int i = 0; i < OFFSETS.length(); i++) {
		outline += texture(TEXTURE, UV + size * OFFSETS[i]).a;
	}
	outline = min(outline, 1.0);

	vec4 color = texture(TEXTURE, UV);
	COLOR = mix(color, line_color, outline - color.a);
}
//uniform float line_thickness : hint_range(0.0, 10.0) = 1.0;
//
//const vec2 OFFSETS[8] = {
	//vec2(-1, -1), vec2(-1, 0), vec2(-1, 1), vec2(0, -1), vec2(0, 1), 
	//vec2(1, -1), vec2(1, 0), vec2(1, 1)
//};
//
//void fragment() {
	//vec2 size = TEXTURE_PIXEL_SIZE * line_thickness;
	//float outline = 0.0;
	//
	//for (int i = 0; i < OFFSETS.length(); i++) {
		//outline += texture(TEXTURE, UV + size * OFFSETS[i]).a;
	//}
	//outline = min(outline, 1.0);
	//
	//vec4 color = texture(TEXTURE, UV);
	//COLOR = mix(color, line_color, outline - color.a);
//}



//void fragment() {
	//vec2 size = TEXTURE_PIXEL_SIZE * line_thickness;
//
	////// For each side, we want a single value, so we extract the alpha component of
	////// the sampled color.
	////float left = texture(TEXTURE, UV + vec2(-size.x, 0)).a;
	////float right = texture(TEXTURE, UV + vec2(size.x, 0)).a;
	////float up = texture(TEXTURE, UV + vec2(0, size.y)).a;
	////float down = texture(TEXTURE, UV + vec2(0, -size.y)).a;
	////float upper_left = texture(TEXTURE, UV + vec2(-size.x, size.y)).a;
	////float upper_right = texture(TEXTURE, UV + vec2(size.x, size.y)).a;
	////float bottom_left = texture(TEXTURE, UV + vec2(-size.x, -size.y)).a;
	////float bottom_right = texture(TEXTURE, UV + vec2(size.x, -size.y)).a;
////
	//////float sum = left + right + up + down;
	////float sum = left + right + up + down + upper_left + upper_right + bottom_left + bottom_right;
	////// This value represents the black-and-white mask we'll use to outline the sprite.
	////float outline = min(sum, 1.0);
	//
    //float outline = texture(TEXTURE, UV + vec2(-size.x, 0)).a;
    //outline += texture(TEXTURE, UV + vec2(0, size.y)).a;
    //outline += texture(TEXTURE, UV + vec2(size.x, 0)).a;
    //outline += texture(TEXTURE, UV + vec2(0, -size.y)).a;
    //outline += texture(TEXTURE, UV + vec2(-size.x, size.y)).a;
    //outline += texture(TEXTURE, UV + vec2(size.x, size.y)).a;
    //outline += texture(TEXTURE, UV + vec2(-size.x, -size.y)).a;
    //outline += texture(TEXTURE, UV + vec2(size.x, -size.y)).a;
    //outline = min(outline, 1.0);
	//
	//vec4 color = texture(TEXTURE, UV);
	//// We apply the outline color by calculating a mask surrounding the sprite.
	//COLOR = mix(color, line_color, outline - color.a);
//}
