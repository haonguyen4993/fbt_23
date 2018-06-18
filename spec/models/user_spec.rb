require "rails_helper"

describe User do
  it do
    is_expected.to validate_presence_of(:name)
      .with_message I18n.t "activerecord.errors.models.user.attributes.name.blank"
  end

  it do
    is_expected.to validate_presence_of(:email)
      .with_message I18n.t "activerecord.errors.models.user.attributes.email.blank"
  end

  it do
    is_expected.to validate_uniqueness_of(:email)
      .case_insensitive
      .with_message I18n.t "activerecord.errors.models.user.attributes.email.unique"
  end

  it do
    is_expected.not_to allow_value("wrong_email")
      .for(:email)
      .with_message I18n.t "activerecord.errors.models.user.attributes.email.invalid"
  end

  it do
    is_expected.to validate_presence_of(:password)
      .with_message I18n.t "activerecord.errors.models.user.attributes.password.blank"
  end

  describe "is invalid with a password too short or too long" do
    context "password too short" do
      it do
        is_expected.to validate_length_of(:password)
          .is_at_least(Settings.user.min_pass_length)
          .with_message I18n.t(
            "activerecord.errors.models.user.attributes.password.too_short",
            count: Settings.user.min_pass_length)
      end
    end

    context "password too long" do
      it do
        is_expected.to validate_length_of(:password)
          .is_at_most(Settings.user.max_pass_length)
          .with_message I18n.t("activerecord.errors.models.user.attributes.password.too_long",
            count: Settings.user.max_pass_length)
      end
    end
  end

  it do
    is_expected.to validate_confirmation_of(:password)
      .on(:create)
      .with_message I18n.t "activerecord.errors.models.user.attributes.password_confirmation.match"
  end

  it {is_expected.to have_many :bookings}
  it {is_expected.to have_many :reviews}
  it {is_expected.to have_many :ratings}
  it {is_expected.to have_many :comments}
end
