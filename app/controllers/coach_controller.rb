class CoachController < ApplicationController
  def index
      @currentView = "coachIndex"
      @firebaseInfo = FirebaseInfo.find_by(id:1)
  end
end
