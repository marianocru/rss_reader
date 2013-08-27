
FactoryGirl.define  do

  factory :user do |f|
    f.first_name "mariano"
    f.last_name "mariano"
    f.login "login"
    f.email "mariano@hotmail.com"
    f.username "mariano"
    f.password "12345678"
    f.password_confirmation { |u| u.password }
    f.channels { [FactoryGirl.build(:channel, :arts),FactoryGirl.build(:channel, :life)] }
  end

  factory :channel do
    trait :life do
      id 1001
      url 'http://feeds.reuters.com/news/lifestyle'
      name 'life'
      articles { [FactoryGirl.build(:article, :art_life_1),FactoryGirl.build(:article, :art_life_2),FactoryGirl.build(:article, :art_life_3)] }
    end
    trait :arts do
      id 1002
      url 'http://feeds.reuters.com/news/arts'
      name 'arts'
      articles { [FactoryGirl.build(:article, :art_art_1)] }
    end
    trait :money do
      id 1003
      url 'http://feeds.reuters.com/news/money'
      name 'money'
    end
    trait :news do
      id 1004
      url 'http://feeds.reuters.com/news/news'
      name 'news'
    end
  end


  factory :article do
    pubdate "2013-08-24"
    link 'http://feeds.reuters.com/news/lifestyle'

    trait :art_life_1 do
      id 1001
      description 'description 1'
      mark true
      title 'life 1'
      guid  1

    end

    trait :art_life_2 do
      id 1002
      description 'description 2'
      mark false
      title 'life 2'
      guid  2
    end

    trait :art_life_3 do
      id 1003
      description 'description 3'
      mark false
      title 'life 3'
      guid  3
      comments { [FactoryGirl.build(:comment, :comment_3)] }
    end

    trait :art_art_1 do
      id 1004
      description 'description 1'
      mark true
      title 'art 1'
      guid  4
      comments { [FactoryGirl.build(:comment, :comment_1), FactoryGirl.build(:comment, :comment_2)] }
    end
  end


  factory :comment do
    trait :comment_1 do
      comment 'comment 1'
    end

    trait :comment_2 do
      comment 'comment 2'
    end

    trait :comment_3 do
      comment  'comment 3'
    end

  end
end