FactoryGirl.define do
    # group with name
    factory :group do 
        name "grupa testowa"
    end
    factory :blank_gorup, class: :group do
        name ""
    end
end