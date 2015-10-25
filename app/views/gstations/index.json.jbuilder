json.array!(@gstations) do |gstation|
  json.extract! gstation, :id, :name, :lat, :lon, :rating, :queue, :gasavail
  json.url gstation_url(gstation, format: :json)
end
