varying vec2 v_texcoord;
varying vec4 v_vcolor;

uniform vec2 resolution;

void main()
{ 
    vec2 onePixel = vec2(1.0 / resolution.x, 1.0 / resolution.y);
    vec3 color = texture2D(gm_BaseTexture, v_texcoord).rgb;
	
	float light_offset = .1;
	float dark_offset = -.1;
	
	vec3 color_other = texture2D(gm_BaseTexture, v_texcoord + onePixel).rgb;
	if (color_other != color){
		float offset = dark_offset;
		color = vec3((color.r+offset),(color.g+offset),(color.b+offset));
	}else{
		color_other = texture2D(gm_BaseTexture, v_texcoord - onePixel).rgb;
		if (color_other != color){
			float offset = light_offset;
			color = vec3((color.r+offset),(color.g+offset),(color.b+offset));
		}else{
			color = vec3((color.r),(color.g),(color.b));
		}
	}
	/*vec3 color_other = texture2D(gm_BaseTexture, v_texcoord + onePixel.y).rgb;
	vec3 color_other_2 = texture2D(gm_BaseTexture, v_texcoord + onePixel.x).rgb;
	if (color_other != color || color_other_2 != color){
		float offset = dark_offset;
		color = vec3((color.r+offset),(color.g+offset),(color.b+offset));
	}else{
		color_other = texture2D(gm_BaseTexture, v_texcoord - onePixel.y).rgb;
		color_other_2 = texture2D(gm_BaseTexture, v_texcoord - onePixel.x).rgb;
		if (color_other != color || color_other_2 != color){
			float offset = light_offset;
			color = vec3((color.r+offset),(color.g+offset),(color.b+offset));
		}else{
			color = vec3((color.r),(color.g),(color.b));
		}
	}*/
	
    gl_FragColor = vec4(color.rgb, texture2D(gm_BaseTexture,v_texcoord).a);
}
