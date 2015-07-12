module VoteSymModClasses

### Voter Class ###
  class Voter
    attr_accessor :name, :politics

    def initialize(name, politics)
      @name = name
      @politics = politics
      @vote = true
    end

  end

### Politician Class ###
  class Politician
    attr_accessor :name, :party

    def initialize(name, party)
      @name = name
      @party = party
      @votes = 1
    end

  end
end
