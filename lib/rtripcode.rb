#--
#           DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
#                   Version 2, December 2004
#
#  Copyleft meh.
#
#           DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
#  TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
#
#  0. You just DO WHAT THE FUCK YOU WANT TO.
#++

class String
  def tripcode (secure=nil)
    input = self.encode('SJIS')
    salt  = (input + 'H..')[1, 2].gsub(/[^\.-z]/, '..').tr(':;<=>?@[\]^_`', 'ABCDEFGabcdef')

    if secure
      input.crypt(salt).crypt(secure)[-10 .. -1]
    else
      input.crypt(salt)[-10 .. -1]
    end
  end

  def tripcode! (secure=nil)
    replace(tripcode(secure))
  end
end
