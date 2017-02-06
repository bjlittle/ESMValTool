;
;  Requires: zg:*3*
;
info = True
info@derived = True
info@long_name="Geopotential Height at 500 mb"
info@units="m"

undef("calculate")
function calculate(index [1] : integer,
                   variable [1] : string,
                   field_number [1] : string)
;;                 return_val [1] : logical
;; Arguments:
;;    index    - index to current infile defined in the 'temp_ncl_code/filesinfo'-file
;;    variable - logical with releveant variable as string attribute
;;    field_number  - string with field number classification
;; Return value:
;;    data_new - logical
local tmp, dum, i
begin
  data_new = True
  tmp = read_data(index,"zg","*3*")
    dum = extract_data(index,tmp,1,500.,500.)   ;extract_data(models,tmp,i,"plev",500.,500.)

    dum@long_name=info@long_name
    dum@units=info@units
    add_data(index,data_new,dum)

    delete(dum)
  delete(tmp)

  return(data_new)
end