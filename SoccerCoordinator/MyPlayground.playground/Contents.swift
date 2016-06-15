//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
// Create collections for teams using empty arrays of dictionaries. I will add dictionaries of players to these as they are sorted.
var dragons: [Dictionary<String, AnyObject>] = []
var sharks: [Dictionary<String, AnyObject>] = []
var raptors: [Dictionary<String, AnyObject>] = []

// Create constants for practice times of each time to be easily updated
let dragonsPracticeTime = "March 17 at 1pm"
let sharksPracticeTime = "March 17 at 3pm"
let raptorsPracticeTime = "March 18 at 1pm"

// Create the initial array of dictionaries containing each player's personal information
let players: [Dictionary<String, AnyObject>] = [
    ["Name": "Joe Smith", "Height": 42, "Soccer Experience": true, "Guardian Names": "Jim and Jan Smith"],
    ["Name": "Jill Tanner", "Height": 36, "Soccer Experience": true, "Guardian Names": "Clara Tanner"],
    ["Name": "Bill Bon", "Height": 43, "Soccer Experience": true,"Guardian Names": "Sara and Jenny Bon"],
    ["Name": "Eva Gordon", "Height": 45, "Soccer Experience": false, "Guardian Names": "Wendy and Mike Gordon"],
    ["Name": "Matt Gill", "Height": 40, "Soccer Experience": false, "Guardian Names": "Charles and Sylvia Gill"],
    ["Name": "Kimmy Stein", "Height": 41, "Soccer Experience": false, "Guardian Names": "Bill and Hillary Stein"],
    ["Name": "Sammy Adams", "Height": 45, "Soccer Experience": false, "Guardian Names": "Jeff Adams"],
    ["Name": "Karl Saygan", "Height": 42, "Soccer Experience": true, "Guardian Names": "Heather Bledsoe"],
    ["Name": "Suzane Greenberg", "Height": 44, "Soccer Experience": true, "Guardian Names": "Henrietta Dumas"],
    ["Name": "Sal Dali", "Height": 41, "Soccer Experience": false, "Guardian Names": "Gala Dali"],
    ["Name": "Joe Kavalier", "Height": 39, "Soccer Experience": false, "Guardian Names": "Sam and Elaine Kavalier"],
    ["Name": "Ben Finkelstein", "Height": 44, "Soccer Experience": false, "Guardian Names": "Aaron and Jill Finkelstein"],
    ["Name": "Diego Soto", "Height": 41, "Soccer Experience": true, "Guardian Names": "Robin and Sarika Soto"],
    ["Name": "Chloe Alaska", "Height": 47, "Soccer Experience": false, "Guardian Names": "David and Jamie Alaska"],
    ["Name": "Arnold Willis", "Height": 43, "Soccer Experience": false, "Guardian Names": "Claire Willis"],
    ["Name": "Phillip Helm", "Height": 44, "Soccer Experience": true, "Guardian Names": "Thomas Helm and Eva Jones"],
    ["Name": "Les Clay", "Height": 42, "Soccer Experience": true, "Guardian Names": "Wynonna Brown"],
    ["Name": "Herschel Krustofski", "Height": 45, "Soccer Experience": true, "Guardian Names": "Hyman and Rachel Krustofski"]
]

// This retuns the count of experienced players allocated to each team
func experiencedPlayersPerTeam(players: [Dictionary<String, AnyObject>]) -> Int {
    var experiencedCount = 0
    for player in players {
        if (player["Soccer Experience"] as! Bool == true) {
            experiencedCount += 1
        }
    }
    
    return experiencedCount / 3
    
}


// This performs the actual sorting and printing via several for-in loops and if statements iterating through the arrays of dictionaries
func sortAndPrintLetters(players: [Dictionary<String, AnyObject>]) {
    var experiencedPlayers: [Dictionary<String, AnyObject>] = []
    var inexperiencedPlayers: [Dictionary<String, AnyObject>] = []
    let totalNumPerTeam: Int = players.count / 3
    let numExpPerTeam = experiencedPlayersPerTeam(players)
    
    // First sort the players into 2 lists, experienced and inexperienced
    for player in players {
        if (player["Soccer Experience"] as! Bool == true) {
            experiencedPlayers.append(player)
        } else {
            inexperiencedPlayers.append(player)
        }
    }
    
    // Sort out experienced players into the appropriate calculated number per team
    for player in experiencedPlayers {
        if (dragons.count < numExpPerTeam) {
            dragons.append(player)
        } else if (sharks.count < numExpPerTeam) {
            sharks.append(player)
        } else {
            raptors.append(player)
        }
    }
    
    // Sort out inexperienced players until the teams are full
    for player in inexperiencedPlayers {
        if (dragons.count < totalNumPerTeam) {
            dragons.append(player)
        } else if (sharks.count < totalNumPerTeam) {
            sharks.append(player)
        } else {
            raptors.append(player)
        }
    }
    
    // Print letters to guardians of each team containing guardian names,
    for player in dragons {
        print("Dear \(player["Guardian Names"] as! String), \n Your child, \(player["Name"] as! String), has been selected to play on the Dragons team in our league. Please be at practice on \(dragonsPracticeTime). \n Thank you and congratulations on making the Dragons team!")
    }
    for player in sharks {
        print("Dear \(player["Guardian Names"] as! String), \n Your child, \(player["Name"] as! String), has been selected to play on the Sharks team in our league. Please be at practice on \(sharksPracticeTime). \n Thank you and congratulations on making the Sharks team!")
    }
    for player in raptors {
        print("Dear \(player["Guardian Names"] as! String), \n Your child, \(player["Name"] as! String), has been selected to play on the Raptors team in our league. Please be at practice on \(raptorsPracticeTime). \n Thank you and congratulations on making the Raptors team!")
    }
}

sortAndPrintLetters(players)
