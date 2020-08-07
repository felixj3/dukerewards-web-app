require 'net/http'
require 'json'
require 'uri'

class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events/qrCode/:id
  def qrCode
    params.each do |k,v|
      puts "key: #{k} value: #{v}"
    end
    matchEvents
    @matchEvents.each do |e|
      if e.eventid == Event.find_by(id: params[:id]).eventid
        @event = e
      end
    end
  end

  # GET /events
  # GET /events.json
  def index 
    # Events are sorted based on how they were received from the calendar api currently (7/22/2020)
    matchEvents
    # this call should set @events to be all the events with points associated
    @events = @matchEvents

    # @events.each do |e|
    #   e.attributes.each do |k,v|
    #     puts "-------------------------------"
    #     puts k
    #     puts v
    #   end
    # end
    #@events = Event.order('start_time DESC')
    @matchEvents.each do |e| 
      if e.name.include?("MED")
        e.category = "Dining"
      else
        e.category = "Athletics"
      end
    end
    respond_to do |format|
       format.html 
       format.json { render json: {status: 'SUCCESS', message: 'Loaded events', data:@matchEvents}, status: :ok}
    end
  end
 

  #GET /cheese
  def getAllEvents()
    event_json = Eventsapi.getEventsData() 
    correct_events = Eventsapi.getEventsWithCategory(event_json, 'Health/Wellness')
    @events = Eventsapi.toEventModel(correct_events)

    #sports = ["baseball", "mbball", "wbball", "cross", "fencing", "fhockey", "football", "mgolf", "wgolf", "mlax", "wlax", "rowing", "msoc", "wsoc", "softball", "mten", "wten","tf", "vb"]
    sports = ["football"] # small sample
    sports.each do |s|
      athletics_events_json = Eventsapi.getAthleticsData(s)
      athletics_correct_events = Eventsapi.getAthleticsJson(athletics_events_json)
      @events = @events + Eventsapi.toEventModel(athletics_correct_events)
    end

    # event_json = Eventsapi.getEventsData() 
    # event_json1 = Eventsapi.getFootballData()
    # event_json2 = Eventsapi.getBaseballData()
    # event_json3 = Eventsapi.getMbballData()
    # event_json4 = Eventsapi.getWbballData()
    # event_json5 = Eventsapi.getCrossData()
    # event_json6 = Eventsapi.getFencingData()
    # event_json7 = Eventsapi.getFhockeyData()
    # event_json8 = Eventsapi.getMgolfData()
    # event_json9 = Eventsapi.getWgolfData()
    # event_json10 = Eventsapi.getMlaxData()
    # event_json11 = Eventsapi.getWlaxData()
    # event_json12 = Eventsapi.getRowingData()
    # event_json13 = Eventsapi.getMsocData()
    # event_json14 = Eventsapi.getWsocData()
    # event_json15 = Eventsapi.getSoftballData()
    # event_json16 = Eventsapi.getSwimData()
    # event_json17 = Eventsapi.getMtenData()
    # event_json18 = Eventsapi.getWtenData()
    # event_json19 = Eventsapi.getTfData()
    # event_json20 = Eventsapi.getVbData()

    
  
    # correct_events = Eventsapi.getEventsWithCategory(event_json, 'Health/Wellness')
    # correct_events1 = Eventsapi.getAthleticsJson(event_json1)
    # correct_events2 = Eventsapi.getAthleticsJson(event_json2)
    # correct_events3 = Eventsapi.getAthleticsJson(event_json3)
    # correct_events4 = Eventsapi.getAthleticsJson(event_json4)
    # correct_events5 = Eventsapi.getAthleticsJson(event_json5)
    # correct_events6 = Eventsapi.getAthleticsJson(event_json6)
    # correct_events7 = Eventsapi.getAthleticsJson(event_json7)
    # correct_events8 = Eventsapi.getAthleticsJson(event_json8)
    # correct_events9 = Eventsapi.getAthleticsJson(event_json9)
    # correct_events10 = Eventsapi.getAthleticsJson(event_json10)
    # correct_events11 = Eventsapi.getAthleticsJson(event_json11)
    # correct_events12 = Eventsapi.getAthleticsJson(event_json12)
    # correct_events13 = Eventsapi.getAthleticsJson(event_json13)
    # correct_events14 = Eventsapi.getAthleticsJson(event_json14)
    # correct_events15 = Eventsapi.getAthleticsJson(event_json15)
    # correct_events16 = Eventsapi.getAthleticsJson(event_json16)
    # correct_events17 = Eventsapi.getAthleticsJson(event_json17)
    # correct_events18 = Eventsapi.getAthleticsJson(event_json18)
    # correct_events19 = Eventsapi.getAthleticsJson(event_json19)
    # correct_events20 = Eventsapi.getAthleticsJson(event_json20)


    #@events = Eventsapi.toEventModel(correct_events)  + Eventsapi.toEventModel(correct_events1) + Eventsapi.toEventModel(correct_events2) + Eventsapi.toEventModel(correct_events3) + Eventsapi.toEventModel(correct_events4) + Eventsapi.toEventModel(correct_events5) + Eventsapi.toEventModel(correct_events6) + Eventsapi.toEventModel(correct_events7) + Eventsapi.toEventModel(correct_events8) + Eventsapi.toEventModel(correct_events9) + Eventsapi.toEventModel(correct_events10) + Eventsapi.toEventModel(correct_events11) + Eventsapi.toEventModel(correct_events12) + Eventsapi.toEventModel(correct_events13) + Eventsapi.toEventModel(correct_events14) + Eventsapi.toEventModel(correct_events15) + Eventsapi.toEventModel(correct_events16) + Eventsapi.toEventModel(correct_events17) + Eventsapi.toEventModel(correct_events18) + Eventsapi.toEventModel(correct_events19) + Eventsapi.toEventModel(correct_events20)
    
    
    # render json: @events, status: :ok
    # don't render here because the method calling getAllEvents will render
  end 


  # GET /events/1
  # GET /events/1.json
  def show
    matchEvents
    @matchEvents.each do |e|
      if e.eventid == Event.find_by(id: params[:id]).eventid
        @event = e
      end
    end
  end


  # GET /events/new
  def new
    # called when user presses add for an event
    getAllEvents
    matchEvents
    @event = Event.new 
    # this @event is used to check if there are any errors right now

    @selected = false
    # Event.where(QRnumber: "TEMP").destroy_all
  end

  def generateMap
    # map selected event to eventid
    getAllEvents
    @map = Hash.new("ERROR")
    @events.each do |c|
      @map["#{Time.strptime(c.start_time, "%Y-%m-%dT%H:%M:%S%z").in_time_zone.strftime("%F %H:%M %Z")}  #{c.name}"] = c.eventid
    end
  end

  # GET /events/selectEvent
  def selectEvent
    generateMap

    # puts "-------------------------------"
    # puts "selectEvent"
    # puts params[:selected]
    # puts @map[params[:selected]]
    # puts "-------------------------------"
    
    if params[:selected] != "Select Event" && params[:selected] != "ERROR"
      @selected = true
      @events.each do |e|
        if e.eventid == @map[params[:selected]]
          @event = e
          break
        end
      end
      session[:selectedEvent] = @event.eventid
      render "new"
    else
      matchEvents
      render :controller => 'events', :action => 'new'
    end


    # <div class="field">
    #   <% event.attributes.each do |k,v| %>
    #     <%= form.hidden_field k, { :value => v }%>
    #   <% end %>
    # </div>
  end

  # GET /events/1/edit
  def edit
    matchEvents
    @matchEvents.each do |e|
      if e.eventid == Event.find_by(id: params[:id]).eventid
        @event = e
      end
    end
  end

  # POST /events
  # POST /events.json
  def create
    # when submit is clicked on new tab
    # @event = Event.new(event_params)
    getAllEvents
    sessionEventID = session[:selectedEvent]
    webEvent = nil
    @events.each do |e|
      # puts e.eventid
      # puts tempEvent.eventid
      if e.eventid == sessionEventID
        webEvent = e
        break
      end
    end

    # params.each do |k,v|
    #   puts "-------------------------------"
    #   puts "key: #{k} value: #{v}"
    #   puts "-------------------------------"
    # end

    # webEvent.attributes.each do |k,v|
    #   puts "-------------------------------"
    #   puts "key: #{k} value: #{v}"
    #   puts "-------------------------------"
    # end
    
    @event = Event.new(eventid: sessionEventID, points: params[:event]["points"], radius: params[:event]["radius"])
    @event.QRnumber = @event.hash
    @event.name = webEvent.name
    @event.start_time = webEvent.start_time
    @event.end_time = webEvent.end_time
    @event.location = webEvent.location
    @event.description = webEvent.description
    @event.category = webEvent.category
    @event.image = webEvent.image
    @event.duration = ((webEvent.end_time.to_datetime - webEvent.start_time.to_datetime)*24 * 60).to_i
    if @event.save
      render "show"
    else
      matchEvents
      @selected = true
      render "new"
      #render json: {errors: @event.errors}, status: :unprocessable_entity
    end

    # respond_to do |format|
    #   if @event.save
    #     # format.html { redirect_to @event, notice: 'Event was successfully created.' }
    #     # format.json { render :show, status: :created, location: @event }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @event.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def matchEvents
    getAllEvents
    @matchEvents = [] # events that exist in our database (points attached)
    @oppositeEvents = [] # events that do not exist in our database
    @events.each do |e|
      if e.start_time > Time.now
        if Event.exists?(eventid: e.eventid)
          @matchEvents << e
        else
          @oppositeEvents << e
        end
      end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_params
      params.require(:event).permit(:QRnumber, :eventid, :name, :start_time, :end_time, :location, :description, :points, :category, :radius)
    end
end
