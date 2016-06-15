import Foundation


// create an empty collection variable to hold all the players’ data.

var dragons: [Dictionary<String, AnyObject>] = []
var raptors: [Dictionary<String, AnyObject>] = []
var sharks: [Dictionary<String, AnyObject>] = []

// constants for practice time letters

let dragonsPracticeTime = "March 17, at 1pm"
let raptorsPracticeTime = "March 18 ,at 1pm"
let sharksPracticeTime = "March 17, at 3pm"

//manually enter all players data

let allPlayersDict: [Dictionary<String, AnyObject>] = [
    
    ["name": "Joe Smith", "height": 42, "experience": true, "guardians": "Jim and Jan Smith"],
    ["name": "Jill Tanner", "height": 36, "experience": true, "guardians": "Clara Tanner"],
    ["name": "Bill Bon", "height": 43, "experience": true,"guardians": "Sara and Jenny Bon"],
    ["name": "Eva Gordon", "height": 45, "experience": false, "guardians": "Wendy and Mike Gordon"],
    ["name": "Matt Gill", "height": 40, "experience": false, "guardians": "Charles and Sylvia Gill"],
    ["name": "Kimmy Stein", "height": 41, "experience": false, "guardians": "Bill and Hillary Stein"],
    ["name": "Sammy Adams", "height": 45, "experience": false, "guardians": "Jeff Adams"],
    ["name": "Karl Saygan", "height": 42, "experience": true, "guardians": "Heather Bledsoe"],
    ["name": "Suzane Greenberg", "height": 44, "experience": true, "guardians": "Henrietta Dumas"],
    ["name": "Sal Dali", "height": 41, "experience": false, "guardians": "Gala Dali"],
    ["name": "Joe Kavalier", "height": 39, "experience": false, "guardians": "Sam and Elaine Kavalier"],
    ["name": "Ben Finkelstein", "height": 44, "experience": false, "guardians": "Aaron and Jill Finkelstein"],
    ["name": "Diego Soto", "height": 41, "experience": true, "guardians": "Robin and Sarika Soto"],
    ["name": "Chloe Alaska", "height": 47, "experience": false, "guardians": "David and Jamie Alaska"],
    ["name": "Arnold Willis", "height": 43, "experience": false, "guardians": "Claire Willis"],
    ["name": "Phillip Helm", "height": 44, "experience": true, "guardians": "Thomas Helm and Eva Jones"],
    ["name": "Les Clay", "height": 42, "experience": true, "guardians": "Wynonna Brown"],
    ["name": "Herschel Krustofski", "height": 45, "experience": true, "guardians": "Hyman and Rachel Krustofski"]
    
]
//print(allPlayersDict)
//print(allPlayersDict.count)

// create a way to iterate through the allPlayersDict and assign them to a team with even exp/not exp players

func sortExperience(allPlayers: [Dictionary<String, AnyObject>]) -> Int {
    var experienceLevel = 0
    for player in allPlayers {
        if player["experience"] as! Bool == true {
            experienceLevel += 1
        }
    }
    return experienceLevel / 3//number of teams
}

// sort for team decisions and printed letters to guardians

func sortForLetters(players: [Dictionary<String, AnyObject>]) {
  
    // a dictionary that will hold a list of all experienced players
    var playersWithExperience: [Dictionary<String, AnyObject>] = []
  
    // a dictionary that will hold a list of all inexperienced players
    var playersWithNoExperience: [Dictionary<String, AnyObject>] = []
   
    //number of players per team
    let numOfPlayersPerTeam: Int = allPlayersDict.count / 3
    
    //number of players with experience
    let numOfExpPlayersPerTeam = sortExperience(players)
    
    //i could do players without exp also, but since there are only 2 options i can use if/else logic
   
    
    //sort experience
    
    for player in allPlayersDict {
        if player["experience"] as! Bool == true {
            playersWithExperience.append(player)
        } else {
            playersWithNoExperience.append(player)
        }
    }
    //with exp
    for player in playersWithExperience {
        if dragons.count < numOfExpPlayersPerTeam {
            dragons.append(player)
        } else if raptors.count < numOfExpPlayersPerTeam {
            raptors.append(player)
        } else {
            sharks.append(player)
        }
    }
    //without exp
    for player in playersWithNoExperience {
        if (dragons.count < numOfPlayersPerTeam) {
            dragons.append(player)
        } else if raptors.count < numOfPlayersPerTeam {
            raptors.append(player)
        } else {
            sharks.append(player)
//            print(raptors.count)
        }
    }
    
    //build the letters for each team
    for player in dragons {
        print("Hello \(player["guardians"] as! String/*removes the optional type*/),\n \(player["name"] as! String) is going to be on the Dragons Team! Practice is as follows \(dragonsPracticeTime). See you there!")
    }
    
    for player in raptors {
        print("Hello \(player["guardians"] as! String/*removes the optional type*/),\n \(player["name"] as! String) is going to be on the Raptors Team! Practice is as follows \(raptorsPracticeTime). See you there!")
        
    }
    
    for player in sharks {
        print("Hello \(player["guardians"] as! String/*removes the optional type*/),\n \(player["name"] as! String) is going to be on the Sharks Team! Practice is as follows \(sharksPracticeTime). See you there!")
    }
}
// call to make it all work!
sortForLetters(allPlayersDict)

print(sharks.count)



