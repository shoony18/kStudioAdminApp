class AnalyticsController < ApplicationController
before_action :authenticate_user!

def new
        @currentView = "analytics_new"

        @anaPointID = ["ANGLE_NECK","ANGLE_R_HIP","ANGLE_L_HIP","ANGLE_R_KNEE","ANGLE_L_KNEE","ANGLE_R_ANKLE","ANGLE_L_ANKLE","ANGLE_AXIS","ANGLE_L_ELBOW","ANGLE_R_ELBOW","ANGLE_L_HAND","ANGLE_R_HAND"]

end
end

