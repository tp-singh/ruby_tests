class Enbake

  def self.valid_card?(cc_string)
    cc_string = cc_string.to_s
    if cc_string.nil? || cc_string.empty?
      false
    else
      cc_number = self.convert_str_to_int_array(cc_string)
      cc_arr = cc_number
      self.luhn_checksum(cc_arr) == 0
    end
  end

  def self.luhn_checksum(cc_arr)
      cc_len = cc_arr.length
      pointer = cc_len - 1
      sum = 0
      cc_len.times do
        if pointer % 2 == cc_len % 2
          n = cc_arr[pointer] * 2
          sum += (n / 10) + (n % 10)
        else
          sum += cc_arr[pointer]
        end
        pointer -= 1
      end
      sum % 10
  end

  def self.convert_str_to_int_array(cc_num)
    cc_clean_arr = []
    cc_clean_str = self.clean_str(cc_num)
    str_arr = cc_clean_str.to_s.split('')
    str_arr.each { | i | cc_clean_arr << i.to_i}
    cc_clean_arr
  end
  
  def self.clean_str(cc_num)
    unless cc_num.nil? || cc_num.empty?
      cc_num.scan(/\d+/).join
    end
  end

  def self.append_check_digit(cc_string)
    cc_string = cc_string.to_s
    if cc_string.nil? || cc_string.empty?
      false
    else
      cc_number = self.convert_str_to_int_array(cc_string)
      cc_arr = cc_number *10
      check_digit = self.luhn_checksum(cc_arr)
      check_digit == 0 ? 0 : 10 - check_digit
      cc_string+check_digit.to_s
    end
  end

end