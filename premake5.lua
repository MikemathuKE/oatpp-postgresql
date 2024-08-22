project "oatpp-postgresql"
    kind "StaticLib"
    language "C++"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    files {
        "src/oatpp/**.hpp",
        "src/oatpp/**.cpp"
    }

    defines {
        "OATPP_DISABLE_ENV_OBJECT_COUNTERS=ON",
        "OATPP_BUILD_TESTS=OFF"
    }

    filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"