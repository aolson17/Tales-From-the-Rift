varying vec2 v_texcoord;
varying vec4 v_vcolor;

uniform vec2 resolution;

void main()
{ 
    vec2 onePixel = vec2(1.0 / resolution.x, 1.0 / resolution.y);
    vec2 uv = v_texcoord;
    
    vec3 color = vec3(0.5);
    color -= texture2D(gm_BaseTexture, uv - onePixel).rgb;
    color += texture2D(gm_BaseTexture, uv + onePixel).rgb;
    color.rgb = vec3((color.r + color.g + color.b) / 3.0);
	
	vec3 color_other = texture2D(gm_BaseTexture, v_texcoord + onePixel).rgb;
    color = texture2D(gm_BaseTexture, v_texcoord).rgb;
	if (color_other != color){
		color = vec3(0);
	}else{
		
	}
	
	
	
	//color.rgb = vec3((color.r + color.g + color.b));
	
	
    gl_FragColor = vec4(color.rgb, texture2D(gm_BaseTexture,uv).a);
	
	color = texture2D(gm_BaseTexture, uv).rgb;
	//if true{
		//gl_FragColor = v_vcolor * texture2D( gm_BaseTexture, v_texcoord );
	//}
}
