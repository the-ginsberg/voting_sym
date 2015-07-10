require "./voting_sym_classes"
include VoteSymModClasses


module VoteSym

### Top Menu of Voting Sim ###
def main_menu
  puts <<-END
  Welcome to Voting Simulator, created by Jeff Ginsberg.
  What would you like to do?
  (C)reate People; voters or politicians.
  (L)ist the existing people.
  (U)pdate or delete existing people.
  (R)un the simulation.
  (Q)uit
  Please enter the letter corresponding to your choice.
  END

  player_choice = gets.chomp.downcase
  ### Decide where to send player next. ###
    case player_choice
      when "c"
        ### Send player to Creation Method ###
      when "l"
        ### List Created Entities to User ###
      when "u"
        ### Send player to entity update method ###
      when "r"
        ### Run Simulation or fail if missing entities ###
      when "q"
        ### Quit Program ###
      else
        ### Invalid Response ###
      end

  end

  ### Create People top Menu ###
  def people_creation_menu
    puts <<-END
    You have selected to create a Person.
    Which would you like to create?
    (V)oter
    (P)olitician
    END

    player_choice = gets.chomp.downcase
    ### Decide where to send player next ###
        case player_choice
          when "v"
          ### Create a Voter ###
          when "p"
          ### Create a Politician ###
          else
          ### Invalid Response ###
        end
  end


  ### Voter Creation Method ###
  def create_new_voter
    puts <<-END
    You have selected to create a new voter!
    What is the new voters name?
    END
    voter_name = gets.chomp

    sleep(0.5)

    puts <<-END
    Please select a Political Party that your voter is affiliated with:
    a) Liberal
    b) Conservative
    c) Tea Party
    d) Socialist
    If you do not select one of the above options, your voters politics are Neutral.
    END

    voter_politics_choice = gets.chomp.downcase
      case voter_politics_choice
        when "a"
          voter_name = Voter.new(voter_name, "Liberal")
        when "b"
          voter_name = Voter.new(voter_name, "Conservative")
        when "c"
          voter_name = Voter.new(voter_name, "Tea Party")
        when "d"
          voter_name = Voter.new(voter_name, "Socialist")
        else
          voter_name = Voter.new(voter_name, "Neutral")
      end
      puts "You have created #{voter_name}"
      sleep(0.5)

      puts "Returning to Main Menu"
      ### Jump back to Main Menu ###
      main_menu
  end


end
