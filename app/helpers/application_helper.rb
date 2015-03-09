module ApplicationHelper

#####################################################################
# Return DcPiece document with name 'social sites' which should hold 
# data for rendering social sites links on browser output. 
# 
# It is up to developer how to implement social sites links so implement
# it in yours application helper.
#####################################################################
def social_sites
  social = DcPiece.find_by(name: 'social sites')
  (social ? social.script : '').html_safe
end

end
