project "VMA"
	kind "StaticLib"
	language "C++"
	cppdialect "C++17"
	staticruntime (sruntime)
	targetdir (bin)
	objdir (binint)

	includedirs {

		"include",
		"src",
		"%{IncludeDir.VULKAN_SDK}"
	}

	files {

		"src/VmaUsage.h",
		"src/VmaUsage.cpp"
	}

	filter "system:windows"
		systemversion "latest"

	filter "configurations:Debug"
		runtime (debugruntime)
		symbols (debugsymbols)
		optimize (debugoptimize)

	filter "configurations:Release"
		runtime (releaseruntime)
		symbols (releasesymbols)
		optimize (releaseoptimize)

	filter "configurations:Dist"
		runtime (distruntime)
		symbols (distsymbols)
		optimize (distoptimize)
