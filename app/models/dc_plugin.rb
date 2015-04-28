#--
# Copyright (c) 2014+ Damjan Rems
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#++

########################################################################
# Mongoid::Document model for dc_plugin documents.
# 
# dc_plugin collection holds data about plugins available for drg_cms project.
########################################################################
class DcPlugin
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :name,        type: String
  field :info,        type: String
  field :version,     type: String
  field :home_url,    type: String
  field :src_url,     type: String
  field :doc_url,     type: String
  field :authors,     type: String
  field :install,     type: String
  field :type,        type: String
  field :search,      type: String

  field :active,      type: Boolean, default: true
  field :created_by,  type: BSON::ObjectId
  field :updated_by,  type: BSON::ObjectId
  
  validates :name,        { presence: true, uniqueness: true }
   
  index( { name: 1 }, { unique: true } )
  index( { type: 1 } )
  
  before_save :do_before_save
  
#############################################################################
# Fill search field to simplify plugins searching.
#############################################################################
def do_before_save
  self.search = UnicodeUtils.downcase("#{self.name} #{self.info}")
end  

end
