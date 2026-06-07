precision mediump float;
varying vec2 v_texcoord;
uniform sampler2D tex;

#define CURVE_AMOUNT 0.2
#define ZOOM 0.95

void main() {
    vec2 uv = v_texcoord;

    // Pre-scale
    uv = (uv - 0.5) * ZOOM + 0.5;

    // Barrel distortion
    vec2 cc = uv - 0.5;
    float dist = dot(cc, cc);
    uv += cc * dist * CURVE_AMOUNT;

    // Fora da tela = preto
    if (uv.x < 0.0 || uv.x > 1.0 || uv.y < 0.0 || uv.y > 1.0) {
        gl_FragColor = vec4(0.0, 0.0, 0.0, 1.0);
        return;
    }

    vec3 col = texture2D(tex, uv).rgb;

    // Scanlines (sem screenSize, usa valor fixo)
    float scan = sin(v_texcoord.y * 1080.0 * 1.5);
    col *= 0.85 + 0.15 * scan;

    // Vignette
    float vign = smoothstep(0.9, 0.4, distance(uv, vec2(0.5)));
    col *= vign;

    gl_FragColor = vec4(col, 1.0);
}