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

###########################################################################
#
###########################################################################
def log_in_out
  if session[:user_id].nil?
    %Q[
    <span class="menu-login">
    <b>#{link_to(fa_icon('sign-in lg'), {controller: 'dc_common', action: 'login', return_to: request.url}, class: 'login', title: t('login'))}</b>
    </span>]
  else
    user_name = session[:user_name]
    user_name = user_name[0,14] + '..' if user_name.size > 15
    %Q[
    <span class="menu-login">
    #{link_to(fa_icon('sign-out') + ' ' + user_name, { controller: 'dc_common', action: 'logout', return_to: request.url}, class: 'logout', title: t('logout'))}
    </span>]
  end
end

end
