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
        "OATPP_BUILD_TESTS=OFF",
        "_CRT_SECURE_NO_WARNINGS"
    }
    
    links {
        "oatpp"
    }

    filter "system:windows"
        systemversion "latest"

        includedirs {
            "C:/Program Files/PostgreSQL/16/include"
        }

        libdirs {
            "C:/Program Files/PostgreSQL/16/lib",
            "%{prj.location}/vendor/oatpp/bin" .. outputdir .. "/oatpp"
        }

        links {
            "libpq.lib"
        }

    filter "system:linux"
        systemversion "latest"

        includedirs {
            "/usr/include/postgresql"
        }

        libdirs {
            "%{prj.location}/vendor/oatpp/bin" .. outputdir .. "/oatpp"
        }

    filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"