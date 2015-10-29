###
# Compass
###

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy pages (https://middlemanapp.com/advanced/dynamic_pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Reload the browser automatically whenever files change
# configure :development do
#   activate :livereload
# end

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end


activate :blog do |blog|
  blog.name = "videos"
  blog.prefix = "videos"
  blog.permalink = "{title}"
  blog.layout = "video-layout"
  blog.tag_template = "tag.html"
  blog.new_article_template = "source/article-templates/video-template.erb"

  blog.custom_collections = {
      category: {
        link: '/categories/{category}',
        template: '/category.html'
      }
    }
end

activate :blog do |blog|
  blog.name = "text"
  blog.permalink = "{title}"
  blog.prefix = "text"
end

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'


activate :directory_indexes
activate :dragonfly_thumbnailer

activate :deploy do |deploy|
  deploy.method        = :rsync
  deploy.host          = 'watch-learn.com'
  deploy.path          = '/home/watchlea/www/wlmiddleman'
  deploy.user          = 'watchlea'
  deploy.build_before  = true
  # Optional Settings
  # deploy.user  = 'tvaughan' # no default
  # deploy.port  = 5309 # ssh port, default: 22
  # deploy.clean = true # remove orphaned files on remote host, default: false
  # deploy.flags = '-rltgoDvzO --no-p --del' # add custom flags, default: -avz
end

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript

  # Enable cache buster
  # activate :asset_hash

  # Use relative URLs
  # activate :relative_assets

  # Or use a different image path
  set :http_prefix, "/wlmiddleman"
end
