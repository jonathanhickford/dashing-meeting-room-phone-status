require 'net/ping'
require 'csv'

phones = []
CSV.foreach(File.expand_path('../../phones.csv', __FILE__), headers: true) do |row|
  tidy_name = row['name'].gsub(/[^0-9a-z ]/i, '')
  phones.push ({:name => tidy_name, :host => row['ip'], :points => Array.new, :last_x => 0})
end

SCHEDULER.every '30s' do
	for phone in phones do
		if Net::Ping::External.new(phone[:host]).ping
			up = 1
			status = 'ok'
		else
			up = 0
			status = 'danger'
		end 
		phone[:points].shift
		phone[:last_x] += 1
		phone[:points] << { x: phone[:last_x], y: up }

		send_event(phone[:name], {points: phone[:points], status: status})
	end
end