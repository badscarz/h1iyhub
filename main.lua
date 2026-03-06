local Main = {
    GitRepoName = "badscarz/h1iyhub",
    Branch = "main",
    CurrentVersion = "v1.0.3" -- Change this locally to test the update trigger
}

local function GetFile(fileName)
    local url = "https://raw.githubusercontent.com/" .. Main.GitRepoName .. "/" .. Main.Branch .. "/" .. fileName
    local success, content = pcall(game.HttpGet, game, url)
    return (success and content) and content or nil
end

local hashDataStr = GetFile("ModuleHashs.dat")

if hashDataStr then
    local success, LatestHashes = pcall(function() return loadstring(hashDataStr)() end)
    
    if success and LatestHashes then
        if LatestHashes["MainScript"] ~= Main.CurrentVersion then
            print("[h1iyHub] Updating to " .. LatestHashes["MainScript"] .. "...")
            local scriptContent = GetFile("script.lua")
            if scriptContent then loadstring(scriptContent)() end
        else
            print("[h1iyHub] Up to date. Loading...")
            local scriptContent = GetFile("script.lua")
            if scriptContent then loadstring(scriptContent)() end
        end
    else
        warn("[h1iyHub] Hash file error.")
    end
else
    warn("[h1iyHub] Connection failed.")
end
