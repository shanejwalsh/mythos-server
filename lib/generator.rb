module Generator 
  extend ActiveSupport::Concern

  def generate_full_character
    new_character = {
      first_name: generate_first_name,
      last_name: generate_last_name,
      alias: generate_alias,
      motto: generate_motto,
      species: generate_species,
      bio: generate_bio,
      alignment: generate_alignment,
      traits_positive: "#{generate_trait_positive}, #{generate_trait_positive}, #{generate_trait_positive}",
      traits_negative: "#{generate_trait_negative}, #{generate_trait_negative}, #{generate_trait_negative}",
      age:generate_age,
      status: generate_status,
      gender: generate_gender,
      feats: generate_feats,
      sprite_data: generate_sprite
    }
  end
  
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
    ['werewolf', 'human', 'elf', 'orc', 'gnome', 'halfling', 'centaur', 'lizard folk', 'goblin', 'giant', 'troll', 'frost troll', 'wood elf', 'vampire', 'mermaid', 'nymph', 'ogre', 'dwarf', 'leprechaun', 'banshee'
    ].sample
  end

  def generate_bio
    from, marital_status, food, food_type, realtonship, relationship_type, mood = ''

    mood = ['happily', 'begrudingly', 'reluctantly'].sample
    food_type = ['loves', 'hates', 'alergic to', 'creator of the', 'is partial to a', 'addicted to', 'makes a mean'].sample
    relationship_type = ['a very close', 'a strangely erotic', 'an icy', 'a happy', 'a complicated', 'a bad', "a 'special'", 'a jovial'].sample
    marital_status = Faker::Demographic.marital_status #=> "Widowed"
    food = Faker::Food.dish #=> "Caesar Salad"  

    from = generate_place

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

    def generate_place
          num = gen_random_num(10)
    case num
      when (1..2)
        return Faker::Games::HeroesOfTheStorm.battleground #=> "Towers of Doom"]
      when (3..4)
        return Faker::Cosmere.shard_world #=> "Yolen"
      when (4..5)
        return Faker::Books::CultureSeries.planet #=> "Xinth"
      when (5..6)
        return Faker::Books::Dune.planet #=> "Caladan"
      when (6..8)
        return Faker::Books::Lovecraft.location #=> "Kingsport"
      when (9..10)
        return Faker::Games::LeagueOfLegends.location  #=> "Demacia"
      end 
    end

  def generate_alignment
    alignment = ['chaotic', 'neutral', 'lawful'].sample + ' ' + ['good', 'neutral', 'evil'].sample
    alignment ==  'neutral neutral' ?  'true neutral' :  alignment
  end

  def generate_trait_positive
    ['accessible', 'adaptable', 'adventuros', 'affable', 'affectionate', 'agreeable', 'ambitious', 'amicable', 'amusing', 'articulate', 'good sense of balance', 'benevolent', 'brave', 'bright', 'brilliant', 'broad-minded', 'capable', 'captivating', 'careful', 'caring', 'charming', 'clear-headed', 'clever', 'compassionate', 'confident', 'conscientious', 'considerate', 'courageous', 'courteous', 'creative', 'curious', 'daring', 'decent', 'dependable', 'determined', 'dignified', 'diligent', 'diplomatic', 'disciplined', 'discreet', 'easy-going','educated', 'efficient', 'eloquent', 'empathetic', 'encouraging', 'energetic', 'exuberant', 'fair', 'faithful', 'firm', 'flexible', 'focused', 'forgiving', 'frank', 'friendly', 'funny', 'generous', 'gentle', 'genuine', 'gracious', 'gregarious', 'hard-working', 'helpful', 'heroic', 'honest', 'humble', 'humorous', 'idealistic', 'imaginative', 'impartial', 'incisive', 'independent', 'innovative', 'insightful', 'intelligent', 'intuitive', 'inventive', 'keen', 'kind', 'liberal', 'logical', 'lovable', 'loyal', 'magnanimous', 'mature', 'meticulous', 'modest', 'neat', 'non-authoritarian', 'obedient', 'objective', 'open', 'optimistic', 'orderly', 'organised', 'passionate', 'patient', 'peaceful', 'perceptive', 'persistent', 'personable', 'persuasive','pioneering', 'plucky', 'polite', 'powerful', 'practical', 'precise', 'principled', 'profound', 'protective', 'prudent','punctual','quick-witted', 'quiet', 'rational', 'relaxed','reliable', 'reserved', 'resourceful', 'responsible', 'romantic', 'scrupulous', 'secure', 'self-confident', 'self-disciplined', 'selfless', 'sensible', 'sensitive', 'shy', 'sincere', 'skillful', 'sociable', 'spontaneous', 'sporting', 'stable', 'steadfast', 'stoic' ,'suave','well endowed', 'subtle', 'sympathetic', 'tasteful', 'through', 'thoughtful', 'tidy', 'tolerant', 'tough', 'unassuming', 'understanding', 'versatile', 'vivacious', 'warm', 'well-read','willing', 'wise', 'witty'
    ].sample
  end

  def generate_trait_negative
    ['abrasive', 'aggressive', 'aimless', 'angry', 'anxious', 'arrogant', 'belligerent', 'bitchy', 'blunt', 'boorish', 'boring', 'callous', 'calculating', 'careless', 'caustic', 'charmless', 'cold', 'course', 'compulsive', 'conceited', 'cowardly', 'crafty', 'crazy', 'cruel', 'cunning', 'deceitful', 'demanding', 'dependant', 'desperate', 'destructive', 'detached', 'difficult', 'dishonest', 'disloyal', 'disobedient', 'disruptive', 'dogmatic', 'dull', 'envious', 'erratic', 'extreme', 'fanatical', 'foolish', 'forgetful', 'fussy', 'gloomy', 'greedy', 'grim', 'grumpy', 'gullible', 'harsh', 'hateful', 'hostile', 'hesitant', 'ignorant', 'impatient', 'impractical', 'impulsive', 'inconsiderate', 'indecisive', 'inflexible', 'inhibited', 'insecure', 'insensitive', 'insulting', 'incredibly racist', 'irresponsible', 'jealous', 'judgemental', 'a killjoy', 'lazy', 'malicious', 'materialistic', 'mean', 'melodramatic', 'miserable', 'moody', 'narcissistic', 'narrow-minded', 'nasty', 'neglectful', 'gassy', 'foul-smelling', 'neurotic', 'obnoxious', 'obsessive', 'outrageous', 'paranoid', 'passive', 'pathetic', 'patronising', 'perverted', 'petty', 'pessimistic', 'petulant', 'picky', 'pompous', 'predatory', 'predujuced', 'pretentious', 'puritanical', 'quick-tempered', 'rigid', 'rude', 'ruthless', 'sadistic', 'sanctimonious', 'self-indulgent', 'selfish', 'shameless', 'slovenly', 'sly', 'sneaky', 'sordid', 'stingy', 'stubborn', 'stupid', 'superficial', 'surly', 'tactless', 'tasteless', 'temperamental', 'tense', 'thoughtless', 'touchy', 'truculent', 'uncaring', 'unreliable', 'unruly', 'untidy', 'a total slob', 'vain', 'vengeful', 'vindictive', 'weak', 'wilful', 'withdrawn'
    ].sample
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
    num = gen_random_num(10)
      case num
        when (1..7)
          return ['Alive'].sample
        when (8..10)
        return ['MIA', 'Unknown', 'Exiled', 'Comatose', 'Dormant'].sample
      end 
  end

  def generate_gender
    ['male', 'female'].sample
  end


  def generate_feats 
    num = gen_random_num(2)
    achievement = ['destroyer', 'champion', 'ruler', 'defeater', 'overlord', 'slayer', 'champion', 'player', 'butcher', 'hero', ].sample
    people = generate_species
    place = generate_place

      case num
      when 1
        return "#{achievement.capitalize} of the #{people}s"
      when 2
        return "#{achievement.capitalize} of #{place}" 
      end 
  end 

  def generate_sprite
    halfling_king = '#585858,#ffeb3b,#585858,#585858,#585858,#ffeb3b,#585858,#585858,#585858,#ffeb3b,#585858,#585858,#585858,#585858,#585858,#585858,#585858,#ffeb3b,#ffeb3b,#585858,#ffeb3b,#ff5722,#ffeb3b,#585858,#ffeb3b,#ffeb3b,#585858,#585858,#585858,#585858,#585858,#585858,#585858,#f2de2c,#ffeb3b,#ffeb3b,#ffeb3b,#f2de2c,#f2de2c,#ffeb3b,#ffeb3b,#f2de2c,#585858,#585858,#ffeb3b,#585858,#585858,#585858,#585858,#5e3201,#5e3201,#5e3201,#684b28,#684b28,#684b28,#765a39,#765a39,#765a39,#585858,#ffeb3b,#ffeb3b,#ffeb3b,#585858,#585858,#585858,#5e3201,#5e3201,#5e3201,#684b28,#684b28,#765a39,#765a39,#765a39,#765a39,#585858,#585858,#ffeb3b,#585858,#585858,#585858,#585858,#5e3201,#5e3201,#371d01,#371d01,#371d01,#fdcbb2,#371d01,#371d01,#371d01,#585858,#585858,#607d8b,#585858,#585858,#585858,#585858,#fdcbb2,#5e3201,#e4bca8,#000000,#e4bca8,#fdcbb2,#fdcbb2,#000000,#fdcbb2,#585858,#585858,#ffc107,#585858,#585858,#585858,#585858,#fdcbb2,#5e3201,#e4bca8,#000000,#e4bca8,#e4bca8,#fdcbb2,#000000,#fdcbb2,#585858,#585858,#ffc107,#585858,#585858,#585858,#585858,#5e3201,#e4bca8,#e4bca8,#5e3201,#5e3201,#5e3201,#5e3201,#5e3201,#fdcbb2,#585858,#585858,#ffc107,#585858,#585858,#585858,#585858,#5e3201,#5e3201,#5e3201,#5e3201,#ecf0f2,#ecf0f2,#e4bca8,#5e3201,#5e3201,#585858,#585858,#ffc107,#585858,#585858,#585858,#585858,#427285,#596b74,#427285,#ffc107,#216d4f,#216d4f,#216d4f,#ffc107,#596b74,#585858,#585858,#ffc107,#585858,#585858,#585858,#585858,#427285,#596b74,#427285,#758288,#ffc107,#2c8a63,#ffc107,#758288,#596b74,#758288,#2c8a63,#fdcbb2,#585858,#585858,#585858,#585858,#2c8a63,#2c8a63,#427285,#758288,#2c8a63,#ffc107,#2c8a63,#758288,#596b74,#596b74,#216d4f,#e4bca8,#585858,#585858,#585858,#585858,#fdcbb2,#e4bca8,#427285,#758288,#000000,#ff9800,#000000,#758288,#596b74,#585858,#585858,#ffc107,#585858,#585858,#585858,#585858,#055576,#055576,#055576,#055576,#055576,#055576,#055576,#055576,#055576,#585858,#585858,#ffc107,#585858,#585858,#585858,#585858,#585858,#000000,#000000,#000000,#585858,#585858,#000000,#000000,#000000,#585858,#585858,#ffc107,#585858,#585858,#585858'
    skeleton = '#585858,#585858,#585858,#585858,#f0eded,#f0eded,#f0eded,#f7f2f2,#f7f2f2,#585858,#585858,#585858,#585858,#585858,#585858,#585858,#585858,#585858,#585858,#dfdfdf,#f0eded,#f0eded,#f0eded,#f7f2f2,#f7f2f2,#f7f2f2,#585858,#585858,#585858,#585858,#585858,#585858,#585858,#585858,#dfdfdf,#dfdfdf,#f0eded,#f0eded,#f0eded,#f7f2f2,#f7f2f2,#f7f2f2,#f7f2f2,#585858,#585858,#585858,#585858,#585858,#585858,#585858,#dfdfdf,#dfdfdf,#f0eded,#000000,#f0eded,#f7f2f2,#f7f2f2,#000000,#f7f2f2,#585858,#585858,#585858,#585858,#585858,#585858,#585858,#dfdfdf,#dfdfdf,#f0eded,#000000,#f0eded,#000000,#f7f2f2,#000000,#f7f2f2,#585858,#585858,#585858,#585858,#585858,#585858,#585858,#dfdfdf,#dfdfdf,#f0eded,#f0eded,#f0eded,#f0eded,#f7f2f2,#f7f2f2,#f7f2f2,#585858,#585858,#585858,#585858,#585858,#585858,#585858,#585858,#dfdfdf,#dfdfdf,#f0eded,#000000,#f0eded,#000000,#f7f2f2,#585858,#585858,#f7f2f2,#585858,#f7f2f2,#585858,#585858,#585858,#8d6fc4,#8d6fc4,#625083,#625083,#625083,#8d6fc4,#8d6fc4,#8d6fc4,#8d6fc4,#585858,#585858,#f7f2f2,#585858,#585858,#807d7d,#585858,#8d6fc4,#807d7d,#625083,#625083,#625083,#8d6fc4,#8d6fc4,#8d6fc4,#625083,#625083,#8d6fc4,#dfdfdf,#585858,#585858,#807d7d,#807d7d,#807d7d,#ff9800,#625083,#625083,#625083,#8d6fc4,#8d6fc4,#8d6fc4,#625083,#625083,#8d6fc4,#dfdfdf,#585858,#585858,#807d7d,#807d7d,#ff9800,#807d7d,#625083,#625083,#625083,#8d6fc4,#8d6fc4,#8d6fc4,#585858,#585858,#585858,#f7f2f2,#585858,#585858,#807d7d,#ff9800,#807d7d,#807d7d,#795548,#795548,#795548,#795548,#795548,#795548,#585858,#585858,#f7f2f2,#585858,#f7f2f2,#585858,#ff9800,#807d7d,#807d7d,#807d7d,#625083,#625083,#625083,#625083,#625083,#625083,#585858,#585858,#585858,#585858,#585858,#585858,#585858,#807d7d,#807d7d,#362259,#625083,#585858,#585858,#625083,#625083,#625083,#585858,#585858,#585858,#585858,#585858,#585858,#585858,#585858,#362259,#362259,#625083,#585858,#585858,#362259,#362259,#625083,#585858,#585858,#585858,#585858,#585858,#585858,#585858,#585858,#dfdfdf,#dfdfdf,#f0eded,#585858,#585858,#dfdfdf,#dfdfdf,#f0eded,#585858,#585858,#585858,#585858,#585858,#585858'
    mermaid = '#585858,#585858,#585858,#585858,#585858,#585858,#585858,#585858,#3f51b5,#3f51b5,#3f51b5,#3f51b5,#3f51b5,#3f51b5,#3f51b5,#3f51b5,#585858,#585858,#585858,#585858,#3f51b5,#3f51b5,#3f51b5,#3f51b5,#3f51b5,#673ab7,#673ab7,#673ab7,#673ab7,#ff9800,#ff9800,#ff9800,#585858,#585858,#585858,#3f51b5,#3f51b5,#3f51b5,#673ab7,#673ab7,#3f51b5,#3f51b5,#3f51b5,#3f51b5,#ff9800,#ff9800,#ff9800,#00bcd4,#585858,#585858,#585858,#585858,#3f51b5,#3f51b5,#3f51b5,#3f51b5,#673ab7,#673ab7,#673ab7,#673ab7,#ff9800,#ff9800,#ff9800,#ff9800,#585858,#585858,#3f51b5,#3f51b5,#3f51b5,#3f51b5,#3f51b5,#3f51b5,#3f51b5,#585858,#585858,#585858,#ff9800,#ff9800,#ff9800,#f44336,#585858,#3f51b5,#3f51b5,#3f51b5,#3f51b5,#3f51b5,#3f51b5,#585858,#585858,#585858,#ff9800,#ff9800,#ff9800,#ff9800,#585858,#585858,#585858,#585858,#585858,#585858,#585858,#585858,#585858,#585858,#585858,#ff9800,#ff9800,#ff9800,#4caf50,#ff9800,#585858,#585858,#585858,#585858,#585858,#585858,#585858,#585858,#585858,#ff9800,#ff9800,#ff9800,#ff9800,#ff9800,#ff9800,#4caf50,#585858,#585858,#585858,#585858,#585858,#585858,#585858,#585858,#ee588b,#e91e63,#e91e63,#e91e63,#ff9800,#ff9800,#585858,#607d8b,#585858,#607d8b,#585858,#585858,#585858,#585858,#585858,#585858,#e91e63,#e91e63,#e91e63,#ee588b,#e91e63,#ff9800,#607d8b,#585858,#607d8b,#585858,#585858,#585858,#585858,#585858,#585858,#585858,#ee588b,#e91e63,#ee588b,#e91e63,#585858,#ff9800,#585858,#607d8b,#585858,#607d8b,#585858,#585858,#585858,#585858,#585858,#e91e63,#e91e63,#e91e63,#e91e63,#e91e63,#585858,#585858,#795548,#585858,#607d8b,#585858,#e91e63,#585858,#585858,#585858,#ee588b,#e91e63,#ee588b,#e91e63,#ee588b,#585858,#585858,#795548,#585858,#585858,#585858,#585858,#ee588b,#ee588b,#e91e63,#e91e63,#e91e63,#e91e63,#e91e63,#e91e63,#585858,#585858,#795548,#585858,#585858,#585858,#585858,#585858,#585858,#e91e63,#e91e63,#ee588b,#585858,#585858,#585858,#585858,#585858,#795548,#585858,#585858,#585858,#585858,#585858,#585858,#e91e63,#ee588b,#585858,#585858,#585858,#585858,#585858,#585858,#795548,#585858,#585858,#585858,#585858,#585858,#585858,#585858'
    adventurer = '#bfbfbf,#585858,#795548,#585858,#585858,#585858,#795548,#795548,#795548,#7d6861,#7d6861,#7d6861,#795548,#795548,#795548,#795548,#bfbfbf,#bfbfbf,#bfbfbf,#585858,#585858,#795548,#795548,#795548,#795548,#7d6861,#7d6861,#7d6861,#795548,#795548,#795548,#795548,#bfbfbf,#bfbfbf,#bfbfbf,#585858,#585858,#795548,#795548,#795548,#795548,#7d6861,#7d6861,#7d6861,#795548,#795548,#795548,#795548,#bfbfbf,#585858,#795548,#ff5722,#585858,#795548,#795548,#795548,#d5b497,#dab697,#dab697,#fed9bf,#fed9bf,#fed9bf,#fed9bf,#fed9bf,#585858,#585858,#ff5722,#585858,#585858,#fed9bf,#795548,#a58871,#dab697,#000000,#dab697,#fed9bf,#fed9bf,#fed9bf,#000000,#fed9bf,#585858,#585858,#795548,#ff5722,#585858,#fed9bf,#795548,#a58871,#dab697,#2196f3,#dab697,#dab697,#fed9bf,#fed9bf,#2196f3,#fed9bf,#585858,#585858,#795548,#585858,#585858,#795548,#a58871,#a58871,#dab697,#dab697,#dab697,#dab697,#dab697,#fed9bf,#fed9bf,#fed9bf,#585858,#585858,#795548,#585858,#7e2e14,#795548,#a58871,#a58871,#d5b497,#dab697,#dab697,#dadee1,#dadee1,#dab697,#fed9bf,#fed9bf,#585858,#585858,#795548,#585858,#7e2e14,#7e2e14,#7e2e14,#7e2e14,#607d8b,#9eadb5,#607d8b,#9eadb5,#607d8b,#9eadb5,#607d8b,#3e51b2,#585858,#585858,#fed9bf,#dab697,#dab697,#6170c2,#607d8b,#7e2e14,#9eadb5,#607d8b,#9eadb5,#607d8b,#9eadb5,#607d8b,#9eadb5,#3e51b2,#585858,#585858,#fed9bf,#dab697,#6170c2,#6170c2,#607d8b,#7e2e14,#607d8b,#9eadb5,#607d8b,#9eadb5,#607d8b,#9eadb5,#607d8b,#3e51b2,#585858,#585858,#795548,#585858,#7e2e14,#7e2e14,#7e2e14,#7e2e14,#9eadb5,#607d8b,#9eadb5,#607d8b,#9eadb5,#607d8b,#9eadb5,#dab697,#585858,#585858,#795548,#585858,#585858,#585858,#7e2e14,#7e2e14,#7e2e14,#7e2e14,#7e2e14,#7e2e14,#7e2e14,#7e2e14,#7e2e14,#dab697,#585858,#585858,#795548,#585858,#585858,#585858,#6170c2,#6170c2,#6170c2,#6170c2,#6170c2,#6170c2,#6170c2,#6170c2,#6170c2,#585858,#585858,#585858,#795548,#585858,#585858,#585858,#3e51b2,#6170c2,#585858,#585858,#585858,#585858,#3e51b2,#6170c2,#585858,#585858,#585858,#585858,#795548,#585858,#585858,#585858,#796259,#55453e,#585858,#585858,#585858,#585858,#796259,#55453e,#585858,#585858'
    hobbit_wizard ='#585858,#585858,#585858,#585858,#585858,#585858,#585858,#585858,#585858,#585858,#585858,#585858,#585858,#585858,#585858,#585858,#585858,#585858,#585858,#585858,#585858,#585858,#585858,#585858,#585858,#585858,#585858,#585858,#585858,#585858,#585858,#585858,#585858,#585858,#585858,#585858,#585858,#585858,#585858,#f5744b,#ff5722,#f5744b,#585858,#585858,#585858,#585858,#585858,#b161bf,#585858,#585858,#585858,#585858,#585858,#585858,#585858,#ff5722,#ff5722,#ff5722,#ff5722,#ff5722,#585858,#585858,#585858,#9c27b0,#585858,#585858,#585858,#585858,#585858,#585858,#d8b2a6,#d8b2a6,#d8b2a6,#ff5722,#ff5722,#ff5722,#dfc8c0,#585858,#585858,#795548,#585858,#585858,#585858,#585858,#585858,#d8b2a6,#d8b2a6,#d8b2a6,#d8b2a6,#d8b2a6,#d8b2a6,#dfc8c0,#dfc8c0,#dfc8c0,#585858,#795548,#585858,#585858,#585858,#585858,#dfc8c0,#d8b2a6,#d8b2a6,#ffffff,#8bc34a,#d8b2a6,#d8b2a6,#ffffff,#8bc34a,#dfc8c0,#585858,#795548,#585858,#585858,#585858,#585858,#dfc8c0,#d8b2a6,#d8b2a6,#d8b2a6,#d8b2a6,#d8b2a6,#d8b2a6,#dfc8c0,#dfc8c0,#dfc8c0,#585858,#795548,#585858,#585858,#585858,#585858,#585858,#d8b2a6,#d8b2a6,#d8b2a6,#d8b2a6,#ebe3e3,#ebe3e3,#d8b2a6,#dfc8c0,#dfc8c0,#585858,#795548,#585858,#585858,#585858,#585858,#585858,#03a9f4,#2196f3,#c1522f,#c1522f,#c7c3c2,#f44336,#c7c3c2,#c1522f,#2196f3,#585858,#795548,#585858,#585858,#585858,#585858,#585858,#03a9f4,#2196f3,#c1522f,#c1522f,#c7c3c2,#c7c3c2,#c7c3c2,#c1522f,#2196f3,#2196f3,#d8b2a6,#585858,#585858,#585858,#585858,#585858,#03a9f4,#2196f3,#c1522f,#c1522f,#c7c3c2,#c7c3c2,#c7c3c2,#c1522f,#585858,#2196f3,#d8b2a6,#585858,#585858,#585858,#585858,#585858,#dfc8c0,#d8b2a6,#c1522f,#c1522f,#c7c3c2,#c7c3c2,#c7c3c2,#c1522f,#585858,#585858,#795548,#585858,#585858,#585858,#585858,#585858,#575b3f,#575b3f,#676c48,#676c48,#676c48,#676c48,#676c48,#676c48,#585858,#585858,#795548,#585858,#585858,#585858,#585858,#585858,#585858,#575b3f,#676c48,#585858,#585858,#575b3f,#676c48,#585858,#585858,#585858,#795548,#585858,#585858,#585858,#585858,#585858,#585858,#796963,#795548,#585858,#585858,#796963,#795548,#585858,#585858,#585858,#795548'
    devil = '#585858,#ffeb3b,#607d8b,#585858,#585858,#585858,#585858,#585858,#585858,#585858,#585858,#585858,#585858,#585858,#ffeb3b,#585858,#585858,#ffeb3b,#607d8b,#585858,#585858,#585858,#962720,#962720,#962720,#e32f22,#e32f22,#e32f22,#585858,#ffeb3b,#ffeb3b,#585858,#585858,#585858,#607d8b,#ffeb3b,#962720,#962720,#962720,#962720,#962720,#e32f22,#e32f22,#e32f22,#e32f22,#ffeb3b,#585858,#585858,#585858,#585858,#607d8b,#c4b424,#962720,#962720,#962720,#962720,#962720,#e32f22,#e32f22,#e32f22,#e32f22,#e32f22,#585858,#585858,#585858,#585858,#607d8b,#585858,#962720,#962720,#962720,#ffeb3b,#ffeb3b,#e32f22,#e32f22,#e32f22,#ffeb3b,#e32f22,#585858,#585858,#585858,#585858,#607d8b,#585858,#962720,#962720,#962720,#ffeb3b,#c4b424,#962720,#ffeb3b,#e32f22,#c4b424,#e32f22,#585858,#585858,#585858,#585858,#607d8b,#585858,#962720,#962720,#962720,#962720,#962720,#962720,#e32f22,#e32f22,#e32f22,#e32f22,#585858,#585858,#585858,#585858,#607d8b,#585858,#962720,#611a15,#962720,#962720,#c4b84e,#962720,#c4b84e,#e32f22,#e32f22,#e32f22,#585858,#585858,#585858,#673ab7,#673ab7,#673ab7,#611a15,#611a15,#611a15,#c4b84e,#ffeb3b,#d2c23a,#d2c23a,#611a15,#611a15,#585858,#585858,#585858,#585858,#e4b62a,#e4b62a,#e32f22,#e32f22,#962720,#962720,#962720,#962720,#962720,#962720,#962720,#e32f22,#585858,#585858,#585858,#585858,#e4b62a,#e4b62a,#e32f22,#e32f22,#962720,#962720,#c4b84e,#8e853c,#8e853c,#ffeb3b,#962720,#e32f22,#585858,#585858,#585858,#585858,#585858,#673ab7,#585858,#962720,#962720,#962720,#962720,#962720,#962720,#962720,#962720,#e4b62a,#585858,#585858,#585858,#585858,#585858,#673ab7,#585858,#962720,#962720,#962720,#962720,#962720,#962720,#962720,#962720,#e4b62a,#585858,#585858,#585858,#585858,#585858,#585858,#585858,#962720,#962720,#962720,#962720,#962720,#962720,#962720,#962720,#585858,#585858,#585858,#585858,#585858,#585858,#585858,#585858,#585858,#962720,#962720,#585858,#585858,#962720,#962720,#585858,#585858,#585858,#585858,#585858,#585858,#585858,#585858,#585858,#585858,#000000,#000000,#585858,#585858,#000000,#000000,#585858,#585858,#585858,#585858,#585858'
    ghost = '#585858,#585858,#585858,#382064,#432e67,#432e67,#432e67,#432e67,#554079,#554079,#554079,#585858,#585858,#585858,#585858,#585858,#585858,#585858,#382064,#432e67,#432e67,#432e67,#432e67,#432e67,#554079,#554079,#554079,#382064,#585858,#585858,#585858,#585858,#585858,#585858,#382064,#432e67,#432e67,#432e67,#382064,#432e67,#554079,#382064,#554079,#554079,#382064,#585858,#585858,#585858,#585858,#585858,#382064,#432e67,#432e67,#432e67,#33c466,#432e67,#554079,#33c466,#554079,#554079,#382064,#585858,#585858,#585858,#585858,#585858,#382064,#432e67,#432e67,#432e67,#382064,#432e67,#432e67,#382064,#554079,#554079,#382064,#585858,#585858,#585858,#585858,#585858,#382064,#432e67,#432e67,#432e67,#432e67,#432e67,#432e67,#554079,#554079,#554079,#554079,#554079,#554079,#585858,#585858,#585858,#585858,#382064,#432e67,#432e67,#432e67,#33c466,#33c466,#33c466,#554079,#554079,#554079,#554079,#585858,#585858,#382064,#432e67,#432e67,#432e67,#432e67,#432e67,#432e67,#432e67,#432e67,#432e67,#554079,#554079,#554079,#585858,#585858,#585858,#382064,#432e67,#432e67,#432e67,#432e67,#432e67,#432e67,#432e67,#432e67,#432e67,#554079,#585858,#585858,#585858,#585858,#585858,#585858,#382064,#382064,#432e67,#432e67,#432e67,#432e67,#432e67,#432e67,#432e67,#554079,#585858,#585858,#585858,#585858,#585858,#585858,#585858,#585858,#382064,#432e67,#432e67,#432e67,#432e67,#432e67,#432e67,#554079,#585858,#585858,#585858,#585858,#585858,#585858,#585858,#585858,#382064,#432e67,#432e67,#432e67,#432e67,#432e67,#554079,#585858,#585858,#585858,#585858,#585858,#585858,#585858,#585858,#585858,#382064,#432e67,#432e67,#432e67,#432e67,#554079,#585858,#585858,#585858,#585858,#585858,#585858,#585858,#585858,#585858,#585858,#382064,#432e67,#432e67,#432e67,#554079,#585858,#585858,#585858,#585858,#585858,#585858,#585858,#585858,#585858,#585858,#585858,#382064,#432e67,#432e67,#554079,#585858,#585858,#585858,#585858,#585858,#585858,#585858,#585858,#585858,#585858,#585858,#585858,#382064,#554079,#554079,#585858,#585858,#585858,#585858,#585858,#585858,#585858,#585858,#585858,#585858'
    [halfling_king, skeleton, mermaid, adventurer, hobbit_wizard, devil, ghost].sample
  end

  def gen_random_num(limit)
    (1..limit).to_a.sample
  end



end