-- premake5.lua
workspace "test"
    configurations { "Debug", "Release" }

project "test.core"
    kind "SharedLib" -- ConsoleApp / WindowedApp / SharedLib / StaticLib
    language "C++"
    targetdir "bin/%{cfg.buildcfg}"

    -- including files
    files { 
       "test.core/**.h", 
       "test.core/**.c", 
       "test.core/**.cpp"
    }

    -- excluding files
    removefiles {}

    -- linking other projects
    links {}
    includedirs {}
    libdirs {}

    -- build configurations
    filter "configurations:Debug"
        defines { "DEBUG" }
        symbols "On"

    filter "configurations:Release"
        defines { "NDEBUG" }
        optimize "On"

project "test.app"
    kind "ConsoleApp" -- ConsoleApp / WindowedApp / SharedLib / StaticLib
    language "C++"
    targetdir "bin/%{cfg.buildcfg}"

    -- including files
    files {
       "test.app/**.h", 
       "test.app/**.c", 
       "test.app/**.cpp"
    }

    -- excluding files
    removefiles {}

    -- linking other projects
    links { "test.core" }
    includedirs { "test.core/" }
    libdirs { "bin/%{cfg.buildcfg}" }

    -- build configurations
    filter "configurations:Debug"
        defines { "DEBUG" }
        symbols "On"

    filter "configurations:Release"
        defines { "NDEBUG" }
        optimize "On"