require 'clockwork'
include Clockwork

every(12.hour, 'nofity-all.job') do
  get(URI.parse('http://localhost:3000/nofity_all'))
end