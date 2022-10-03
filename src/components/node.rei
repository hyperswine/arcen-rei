use std::math::{Vec2fh,Vec3b,Vec4fh}

export Padding: Vec4fh
export Borders: Vec4fh
export ColorRGB: Vec3b

export FontFamily: String
export FontSize: Size
export Image: String
export Surface3D: String

export Font: {
    font_family: FontFamily
    font_size: FontSize
}

export PositionType: enum {
    Relative
    Absolute
}

export Position: {
    position_type: PositionType
    position: Vec2fh
}

export ContentAlignment: enum {
    Start
    Center
    End
}

export ContentSpacing: enum {
    Around
    Between
    Even
}

export Axis: enum {
    Row
    Col
}

export Animate: {
    duration_seconds: f64
    translate_to: Vec2fh
    rotate_by: Vec2fh
    scale_by: Vec2fh
}

export Node: {
    padding: Padding
    borders: Borders
    background_color: ColorRGB
    color: ColorRGB
    font: Font
    text: String?
    image: Image?
    position: Position
    animate: Vec<Animate>

    children: Vec<Node>
    children_axis: Axis
    children_alignment: ContentAlignment
    children_spacing: ContentSpacing
}
