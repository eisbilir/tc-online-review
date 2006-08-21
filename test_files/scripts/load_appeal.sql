	select a.appeal_id,  
            sq.q_template_v_id as scorecard_question_id,  
            s.scorecard_id,  
            (select submitter_id from submission where submission_id = s.submission_id and cur_version=1) as user_id,  
            s.author_id as reviewer_id,  
            s.project_id,  
            sq.evaluation_id as final_evaluation_id,  
            a. appeal_text,  
            a.appeal_response,  
            a.raw_evaluation_id  
            from appeal a, scorecard s, scorecard_question sq  
            where s.scorecard_id = sq.scorecard_id  
            and sq.question_id = a.question_id  
            and sq.cur_version = 1  
            and s.cur_version = 1   
            and a.cur_version = 1  
            and a.is_resolved = 1  
            and sq.evaluation_id is not null  
            and project_id = ?  
            and (a.modify_date>? OR s.modify_date>? OR sq.modify_date>?)

            
	select ric.review_item_comment_id as appeal_id
		,ri.review_item_id  as scorecard_question_id
        ,ri.review_id as scorecard_id
        ,(select value from resource_info where resource_id = u.resource_id and resource_info_type_id = 1) as user_id
        ,(select value from resource_info where resource_id = r.resource_id and resource_info_type_id = 1) as reviewer_id
        ,u.project_id
        ,ri.answer as final_evaluation_id
        ,ric.content as appeal_text
        ,ric_resp.content as appeal_response
        ,ric_resp.extra_info as raw_evaluation_id
        from review_item_comment ric
        	inner join review_item  ri
        	on ric.review_item_id = ri.review_item_id 
        	inner join review r 
        	on ri.review_id = r.review_id  
        	inner join submission s
        	on r.submission_id = s.submission_id        	
        	inner join upload u
        	on u.upload_id = s.upload_id
        	inner join resource res
        	on r.resource_id = res.resource_id
        	and res.resource_role_id in (2, 3, 4, 5, 6, 7)
        	inner join review_item_comment ric_resp
        	on ric_resp.review_item_id = ri.review_item_id 
        	and ric_resp.comment_type_id = 5
        where ric.comment_type_id = 4
        and (ric.modify_date > ? OR ri.modify_date > ? OR r.modify_date > ? OR s.modify_date > ?)
        
final_evaluation_id should be parsed     
raw_evaluation_id   