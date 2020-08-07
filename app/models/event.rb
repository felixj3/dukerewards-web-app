class Event < ApplicationRecord

    # validates :name, presence: true
    # validates :start_time, presence: true
    # validates :end_time, presence: true
    # # validates :time, presence: true
    # validates :location, presence: true
    # validates :description, presence: true
    validates :points, presence: true
    validates :radius, presence: true
    # validates :category, presence: true
    # # has_secure_token :QRnumber
    # # validates_uniqueness_of :QRnumber

    # no check for uniqueness of QRnumber - it is the Event model's hash

    has_many :attendances
    has_many :users, through: :attendances
    
    attribute :name 
    attribute :start_time
    attribute :end_time
    attribute :location
    attribute :description
    attribute :category
    attribute :image
    # validates :points, presence: true

    # attr_accessor :name, :start_time, :end_time, :location, :description, :category, :image
  
    # def as_json(options={})
    #   super(methods: [:name, :start_time, :end_time, :location, :description, :category, :image])
    #   # this allows the json rendered to show all the attributes, even ones not stored in active record
    # end
  end
