import lib.common as libcommon
import lib.getfake as libgetfake

text = (
    "--\n-- Generated by python\n--\n"
    "INSERT INTO `tree` (`name`, `type`, `size`) VALUES \n" 
) + libcommon.loop_fct(
    lambda : libgetfake.generate_replace("(':name', ':word', :int)"),
    ",\n",
    30
) + ';'

libcommon.append_file('mysql', 'mydb_data.sql', text)
