# Be sure to restart your server when you modify this file.

#Rails.application.config.session_store :cookie_store, key: '_test_drg_cms_session'

Rails.application.config.session_store :mongoid_store , {
    expire_after: 1.month
}