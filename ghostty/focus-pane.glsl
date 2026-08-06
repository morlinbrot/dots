// Colored utline around the focused pane. iFocus is 1 on the focused
// surface only, so unfocused splits render untouched.
void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    fragColor = texture(iChannel0, fragCoord / iResolution.xy);

    if (iFocus == 1) {
        float thickness = 1.0;
        if (fragCoord.x < thickness || fragCoord.y < thickness ||
            fragCoord.x > iResolution.x - thickness ||
            fragCoord.y > iResolution.y - thickness) {
            // fragColor = vec4(0.980, 0.702, 0.529, 1.0); // Catppuccin Mocha peach #fab387
            // fragColor = vec4(0.949, 0.804, 0.804, 1.0); // Catppuccin Mocha flamingo #f2cdcd
            // fragColor = vec4(0.922, 0.627, 0.675, 1.0); // Catppuccin Mocha maroon #eba0ac
            fragColor = vec4(0.961, 0.761, 0.906, 1.0); // Catppuccin Mocha pink #f5c2e7
            // fragColor = vec4(0.796, 0.651, 0.969, 1.0); // Catppuccin Mocha mauve #cba6f7
            // fragColor = vec4(0.706, 0.745, 0.996, 1.0); // Catppuccin Mocha lavender #b4befe
        }
    }
}
