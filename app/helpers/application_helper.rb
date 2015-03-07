module ApplicationHelper

#####################################################################
# Return DcPiece document with name 'social sites' which should hold 
# data for rendering social sites links on browser output.
#####################################################################
def social_sites
  social = DcPiece.find_by(name: 'social sites')
  (social ? social.script : '').html_safe
end

end
