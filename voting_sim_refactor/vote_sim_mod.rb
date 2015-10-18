require "./vote_sim_classes"
include VoteSymModClasses

class MainProgram

def initBRO
  @voter_array = Array.new
  @candidate_array = Array.new
end


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
        person_update_menu
      when "r"
        voter_simulation_method
      when "q"
        quit_game
      else
        ### Invalid Response ###
        main_menu
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
      puts "You have created #{voter_name.name}"
      @voter_array << voter_name
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
### List Voters ###
  when "v"
  @voter_array.each { |x|
  print x.name + " "
  print x.politics
  puts
  }

### List Candidates ###
  when "c"
  @candidate_array.each { |x|
  print x.name + " "
  print x.party
  puts
  }
  else
    puts "Invalid Response! Try again."
    list_arrays
  end
  main_menu
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
      @candidate_array << candidate_name
      sleep(0.5)

      puts "Returning to Main Menu"
      ### Jump back to Main Menu ###
      main_menu
  end


### Person Updater ###
  def person_update_menu
    puts <<-END
    You have selected to update a person.
    Would you like to update a (c)andidate or a (v)oter?
    END

    user_choice = gets.chomp.downcase

    case user_choice
      when "c"
      ### Go to Update Candidate ###
      candidate_update

      when "v"
      ### Go to Update Voter ###
      voter_update

      else
      puts "Invalid Response! Try again."
      person_update_menu
    end
  end

############# Update Candidate #############
def candidate_update
  puts <<-END
  You have selected to update a Candidate.
  Below is a list of Candidates, please select a candidate by name.
  END
  sleep 2

  ### Provide a list of names to user ###
  @candidate_array.each { |x|
  print x.name + ", "
  }

  sleep 1

  puts "Which candidate would you like to update?"
  candidate_choice = gets.chomp

  ### Compare User input against Candidate Array ###
  @candidate_array.each { |x|
    if x.name == candidate_choice
      puts <<-END
      #{x.name} of the #{x.party} Located!
      What would you like to update the name to?
      END
      ### Get new name ###
      new_name = gets.chomp

      ### Get new party ###
      puts <<-END
      What party are they with?
      a) Democrat
      b) Republican
      END
      new_party = gets.chomp.downcase

       ### Update the values ###
        case new_party
          when "a"
            x.name = new_name
            x.party = "Democrat"
            puts "Update complete returning to main menu."
            main_menu
          when "b"
            x.name = new_name
            x.party = "Republican"
            puts "Update complete returning to main menu."
            main_menu
          else
            puts "Invalid Input."
            candidate_update
        end
    else
      puts "Checking..."
      puts
    end
    }
    puts "No user with that name located. Returning to Main Menu."
    main_menu
  end
##########     ##########



############# Update Voter #############
  def voter_update
    puts <<-END
    You have selected to update a voter.
    Below is a list of voters, please select a voter by name.
    END
    sleep 2

    ### Provide a list of names to user ###
    @voter_array.each { |x|
    print x.name + ", "
    }

    sleep 1

    puts "Which voter would you like to update?"
    voter_choice = gets.chomp

    ### Compare User input against Voter Array ###
    @voter_array.each { |x|
      if x.name == voter_choice

        ### Get new name ###
        puts <<-END
        #{x.name}, supporter of the #{x.politics} Located!
        What would you like to update the name to?
        END
        new_name = gets.chomp

        ### Get new party ###
        puts <<-END
        What political group do they support?
        a) Liberal
        b) Conservative
        c) Tea Party
        d) Socialist
        If you do not select one of the above options, your voters politics are Neutral.
        END
        new_party = gets.chomp.downcase

         ### Update the values ###
          case new_party
            when "a"
              x.name = new_name
              x.politics = "Liberal"
              puts "Update complete returning to main menu."
              main_menu
            when "b"
              x.name = new_name
              x.politics = "Conservative"
              puts "Update complete returning to main menu."
              main_menu
            when "c"
              x.name = new_name
              x.politics = "Tea Party"
              puts "Update complete returning to main menu."
              main_menu
            when "d"
              x.name = new_name
              x.politics = "Socialist"
              puts "Update complete returning to main menu."
              main_menu
            else
              puts "You did not select any of the above options, defaulting to Neutral."
              x.name = new_name
              x.politics = "Neutral"
              sleep(0.2)
              puts "Update complete returning to main menu."
              main_menu
          end
      else
        puts "Checking..."
        puts
      end
      }
      puts "No user with that name located. Returning to Main Menu."
      main_menu
    end
##########     ##########


####################### VOTER SIMULATION #############################
def voter_simulation_method
  if @candidate_array.empty? == true || @voter_array.empty? == true
    puts <<-END
    You must have at least 1 voter and 1 candidate to run a vote.
    Please create at least one of each and return to run a simulation.
    END
    main_menu
  else
    #### Run Simulation ### Stump speech function???
    stump_speech

  end

end



### Function Convincing Voters ###
    def stump_speech
      @candidate_array.each { |x|

        ### Democrat Speech Begin Here ###
        if x.party == "Democrat"
          @voter_array.each { |y|
            case y.politics

            ### Democrat attempting to convince Liberal for vote ###
            when "Liberal"
              lib_stats = [1,2,3,4].sample
              if y.vote == true && [1,2,3,4].sample != lib_stats
                puts "I #{y.name} am voting for #{x.name}!"
                y.vote = false
                x.votes += 1
              elsif y.vote == true && [1,2,3,4].sample == lib_stats
                puts "I #{y.name} am not voting for #{x.name}."
              else
                puts "I #{y.name} already voted."
              end

            ### Democrat attempting to convince Conservative for vote ###
            when "Conservative"
              conserv_stats = [1,2,3,4].sample
              if y.vote == true && [1,2,3,4].sample == conserv_stats
                puts "I #{y.name} am voting for #{x.name}!"
                y.vote = false
                x.votes += 1
              elsif y.vote == true && [1,2,3,4].sample != conserv_stats
                puts "I #{y.name} am not voting for #{x.name}."
              else
                puts "I #{y.name} already voted."
              end

            ### Democrat attempting to convince Tea Party for vote ###
            when "Tea Party"
              tea_part_stats = [1,2,3,4,5,6,7,8,9,10].sample
              if y.vote == true && [1,2,3,4,5,6,7,8,9,10].sample == tea_part_stats
                puts "I #{y.name} am voting for #{x.name}!"
                y.vote = false
                x.votes += 1
              elsif y.vote == true && [1,2,3,4,5,6,7,8,9,10].sample != tea_part_stats
                puts "I #{y.name} am not voting for #{x.name}."
              else
                puts "I #{y.name} already voted."
              end

            ### Democrat attempting to convince Socialist for vote ###
            when "Socialist"
              socialist_stats = [1,2,3,4,5,6,7,8,9,10].sample
              if y.vote == true && [1,2,3,4,5,6,7,8,9,10].sample != socialist_stats
                puts "I #{y.name} am voting for #{x.name}!"
                y.vote = false
                x.votes += 1
              elsif y.vote == true && [1,2,3,4,5,6,7,8,9,10].sample == socialist_stats
                puts "I #{y.name} am not voting for #{x.name}."
              else
                puts "I #{y.name} already voted."
              end

            ### Democrat attempting to convince Neutral for vote ###
            when "Neutral"
              neutral_stats = [1,2].sample
              if y.vote == true && [1,2].sample == neutral_stats
                puts "I #{y.name} am voting for #{x.name}!"
                y.vote = false
                x.votes += 1
              elsif y.vote == true && [1,2].sample != neutral_stats
                puts "I #{y.name} am not voting for #{x.name}."
              else
                puts "I #{y.name} already voted."
              end

            ### Candidate passed through had no political alignment ###
            ### This should NEVER Happen! ###
            else
              puts "A CANDIDATE ENTERED DID NOT HAVE A POLITICAL ALIGNMENT!"
              sleep 3

            end
          }
          #^^##^^##^^# Democrat Computations Complete #^^##^^##^^#

        ### Begin Republican Calculations! ###
        ### Republican Speeches Begin Here! ###
        else
          @voter_array.each { |z|
            case z.politics

              ### Republican attempting to convince Liberal for vote ###
              when "Liberal"
                lib2_stats = [1,2,3,4].sample
                if z.vote == true && [1,2,3,4].sample == lib2_stats
                  puts "I #{z.name} am voting for #{x.name}!"
                  z.vote = false
                  x.votes += 1
                elsif z.vote == true && [1,2,3,4].sample != lib2_stats
                  puts "I #{z.name} am not voting for #{x.name}."
                else
                  puts "I #{z.name} already voted."
                end

              ### Republican attempting to convince Conservative for vote ###
              when "Conservative"
                conserv2_stats = [1,2,3,4].sample
                if z.vote == true && [1,2,3,4].sample != conserv2_stats
                  puts "I #{z.name} am voting for #{x.name}!"
                  z.vote = false
                  x.votes += 1
                elsif z.vote == true && [1,2,3,4].sample == conserv2_stats
                  puts "I #{z.name} am not voting for #{x.name}."
                else
                  puts "I #{z.name} already voted."
                end

              ### Republican attempting to convince Tea Party for vote ###
              when "Tea Party"
                tea_part2_stats = [1,2,3,4,5,6,7,8,9,10].sample
                if z.vote == true && [1,2,3,4,5,6,7,8,9,10].sample != tea_part2_stats
                  puts "I #{z.name} am voting for #{x.name}!"
                  z.vote = false
                  x.votes += 1
                elsif z.vote == true && [1,2,3,4,5,6,7,8,9,10].sample == tea_part2_stats
                  puts "I #{z.name} am not voting for #{x.name}."
                else
                  puts "I #{z.name} already voted."
                end

              ### Republican attempting to convince Socialist for vote ###
              when "Socialist"
                socialist2_stats = [1,2,3,4,5,6,7,8,9,10].sample
                if z.vote == true && [1,2,3,4,5,6,7,8,9,10].sample == socialist2_stats
                  puts "I #{z.name} am voting for #{x.name}!"
                  z.vote = false
                  x.votes += 1
                elsif z.vote == true && [1,2,3,4,5,6,7,8,9,10].sample != socialist2_stats
                  puts "I #{z.name} am not voting for #{x.name}."
                else
                  puts "I #{z.name} already voted."
                end

              ### Democrat attempting to convince Neutral for vote ###
              when "Neutral"
                neutral2_stats = [1,2].sample
                if z.vote == true && [1,2].sample == neutral2_stats
                  puts "I #{z.name} am voting for #{x.name}!"
                  z.vote = false
                  x.votes += 1
                elsif z.vote == true && [1,2].sample != neutral2_stats
                  puts "I #{z.name} am not voting for #{x.name}."
                else
                  puts "I #{z.name} already voted."
                end

              ### Candidate passed through had no political alignment ###
              ### This should NEVER Happen! ###
              else
                puts "A CANDIDATE ENTERED DID NOT HAVE A POLITICAL ALIGNMENT!"
                sleep 3

              end ### Ending Republican Calculation Case ###
          } ### Ending Republican .each on the array ###

        end ### Ending Democrat/Republican If Else Statement ###

      } ### Ending .each of the candidates ###
      display_vote_results
    end ### Ending Stump Speech Method ###


##^^##^^##^^##^^##^^##^^##^^##^^##^^##^^##^^##^^##^^##^^##^^##^^##^^##

### Display the vote result ###
def display_vote_results
  @candidate_array.each { |x|
  puts
  puts "#{x.name} received #{x.votes} votes!"
  }
  puts
  main_menu
end



### Quit Game Method ###
  def quit_game
    puts "Quitting Vote Sim."
    @again = false
  end




end
