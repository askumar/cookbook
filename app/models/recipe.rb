class Recipe < ActiveRecord::Base
  CATEGORIES = [ 'Breakfast', 'Lunch', 'Snacks', 'Dinner', 'Drinks' ]

  default_scope :order => :name

  def video_url
    #'/videos/' + self.video
    'https://s3.amazonaws.com/cookbook_video/' + self.video + '.flv'
  end

  def instructions_as_html
    RedCloth.new(self.instructions).to_html
  end
end
