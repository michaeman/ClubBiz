module ApplicationHelper

def page_heading(title)
  content_for(:title){ title }
  content_tag(:h2, title)
end

def random_image
  image_files = %w( .jpg .gif .png )
  files = Dir.entries(
    "#{RAILS_ROOT}/public/system/" 
  ).delete_if { |x| !image_files.index(x[-4,4]) }
  files[rand(files.length)]
end

end
