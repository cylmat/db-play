import lib.common as libcommon
import lib.getfake as libgetfake

text = (
    "--\n-- Generated by python\n--\n"
) + libgetfake.generate_replace(":sentence")

libcommon.append_file('minio', 'data_sample.txt', text)