void windowShader(inout vec4 color) {
    vec2 uv = x_TexCoord;
    
    float aberration = 0.002;
    float r = texture2D(x_Tex, vec2(uv.x + aberration, uv.y)).r;
    float g = texture2D(x_Tex, uv).g;
    float b = texture2D(x_Tex, vec2(uv.x - aberration, uv.y)).b;
    
    float scanline = sin(uv.y * 800.0) * 0.06;
    
    color.r = r;
    color.g = g;
    color.b = b;
    color.rgb -= scanline;
}
