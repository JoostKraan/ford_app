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
};

layout(binding = 1) uniform sampler2D src;

const vec3 phosphor = vec3(0.0, 1.0, 0.706);  // teal/green VFD

vec4 blurSample(vec2 uv, float r) {
    vec4 acc = vec4(0.0);
    for (float x = -3.0; x <= 3.0; x += 1.0)
        for (float y = -3.0; y <= 3.0; y += 1.0)
            acc += texture(src, uv + vec2(x, y) * r);
    return acc / 49.0;
}

void main() {
    vec2 uv = qt_TexCoord0;

    vec4 pixel = texture(src, uv);
    float lum = dot(pixel.rgb, vec3(0.299, 0.587, 0.114));

    // Recolor to phosphor amber
    vec3 col = mix(phosphor * dimLevel * 0.3, phosphor * lum, lum);

    // Wider bloom pass
    vec4 blurred = blurSample(uv, glowRadius);
    float bLum   = dot(blurred.rgb, vec3(0.299, 0.587, 0.114));
    vec3  bloom  = phosphor * bLum * glowStrength;
    col = 1.0 - (1.0 - col) * (1.0 - bloom);

    // Second softer bloom for extra halo
    vec4 blurred2 = blurSample(uv, glowRadius * 3.0);
    float bLum2   = dot(blurred2.rgb, vec3(0.299, 0.587, 0.114));
    vec3  bloom2  = phosphor * bLum2 * (glowStrength * 0.4);
    col = 1.0 - (1.0 - col) * (1.0 - bloom2);

    // Scanlines
    float line = mod(floor(uv.y * screenHeight), 6.0);
    col *= 1.0 - (step(line, 0.5) * scanStrength);

    // Glass tint
    col = 1.0 - (1.0 - col) * (1.0 - phosphor * tintStrength);

    // Vignette
    float d = length(uv - vec2(0.5)) * 1.414;
    col *= 1.0 - d * d * vig;

    fragColor = vec4(col, pixel.a) * qt_Opacity;
}