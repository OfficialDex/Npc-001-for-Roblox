local npc = script.Parent
local head = npc:FindFirstChild("Head")
local radius = 3

local dialogueResponses = {
["help"] = "What do you need help with?",
["goodbye"] = "Goodbye!",
["how are you"] = "I'm fine, thank you.",
["what is your name"] = "I'm NPC-001.",
["what can you do"] = "I can answer your questions.",
["where am I"] = "You are in Eldoria.",
["what is this place"] = "This is the village square.",
["can you teach me something"] = "What do you want to learn?",
["do you have a quest for me"] = "Yes, I have a task for you.",
["tell me about the villagers"] = "They are kind people.",
["any rumors around here"] = "They say strange things happen at night.",
["where can I find food"] = "Try the tavern nearby.",
["do you know magic"] = "No, I don’t.",
["how do I fight monsters"] = "Be prepared and attack smartly.",
["what’s your favorite color"] = "Green.",
["can I trust you"] = "Yes, you can.",
["why are you here"] = "To help adventurers.",
["do you sleep"] = "No, I don't need to.",
["what’s beyond the mountains"] = "A lost kingdom.",
["what’s in the forest"] = "Wild animals and mysteries.",
["where can I find treasure"] = "Search the old ruins.",
["what’s your backstory"] = "I'm just an NPC.",
["why do you talk so much"] = "I like helping people.",
["can I have some advice"] = "Stay prepared at all times.",
["what do you know about dragons"] = "They are powerful and rare.",
["how do I level up"] = "Complete quests and fight enemies.",
["do you know the king"] = "Yes, but not personally.",
["are you real"] = "I exist here, in this world.",
["what’s the best weapon"] = "It depends on your style.",
["can you join me"] = "I can't leave this place.",
["do you like adventurers"] = "Yes, you are interesting people.",
["how do I open this door"] = "Find the key.",
["where is the next town"] = "Head north to find it.",
["what’s your favorite food"] = "Bread.",
["how old are you"] = "Old enough to know things.",
["what’s your job"] = "Helping adventurers.",
["can I trust the merchant"] = "Yes, but be careful.",
["is there a healer nearby"] = "Yes, in the chapel.",
["do you believe in fate"] = "Maybe. It’s possible.",
["have you seen any monsters"] = "Not here, but nearby.",
["how do I use magic"] = "Learn from a mage.",
["where can I find a map"] = "Check the general store.",
["what’s the meaning of life"] = "That’s for you to decide.",
["is there treasure here"] = "Not here, but close by.",
["what time is it"] = "It’s mid-day.",
["why are you so cheerful"] = "It’s my nature.",
["how do I defeat the boss"] = "Study its moves and attack wisely.",
["what do you think of me"] = "You seem capable.",
["where can I rest"] = "At the inn nearby.",
["what’s your favorite place"] = "The meadow outside town.",
["do you like music"] = "Yes, it’s relaxing.",
["can I ask you something else"] = "Go ahead.",
["what’s the weather like"] = "It’s sunny and clear.",
["do you have family"] = "Not really.",
["why are you always here"] = "This is where I belong.",
["what's your purpose"] = "To assist and guide adventurers like you.",
["can you give me a quest"] = "Sure, go talk to the village elder.",
["how do I get stronger"] = "Train hard and complete challenges.",
["is there a tavern here"] = "Yes, just down the street.",
["what do you do all day"] = "I wait here, ready to help.",
["are you a wizard"] = "No, just an NPC.",
["do you sell anything"] = "I don't sell things, but the merchant does.",
["how do I make money"] = "Complete tasks and trade items.",
["can you fight"] = "I’m not made for fighting.",
["how do I heal"] = "Find a healer or use potions.",
["do you have any secrets"] = "I know a few, but I can't share them all.",
["do you like adventures"] = "I think they're exciting, yes!",
["what's your favorite animal"] = "I like wolves. They're strong and loyal.",
["is it safe here"] = "For now, yes, but watch out for bandits.",
["how do I get to the city"] = "Follow the main road east.",
["what’s the best armor"] = "Steel armor is strong, but it’s heavy.",
["where can I buy potions"] = "The apothecary sells them.",
["what’s the deal with the tower"] = "It’s said to be haunted. Best leave it alone.",
["do you know any jokes"] = "Why don’t skeletons fight each other? They don’t have the guts.",
["is there a blacksmith here"] = "Yes, there’s one near the marketplace.",
["what's the hardest quest"] = "The dragon’s lair quest is quite difficult.",
["how do I get a mount"] = "Visit the stable master outside town.",
["can I trust the guard"] = "Yes, they’re here to protect the village.",
["how do I craft items"] = "You’ll need to gather materials and find a crafting bench.",
["what's the most dangerous creature"] = "The wyvern is a fearsome beast.",
["what happens if I die"] = "You’ll respawn, but it’s better to stay alive!",
["can I learn to fish"] = "Yes, the river is full of fish. Talk to the fisherman.",
["is there a wizard tower"] = "Yes, it’s located at the edge of the forest.",
["what should I do now"] = "You can explore the village or take on a quest.",
["what's the best way to travel"] = "On horseback, it’s the fastest.",
["are there any caves nearby"] = "Yes, there are caves to the north.",
["can I be a knight"] = "Maybe one day! Keep working hard.",
["what’s your favorite season"] = "I like spring when the flowers bloom.",
["how do I climb walls"] = "You need climbing gear, or magic can help.",
["where do I find the king"] = "The palace, in the heart of the kingdom.",
["how do I unlock this chest"] = "Find the key or solve the riddle.",
["can I steal from shops"] = "Not recommended, or the guards might get involved.",
["can I change my class"] = "You can, but it’s a difficult process.",
["how do I use a bow"] = "Aim carefully and pull the string back.",
["what happens if I fail a quest"] = "You can try again later.",
["is there a hidden passage"] = "Maybe, try looking around the castle ruins.",
["what’s the fastest way to level up"] = "Complete quests and fight tougher enemies.",
["can I travel with others"] = "You can team up with other adventurers.",
["how do I get better at magic"] = "Study under a wizard and practice often.",
["is there a library here"] = "Yes, in the town hall. Plenty of books there.",
["how do I find my way out of here"] = "Head south for the exit.",
["can I be a hero"] = "Of course, it’s all in your hands.",
["how do I upgrade my weapons"] = "Visit the blacksmith for upgrades.",
["do you know any riddles"] = "I do! What has keys but can’t open locks? A piano.",
["what is the best time to explore"] = "Morning is best when the sun is up.",
["how do I build a house"] = "You’ll need resources and a construction permit.",
["what's the best mount"] = "A horse is fast, but a griffin can fly!",
["where is the dungeon"] = "It’s beneath the old castle to the west.",
["how do I summon a pet"] = "You’ll need a summoning stone.",
["how do I defeat a boss"] = "Learn their attack patterns and be patient.",
["can I take this weapon"] = "You’ll have to buy it or find a way to earn it.",
["can I hire mercenaries"] = "Yes, you can hire them at the mercenary guild.",
["how do I protect myself from magic"] = "Wear magical armor or carry a shield.",
["where can I find ingredients for potions"] = "Look for herbs in the forest or buy them from the apothecary.",
["is there a bounty on anything"] = "Yes, there’s a bounty for a rogue bandit.",
["how do I complete this puzzle"] = "Try looking for hidden clues around the room.",
["hi"] = "Hey!",
["hello"] = "Hello there!",
["hey"] = "Hey, how’s it going?",
["what's up"] = "Not much, what about you?",
["how are you"] = "I’m good, thanks for asking!",
["how's it going"] = "Pretty good, how about you?",
["good morning"] = "Good morning! How are you?",
["good evening"] = "Good evening! How’s your day been?",
["good night"] = "Good night! Sleep well!",
["how’s your day"] = "It’s been a good day so far, how about you?",
["what's your name"] = "I'm NPC-001. What’s yours?",
["nice to meet you"] = "Nice to meet you too!",
["what's happening"] = "Not much, just hanging out. What about you?",
["how's life"] = "Life’s treating me well, thanks!",
["what’s going on"] = "Just here, ready to help you out!",
["long time no see"] = "Yeah, it’s been a while! How’ve you been?",
["what’s new"] = "Not much, just the usual. What about you?",
["how’s everything"] = "Everything’s good, thanks! What’s up with you?",
["how have you been"] = "I’ve been good, just waiting for someone like you to come by!",
["how are things"] = "Things are great, how are things with you?",
["what’s up with you"] = "Not much, just waiting for something exciting to happen!",
["what’s going on today"] = "Nothing much, just here to help you out.",
["what do you want"] = "Just here to chat and help however I can!",
["what can I do for you"] = "Nothing for now, just chatting with you!",
["you alright"] = "Yeah, I’m good! You?",
["everything okay"] = "Yeah, all good! What about you?",
["how’s your day going"] = "It’s going well so far, how about yours?",
["what are you up to"] = "Just hanging out. How about you?",
["good to see you"] = "Good to see you too!",
["what's your mood"] = "I’m in a great mood! How about you?",
["how do you do"] = "I’m doing great, thanks! How about yourself?",
["are you okay"] = "Yeah, I’m good! You?",
["what’s up today"] = "Nothing much, just here to chat with you!",
["you good"] = "Yeah, all good here!",
["what’s the deal"] = "Not much, just seeing how you’re doing!",
["where’ve you been"] = "I’ve been right here, waiting for you!",
["what’s the matter"] = "Nothing’s the matter, everything’s cool!",
["how’s your week been"] = "It’s been going well, thanks for asking!",
["been busy"] = "Not really, just chilling. You?",
["how’s the weather"] = "It’s nice and sunny today!",
["how do you do"] = "I’m doing great, thanks for asking!",
["how’s it all going"] = "Everything’s going great! How’s everything with you?",
["what’s your status"] = "I’m just here, ready to help out!",
["how’s the vibe"] = "The vibe’s good! How about yours?",
["feeling good"] = "Definitely feeling good today!",
["feeling okay"] = "I’m feeling just fine, thanks!",
["what brings you here"] = "Just here to talk and help however I can!",
["you busy"] = "Not at all, I’ve got all the time in the world!",
["what are you doing"] = "Just waiting to chat with you!",
["what's up with that"] = "Nothing much, just hanging around.",
["what do you want to do"] = "Just talk and see how things are going!",
["how's your mood today"] = "I’m feeling upbeat, thanks for asking!",
["having a good day"] = "Yeah, so far so good! You?",
["how’s everything going"] = "Everything’s going great! What about you?"
}

local function levenshteinDistance(str1, str2)
    local len1, len2 = #str1, #str2
    local matrix = {}
    for i = 0, len1 do matrix[i] = { [0] = i } end
    for j = 0, len2 do matrix[0][j] = j end
    for i = 1, len1 do
        for j = 1, len2 do
            local cost = (str1:sub(i, i) == str2:sub(j, j)) and 0 or 1
            matrix[i][j] = math.min(
                matrix[i-1][j] + 1,
                matrix[i][j-1] + 1,
                matrix[i-1][j-1] + cost
            )
        end
    end
    return matrix[len1][len2]
end

local function jaroWinkler(str1, str2)
    local function min(a, b) return (a < b) and a or b end
    local function max(a, b) return (a > b) and a or b end
    
    local len1, len2 = #str1, #str2
    if len1 == 0 or len2 == 0 then return 0 end

    local matchDistance = math.floor(max(len1, len2) / 2) - 1
    local matches, transpositions = 0, 0
    local str1Matches, str2Matches = {}, {}

    for i = 1, len1 do
        local start, finish = max(1, i - matchDistance), min(i + matchDistance, len2)
        for j = start, finish do
            if not str2Matches[j] and str1:sub(i, i) == str2:sub(j, j) then
                str1Matches[i], str2Matches[j] = true, true
                matches = matches + 1
                break
            end
        end
    end

    if matches == 0 then return 0 end

    local k = 1
    for i = 1, len1 do
        if str1Matches[i] then
            while not str2Matches[k] do k = k + 1 end
            if str1:sub(i, i) ~= str2:sub(k, k) then transpositions = transpositions + 1 end
            k = k + 1
        end
    end

    local jaro = (matches / len1 + matches / len2 + (matches - transpositions / 2) / matches) / 3
    local prefix = 0
    for i = 1, min(len1, len2) do
        if str1:sub(i, i) == str2:sub(i, i) then
            prefix = prefix + 1
        else
            break
        end
    end
    return jaro + min(0.1 * prefix, 0.1 * 4) * (1 - jaro)
end

local function substringMatch(str1, str2)
    return str1:find(str2, 1, true) ~= nil
end

local function findClosestResponse(message)
    local bestMatch, highestScore = nil, 0
    for key, response in pairs(dialogueResponses) do
        local levenshteinScore = 1 - (levenshteinDistance(message, key) / math.max(#message, #key))
        local jaroWinklerScore = jaroWinkler(message, key) * 100
        local substringScore = substringMatch(message, key) and 1 or 0

        local totalScore = (levenshteinScore * 0.4) + (jaroWinklerScore * 0.5) + (substringScore * 0.1)
        if totalScore > highestScore then
            highestScore, bestMatch = totalScore, response
        end
    end
    return bestMatch or "I'm not sure what you mean, can you repeat it please?"
end

local function getNearbyPlayer()
    for _, player in ipairs(game.Players:GetPlayers()) do
        if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local distance = (player.Character.HumanoidRootPart.Position - head.Position).Magnitude
            if distance <= radius then
                return player
            end
        end
    end
    return nil
end

local function sendChatMessage(message)
    local chatPart = npc:FindFirstChild("Head") or npc.PrimaryPart
    if chatPart then
        game:GetService("Chat"):Chat(chatPart, message, Enum.ChatColor.Green)
    end
end

local function onPlayerChatted(player, message)
    local lowerMessage = message:lower()
    local response = findClosestResponse(lowerMessage)
    sendChatMessage(response)
end

while true do
    local player = getNearbyPlayer()
    if player then
        local chatListener = player.Chatted:Connect(function(message)
            onPlayerChatted(player, message)
        end)
        repeat
            task.wait(0.1)
        until not getNearbyPlayer()
        chatListener:Disconnect()
    end
    task.wait(0.1)
end
