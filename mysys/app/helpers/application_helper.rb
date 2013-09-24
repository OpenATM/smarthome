module ApplicationHelper
   def inspect_value(var ,var_name = "var")
       puts "**********************************************************"
       puts "#{var_name}=>#{var}"
       puts "**********************************************************"
   end
   
end
