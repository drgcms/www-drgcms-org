module ApplicationHelper
include CmsCommonHelper

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

###########################################################################
#
###########################################################################
def log_in_out
  if session[:user_id].nil?
    %(
    <span class="menu-login">
    <b>#{link_to(mi_icon('sign_in'), { controller: 'dc_common', action: 'login', return_to: request.url },
                 class: 'login', title: t('login'), rel: 'nofollow') }</b>
    </span>)
  else
    user_name = session[:user_name]
    user_name = user_name[0,14] + '..' if user_name.size > 15
    %(
    <span class="menu-login">
    #{link_to(mi_icon('sign_out') + ' ' + user_name, { controller: 'dc_common', action: 'logout', return_to: request.url },
              class: 'logout', title: t('logout'), rel: 'nofollow') }
    </span>)
  end
end

end
