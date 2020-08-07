require 'net/http'
require 'json'
require 'uri'

class Eventsapi
    def self.getEventsData()
		
		#url = "https://calendar-test.oit.duke.edu/events/index.json?&topic=&future_days=90&user_date=&feed_type=simple&local=true"
		url = "https://calendar.duke.edu/events/index.json?&topic=&future_days=90&user_date=&feed_type=simple&local=true"

		uri = URI.parse(url)
		http = Net::HTTP.new(uri.host, uri.port)
		http.use_ssl = true 
		request = Net::HTTP::Get.new(uri.request_uri)
		response = http.request(request).body
		doc = JSON.parse(response)
		# Rails.logger.debug(response)
		doc
	end

	def self.getFootballData()
		
		
		#url = "https://calendar.duke.edu/events/index.json?&topic=&future_days=90&user_date=&feed_type=simple&local=true"
		url = "http://goduke.com/api/athletic_calendar/?path=football"
		uri = URI.parse(url)
		http = Net::HTTP.new(uri.host, uri.port)
		#http.use_ssl = true 
		request = Net::HTTP::Get.new(uri.request_uri)
		response = http.request(request).body
		doc = JSON.parse(response)
		# Rails.logger.debug(response)
		doc
	end


	def self.getBaseballData()
		
		
		#url = "https://calendar.duke.edu/events/index.json?&topic=&future_days=90&user_date=&feed_type=simple&local=true"
		url = "http://goduke.com/api/athletic_calendar/?path=baseball"
		uri = URI.parse(url)
		http = Net::HTTP.new(uri.host, uri.port)
		#http.use_ssl = true 
		request = Net::HTTP::Get.new(uri.request_uri)
		response = http.request(request).body
		doc = JSON.parse(response)
		# Rails.logger.debug(response)
		doc
	end


	def self.getMbballData()
		
		
		#url = "https://calendar.duke.edu/events/index.json?&topic=&future_days=90&user_date=&feed_type=simple&local=true"
		url = "http://goduke.com/api/athletic_calendar/?path=mbball"
		uri = URI.parse(url)
		http = Net::HTTP.new(uri.host, uri.port)
		#http.use_ssl = true 
		request = Net::HTTP::Get.new(uri.request_uri)
		response = http.request(request).body
		doc = JSON.parse(response)
		# Rails.logger.debug(response)
		doc
	end

	def self.getWbballData()
		
		
		#url = "https://calendar.duke.edu/events/index.json?&topic=&future_days=90&user_date=&feed_type=simple&local=true"
		url = "http://goduke.com/api/athletic_calendar/?path=wbball"
		uri = URI.parse(url)
		http = Net::HTTP.new(uri.host, uri.port)
		#http.use_ssl = true 
		request = Net::HTTP::Get.new(uri.request_uri)
		response = http.request(request).body
		doc = JSON.parse(response)
		# Rails.logger.debug(response)
		doc
	end

	def self.getCrossData()
		
		
		#url = "https://calendar.duke.edu/events/index.json?&topic=&future_days=90&user_date=&feed_type=simple&local=true"
		url = "http://goduke.com/api/athletic_calendar/?path=cross"
		uri = URI.parse(url)
		http = Net::HTTP.new(uri.host, uri.port)
		#http.use_ssl = true 
		request = Net::HTTP::Get.new(uri.request_uri)
		response = http.request(request).body
		doc = JSON.parse(response)
		# Rails.logger.debug(response)
		doc
	end

	def self.getFencingData()
		
		
		#url = "https://calendar.duke.edu/events/index.json?&topic=&future_days=90&user_date=&feed_type=simple&local=true"
		url = "http://goduke.com/api/athletic_calendar/?path=fencing"
		uri = URI.parse(url)
		http = Net::HTTP.new(uri.host, uri.port)
		#http.use_ssl = true 
		request = Net::HTTP::Get.new(uri.request_uri)
		response = http.request(request).body
		doc = JSON.parse(response)
		# Rails.logger.debug(response)
		doc
	end

	def self.getFhockeyData()
		
		
		#url = "https://calendar.duke.edu/events/index.json?&topic=&future_days=90&user_date=&feed_type=simple&local=true"
		url = "http://goduke.com/api/athletic_calendar/?path=fhockey"
		uri = URI.parse(url)
		http = Net::HTTP.new(uri.host, uri.port)
		#http.use_ssl = true 
		request = Net::HTTP::Get.new(uri.request_uri)
		response = http.request(request).body
		doc = JSON.parse(response)
		# Rails.logger.debug(response)
		doc
	end

	def self.getMgolfData()
		
		
		#url = "https://calendar.duke.edu/events/index.json?&topic=&future_days=90&user_date=&feed_type=simple&local=true"
		url = "http://goduke.com/api/athletic_calendar/?path=mgolf"
		uri = URI.parse(url)
		http = Net::HTTP.new(uri.host, uri.port)
		#http.use_ssl = true 
		request = Net::HTTP::Get.new(uri.request_uri)
		response = http.request(request).body
		doc = JSON.parse(response)
		# Rails.logger.debug(response)
		doc
	end

	def self.getWgolfData()
		
		
		#url = "https://calendar.duke.edu/events/index.json?&topic=&future_days=90&user_date=&feed_type=simple&local=true"
		url = "http://goduke.com/api/athletic_calendar/?path=wgolf"
		uri = URI.parse(url)
		http = Net::HTTP.new(uri.host, uri.port)
		#http.use_ssl = true 
		request = Net::HTTP::Get.new(uri.request_uri)
		response = http.request(request).body
		doc = JSON.parse(response)
		# Rails.logger.debug(response)
		doc
	end

	def self.getMlaxData()
		
		
		#url = "https://calendar.duke.edu/events/index.json?&topic=&future_days=90&user_date=&feed_type=simple&local=true"
		url = "http://goduke.com/api/athletic_calendar/?path=mlax"
		uri = URI.parse(url)
		http = Net::HTTP.new(uri.host, uri.port)
		#http.use_ssl = true 
		request = Net::HTTP::Get.new(uri.request_uri)
		response = http.request(request).body
		doc = JSON.parse(response)
		# Rails.logger.debug(response)
		doc
	end

	def self.getWlaxData()
	
		
		#url = "https://calendar.duke.edu/events/index.json?&topic=&future_days=90&user_date=&feed_type=simple&local=true"
		url = "http://goduke.com/api/athletic_calendar/?path=wlax"
		uri = URI.parse(url)
		http = Net::HTTP.new(uri.host, uri.port)
		#http.use_ssl = true 
		request = Net::HTTP::Get.new(uri.request_uri)
		response = http.request(request).body
		doc = JSON.parse(response)
		# Rails.logger.debug(response)
		doc
	end

	def self.getRowingData()
		
		
		#url = "https://calendar.duke.edu/events/index.json?&topic=&future_days=90&user_date=&feed_type=simple&local=true"
		url = "http://goduke.com/api/athletic_calendar/?path=rowing"
		uri = URI.parse(url)
		http = Net::HTTP.new(uri.host, uri.port)
		#http.use_ssl = true 
		request = Net::HTTP::Get.new(uri.request_uri)
		response = http.request(request).body
		doc = JSON.parse(response)
		# Rails.logger.debug(response)
		doc
	end

	def self.getMsocData()
		
		
		#url = "https://calendar.duke.edu/events/index.json?&topic=&future_days=90&user_date=&feed_type=simple&local=true"
		url = "http://goduke.com/api/athletic_calendar/?path=msoc"
		uri = URI.parse(url)
		http = Net::HTTP.new(uri.host, uri.port)
		#http.use_ssl = true 
		request = Net::HTTP::Get.new(uri.request_uri)
		response = http.request(request).body
		doc = JSON.parse(response)
		# Rails.logger.debug(response)
		doc
	end
	def self.getWsocData()
		
		
		#url = "https://calendar.duke.edu/events/index.json?&topic=&future_days=90&user_date=&feed_type=simple&local=true"
		url = "http://goduke.com/api/athletic_calendar/?path=wsoc"
		uri = URI.parse(url)
		http = Net::HTTP.new(uri.host, uri.port)
		#http.use_ssl = true 
		request = Net::HTTP::Get.new(uri.request_uri)
		response = http.request(request).body
		doc = JSON.parse(response)
		# Rails.logger.debug(response)
		doc
	end
	def self.getSoftballData()
		
		
		#url = "https://calendar.duke.edu/events/index.json?&topic=&future_days=90&user_date=&feed_type=simple&local=true"
		url = "http://goduke.com/api/athletic_calendar/?path=softball"
		uri = URI.parse(url)
		http = Net::HTTP.new(uri.host, uri.port)
		#http.use_ssl = true 
		request = Net::HTTP::Get.new(uri.request_uri)
		response = http.request(request).body
		doc = JSON.parse(response)
		# Rails.logger.debug(response)
		doc
	end

	def self.getSwimData()
		
		
		#url = "https://calendar.duke.edu/events/index.json?&topic=&future_days=90&user_date=&feed_type=simple&local=true"
		url = "http://goduke.com/api/athletic_calendar/?path=swim"
		uri = URI.parse(url)
		http = Net::HTTP.new(uri.host, uri.port)
		#http.use_ssl = true 
		request = Net::HTTP::Get.new(uri.request_uri)
		response = http.request(request).body
		doc = JSON.parse(response)
		# Rails.logger.debug(response)
		doc
	end
	def self.getMtenData()
		
		
		#url = "https://calendar.duke.edu/events/index.json?&topic=&future_days=90&user_date=&feed_type=simple&local=true"
		url = "http://goduke.com/api/athletic_calendar/?path=mten"
		uri = URI.parse(url)
		http = Net::HTTP.new(uri.host, uri.port)
		#http.use_ssl = true 
		request = Net::HTTP::Get.new(uri.request_uri)
		response = http.request(request).body
		doc = JSON.parse(response)
		# Rails.logger.debug(response)
		doc
	end
	def self.getWtenData()
		
		
		#url = "https://calendar.duke.edu/events/index.json?&topic=&future_days=90&user_date=&feed_type=simple&local=true"
		url = "http://goduke.com/api/athletic_calendar/?path=wten"
		uri = URI.parse(url)
		http = Net::HTTP.new(uri.host, uri.port)
		#http.use_ssl = true 
		request = Net::HTTP::Get.new(uri.request_uri)
		response = http.request(request).body
		doc = JSON.parse(response)
		# Rails.logger.debug(response)
		doc
	end
	def self.getTfData()
		
		
		#url = "https://calendar.duke.edu/events/index.json?&topic=&future_days=90&user_date=&feed_type=simple&local=true"
		url = "http://goduke.com/api/athletic_calendar/?path=tf"
		uri = URI.parse(url)
		http = Net::HTTP.new(uri.host, uri.port)
		#http.use_ssl = true 
		request = Net::HTTP::Get.new(uri.request_uri)
		response = http.request(request).body
		doc = JSON.parse(response)
		# Rails.logger.debug(response)
		doc
	end

	def self.getVbData()
		
		
		#url = "https://calendar.duke.edu/events/index.json?&topic=&future_days=90&user_date=&feed_type=simple&local=true"
		url = "http://goduke.com/api/athletic_calendar/?path=vb"
		uri = URI.parse(url)
		http = Net::HTTP.new(uri.host, uri.port)
		#http.use_ssl = true 
		request = Net::HTTP::Get.new(uri.request_uri)
		response = http.request(request).body
		doc = JSON.parse(response)
		# Rails.logger.debug(response)
		doc
	end

	def self.getAthleticsData(sport)
		url = "http://goduke.com/api/athletic_calendar/?path=#{sport}"
		uri = URI.parse(url)
		http = Net::HTTP.new(uri.host, uri.port)
		#http.use_ssl = true 
		request = Net::HTTP::Get.new(uri.request_uri)
		response = http.request(request).body
		doc = JSON.parse(response)
		# Rails.logger.debug(response)
		doc
	end
	
	
	def self.getEventsWithCategory(event_json, category)
		parsejson = JSON.parse(event_json.to_json)['events']
		correct_events = parsejson.select {|event| 
			if event['categories'] != nil
				event['categories'].include?(category)
			else
				false
			end}
		# puts correct_events
		return correct_events
	end

	def self.getAthleticsJson(event_json)
		correct_events = JSON.parse(event_json.to_json)['events']
		
		return correct_events
	end


	def self.toEventModel(correct_events)
		events = Array.new
		correct_events.each do |event|
			if Event.exists?(eventid: event["id"])
				currEvent = Event.find_by(eventid: event["id"])
			else
				currEvent = Event.new(eventid: event["id"])

				# does not save event until user adds points
			end
			currEvent.name = event["summary"]
			currEvent.start_time = event["start_timestamp"]
			currEvent.end_time = event["end_timestamp"]
			if event["end_timestamp"] == nil
				currEvent.end_time = currEvent.start_time.to_datetime + 2.hours
			end
			currEvent.location = event["location"]["address"]
			currEvent.description = event["description"]
			currEvent.category = event["categories"]
			currEvent.image = event["image"]
			# currEvent = Event.new(id: event["id"], name: event["summary"], start_time: event["start_timestamp"], end_time: event["end_timestamp"], location: event["location"]["address"], description: event["description"], points: 0, category: event["categories"], image: event["image"]) 
			events.push(currEvent)
		end
		return events
	end
end