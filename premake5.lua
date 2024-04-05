project "VMA"
	kind "StaticLib"
	language "C++"
	cppdialect "C++17"
	staticruntime "Off"
	targetdir ("%{wks.location}/bin/" .. outputdir .. "/lib")
	objdir ("%{wks.location}/bin-int/" .. outputdir .. "/lib")

	includedirs {

		"include",
		"src",
		"%{IncludeDir.VULKAN_SDK}"
	}

	files {

		"src/VmaUsage.h", "src/VmaUsage.cpp"
	}

	defines "VMA_STATIC_VULKAN_FUNCTIONS"

	filter "system:windows"
		systemversion "latest"

	filter "configurations:Debug"
		defines "VE_DEBUG"
		runtime "Debug"
		symbols "On"

	filter "configurations:Release"
		defines "VE_RELEASE"
		runtime "Release"
		symbols "On"
		optimize "On"

	filter "configurations:Dist"
		defines "VE_DIST"
		runtime "Release"
		optimize "On"
