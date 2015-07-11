require "./voting_sym_classes"
include VoteSymModClasses

$voter_array = Array.new
$candidate_array = Array.new

module VoteSym

### Top Menu of Voting Sim ###
def main_menu
  puts
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
        people_creation_menu
      when "l"
        list_arrays
      when "u"
        ### Send player to entity update method ###
      when "r"
        ### Run Simulation or fail if missing entities ###
      when "q"
        quit_game
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
          create_new_voter
          when "p"
          create_new_candidate
          else
          people_creation_menu
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
      $voter_array << voter_name
      sleep(0.5)

      puts "Returning to Main Menu"
      ### Jump back to Main Menu ###
      main_menu
  end


### List Information ###
def list_arrays
  puts <<-END
  Would you like to view candidates or voters?
  (C)andidates
  (V)oters
  END

  user_response = gets.chomp.downcase

  case user_response
  when "v"
  $voter_array.each { |x|
  print x.name + " "
  print x.politics
  puts
  }

  when "c"
  $candidate_array.each { |x|
  print x.name + " "
  print x.party
  puts
  }
  else
    puts "Invalid Response! Try again."
    list_arrays
  end

end



  ### Politician Creation Method ###
  def create_new_candidate
    puts <<-END
    You have selected to create a new Politician!
    What is the new candidates name?
    END
    candidate_name = gets.chomp

    sleep(0.5)

    puts <<-END
    Please select a Party that your Politician is affiliated with:
    a) Democrat
    b) Republican
    END

    candidate_party_choice = gets.chomp.downcase
      case candidate_party_choice
        when "a"
          candidate_name = Politician.new(candidate_name, "Democrat")
        when "b"
          candidate_name = Politician.new(candidate_name, "Republican")
        else
          puts "Invalid Party selection, please try again."
          create_new_candidate
      end
      puts "You have created #{candidate_name}"
      $candidate_array << candidate_name
      sleep(0.5)

      puts "Returning to Main Menu"
      ### Jump back to Main Menu ###
      main_menu
  end

  def quit_game
    puts "Quitting Vote Sim."
    @again = false
  end



end
