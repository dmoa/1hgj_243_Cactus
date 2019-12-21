return lg.newShader([[
    extern vec2 size;
    extern number factor;
    vec4 effect(vec4 color, Image img, vec2 texture_coords, vec2 pixel_coords){
       vec2 tc = floor(texture_coords * size / factor) * factor / size;
       return Texel(img, tc);
    }
]])