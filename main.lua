-- Configuration
local Main = {
    GitRepoName = "badscarz/h1iyhub",
    Branch = "main" -- Make sure this matches your GitHub branch name!
}

-- Simple Fetcher (No subfolders)
local function GetFile(fileName)
    -- This builds: https://raw.githubusercontent.com/badscarz/h1iyhub/main/fileName
    local url = "https://raw.githubusercontent.com/" .. Main.GitRepoName .. "/" .. Main.Branch .. "/" .. fileName
    
    local success, content = pcall(game.HttpGet, game, url)
    
    if success and content then
        return content
    else
        warn("Failed to fetch: " .. fileName)
        return nil
    end
end

-- Example of how to use it:
local hashData = GetFile("ModuleHashs.dat")
local mainScript = GetFile("script.lua")

if mainScript then
    loadstring(mainScript)()
end
