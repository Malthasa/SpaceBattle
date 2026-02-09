shader_type canvas_item;

uniform sampler2D background_texture : filter_nearest_mipmap, repeat_enable;
uniform vec2 texture_scale = vec2(1.0, 1.0);
uniform float parallax_factor = 1.0; // Lower values = slower scrolling (parallax effect)

uniform vec2 camera_position = vec2(0.0, 0.0);

void fragment() {
    // Calculate UV coordinates based on camera position
    vec2 uv = UV * texture_scale;
    
    // Apply camera offset with parallax factor
    vec2 scroll_offset = camera_position * parallax_factor * 0.001; // Scale down for reasonable scrolling
    
    uv += scroll_offset;
    // Sample the texture
    COLOR = texture(background_texture, uv);
}