CREATE DEFINER=`epadmin`@`%` PROCEDURE `approval_rm_change`(IN empcode INT, IN reqtype CHAR(20),IN createdt CHAR(20),IN empid CHAR(100))
BEGIN
	DECLARE countRow INT;
	UPDATE reporting_manager_requests rm1 SET rm1.old_rm_approval = CASE WHEN (rm1.old_rm = empcode and rm1.old_rm_approval='Pending') THEN reqtype  WHEN rm1.old_rm_approval='Pending' THEN 'Pending' WHEN rm1.old_rm_approval='Approved' THEN 'Approved' WHEN rm1.old_rm_approval='Rejected' THEN 'Rejected' END,
    rm1.new_rm_approval = CASE WHEN (rm1.new_rm = empcode  and rm1.new_rm_approval='Pending') THEN reqtype  WHEN rm1.new_rm_approval='Pending' THEN 'Pending' WHEN rm1.new_rm_approval ='Approved' THEN 'Approved' WHEN rm1.new_rm_approval ='Rejected' THEN 'Rejected'  END,
    rm1.status =  CASE WHEN ( (rm1.old_rm_approval IS NULL OR rm1.old_rm_approval='Approved')   and rm1.new_rm_approval='Approved') THEN 'Approved' WHEN (rm1.old_rm_approval='Rejected'  or  rm1.new_rm_approval='Rejected' ) THEN 'Rejected'  WHEN rm1.status ='Pending' THEN 'Pending'  END,
    rm1.approved_date =  CASE WHEN ((rm1.old_rm_approval IS NULL OR rm1.old_rm_approval='Approved')  and rm1.new_rm_approval='Approved') THEN CURDATE()  END
    where  rm1.created_date =createdt and rm1.emp_id =empid;
  SET countRow= ROW_COUNT();
  IF(countRow >0) THEN 
  
   UPDATE reporting_manager rm
   JOIN (
     select count(*) as cnt from reporting_manager_requests  where status='Approved' and created_date =createdt and emp_id =empid
    )t2 on t2.cnt=1 
    set rm.end_date =(select DATE_SUB(begin_date,INTERVAL 1 DAY) as dt from reporting_manager_requests  where status='Approved' and created_date =createdt and emp_id =empid)
    where rm.emp_id=empid and (rm.end_date is null or rm.end_date='');
   
   insert into reporting_manager (emp_id,manager_code,begin_date)
   select emp_id ,new_rm ,DATE_FORMAT(begin_date,'%Y-%m-%d') as dt from reporting_manager_requests  where status='Approved' and created_date =createdt and emp_id =empid and NOT EXISTS (select * from reporting_manager rm where rm.emp_id=empid and (rm.end_date is null or rm.end_date=''));
  
  END IF;
 
  select (CASE WHEN (rm.old_rm = empcode and rm.old_rm_approval='Approved' and rm.status not in('Approved')) THEN 1 WHEN (rm.new_rm = empcode and rm.new_rm_approval ='Approved' and rm.status not in('Approved')) THEN 2 WHEN (rm.status='Approved') THEN 3 WHEN (rm.status='Rejected') THEN 4 WHEN (rm.status='Pending') THEN 0 END) as status  from reporting_manager_requests rm 
  where rm.created_date =createdt and rm.emp_id =empid;
  
 /* return status =1 then old rm approve if 2 new rm approve if 3 then fully approved if 4 then rejected if 0 then no updte*/
 
END;




CREATE DEFINER=`epadmin`@`%` PROCEDURE `change_reset_pwd`(IN empid CHAR(100),IN newPwd CHAR(100),IN oldPwd CHAR(100))
BEGIN
	DECLARE countRow INT;
    DECLARE countTotlRecord INT;
	UPDATE employee_login_details el set el.emp_password =AES_ENCRYPT(newPwd ,'mydbq@2023'),el.last_pwd_change_date =CURDATE(),el.is_active='Y',el.is_lock=0 ,el.isinitial_pwd_change='Y'
    WHERE el.emp_email =empid and AES_DECRYPT(el.emp_password, 'mydbq@2023')=oldPwd;
    
   SET countRow= ROW_COUNT();
   IF(countRow >0) THEN
     INSERT INTO emp_pwd_history (emp_id,pwd) values(empid,AES_ENCRYPT(newPwd ,'mydbq@2023'));
   END IF;
   SET countTotlRecord = (SELECT COUNT(*) FROM emp_pwd_history where emp_id= empid);
   IF(countTotlRecord >3) THEN
     DELETE FROM emp_pwd_history  where emp_id= empid order by id limit 1;
   END IF;
END;


CREATE DEFINER=`epadmin`@`%` PROCEDURE `data_process_onboard`(IN empCode CHAR(100),IN password CHAR(100))
BEGIN
	DECLARE countRecordPers INT;
    DECLARE countRecordLogin INT;
    DECLARE countRecordUserPhoto INT;
   SET countRecordPers = (select Count(*) cnt from emp_personaldata pr join employee_master em on em.emp_email = pr.emp_id where em.emp_code=empCode);
   SET countRecordLogin = (select Count(*) cnt from employee_login_details eld join employee_master em on em.emp_email = eld.emp_email where em.emp_code=empCode);
   SET countRecordUserPhoto = (select Count(*) cnt from emp_personal_profile_photo eld join employee_master em on em.emp_email = eld.emp_id where em.emp_code=empCode);
 IF(countRecordPers <1) THEN
     insert into emp_personaldata (emp_id,preferred_name,form_of_address,first_name,middle_name,last_name,country_of_birth)
     select em.emp_email , concat(IFNULL(em.form_of_address,''),' ',IFNULL(em.emp_name,''),' ',IFNULL(em.middle_name,''),' ',IFNULL(em.last_name,'')) as name,  IFNULL(em.form_of_address,''),IFNULL(em.emp_name,''),IFNULL(em.middle_name,''),IFNULL(em.last_name,'') ,em.country_of_birth 
     from employee_master em where em.emp_code=empCode;
 ELSE 
  UPDATE emp_personaldata pers
  INNER JOIN employee_master ms ON pers.emp_id=ms.emp_email and  ms.emp_code=empCode
  SET 
  pers.preferred_name=concat(IFNULL(ms.form_of_address,''),' ',IFNULL(ms.emp_name,''),' ',IFNULL(ms.middle_name,''),' ',IFNULL(ms.last_name,'')),
  pers.form_of_address=IFNULL(ms.form_of_address,''),
  pers.first_name=IFNULL(ms.emp_name,''),
  pers.middle_name=IFNULL(ms.middle_name,''),
  pers.last_name=IFNULL(ms.last_name,''),
  pers.country_of_birth=ms.country_of_birth ;
 END IF;

IF(countRecordLogin <1) THEN
   insert into employee_login_details (emp_email,emp_password,is_active) select em.emp_email ,AES_ENCRYPT(password ,'mydbq@2023') as pwd,'Y' as is_active from employee_master em where em.emp_code=empCode;
ELSE
    UPDATE employee_login_details set is_active='Y',emp_password=AES_ENCRYPT(password ,'mydbq@2023') where emp_email =(select em.emp_email from employee_master em where em.emp_code=empCode);
END IF;

IF(countRecordUserPhoto <1) THEN
   insert into emp_personal_profile_photo (emp_id,profile_photo) select em.emp_email ,em.picture from employee_master em where em.emp_code=empCode;
ELSE
     UPDATE emp_personal_profile_photo pers
     INNER JOIN employee_master ms ON pers.emp_id=ms.emp_email and  ms.emp_code=empCode
     SET 
     pers.profile_photo=ms.picture ;
END IF;

update employee_master em set em.process_data=1 where em.emp_code=empCode; 

END;