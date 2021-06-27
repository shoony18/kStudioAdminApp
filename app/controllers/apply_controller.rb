class ApplyController < ApplicationController
before_action :authenticate_user!

    def top
        
    end

    def test
        @testdata_ID = []
        @testdata_Name = []

        require "google/cloud/bigquery"
        bigquery = Google::Cloud::Bigquery.new
        sql     = "select * from test_data_set.PLR0600T_test2 limit 10"
        results = bigquery.query sql

        results.each do |row|
            puts "#{row[:url]}: #{row[:view_count]} views"
            @testdata_ID.push(row[:ANALYTICS_ID])
            @testdata_Name.push(row[:MEMBER_NAME])
        end
        
    end
    
    def testAfterGetValue
        @testdata_ID = []
        @testdata_Name = []
        @testdata_Feedback = []

        require "google/cloud/bigquery"
        bigquery = Google::Cloud::Bigquery.new
        sql     = "select * from test_data_set.PLR0600T_test2 limit 10"
        results = bigquery.query sql

        results.each do |row|
            puts "#{row[:url]}: #{row[:view_count]} views"
            @testdata_ID.push(row[:ANALYTICS_ID])
            @testdata_Name.push(row[:MEMBER_NAME])
            @testdata_Feedback.push(row[:FEEDBACK])
        end
        
        @testdata_Feedback_sentence = ""
        @testdata_Feedback.each do |data|
            @testdata_Feedback_sentence = @testdata_Feedback_sentence + "\n" + data
        end
        
    end

    def index
        @currentView = "applyIndex"
        @currentView2 = "fbNew"
#        @firebaseInfo = FirebaseInfo.find_by(id:1)
        @applyID = ""
        @anaPointID = ["ANGLE_NECK","ANGLE_R_HIP","ANGLE_L_HIP","ANGLE_R_KNEE","ANGLE_L_KNEE","ANGLE_R_ANKLE","ANGLE_L_ANKLE","ANGLE_AXIS","ANGLE_L_ELBOW","ANGLE_R_ELBOW","ANGLE_L_HAND","ANGLE_R_HAND"]
        
    
    end    
    
    def show        
        @currentView = "applyShow"
#        @firebaseInfo = FirebaseInfo.find_by(id:1)
        @applyID = params[:applyID]
    end

    def edit
        @currentView = "applyEdit"
#        @firebaseInfo = FirebaseInfo.find_by(id:1)
        @applyID = params[:applyID]
    end

    def edit_bq
        @currentView = "applyEdit_bq"
#        @firebaseInfo = FirebaseInfo.find_by(id:1)
        @applyID = params[:applyID]

        @anaPointID = ["ANGLE_NECK","ANGLE_R_SHOULDER","ANGLE_L_SHOULDER","ANGLE_R_ELBOW","ANGLE_L_ELBOW","ANGLE_R_HIP","ANGLE_L_HIP","ANGLE_R_KNEE","ANGLE_L_KNEE","ANGLE_R_ANKLE","ANGLE_L_ANKLE","ANGLE_R_COM","ANGLE_L_COM"]
        @angleValue = []
        @angleValueDiff = []
        @detailScore = []
        @fbFlag = []
        @fbContent = []

        @anaCriteriaID = ["headPosition","leg","axis","arm","ground"]
        @anaCriteriaTitle = ["ヘッドポジション","レッグ","軸","腕振り","接地"]
        @criteriaScore = []

        require "google/cloud/bigquery"
        bigquery = Google::Cloud::Bigquery.new
        
        sql1_text = "select * from motionplotdb.KST0610T_userValue where ANALYTICS_ID = '"+@applyID+"' and FRAME = 0;"
        sql1     = sql1_text
        results1 = bigquery.query sql1
        
        sql2_text = "select * from motionplotdb.KST0610T_userScore where ANALYTICS_ID = '"+@applyID+"' and FRAME = 0;"
        sql2     =  sql2_text
        results2 = bigquery.query sql2

        sql3_text = "select * from motionplotdb.KST0610T_userScoreFB where ANALYTICS_ID = '"+@applyID+"' and FRAME = 0;"
        sql3     =  sql3_text
        results3 = bigquery.query sql3

        sql4_text = "select * from motionplotdb.KST0610T_userValueDiff where ANALYTICS_ID = '"+@applyID+"' and FRAME = 0;"
        sql4     =  sql4_text
        results4 = bigquery.query sql4

        results1.each do |row|
            puts "#{row[:url]}: #{row[:view_count]} views"
            @angleValue.push(row[:ANGLE_NECK].floor)
            @angleValue.push(row[:ANGLE_R_SHOULDER].floor)
            @angleValue.push(row[:ANGLE_L_SHOULDER].floor)
            @angleValue.push(row[:ANGLE_R_ELBOW].floor)
            @angleValue.push(row[:ANGLE_L_ELBOW].floor)
            @angleValue.push(row[:ANGLE_R_HIP].floor)
            @angleValue.push(row[:ANGLE_L_HIP].floor)
            @angleValue.push(row[:ANGLE_R_KNEE].floor)
            @angleValue.push(row[:ANGLE_L_KNEE].floor)
            @angleValue.push(row[:ANGLE_R_ANKLE].floor)
            @angleValue.push(row[:ANGLE_L_ANKLE].floor)
            @angleValue.push(row[:ANGLE_R_COM].floor)
            @angleValue.push(row[:ANGLE_L_COM].floor)
        end

        results2.each do |row|
            puts "#{row[:url]}: #{row[:view_count]} views"
            @detailScore.push(row[:ANGLE_NECK].floor)
            @detailScore.push(row[:ANGLE_R_SHOULDER].floor)
            @detailScore.push(row[:ANGLE_L_SHOULDER].floor)
            @detailScore.push(row[:ANGLE_R_ELBOW].floor)
            @detailScore.push(row[:ANGLE_L_ELBOW].floor)
            @detailScore.push(row[:ANGLE_R_HIP].floor)
            @detailScore.push(row[:ANGLE_L_HIP].floor)
            @detailScore.push(row[:ANGLE_R_KNEE].floor)
            @detailScore.push(row[:ANGLE_L_KNEE].floor)
            @detailScore.push(row[:ANGLE_R_ANKLE].floor)
            @detailScore.push(row[:ANGLE_L_ANKLE].floor)
            @detailScore.push(row[:ANGLE_R_COM].floor)
            @detailScore.push(row[:ANGLE_L_COM].floor)
        end

        results3.each do |row|
            puts "#{row[:url]}: #{row[:view_count]} views"
            @fbFlag.push(row[:ANGLE_NECK].floor)
            @fbFlag.push(row[:ANGLE_R_SHOULDER].floor)
            @fbFlag.push(row[:ANGLE_L_SHOULDER].floor)
            @fbFlag.push(row[:ANGLE_R_ELBOW].floor)
            @fbFlag.push(row[:ANGLE_L_ELBOW].floor)
            @fbFlag.push(row[:ANGLE_R_HIP].floor)
            @fbFlag.push(row[:ANGLE_L_HIP].floor)
            @fbFlag.push(row[:ANGLE_R_KNEE].floor)
            @fbFlag.push(row[:ANGLE_L_KNEE].floor)
            @fbFlag.push(row[:ANGLE_R_ANKLE].floor)
            @fbFlag.push(row[:ANGLE_L_ANKLE].floor)
            @fbFlag.push(row[:ANGLE_R_COM].floor)
            @fbFlag.push(row[:ANGLE_L_COM].floor)
        end
        
        results4.each do |row|
            puts "#{row[:url]}: #{row[:view_count]} views"
            @angleValueDiff.push(row[:ANGLE_NECK].floor)
            @angleValueDiff.push(row[:ANGLE_R_SHOULDER].floor)
            @angleValueDiff.push(row[:ANGLE_L_SHOULDER].floor)
            @angleValueDiff.push(row[:ANGLE_R_ELBOW].floor)
            @angleValueDiff.push(row[:ANGLE_L_ELBOW].floor)
            @angleValueDiff.push(row[:ANGLE_R_HIP].floor)
            @angleValueDiff.push(row[:ANGLE_L_HIP].floor)
            @angleValueDiff.push(row[:ANGLE_R_KNEE].floor)
            @angleValueDiff.push(row[:ANGLE_L_KNEE].floor)
            @angleValueDiff.push(row[:ANGLE_R_ANKLE].floor)
            @angleValueDiff.push(row[:ANGLE_L_ANKLE].floor)
            @angleValueDiff.push(row[:ANGLE_R_COM].floor)
            @angleValueDiff.push(row[:ANGLE_L_COM].floor)
        end

        @criteriaScore[0] = @detailScore[0].floor
        @criteriaScore[1] = ((@detailScore[1] + @detailScore[2] + @detailScore[3] + @detailScore[4] + @detailScore[5] + @detailScore[6])/6).floor
        @criteriaScore[2] = @detailScore[7].floor
        @criteriaScore[3] = ((@detailScore[8] + @detailScore[9] + @detailScore[10] + @detailScore[11])/4).floor
        @criteriaScore[4] = @detailScore[12].floor
        @totalScore = ((@criteriaScore[0] + @criteriaScore[1] + @criteriaScore[2] + @criteriaScore[3] + @criteriaScore[4])).floor
        
        @anaPointID_j = @anaPointID.to_json.html_safe
        @angleValue_j = @angleValue.to_json.html_safe
        @angleValueDiff_j = @angleValueDiff.to_json.html_safe
        @detailScore_j = @detailScore.to_json.html_safe
        @fbFlag_j = @fbFlag.to_json.html_safe
        @anaCriteriaID_j = @anaCriteriaID.to_json.html_safe
        @anaCriteriaTitle_j = @anaCriteriaTitle.to_json.html_safe
        @criteriaScore_j = @criteriaScore.to_json.html_safe
        
    end

    def create
        @firebaseInfo = FirebaseInfo.new(
    apiKey: "AIzaSyAjImPxYZZ3LmxAJ2L3AbGETd9F9BXXeKI",
    authDomain: "coachingapp1-stg.firebaseapp.com",
    databaseURL: "https://coachingapp1-stg-default-rtdb.firebaseio.com",
    projectId: "coachingapp1-stg",
    storageBucket: "coachingapp1-stg.appspot.com",
    messagingSenderId: "806777259833",
    appId: "1:806777259833:web:334e1d272d7ed77b7a4ae8",
    measurementId: "G-H2WNN8Q892"
            )   
        @firebaseInfo.save

        redirect_to("/apply/index")
        
    end
    
    def fbNew
        @currentView = "fbNew"

        @anaPointID = ["ANGLE_NECK","ANGLE_R_SHOULDER","ANGLE_L_SHOULDER","ANGLE_L_ELBOW","ANGLE_R_ELBOW","ANGLE_R_HIP","ANGLE_L_HIP","ANGLE_R_KNEE","ANGLE_L_KNEE","ANGLE_R_ANKLE","ANGLE_L_ANKLE","ANGLE_AXIS","ANGLE_GROUND"]

    end

end
