require "csv"
require "open-uri"

class Cake < ApplicationRecord
  belongs_to :user, optional: true
  has_one_attached :image, :dependent => :destroy

  has_many :cart_items
  has_many :carts
  has_many :order_details, :dependent => :destroy 

  validates :name, presence: true
  validates :image, presence: true
  validates :description, presence: true
  validates :price, presence: true

    def self.import(file,user_id)
      list = []
      CSV.foreach(file.path, :headers => true) do |row| 
        path = Rails.root.join('app', 'assets', 'images', row["image"])
        file = open(path)
        cake =  Cake.where(name: row['name'])
        t = Cake.new
        t.image.attach(io: file, filename: row['name']+ '.jpg', content_type: 'image/jpg')
        t.name = row['name']
        t.description = row['description']
        t.price = row['price']
        t.user_id = user_id
        t.save if cake.count == 0
      end
    end
     
end
