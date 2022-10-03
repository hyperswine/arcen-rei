use pkg::utility::{vertex,fragment}

Coords: [f16; 2]
Pixel: [u8; 4]

const RED = [255, 0, 0, 0]

# Coords of a quad
Quad: [Coords; 4]

@vertex("render_quad") {
input: {
    input_vertex: Coords
}

output: {
    out: Vec4
}

uniform: {
    model: Mat4
    view: Mat4
    proj: Mat4
}

main: () {
    out = model * view * proj * input_vertex
}
}

@fragment("render_quad") {
input: {
    input_coords: Vec4
}

output: {
    out: Pixel
}

main: () {
    out = RED
}
}

render_quad: (pos: Coords) {
    core::lazy {
        // 4 coords
        let quad_coords = [
            Coords(0, 0), Coords(1, 0), Coords(1, 1), Coords(0, 1)
        ]
    }

    // render it to a specific location (model matrix)
    let model = Model(pos)
    let view = View()
    let proj = Proj()

    // start
    let shader = Shader("render_quad")
    let pipeline = Pipeline()

    pipeline.run(
        shader, verts=quad_coords, model, view, proj
    )
}
