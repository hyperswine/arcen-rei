use arcen_ls::common::{arcen_analyse}
use rei_ls::common::{rei_analyse}
use std::ast::{Scope}
use 

# All annotations are "compile time", and auto hooked into by the language server
export arcen: (scoped_body: ScopedBody) -> Node {
    // returns to the main rei analyser
    let res = arcen_analyse(stream=scoped_body)
    rei_analyse(res)

    // return the actual node
    Node(res)
}
