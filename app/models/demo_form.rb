#--
# Copyright (c) 2017+ Damjan Rems
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
class DemoForm

##########################################################################  
# Choices for select field defined in code.
##########################################################################  
def self.choices4_field24()
  [ ['six',6],['five',5],['four',4] ]
end


##########################################################################  
#
##########################################################################  
def self.my_search(typed)
  months = Date::MONTHNAMES
  self.only(:id, :naziv1, :naziv2, :naslov, :posta, :posta_naziv)
      .where(vse_zivo: /#{UnicodeUtils.downcase(vpis)}/)
      .inject([]) {|r,v| r << ["#{v.naziv1} #{v.naziv2} #{v.naslov} #{v.posta} #{v.posta_naziv}", v.id]}
end

end
