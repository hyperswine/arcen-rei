use arcen_ls::common::{arcen_analyse}
use rei_ls::common::{rei_analyse}
use std::ast::{Scope}

# All annotations are "compile time", and auto hooked into by the language server
export arcen: (scoped_body: ScopedBody) -> Node {
    // returns to the main rei analyser
    let res = arcen_analyse(stream=scoped_body)
    rei_analyse(res)

    // return the actual node
    Node(res)
}

// turn all S: (...) -> Component into a replace
// &[T] means view in rei
// not necessarily a fat pointer

export gen_macros_for_components: (components: &[ArcenComponentSignature]) {
    components.map(c => {
        "
            {c.name}: replace {
                {"[" exprs: Expr* "]" body: ScopedBody | ArrowExpr} {
                    // try to match each expr to a field in that Component
                    // try to fit all the exprs in the scoped body into Components like Text & match them to a fitting component

                }
            }
        "
    })
}
