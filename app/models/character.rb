class Character < ApplicationRecord

  def generate_first_name
    num = gen_random_num(10)
    case num
    when (1..7)
      return Faker::Name.first_name #=> "Kaci"
    when (8..10)
      return Faker::Games::ElderScrolls.first_name #=> Astrid
    end    
  end

  def generate_last_name
    num = gen_random_num(10)
    case num
    when (1..7)
      return Faker::Name.last_name #=> "Ernser"
    when (8..10)
      return Faker::Games::ElderScrolls.last_name #=> Mallory
    end    
  end

  def generate_alias
    num = gen_random_num(10)
    case num
    when (1..2)
      return Faker::Ancient.god #=> "Zeus"
    when (3..4)
      return Faker::Ancient.primordial #=> "Gaia"
    when (5..8)
      return Faker::Ancient.titan #=> "Atlas" 
    when (9..10)
      return Faker::Books::Lovecraft.deity #=> "Shub-Niggurath"
    end    
  end

  def generate_motto
    num = gen_random_num(20)
    case num
    when (1)
      return Faker::Marketing.buzzwords #=> "rubber meets the road", "sprint to the finish line"
    when (2..3)
      return Faker::Books::Dune.saying #=> "You do not beg the sun for mercy."
    when (4..5)
      return Faker::GreekPhilosophers.quote #=> "Only the educated are free."
    when (6..7)
      return Faker::Games::Dota.quote #=> "Easy now, this stuff is explosive!"
    when (8..9)
      return Faker::Games::Fallout.quote #=> "Democracy is non-negotiable"
    when (10..11)
      return Faker::Games::HeroesOfTheStorm.quote #=> "MEAT!!!"
    when (12..13)
      return Faker::Games::Witcher.quote # => "No Lollygagin'!"
    when (14..15)
      return Faker::Games::LeagueOfLegends.quote #=> "Purge the unjust."
    when (16..17)
      return Faker::Games::WorldOfWarcraft.quote #=> "These are dark times indeed."
    when (18..19)
      return Faker::TvShows::TwinPeaks.quote #=> "The owls are not what they seem."
    when (19..20)
      return Faker::TvShows::VentureBros.quote #=> "Revenge like gazpacho soup, is best served cold, precise and merciless."
    end    
  end

  def generate_species
     num = gen_random_num(10)
    case num
    when (1..3)
      return Faker::Games::ElderScrolls.creature
    when (4..6)
      return Faker::Games::Myst.creature #=> "squee"
    when (6..10)
      return Faker::Games::Witcher.monster # => "Katakan"
    end      
  end

  def generate_bio
    from, marital_status, food, food_type, realtonship, relationship_type, mood = ''

    mood = ['happily', 'begrudingly', 'reluctantly'].sample
    food_type = ['loves', 'hates', 'alergic to', 'creator of the', 'is partial to a', 'addicted to', 'makes a mean'].sample
    relationship_type = ['a very close', 'a strangely erotic', 'an icy', 'a happy', 'a complicated', 'a bad', "a 'special'", 'a jovial'].sample
    marital_status = Faker::Demographic.marital_status #=> "Widowed"
    food = Faker::Food.dish #=> "Caesar Salad"

    num = gen_random_num(10)
    case num
      when (1..2)
        from = Faker::Games::HeroesOfTheStorm.battleground #=> "Towers of Doom"]
      when (3..4)
        from =  Faker::Cosmere.shard_world #=> "Yolen"
      when (4..5)
        from = Faker::Books::CultureSeries.planet #=> "Xinth"
      when (5..6)
        from = Faker::Books::Dune.planet #=> "Caladan"
      when (6..8)
        from = Faker::Books::Lovecraft.location #=> "Kingsport"
      when (9..10)
        from = Faker::Games::LeagueOfLegends.location  #=> "Demacia"
    end  

    num = gen_random_num(5)
    case num
      when 1
        realtonship = Faker::Relationship.familial #=> "Mother" or "Grandmother"
      when 2
        realtonship = Faker::Relationship.spouse #=> "Husband" or "Wife"
      when 3
        realtonship = Faker::Relationship.parent #=> "Father" or "Mother"
      when 4
        realtonship = Faker::Relationship.in_law #=> "Father-in-law"
      when 5
        realtonship = Faker::Relationship.sibling #=> "Sister" or "Brother"
    end  

    "Originating from #{from}. #{mood.capitalize} #{marital_status.downcase}. #{food_type.capitalize} #{food}. Has #{relationship_type} relationship with their #{realtonship.downcase}."
  end

  def generate_alignment
    alignment = ['chaotic', 'neutral', 'lawful'].sample + ' ' + ['good', 'neutral', 'evil'].sample
    alignment ==  'neutral neutral' ?  'true neutral' :  alignment
  end

  def generate_trait_positive
    ['accessible', 'adaptable', 'adventuros', 'affable', 'affectionate', 'agreeable', 'ambitious', 'amicable', 'amusing', 'articulate', 'good sense of balance', 'benevolent', 'brave', 'bright', 'brilliant', 'broad-minded', 'capable', 'captivating', 'careful', 'caring', 'charming', 'clear-headed', 'clever', 'compassionate', 'confident', 'conscientious', 'considerate', 'courageous', 'courteous', 'creative', 'curious', 'daring', 'decent', 'dependable', 'determined', 'dignified', 'diligent', 'diplomatic', 'disciplined', 'discreet', 'easy-going','educated', 'efficient', 'eloquent', 'empathetic', 'encouraging', 'energetic', 'exuberant', 'fair', 'faithful', 'firm', 'flexible', 'focused', 'forgiving', 'frank', 'friendly', 'funny', 'generous', 'gentle', 'genuine', 'gracious', 'gregarious', 'hard-working', 'helpful', 'heroic', 'honest', 'humble', 'humorous', 'idealistic', 'imaginative', 'impartial', 'incisive', 'independent', 'innovative', 'insightful', 'intelligent', 'intuitive', 'inventive', 'keen', 'kind', 'liberal', 'logical', 'lovable', 'loyal', 'magnanimous', 'mature', 'meticulous', 'modest', 'neat', 'non-authoritarian', 'obedient', 'objective', 'open', 'optimistic', 'orderly', 'organised', 'passionate', 'patient', 'peaceful', 'perceptive', 'persistent', 'personable', 'persuasive','pioneering', 'plucky', 'polite', 'powerful', 'practical', 'precise', 'principled', 'profound', 'protective', 'prudent','punctual','quick-witted', 'quiet', 'rational', 'relaxed','reliable', 'reserved', 'resourceful', 'responsible', 'romantic', 'scrupulous', 'secure', 'self-confident', 'self-disciplined', 'selfless', 'sensible', 'sensitive', 'shy', 'sincere', 'skillful', 'sociable', 'spontaneous', 'sporting', 'stable', 'steadfast', 'stoic' ,'suave','well endowed', 'subtle', 'sympathetic', 'tasteful', 'through', 'thoughtful', 'tidy', 'tolerant', 'tough', 'unassuming', 'understanding', 'versatile', 'vivacious', 'warm', 'well-read','willing', 'wise', 'witty'
    ].sample
  end

  def generate_traits_negative
    ['charming'].sample(3)
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
