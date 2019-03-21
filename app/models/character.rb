class Character < ApplicationRecord

  def generate_first_name
    num = gen_random_num(2)
    case num
    when 1
      return Faker::Name.first_name
    when 2
      return Faker::Games::ElderScrolls.first_name
    end    
  end

  def generate_last_name
    num = gen_random_num(2)
    case num
    when 1
      return Faker::Name.first_name
    when 2
      return Faker::Games::ElderScrolls.first_name
    end    
    #Faker::Games::ElderScrolls.last_name 
    #Faker::Name.last_name
  end

  def generate_alias
    # Faker::Ancient.god #=> "Zeus"
    # Faker::Ancient.primordial #=> "Gaia"
    # Faker::Ancient.titan #=> "Atlas"
    # Faker::Books::Lovecraft.deity
  end

  def generate_motto
    #Faker::GreekPhilosophers.quote #=> "Only the educated are free."
    #Faker::Marketing.buzzwords #=> "rubber meets the road", "sprint to the finish line"
    #Faker::Books::Dune.saying #=> "You do not beg the sun for mercy."
    #Faker::Games::Dota.quote #=> "Easy now, this stuff is explosive!"
    #Faker::Games::Fallout.quote #=> "Democracy is non-negotiable"
    #Faker::Games::HeroesOfTheStorm.quote #=> "MEAT!!!"
    #Faker::Games::Witcher.quote # => "No Lollygagin'!"
    #Faker::Games::LeagueOfLegends.quote #=> "Purge the unjust."
    #Faker::Games::WorldOfWarcraft.quote #=> "These are dark times indeed."
    #Faker::TvShows::TwinPeaks.quote #=> "The owls are not what they seem."
    #Faker::TvShows::VentureBros.quote #=> "Revenge like gazpacho soup, is best served cold, precise and merciless."


  end

  def generate_species
    #Faker::Games::ElderScrolls.creature
    #Faker::Games::Myst.creature #=> "squee"
    #Faker::Games::Witcher.monster # => "Katakan"

    
  end

  def generate_bio
    #from...
    #Faker::Games::HeroesOfTheStorm.battleground#=> "Towers of Doom"
    #Faker::Cosmere.shard_world
    #Faker::Space.meteorite #=> "Ensisheim"
    #Faker::Books::CultureSeries.planet
    #Faker::Books::Dune.planet #=> "Caladan"
    #Faker::Books::Lovecraft.location #=> "Kingsport"
    #Faker::Games::LeagueOfLegends.location
    #

    #marital status
    # Faker::Demographic.marital_status #=> "Widowed"

    #loves to eat...
    #Faker::Food.dish #=> "Caesar Salad"


    #had a [great, poor, wierd ] realtonship with:
    #Faker::Relationship.familial #=> "Mother" or "Grandmother"
    # Faker::Relationship.familial('direct') #=> "Mother" or "Brother"
    # Faker::Relationship.familial('extended') #=> "Grandmother" or "Niece" or "Aunt"
    # Faker::Relationship.spouse #=> "Husband" or "Wife"
    # Faker::Relationship.parent #=> "Father" or "Mother"
    # Faker::Relationship.in_law #=> "Father-in-law"
    # Faker::Relationship.sibling #=> "Sister" or "Brother"
    
  end

  def generate_alignment
    alignment = ['chaotic', 'neutral', 'lawful'].sample + ' ' + ['good', 'neutral', 'evil'].sample
    alignment ==  'neutral neutral' ?  'true neutral' :  alignment
  end

  def generate_traits
    #Faker::Educator.subject #=> "Criminology"
    #Faker::Job.key_skill #=> "Teamwork"
    #Faker::Games::Heroes.specialty #=> "Ballista"
    
  end


  def generate_age
    num = gen_random_num(10)
    case num
    when (1..7)
      return (18..50).to_a.sample
    when (8..9)
      return (50..300).to_a.sample
    when 10
      return (500..2000).to_a.sample
    end
  end

  def generate_status
    ['Alive', 'Dead', 'MIA', 'Unknown', 'Exiled', 'Coma', 'Dormant'].sample
  end

  def generate_gender
    num = gen_random_num(10)
    case num
    when (1..7)
      return ['Male', 'Female'].sample
    when (8..9)
      return ['Unknown'].sample
    when 10
      return ['Other'].sample
    end
  end

  def gen_random_num(limit)
    (1..limit).to_a.sample
  end
end
