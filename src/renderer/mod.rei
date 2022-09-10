use pkg::utility::{vertex,fragment}

type Coords = [f16; 2]
type Pixel = [u8; 4]

const RED = [255, 0, 0, 0]

# Coords of a quad
data Quad([Coords; 4])

@vertex("render_quad") {
@input
data {
    input_vertex: Coords
}

@output
data {
    out: Vec4
}

@uniform
data {
    model: Mat4
    view: Mat4
    proj: Mat4
}

fn main() {
    out = model * view * proj * input_vertex
}
}

@fragment("render_quad") {
@input
data {
    input_coords: Vec4
}

@output
data {
    out: Pixel
}

fn main() {
    out = RED
}
}

fn render_quad(pos: Coords) {
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
