-- Credits go to vxsty on MoreUNC for these

funcs.isreadonly = function(tbl)
 if type(tbl) ~= 'table' then return false end
 return table.isfrozen(tbl)
end

funcs.setreadonly = function(tbl, cond)
 if cond then
  table.freeze(tbl)
 else  
  return funcs.deepclone(tbl)
 end

end
