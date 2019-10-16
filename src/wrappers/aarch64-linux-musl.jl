# Autogenerated wrapper script for GLEW_jll for aarch64-linux-musl
export libGLEW

using Libglvnd_jll
using X11_jll
## Global variables
PATH = ""
LIBPATH = ""
LIBPATH_env = "LD_LIBRARY_PATH"

# Relative path to `libGLEW`
const libGLEW_splitpath = ["lib", "libGLEW.so"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libGLEW_path = ""

# libGLEW-specific global declaration
# This will be filled out by __init__()
libGLEW_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libGLEW = "libGLEW.so.2.1"


"""
Open all libraries
"""
function __init__()
    global prefix = abspath(joinpath(@__DIR__, ".."))

    # Initialize PATH and LIBPATH environment variable listings
    global PATH_list, LIBPATH_list
    append!.(Ref(PATH_list), (Libglvnd_jll.PATH_list, X11_jll.PATH_list,))
    append!.(Ref(LIBPATH_list), (Libglvnd_jll.LIBPATH_list, X11_jll.LIBPATH_list,))

    global libGLEW_path = abspath(joinpath(artifact"GLEW", libGLEW_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libGLEW_handle = dlopen(libGLEW_path)
    push!(LIBPATH_list, dirname(libGLEW_path))

    # Filter out duplicate and empty entries in our PATH and LIBPATH entries
    filter!(!isempty, unique!(PATH_list))
    filter!(!isempty, unique!(LIBPATH_list))
    global PATH = join(PATH_list, ':')
    global LIBPATH = join(LIBPATH_list, ':')

    # Add each element of LIBPATH to our DL_LOAD_PATH (necessary on platforms
    # that don't honor our "already opened" trick)
    #for lp in LIBPATH_list
    #    push!(DL_LOAD_PATH, lp)
    #end
end  # __init__()

