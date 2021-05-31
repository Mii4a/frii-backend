class UserSerializer < ActiveModel::Serializer
  attributes :id, :name

  has_many :tagmaps, dependent: :destroy
  has_many :tags, through: :tagmaps
end
