use pkg::utility::{vertex,fragment}

type Coords = [f16; 2]

# Coords of a quad
data Quad([Coords; 4])

@vertex("render_quad") {
let input_vertex: Coords
let model: Mat4
let view: Mat4
let proj: Mat4
let out: Mat4

fn main() {
    out = model * view * proj * input_vertex
}
}


@fragment("render_quad") {
fn main() {

}
}
