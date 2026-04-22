#version 440
layout(location = 0) in vec2 qt_TexCoord0;
layout(location = 0) out vec4 fragColor;
layout(std140, binding = 0) uniform buf {
    mat4  qt_Matrix;
    float qt_Opacity;
    float glowRadius;
    float glowStrength;
    float dimLevel;
    float scanStrength;
    float tintStrength;
    float vig;
    float screenHeight;
    float uiTopOffset;
    float uiBottomOffset;
};
layout(binding = 1) uniform sampler2D src;
const vec3 phosphor = vec3(0.0, 1.0, 0.533);

void main() {
    vec2 uv = qt_TexCoord0;

    if (uv.y > uiTopOffset && uv.y < (1.0 - uiBottomOffset)) {
        discard;
    }

    vec4 pixel = texture(src, uv);
    float lum = dot(pixel.rgb, vec3(0.299, 0.587, 0.114));
    vec3 col = mix(phosphor * dimLevel * 0.3, phosphor * lum, lum);

    float line = mod(floor(uv.y * screenHeight), 6.0);
    col *= 1.0 - (step(line, 0.5) * scanStrength);

    col = 1.0 - (1.0 - col) * (1.0 - phosphor * tintStrength);

    float d = length(uv - vec2(0.5)) * 1.414;
    col *= 1.0 - d * d * vig;

    fragColor = vec4(col, pixel.a) * qt_Opacity;
}
//compile :  /home/joost/Qt/6.11.0/gcc_64/bin/qsb --glsl "100 es,120,150" --hlsl 50 --msl 12 -o /home/joost/Documents/GitHub/ford_app/shaders/vfd.frag.qsb /home/joost/Documents/GitHub/ford_app/shaders/vfd.frag