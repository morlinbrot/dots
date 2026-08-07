// Colored outline around the focused pane. iFocus is 1 on the focused
// surface only, so unfocused splits render untouched.
//
// The outline is drawn inset by `inset` pixels rather than flush against the
// true edge. At a split boundary, Ghostty draws the divider on top of both
// pane textures and shaders can't paint over it, so a line drawn exactly on
// the edge (inset = 0) gets eaten there. Nudging it inward keeps the line at
// a full, uncut 1px while landing just inside the divider's overdraw.
// (https://github.com/ghostty-org/ghostty/discussions/2727)
void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    fragColor = texture(iChannel0, fragCoord / iResolution.xy);

    if (iFocus == 1) {
        float thickness = 1.0;
        float inset = 1.0;

        bool onVerticalEdge =
            (fragCoord.x > inset && fragCoord.x < inset + thickness) ||
            (fragCoord.x > iResolution.x - inset - thickness && fragCoord.x < iResolution.x - inset);

        bool onHorizontalEdge =
            (fragCoord.y > inset && fragCoord.y < inset + thickness) ||
            (fragCoord.y > iResolution.y - inset - thickness && fragCoord.y < iResolution.y - inset);

        bool withinBounds =
            fragCoord.x > inset && fragCoord.x < iResolution.x - inset &&
            fragCoord.y > inset && fragCoord.y < iResolution.y - inset;

        if (withinBounds && (onVerticalEdge || onHorizontalEdge)) {
            // fragColor = vec4(0.980, 0.702, 0.529, 1.0); // Catppuccin Mocha peach #fab387
            // fragColor = vec4(0.949, 0.804, 0.804, 1.0); // Catppuccin Mocha flamingo #f2cdcd
            // fragColor = vec4(0.922, 0.627, 0.675, 1.0); // Catppuccin Mocha maroon #eba0ac
            fragColor = vec4(0.961, 0.761, 0.906, 1.0); // Catppuccin Mocha pink #f5c2e7
            // fragColor = vec4(0.796, 0.651, 0.969, 1.0); // Catppuccin Mocha mauve #cba6f7
            // fragColor = vec4(0.706, 0.745, 0.996, 1.0); // Catppuccin Mocha lavender #b4befe
        }
    }
}
