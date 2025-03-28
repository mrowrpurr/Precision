add_rules("mode.debug", "mode.release")

set_languages("c++23")

option("commonlib")
    set_default("skyrim-commonlib-ng")
option_end()

if not has_config("commonlib") then
    return
end

add_repositories("SkyrimScripting     https://github.com/SkyrimScripting/Packages.git")
add_repositories("SkyrimScriptingBeta https://github.com/SkyrimScriptingBeta/Packages.git")
add_repositories("MrowrLib            https://github.com/MrowrLib/Packages.git")

includes("xmake/*.lua")

add_requires("skyrim-commonlib-ng", { configs = { ae = true, se = true, vr = false }})
add_requires("simpleini", "toml++", "glm")

includes("xmake/*.lua")

add_defines("UNICODE", "_UNICODE")

-- Explicitly enable exception handling with /EHsc
add_cxxflags("/EHsc")

skse_plugin({
    name = "Precision",
    version = "0.0.1",
    author = "Some One",
    email = "some.one@example.com",
    -- src = "src/*.cpp",
    include = "src",
    packages = {"simpleini", "toml++", "glm"}
})
