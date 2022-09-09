use std::math::{Vec2fh,Vec3b,Vec4fh}

pub type Padding = Vec4fh
pub type Borders = Vec4fh
pub type ColorRGB = Vec3b

pub type FontFamily = String
pub type FontSize = Size
pub type Image = String
pub type Surface3D = String

pub data Font {
    pub font_family: FontFamily
    pub font_size: FontSize
}

pub enum PositionType {
    Relative
    Absolute
}

pub data Position {
    position_type: PositionType
    position: Vec2fh
}

pub enum ContentAlignment {
    Start
    Center
    End
}

pub enum ContentSpacing {
    Around
    Between
    Even
}

pub enum Axis {
    Row
    Col
}

pub data Animate {
    duration_seconds: f64
    translate_to: Vec2fh
    rotate_by: Vec2fh
    scale_by: Vec2fh
}

pub data Node {
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
