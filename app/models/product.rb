class Product < ActiveRecord::Base
    has_many :orders, :through => :line_items
    has_many :line_items
	
	def self.find_products_for_sale
		find(:all, :order => "title")
	end
	
	validates_presence_of :title, :description, :image_url
	validates_numericality_of :price
	validates_uniqueness_of :title
	validates_format_of :image_url,
	:with => %r{\.(gif|jpg|png)$}i,
	:message => 'Must be a URL for GIF, JPG or PNG image.'
	validate :price_must_be_at_least_a_cent
	validates_length_of :title, :minimum => 10,
	:message => 'Der Titel muss aus mindestens 10 Zeichen bestehen.'
	
	protected
	def price_must_be_at_least_a_cent
		errors.add(:price, 'Should be at least 0.01') if price.nil? ||
		price < 0.01
	end		
end
