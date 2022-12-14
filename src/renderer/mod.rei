use std::graphics::shader::{vertex,fragment}
use std::graphics::*

Coords: [f16; 2]
Pixel: [u8; 4]

RED: Pixel([255, 0, 0, 0])

// the uniform keyword allows a globalish static var?
QuadUniform: uniform {
    model: Mat4
    view: Mat4
    proj: Mat4
}

// once {
//     mut quad_uniform_data = QuadUniform()
// }

# maybe allow the fn to be uniform1, 2, 3, etc?
// I mean... now you think about it
// why even like
// I guess its easier to reason with for each shader in the pipeline
// but parameterising the fn with those uniform types...

# a shader
shade_vert_quad: (input_vertex: Coords) -> Vec4 => proj * view * model * input_vertex

# another shader
shade_frag_quad_red: (input: Vec4) -> Pixel => RED

# render quad code
render_quad: (pos: Coords) {
    // 4 coords
    static let quad_coords = [
        Coords(0, 0), Coords(1, 0), Coords(1, 1), Coords(0, 1)
    ]

    // render it to a specific location (model matrix)
    let model = Model(pos)
    let view = View(View2D)
    let proj = Proj(Iso)

    // start
    let pipeline = Pipeline(shaders=(shade_vert_quad, shade_frag_quad_red))
    pipeline.run(shader, verts=quad_coords, model, view, proj)
}
