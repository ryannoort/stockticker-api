json.array! @commodities do |commodity|
  json.(commodity, :name, :price)
end
