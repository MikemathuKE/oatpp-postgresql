project "oatpp-postgresql"
    kind "StaticLib"
    language "C++"
    cppdialect "C++20"
    staticruntime "on"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    files {
        "src/oatpp-postgresql/**.hpp",
        "src/oatpp-postgresql/**.cpp"
    }

    includedirs {
        "src",
        "../oatpp/src"
    }

    defines {
        "OATPP_DISABLE_ENV_OBJECT_COUNTERS=ON",
        "OATPP_BUILD_TESTS=OFF"
    }
    
    links {
        "oatpp"
    }

    filter "system:windows"
        systemversion "latest"

        includedirs {
        "C:/Program Files/PostgreSQL/16/include"
        }

    filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"