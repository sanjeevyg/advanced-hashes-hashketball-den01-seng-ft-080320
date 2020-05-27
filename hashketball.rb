# Write your code below game_hash
require "pry"
def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        {
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        {
          player_name: "Bismack Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10
        },
        {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        {
          player_name: "Kemba Walker",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }
end



def num_points_scored(players_name)
        game_hash.each {|location, team_data|
        team_data.each {|attribute, data|
          if attribute == :players
            data.each {|data_item|
                  if data_item[:player_name] == players_name
                    return data_item[:points]
                  end
            }
          end
        }
    }
end


def shoe_size(players_name)
        game_hash.each {|location, team_data|
        team_data.each {|attribute, data|
          if attribute == :players
            data.each {|data_item|
                  if data_item[:player_name] == players_name
                    return data_item[:shoe]
                  end
            }
          end
        }
    }
end



def  team_colors(team_name)
    game_hash.each {|location, team_data|
    team_data.each {|attribute, data|
      if game_hash[location][:team_name] == team_name
        return game_hash[location][:colors]
      end
    }
}
end



def team_names
  team_names = []
  game_hash.each {|location, team_data|
      game_hash[location][:team_name]
      team_names << game_hash[location][:team_name]
  }
  team_names
end



def player_numbers(team_name)
  player_numbers= []
  game_hash.each {|location, team_data|
    team_data.each {|attribute, data|
      if attribute == :players
        data.each {|data_item|
            if game_hash[location][:team_name] == team_name
              player_numbers << data_item[:number]
           end
       }
     end
   }
 }
 player_numbers.sort!
 player_numbers
end


def player_stats(player_name)
  game_hash.each {|location, team_data|
    team_data.each {|attribute, data|
      if attribute == :players
          counter = 0
          while counter < data.length do
            if game_hash[location][attribute][counter][:player_name] == player_name
              return game_hash[location][attribute][counter]
            end
            counter += 1
          end
     end
   }
 }
end



def big_shoe_rebounds
 #Find max shoe size
    array_shoe = []
    game_hash.each {|location, team_data|
      team_data.each {|attribute, data|
        if attribute == :players
          data.each {|data_set|
            data_set.each {|key, value|
              if key == :shoe
                array_shoe << value
              end
            }
          }
        end
     }
   }
   array_shoe.sort!.max

   #Find player with the largest shoe size and rebounds
   player_name = ""

  game_hash.each {|location, team_data|
  team_data.each {|attribute, data|
    if attribute == :players
        counter = 0
        while counter < data.length do
          if game_hash[location][attribute][counter][:shoe] == array_shoe.sort!.max
          player_name = game_hash[location][attribute][counter][:player_name]
          end
          if game_hash[location][attribute][counter][:player_name] == player_name
          return game_hash[location][attribute][counter][:rebounds]
          end
          counter += 1
        end
   end
 }
}
end


def most_points_scored
    points_scored = []
   game_hash.each {|location, team_data|
     team_data.each {|attribute, data|
       if attribute == :players
         data.each {|data_set|
           data_set.each {|key, value|
             if key == :points
               points_scored << value
             end
           }
         }
       end
    }
  }
  points_scored.sort!.max

  #Find player with the most points

game_hash.each {|location, team_data|
team_data.each {|attribute, data|
 if attribute == :players
     counter = 0
     while counter < data.length do
       if game_hash[location][attribute][counter][:points] == points_scored.sort!.max
       return game_hash[location][attribute][counter][:player_name]
       end
       counter += 1
     end
end
}
}
end

  



def winning_team 
  #Home Team Points
  points = []
  game_hash.each {|location, team_data|
  if location == :home
    team_data.each {|attribute, data|
      if attribute == :players
        counter = 0
        while counter < data.length do
          points << game_hash[location][attribute][counter][:points]
          counter += 1
        end
      end
    }
  end
  }
  sum_home = 0
  counter_1 = 0
  while counter_1 < points.length do
    sum_home += points[counter_1]
    counter_1 += 1
  end

   #Away team points

   points_away = []
   game_hash.each {|location, team_data|
   if location == :away
     team_data.each {|attribute, data|
       if attribute == :players
         counter = 0
         while counter < data.length do
           points_away << game_hash[location][attribute][counter][:points]
           counter += 1
         end
       end
     }
   end
   }
   sum_away = 0
   counter_1 = 0
   while counter_1 < points.length do
     sum_away += points[counter_1]
     counter_1 += 1
   end

   if sum_home > sum_away
     return :home
   else
     return :away
   end
end

  

def player_with_longest_name

  names = []
  game_hash.each {|location, team_data|
    team_data.each {|attribute, data|
      if attribute == :players
        counter = 0
        while counter < data.length do
          names << game_hash[location][attribute][counter][:player_name].length
          counter += 1
        end
      end
    }
  }
  names.sort!.max

game_hash.each {|location, team_data|
team_data.each {|attribute, data|
 if attribute == :players
     counter = 0
     while counter < data.length do
       if game_hash[location][attribute][counter][:player_name].length == names.sort!.max
       return game_hash[location][attribute][counter][:player_name]
       end
       counter += 1
     end
end
}
}
end


def long_name_steals_a_ton?
  steals = []
  game_hash.each {|location, team_data|
    team_data.each {|attribute, data|
      if attribute == :players
        counter = 0
        while counter < data.length do
          steals << game_hash[location][attribute][counter][:steals]
          counter += 1
        end
      end
    }
  }
  steals.sort!.max

steal_by_player = "".to_i
game_hash.each {|location, team_data|
team_data.each {|attribute, data|
 if attribute == :players
     counter = 0
     while counter < data.length do
       if game_hash[location][attribute][counter][:player_name] == "Bismack Biyombo"
        steal_by_player = game_hash[location][attribute][counter][:steals]
       end
       counter += 1
     end
end
}
}
if steal_by_player == steals.sort!.max
  return true
else
  return false
end
end





















