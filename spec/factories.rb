FactoryGirl.define do
  factory :sentence do
    content "here is the, so good."
  end

  factory :game do
    user_id 1
  end

  factory :game_relation do
    word_count 100
    duration_time 2
  end

  factory :type do
    lang "英文"
  end
end