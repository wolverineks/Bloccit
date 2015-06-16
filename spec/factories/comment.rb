FactoryGirl.define do
  factory :comment do
    body "This is a new comment"
    user
    post

    after(:build) do |comment|
      comment.class.skip_callback(:Create, :after, :send_favorite_emails)
    end
  end
end