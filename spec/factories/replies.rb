FactoryGirl.define do
  factory :reply do
    respond "MyString"
    code "MyText"
    question_id 1
    user_id 1
  end
end
