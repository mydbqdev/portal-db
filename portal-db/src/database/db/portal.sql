CREATE TABLE `employee_master` (
  `emp_email` varchar(50) NOT NULL,
  `emp_band` varchar(10)  NOT NULL,
  `emp_name` varchar(100)  NOT NULL,
  `emp_code` varchar(20)  NOT NULL,
  `designation` varchar(100)  NOT NULL,
  `middle_name` varchar(100)  DEFAULT NULL,
  `last_name` varchar(100)  NOT NULL,
  `date_of_birth` date NOT NULL,
  `gender` varchar(10)  NOT NULL,
  `blood_group` varchar(5)  NOT NULL,
  `relation` varchar(100)  NOT NULL,
  `personal_email` varchar(100)  NOT NULL,
  `profile` mediumblob,
  `emp_join_date` date NOT NULL,
  `form_of_address` varchar(10)  NOT NULL,
  `nationality` varchar(100)  NOT NULL,
  `country_of_birth` varchar(100)  NOT NULL,
  `year` varchar(10)  DEFAULT NULL,
  `process_data` int NOT NULL DEFAULT '0',
  `picture` mediumblob,
  `current_address` varchar(500)  NOT NULL,
  `permanent_address` varchar(500)  NOT NULL,
  `posted_on` datetime DEFAULT CURRENT_TIMESTAMP,
  `rejoin` int DEFAULT '0',
  PRIMARY KEY (`emp_email`),
  UNIQUE KEY `emp_code` (`emp_code`),
  UNIQUE KEY `employee_master_UN` (`personal_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO employee_master (emp_email, emp_band, emp_name, emp_code, designation, middle_name, last_name, date_of_birth, gender, blood_group, relation, personal_email, profile, emp_join_date, form_of_address, nationality, country_of_birth, `year`, process_data, picture, current_address, permanent_address, posted_on) VALUES('sysadmin@mydbq.com', 'D0', 'SYS', '9', 'SYSTEM', NULL, 'Admin', '2020-04-01', 'Male', 'O+', "SonOf_ ", 'sysadmin@dbq.com', NULL, '2020-04-01', 'Mr.', 'Indian', 'India', NULL, 1, NULL, 'BGLR', 'BGLR', NULL);

CREATE TABLE `employee_login_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `emp_email` varchar(50)  NOT NULL,
  `is_active` varchar(5) DEFAULT NULL,
  `isinitial_pwd_change` varchar(5) DEFAULT NULL,
  `last_pwd_change_date` date DEFAULT NULL,
  `is_lock` int DEFAULT '0',
  `emp_password` varbinary(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `employee_login_details_UN` (`emp_email`),
  CONSTRAINT `employee_login_details_FK` FOREIGN KEY (`emp_email`) REFERENCES `employee_master` (`emp_email`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

INSERT INTO employee_login_details (id, emp_email, emp_password, is_active, isinitial_pwd_change, last_pwd_change_date, is_lock) VALUES(1, 'sysadmin@mydbq.com', AES_ENCRYPT('sysadmin' ,'mydbq@2023'), 'Y', 'Y', '2023-07-26', 0);

CREATE TABLE `emp_pwd_history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `emp_id` varchar(50)  NOT NULL,
  `pwd` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `emp_pwd_history_FK` (`emp_id`),
  CONSTRAINT `emp_pwd_history_FK` FOREIGN KEY (`emp_id`) REFERENCES `employee_master` (`emp_email`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `app_role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `role_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

INSERT INTO app_role (id, description, role_name) VALUES(1, 'All Access', 'ALL ACCESS');


CREATE TABLE `role_screen` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int NOT NULL,
  `screen_name` varchar(100) NOT NULL,
  `read_prv` tinyint NOT NULL,
  `write_prv` tinyint NOT NULL,
  PRIMARY KEY (`screen_name`,`role_id`),
  UNIQUE KEY `id` (`id`),
  KEY `role_screen_FK` (`role_id`),
  CONSTRAINT `role_screen_FK` FOREIGN KEY (`role_id`) REFERENCES `app_role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

INSERT INTO role_screen (role_id, screen_name, read_prv, write_prv) VALUES(1, 'ADMIN_DASHBOARD', 1, 1);
INSERT INTO role_screen (role_id, screen_name, read_prv, write_prv) VALUES(1, 'ANNOUNCEMENTS', 1, 1);
INSERT INTO role_screen (role_id, screen_name, read_prv, write_prv) VALUES(1, 'APPRAISAL', 1, 1);
INSERT INTO role_screen (role_id, screen_name, read_prv, write_prv) VALUES(1, 'BANK_DETAILS_APPROVALS', 1, 1);
INSERT INTO role_screen (role_id, screen_name, read_prv, write_prv) VALUES(1, 'BRANCH_INFO', 1, 1);
INSERT INTO role_screen (role_id, screen_name, read_prv, write_prv) VALUES(1, 'COMPENSATION', 1, 1);
INSERT INTO role_screen (role_id, screen_name, read_prv, write_prv) VALUES(1, 'COMPENSATION_REPORT', 1, 1);
INSERT INTO role_screen (role_id, screen_name, read_prv, write_prv) VALUES(1, 'DBQ_RECRUITER', 1, 1);
INSERT INTO role_screen (role_id, screen_name, read_prv, write_prv) VALUES(1, 'DBQ_VERIFY', 1, 1);
INSERT INTO role_screen (role_id, screen_name, read_prv, write_prv) VALUES(1, 'EMAIL_CONFIG', 1, 1);
INSERT INTO role_screen (role_id, screen_name, read_prv, write_prv) VALUES(1, 'EMP_LIST_REPORTS', 1, 1);
INSERT INTO role_screen (role_id, screen_name, read_prv, write_prv) VALUES(1, 'EMP_NOMINEE_REPORTS', 1, 1);
INSERT INTO role_screen (role_id, screen_name, read_prv, write_prv) VALUES(1, 'EMPLOYEE_BGV_INFO', 1, 1);
INSERT INTO role_screen (role_id, screen_name, read_prv, write_prv) VALUES(1, 'EMPLOYEE_INFO', 1, 1);
INSERT INTO role_screen (role_id, screen_name, read_prv, write_prv) VALUES(1, 'EMPLOYEE_MGM', 1, 1);
INSERT INTO role_screen (role_id, screen_name, read_prv, write_prv) VALUES(1, 'EMPLOYEE_SEARCH', 1, 1);
INSERT INTO role_screen (role_id, screen_name, read_prv, write_prv) VALUES(1, 'EMPLOYEE_TIMESHEET', 1, 1);
INSERT INTO role_screen (role_id, screen_name, read_prv, write_prv) VALUES(1, 'EMS_APPROVAL', 1, 1);
INSERT INTO role_screen (role_id, screen_name, read_prv, write_prv) VALUES(1, 'EMS_SETTLEMENT', 1, 1);
INSERT INTO role_screen (role_id, screen_name, read_prv, write_prv) VALUES(1, 'FINANCE_AND_TIME', 1, 1);
INSERT INTO role_screen (role_id, screen_name, read_prv, write_prv) VALUES(1, 'FINANCE_REPORT', 1, 1);
INSERT INTO role_screen (role_id, screen_name, read_prv, write_prv) VALUES(1, 'ION_BOARD', 1, 1);
INSERT INTO role_screen (role_id, screen_name, read_prv, write_prv) VALUES(1, 'LEAVE_BALANCE_REPORTS', 1, 1);
INSERT INTO role_screen (role_id, screen_name, read_prv, write_prv) VALUES(1, 'OFFICE_TIME_SHEET', 1, 1);
INSERT INTO role_screen (role_id, screen_name, read_prv, write_prv) VALUES(1, 'PERFORMANCE_RATING', 1, 1);
INSERT INTO role_screen (role_id, screen_name, read_prv, write_prv) VALUES(1, 'PROJECT_ASSIGNATION', 1, 1);
INSERT INTO role_screen (role_id, screen_name, read_prv, write_prv) VALUES(1, 'PROJECT_REPORTS', 1, 1);
INSERT INTO role_screen (role_id, screen_name, read_prv, write_prv) VALUES(1, 'REQUIREMENT_APPROVALS', 1, 1);
INSERT INTO role_screen (role_id, screen_name, read_prv, write_prv) VALUES(1, 'RESIGNATION_REPORTS', 1, 1);
INSERT INTO role_screen (role_id, screen_name, read_prv, write_prv) VALUES(1, 'RM_CHANGE_REQUEST', 1, 1);
INSERT INTO role_screen (role_id, screen_name, read_prv, write_prv) VALUES(1, 'ROLE_MASTER', 1, 1);
INSERT INTO role_screen (role_id, screen_name, read_prv, write_prv) VALUES(1, 'SALARY_ACCOUNT_DETAILS_REPORT', 1, 1);
INSERT INTO role_screen (role_id, screen_name, read_prv, write_prv) VALUES(1, 'SCHEDULER_RUN', 1, 1);
INSERT INTO role_screen (role_id, screen_name, read_prv, write_prv) VALUES(1, 'SETTINGS_CONFIG', 1, 1);
INSERT INTO role_screen (role_id, screen_name, read_prv, write_prv) VALUES(1, 'TAX_DECLARATION_APPROVALS', 1, 1);
INSERT INTO role_screen (role_id, screen_name, read_prv, write_prv) VALUES(1, 'TAX_DECLARATION_REPORTS', 1, 1);
INSERT INTO role_screen (role_id, screen_name, read_prv, write_prv) VALUES(1, 'TIME_SHEET', 1, 1);
INSERT INTO role_screen (role_id, screen_name, read_prv, write_prv) VALUES(1, 'TIME_SHEET_REPORTS', 1, 1);
INSERT INTO role_screen (role_id, screen_name, read_prv, write_prv) VALUES(1, 'UPLOAD_FILE', 1, 1);
INSERT INTO role_screen (role_id, screen_name, read_prv, write_prv) VALUES(1, 'USER_MASTER', 1, 1);

CREATE TABLE `user_role` (
  `user_id` varchar(50) NOT NULL,
  `role_id` int NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `user_role_FK_1` (`user_id`),
  KEY `user_role_FK` (`role_id`),
  CONSTRAINT `user_role_FK` FOREIGN KEY (`role_id`) REFERENCES `app_role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_role_FK_1` FOREIGN KEY (`user_id`) REFERENCES `employee_master` (`emp_email`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

INSERT INTO user_role (user_id, role_id, id) VALUES('sysadmin@mydbq.com', 1, 1);

CREATE TABLE aadhar_details (
  emp_id varchar(50)  NOT NULL,
  aadhar_no varchar(12)  DEFAULT NULL,
  name_as_per_aadhar varchar(255)  DEFAULT NULL,
  dob_as_per_aadhar date DEFAULT NULL,
  gender_as_in_aadhar varchar(10) DEFAULT NULL,
  f_m_h_name_as_in_aadhar varchar(255) DEFAULT NULL,
  relation_with_above varchar(255) DEFAULT NULL,
  aadhar_card mediumblob,
  disclaimer varchar(2000) DEFAULT NULL,
  aadhar_key varchar(20) DEFAULT NULL,
  PRIMARY KEY (emp_id),
  CONSTRAINT aadhar_details_FK FOREIGN KEY (emp_id) REFERENCES employee_master (emp_email)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE band_with_designations (
  band varchar(20) NOT NULL,
  designation varchar(100) NOT NULL,
  PRIMARY KEY (band,designation)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE org_project_list (
  id int NOT NULL AUTO_INCREMENT,
  project_code varchar(50)  NOT NULL,
  project_name varchar(100) NOT NULL,
  is_active varchar(1) NOT NULL DEFAULT 'Y',
  default_emp int NOT NULL DEFAULT '0',
  PRIMARY KEY (id),
  UNIQUE KEY org_project_list_UN (project_code)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

CREATE TABLE org_project_task (
  id int NOT NULL AUTO_INCREMENT,
  task_name varchar(100) NOT NULL,
  org_project_id int DEFAULT NULL,
  is_active varchar(1) NOT NULL DEFAULT 'Y',
  PRIMARY KEY (id),
  KEY org_project_task_FK (org_project_id),
  CONSTRAINT org_project_task_FK FOREIGN KEY (org_project_id) REFERENCES org_project_list (id) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

CREATE TABLE assign_project_details (
  id int NOT NULL AUTO_INCREMENT,
  project varchar(30) DEFAULT NULL,
  emp_code varchar(30) DEFAULT NULL,
  start_date date DEFAULT NULL,
  end_date date DEFAULT NULL,
  is_billable varchar(20) DEFAULT NULL,
  percentage varchar(100) DEFAULT NULL,
  PRIMARY KEY (id),
  KEY assign_project_details_FK (emp_code),
  KEY assign_project_details_FK_1 (project),
  CONSTRAINT assign_project_details_FK FOREIGN KEY (emp_code) REFERENCES employee_master (emp_code),
  CONSTRAINT assign_project_details_FK_1 FOREIGN KEY (project) REFERENCES org_project_list (project_code)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

CREATE TABLE audit_action_log (
  timestamp timestamp NOT NULL,
  email_account text NOT NULL,
  action_type text NOT NULL,
  table_name text NOT NULL,
  action_details json NOT NULL,
  PRIMARY KEY (timestamp)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE bank_details (
  bank_name varchar(50)  NOT NULL,
  bank_account_number varchar(50)  NOT NULL,
  status varchar(50) DEFAULT NULL,
  sub_type varchar(30)  NOT NULL,
  user_name varchar(50)  NOT NULL,
  id int NOT NULL AUTO_INCREMENT,
  ifsc varchar(20) NOT NULL,
  payee varchar(100) NOT NULL,
  ehs_rep_code varchar(100) DEFAULT NULL,
  PRIMARY KEY (id),
  KEY user_name (user_name),
  CONSTRAINT bank_details_FK FOREIGN KEY (user_name) REFERENCES employee_master (emp_email)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

CREATE TABLE communication (
  id int NOT NULL AUTO_INCREMENT,
  sub_type varchar(50)  DEFAULT NULL,
  details varchar(250)  DEFAULT NULL,
  user_name varchar(50) DEFAULT NULL,
  PRIMARY KEY (id),
  KEY user_name (user_name),
  CONSTRAINT communication_FK FOREIGN KEY (user_name) REFERENCES employee_master (emp_email)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

CREATE TABLE curr_work_loc (
  id int NOT NULL AUTO_INCREMENT,
  from_date varchar(50) DEFAULT NULL,
  to_date varchar(50) DEFAULT NULL,
  country varchar(100) DEFAULT NULL,
  location varchar(100) DEFAULT NULL,
  tower varchar(100) NOT NULL,
  curr_loc varchar(50) DEFAULT NULL,
  emp_email varchar(50)  DEFAULT NULL,
  PRIMARY KEY (id),
  KEY emp_email (emp_email),
  CONSTRAINT curr_work_loc_FK FOREIGN KEY (emp_email) REFERENCES employee_master (emp_email)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

CREATE TABLE dbqrequiter (
  sr_no varchar(100) NOT NULL DEFAULT '000',
  primary_skill varchar(100) DEFAULT NULL,
  secondary_skill varchar(100) DEFAULT NULL,
  st_no_of_positions int DEFAULT '0',
  experience varchar(100) DEFAULT NULL,
  status varchar(100) DEFAULT NULL,
  years int DEFAULT '0',
  months int DEFAULT '0',
  cu_no_of_positions int DEFAULT '0',
  PRIMARY KEY (sr_no),
  UNIQUE KEY sr_no_UNIQUE (sr_no)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE education_details (
  begin_date varchar(255) DEFAULT NULL,
  end_date varchar(255) DEFAULT NULL,
  details varchar(255) DEFAULT NULL,
  sub_type varchar(255) DEFAULT NULL,
  id int NOT NULL AUTO_INCREMENT,
  user_name varchar(50) DEFAULT NULL,
  PRIMARY KEY (id),
  KEY user_name (user_name),
  CONSTRAINT education_details_FK FOREIGN KEY (user_name) REFERENCES employee_master (emp_email)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

CREATE TABLE emp_address (
  id int NOT NULL AUTO_INCREMENT,
  begin_date varchar(50) DEFAULT NULL,
  end_date varchar(50) DEFAULT NULL,
  address varchar(255) DEFAULT NULL,
  user_name varchar(50) DEFAULT NULL,
  sub_type varchar(50) DEFAULT NULL,
  PRIMARY KEY (id),
  KEY user_name (user_name),
  CONSTRAINT emp_address_FK FOREIGN KEY (user_name) REFERENCES employee_master (emp_email)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

CREATE TABLE emp_assignment_timesheet_task (
  id int NOT NULL AUTO_INCREMENT,
  emp_id varchar(50)  NOT NULL,
  project_activity_task_id int NOT NULL,
  start_date date NOT NULL,
  end_date date DEFAULT NULL,
  PRIMARY KEY (id),
  KEY emp_assignment_timesheet_task_FK_1 (project_activity_task_id),
  KEY emp_id (emp_id),
  CONSTRAINT emp_assignment_timesheet_task_ibfk_1 FOREIGN KEY (emp_id) REFERENCES employee_master (emp_email) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

CREATE TABLE emp_leave_request (
  user_name varchar(100) NOT NULL,
  leave_type varchar(20) NOT NULL,
  created_date date DEFAULT NULL,
  leave_date date NOT NULL,
  leave_duration int DEFAULT NULL,
  approver varchar(100) DEFAULT NULL,
  status varchar(20) DEFAULT NULL,
  reason varchar(2000)  DEFAULT NULL,
  approved_date date DEFAULT NULL,
  comment varchar(2000)  DEFAULT NULL,
  cc_mails varchar(2000) DEFAULT NULL,
  PRIMARY KEY (user_name,leave_date),
  KEY emp_leave_request_FK (user_name),
  CONSTRAINT emp_leave_request_FK FOREIGN KEY (user_name) REFERENCES employee_master (emp_email)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE emp_personal_profile_photo (
  emp_id varchar(50)  NOT NULL,
  profile_photo_bucket varchar(100) DEFAULT NULL,
  profile_photo_key varchar(100) DEFAULT NULL,
  profile_photo mediumblob,
  profile_photo_pth varchar(1000) DEFAULT NULL,
  PRIMARY KEY (emp_id),
  CONSTRAINT emp_personal_profile_photo_FK FOREIGN KEY (emp_id) REFERENCES employee_master (emp_email) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE emp_personaldata (
  emp_id varchar(50)  NOT NULL,
  form_of_address varchar(255)  NOT NULL,
  first_name varchar(255)  NOT NULL,
  last_name varchar(255)  NOT NULL,
  marital_status varchar(255) DEFAULT NULL,
  country_of_birth varchar(255)  NOT NULL,
  state_of_birth varchar(255) DEFAULT NULL,
  citizen varchar(255) DEFAULT NULL,
  marriage_wedding_card mediumblob,
  passport_ssc_certificate mediumblob,
  ehs_rep varchar(200)  DEFAULT NULL,
  dual_citizen varchar(200)  DEFAULT NULL,
  birth_city varchar(200)  DEFAULT NULL,
  marriage_date varchar(20) DEFAULT NULL,
  preferred_name varchar(200)  DEFAULT NULL,
  middle_name varchar(100)  DEFAULT NULL,
  profile_photo_bucket varchar(100) DEFAULT NULL,
  profile_photo_key varchar(100) DEFAULT NULL,
  passport_ssc_doc_name varchar(100) DEFAULT NULL,
  PRIMARY KEY (emp_id),
  CONSTRAINT emp_personaldata_FK FOREIGN KEY (emp_id) REFERENCES employee_master (emp_email) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE emp_shift_mngt (
  id int NOT NULL AUTO_INCREMENT,
  emp_id varchar(50)  NOT NULL,
  created_date datetime NOT NULL,
  shift_date date NOT NULL,
  start_time datetime NOT NULL,
  end_time datetime NOT NULL,
  PRIMARY KEY (id),
  KEY emp_shift_mngt_FK (emp_id),
  CONSTRAINT emp_shift_mngt_FK FOREIGN KEY (emp_id) REFERENCES employee_master (emp_email)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

CREATE TABLE employee_account (
  emp_id varchar(50)  NOT NULL,
  pf_id varchar(20) DEFAULT NULL,
  vpf_percentage varchar(20) DEFAULT NULL,
  vpf_amount varchar(20) DEFAULT NULL,
  super_annuation_id varchar(20) DEFAULT NULL,
  gratuity_id varchar(20) DEFAULT NULL,
  professional_tax varchar(20) DEFAULT NULL,
  eligibility varchar(20) DEFAULT NULL,
  labour_welfare_fund varchar(20) DEFAULT NULL,
  PRIMARY KEY (emp_id),
  CONSTRAINT employee_account_FK FOREIGN KEY (emp_id) REFERENCES employee_master (emp_email)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE employee_bgv_details (
  id int NOT NULL AUTO_INCREMENT,
  emp_code varchar(45) DEFAULT NULL,
  reporting_manager varchar(45) DEFAULT NULL,
  teamate varchar(45) DEFAULT NULL,
  company_mail varchar(45) DEFAULT NULL,
  current_address_status varchar(1)  NOT NULL DEFAULT 'N',
  permanant_address_status varchar(1)  NOT NULL DEFAULT 'N',
  qualification varchar(100)  DEFAULT NULL,
  status varchar(100) DEFAULT NULL,
  remarks varchar(100) DEFAULT NULL,
  qualification_status varchar(1)  NOT NULL DEFAULT 'N',
  previous_exp_status varchar(1)  NOT NULL DEFAULT 'N',
  noc_status varchar(1)  NOT NULL DEFAULT 'N',
  PRIMARY KEY (id),
  UNIQUE KEY emp_code (emp_code)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;


CREATE TABLE employee_previous_experience (
  id int NOT NULL AUTO_INCREMENT,
  emp_email varchar(50)  DEFAULT NULL,
  org_name varchar(30) DEFAULT NULL,
  org_details varchar(30) DEFAULT NULL,
  begin_date varchar(10) DEFAULT NULL,
  end_date varchar(10) DEFAULT NULL,
  is_lock varchar(10) DEFAULT NULL,
  PRIMARY KEY (id),
  KEY employee_previous_experience_FK (emp_email),
  CONSTRAINT employee_previous_experience_FK FOREIGN KEY (emp_email) REFERENCES employee_master (emp_email) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE employee_requests (
  id int NOT NULL AUTO_INCREMENT,
  emp_id varchar(50)  DEFAULT NULL,
  id_request_type varchar(20) DEFAULT NULL,
  damage_card mediumblob,
  approval_type varchar(20) DEFAULT NULL,
  approved_by varchar(20) DEFAULT NULL,
  status varchar(15) DEFAULT NULL,
  comments varchar(2400)  DEFAULT NULL,
  disclaimer varchar(10) DEFAULT NULL,
  reason varchar(2000)  DEFAULT NULL,
  created_date date DEFAULT NULL,
  approved_date date DEFAULT NULL,
  PRIMARY KEY (id),
  KEY employee_requests_FK (emp_id),
  CONSTRAINT employee_requests_FK FOREIGN KEY (emp_id) REFERENCES employee_master (emp_email)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;


CREATE TABLE ems_login_details (
  id int NOT NULL AUTO_INCREMENT,
  emp_email varchar(50)  NOT NULL,
  emp_personal_email varchar(50)  NOT NULL,
  emp_password varbinary(100) DEFAULT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY ems_login_details (emp_email)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

CREATE TABLE exit_management_sys (
  id int NOT NULL AUTO_INCREMENT,
  resign_type varchar(150) DEFAULT NULL,
  resign_date date DEFAULT NULL,
  req_relieve_date date DEFAULT NULL,
  act_relieve_date date DEFAULT NULL,
  status_of_approval_rm varchar(30) DEFAULT NULL,
  status_of_approval_hr varchar(30) DEFAULT NULL,
  emp_code varchar(20) DEFAULT NULL,
  manager_code varchar(30) DEFAULT NULL,
  hr_code varchar(30) DEFAULT NULL,
  relieve_reason varchar(500) DEFAULT NULL,
  relieve_detailed_reason text,
  rehire varchar(100) DEFAULT NULL,
  1to1discussion_completed varchar(100) DEFAULT NULL,
  rm_comments varchar(300) DEFAULT NULL,
  hr_comments varchar(300) DEFAULT NULL,
  company_equipment varchar(100) DEFAULT NULL,
  desk_files varchar(100) DEFAULT NULL,
  other_items varchar(100) DEFAULT NULL,
  id_badge varchar(100) DEFAULT NULL,
  status varchar(30) DEFAULT NULL,
  withdrawal_status varchar(45) DEFAULT NULL,
  withdrawal_date date DEFAULT NULL,
  settlement_status int DEFAULT '0',
  relieve_date date DEFAULT NULL,
  ownself int DEFAULT '0',
  rejoin int DEFAULT '0',
  PRIMARY KEY (id),
  KEY emp_code (emp_code),
  CONSTRAINT exit_management_sys_ibfk_1 FOREIGN KEY (emp_code) REFERENCES employee_master (emp_code)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;


CREATE TABLE family_details (
  id int NOT NULL AUTO_INCREMENT,
  valid_from varchar(50) DEFAULT NULL,
  valid_to varchar(50) DEFAULT NULL,
  first_name varchar(50) DEFAULT NULL,
  last_name varchar(50) DEFAULT NULL,
  middle_name varchar(50) DEFAULT NULL,
  known_as varchar(50) DEFAULT NULL,
  gender varchar(50) DEFAULT NULL,
  sub_type varchar(50) DEFAULT NULL,
  birth_place varchar(50) DEFAULT NULL,
  nationality varchar(50) DEFAULT NULL,
  country_of_birth varchar(50) DEFAULT NULL,
  dependent varchar(50) DEFAULT NULL,
  user_name varchar(50) DEFAULT NULL,
  dob date DEFAULT NULL,
  PRIMARY KEY (id),
  KEY user_name (user_name),
  CONSTRAINT family_details_FK FOREIGN KEY (user_name) REFERENCES employee_master (emp_email)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;


CREATE TABLE form16 (
  emp_code varchar(20) NOT NULL,
  company varchar(30) DEFAULT NULL,
  year varchar(10) NOT NULL,
  emp_email varchar(50)  DEFAULT NULL,
  bucket varchar(200) DEFAULT NULL,
  formb_key varchar(450) DEFAULT NULL,
  forma_key varchar(450) DEFAULT NULL,
  PRIMARY KEY (year,emp_code),
  KEY emp_email (emp_email),
  CONSTRAINT form16_FK FOREIGN KEY (emp_email) REFERENCES employee_master (emp_email)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE full_n_final_settlement_details (
  emp_code varchar(10) NOT NULL,
  conveyance_payable decimal(10,0) DEFAULT NULL,
  medical_deductions decimal(10,0) DEFAULT NULL,
  other_deductions decimal(10,0) DEFAULT NULL,
  leave_allowance decimal(10,0) DEFAULT NULL,
  lop int DEFAULT NULL,
  settlement_month varchar(20) DEFAULT NULL,
  hrd_no varchar(100) DEFAULT NULL,
  doc_dt date DEFAULT NULL,
  designation varchar(100) DEFAULT NULL,
  emp_name varchar(200) DEFAULT NULL,
  month_year varchar(100) DEFAULT NULL,
  total_earnings varbinary(100) DEFAULT NULL,
  total_deductions varbinary(100) DEFAULT NULL,
  PRIMARY KEY (emp_code)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE hike_details (
  id int NOT NULL AUTO_INCREMENT,
  basic decimal(10,0) DEFAULT NULL,
  d_a decimal(10,0) DEFAULT NULL,
  h_r_a decimal(10,0) DEFAULT NULL,
  flexible decimal(10,0) DEFAULT NULL,
  perfomance_bonus decimal(10,0) DEFAULT NULL,
  l_t_a decimal(10,0) DEFAULT NULL,
  other_allowances decimal(10,0) DEFAULT NULL,
  emp_email varchar(50) NOT NULL,
  effective_date date NOT NULL,
  curr_salary decimal(10,0) DEFAULT NULL,
  release_date date DEFAULT NULL,
  default_hike int DEFAULT '1',
  monthly_bsc decimal(10,0) DEFAULT NULL,
  monthly_house decimal(10,0) DEFAULT NULL,
  designation varchar(50) DEFAULT NULL,
  PRIMARY KEY (id),
  KEY hike_details_FK (emp_email),
  CONSTRAINT hike_details_FK FOREIGN KEY (emp_email) REFERENCES employee_master (emp_email) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

CREATE TABLE id_card_request (
  emp_id varchar(255) NOT NULL,
  blood_group varchar(255) DEFAULT NULL,
  comments varchar(255) DEFAULT NULL,
  current_working_location varchar(255) DEFAULT NULL,
  disclaimer varchar(255) DEFAULT NULL,
  emp_name varchar(255) DEFAULT NULL,
  emp_sap_id varchar(255) DEFAULT NULL,
  damaged_card tinyblob,
  request_type varchar(255) DEFAULT NULL,
  PRIMARY KEY (emp_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE it_declaration (
  id int NOT NULL AUTO_INCREMENT,
  emp_email varchar(50) NOT NULL,
  finance_yr varchar(10) NOT NULL,
  type_old_new int NOT NULL DEFAULT '1',
  PRIMARY KEY (id),
  UNIQUE KEY it_declaration_UN (emp_email,finance_yr),
  CONSTRAINT it_declaration_FK FOREIGN KEY (emp_email) REFERENCES employee_master (emp_email)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

CREATE TABLE it_declaration_80c (
  id int NOT NULL AUTO_INCREMENT,
  emp_email varchar(50) NOT NULL,
  finance_yr varchar(10) NOT NULL,
  submission_type varchar(20) NOT NULL,
  80c_type varchar(50) NOT NULL,
  amount varchar(15) NOT NULL,
  policy_number varchar(20) DEFAULT NULL,
  policy_holder_nm varchar(150) DEFAULT NULL,
  relation_type varchar(20) DEFAULT NULL,
  receipt_dt date DEFAULT NULL,
  apprve_amount varchar(15) DEFAULT NULL,
  apprve_dt date DEFAULT NULL,
  status varchar(15) NOT NULL,
  remarks varchar(200) DEFAULT NULL,
  docs varchar(1000) DEFAULT NULL,
  created_on date DEFAULT NULL,
  PRIMARY KEY (id),
  KEY it_declaration_80c_FK (emp_email),
  CONSTRAINT it_declaration_80c_FK FOREIGN KEY (emp_email) REFERENCES employee_master (emp_email)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

CREATE TABLE it_declaration_80d (
  id int NOT NULL AUTO_INCREMENT,
  emp_email varchar(50) NOT NULL,
  finance_yr varchar(10) NOT NULL,
  submission_type varchar(20) NOT NULL,
  amount varchar(15) NOT NULL,
  policy_number varchar(20) DEFAULT NULL,
  policy_holder_nm varchar(150) DEFAULT NULL,
  dob date DEFAULT NULL,
  relation_type varchar(20) DEFAULT NULL,
  citizen_type int DEFAULT '0',
  receipt_dt date DEFAULT NULL,
  apprve_amount varchar(15) DEFAULT NULL,
  apprve_dt date DEFAULT NULL,
  status varchar(15) NOT NULL,
  remarks varchar(200) DEFAULT NULL,
  docs varchar(1000) DEFAULT NULL,
  created_on date DEFAULT NULL,
  PRIMARY KEY (id),
  KEY it_declaration_80d_FK (emp_email),
  CONSTRAINT it_declaration_80d_FK FOREIGN KEY (emp_email) REFERENCES employee_master (emp_email)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

CREATE TABLE it_declaration_80e_ee_eeb (
  id int NOT NULL AUTO_INCREMENT,
  emp_email varchar(50) NOT NULL,
  finance_yr varchar(10) NOT NULL,
  submission_type varchar(20) NOT NULL,
  interest_amount varchar(15)  NOT NULL,
  80_e_type varchar(15) NOT NULL,
  loan_number varchar(20) DEFAULT NULL,
  loan_start_dt date DEFAULT NULL,
  apprve_amount varchar(15) DEFAULT NULL,
  apprve_dt date DEFAULT NULL,
  status varchar(15) NOT NULL,
  remarks varchar(200) DEFAULT NULL,
  principle_amount varchar(30) DEFAULT NULL,
  bank_name varchar(100) DEFAULT NULL,
  docs varchar(1000) DEFAULT NULL,
  created_on date DEFAULT NULL,
  PRIMARY KEY (id),
  KEY it_declaration_80e_ee_eeb_FK (emp_email),
  CONSTRAINT it_declaration_80e_ee_eeb_FK FOREIGN KEY (emp_email) REFERENCES employee_master (emp_email)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;



CREATE TABLE it_declaration_80g (
  id int NOT NULL AUTO_INCREMENT,
  emp_email varchar(50) NOT NULL,
  finance_yr varchar(10) NOT NULL,
  amount varchar(15) NOT NULL,
  receipt_number varchar(20) NOT NULL,
  org_name varchar(150) NOT NULL,
  org_pan varchar(10) NOT NULL,
  receipt_dt date NOT NULL,
  apprve_amount varchar(15) DEFAULT NULL,
  apprve_dt date DEFAULT NULL,
  status varchar(15) NOT NULL,
  remarks varchar(200) DEFAULT NULL,
  docs varchar(1000) DEFAULT NULL,
  created_on date DEFAULT NULL,
  PRIMARY KEY (id),
  KEY it_declaration_80g_FK (emp_email),
  CONSTRAINT it_declaration_80g_FK FOREIGN KEY (emp_email) REFERENCES employee_master (emp_email)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

CREATE TABLE it_declaration_hra (
  id int NOT NULL AUTO_INCREMENT,
  emp_email varchar(50) NOT NULL,
  finance_yr varchar(10) NOT NULL,
  form_month varchar(15) NOT NULL,
  to_month varchar(15) NOT NULL,
  rent_type varchar(20) NOT NULL,
  receipt_dt date NOT NULL,
  rent_amount varchar(15) NOT NULL,
  address varchar(150) NOT NULL,
  city varchar(50) NOT NULL,
  state varchar(50) NOT NULL,
  pincode int NOT NULL,
  landlord_name varchar(150) DEFAULT NULL,
  landlord_pan varchar(10) DEFAULT NULL,
  apprve_amount varchar(15) DEFAULT NULL,
  apprve_dt date DEFAULT NULL,
  status varchar(15) NOT NULL,
  remarks varchar(200) DEFAULT NULL,
  docs varchar(1000) DEFAULT NULL,
  total_amount varchar(15) DEFAULT NULL,
  created_on date DEFAULT NULL,
  is_metro int DEFAULT '0',
  PRIMARY KEY (id),
  KEY it_declaration_hra_FK (emp_email),
  CONSTRAINT it_declaration_hra_FK FOREIGN KEY (emp_email) REFERENCES employee_master (emp_email)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;


CREATE TABLE it_declaration_lvc (
  id int NOT NULL AUTO_INCREMENT,
  emp_email varchar(50) NOT NULL,
  finance_yr varchar(10) NOT NULL,
  total_amount varchar(15) NOT NULL,
  receipt_number varchar(20) NOT NULL,
  food_cost varchar(15) DEFAULT NULL,
  stay_cost varchar(15) DEFAULT NULL,
  travel_cost varchar(15) DEFAULT NULL,
  travel_from_dt date NOT NULL,
  receipt_dt date NOT NULL,
  apprve_amount varchar(15) DEFAULT NULL,
  apprve_dt date DEFAULT NULL,
  status varchar(15) NOT NULL,
  remarks varchar(200) DEFAULT NULL,
  travel_to_dt date DEFAULT NULL,
  docs varchar(1000) DEFAULT NULL,
  created_on date DEFAULT NULL,
  PRIMARY KEY (id),
  KEY it_declaration_lvc_FK (emp_email),
  CONSTRAINT it_declaration_lvc_FK FOREIGN KEY (emp_email) REFERENCES employee_master (emp_email)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;


CREATE TABLE itdeclaration_settings (
  id int NOT NULL AUTO_INCREMENT,
  cutoffdate_provisional date NOT NULL,
  cutoffdate_actual date NOT NULL,
  fy varchar(100) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

INSERT INTO itdeclaration_settings (id, cutoffdate_provisional, cutoffdate_actual, fy) VALUES(1, '2023-11-30', '2023-11-30', '2023-2024');


CREATE TABLE leave_balance_master (
  user_name varchar(100) NOT NULL,
  year varchar(4) NOT NULL,
  opening_balance double DEFAULT '0',
  previous_year_carry double DEFAULT '0',
  lapse double DEFAULT '0',
  loss_of_pay double DEFAULT '0',
  adjusted double DEFAULT '0',
  encashment double DEFAULT '0',
  rh_opening_balance double DEFAULT '0',
  sum_total_previous_carry double DEFAULT '0',
  PRIMARY KEY (user_name,year),
  CONSTRAINT leave_balance_master_FK FOREIGN KEY (user_name) REFERENCES employee_master (emp_email) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE leave_setting (
  year int NOT NULL,
  annual_leave int DEFAULT NULL,
  rh_leave int DEFAULT NULL,
  max_encash int DEFAULT NULL,
  max_carry_forward int DEFAULT NULL,
  tot_max_carry_forward int DEFAULT NULL,
  PRIMARY KEY (year)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO leave_setting (year, annual_leave, rh_leave, max_encash, max_carry_forward, tot_max_carry_forward) VALUES(2023, 14, 4, 2, 6, 40);


CREATE TABLE leave_type_master (
  id int DEFAULT '0',
  year varchar(4) NOT NULL,
  leave_type varchar(20) NOT NULL,
  number_of_leaves double(30,2) DEFAULT NULL,
  user_name varchar(100) NOT NULL,
  availed double(30,2) NOT NULL DEFAULT '0.00',
  accrued double(30,2) NOT NULL DEFAULT '0.00',
  opening_Balance double(30,2) DEFAULT '0.00',
  pending double(30,2) DEFAULT '0.00',
  adjusted_by_HR double(30,2) DEFAULT '0.00',
  previous_year_encashment double(30,2) DEFAULT '0.00',
  current_year_encashment double(30,2) DEFAULT '0.00',
  max_carry_forward double(30,2) DEFAULT '0.00',
  lapsable double(30,2) DEFAULT '0.00',
  Loss_of_pay_leave double(30,2) DEFAULT '0.00',
  PRIMARY KEY (year,leave_type,user_name),
  KEY user_name (user_name),
  CONSTRAINT leave_type_master_FK FOREIGN KEY (user_name) REFERENCES employee_master (emp_email) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE my_performance (
  performance_id int NOT NULL AUTO_INCREMENT,
  review_period varchar(60) NOT NULL,
  overall_rating varchar(60) DEFAULT NULL,
  status_of_appraisal varchar(60) NOT NULL,
  emp_overall_desc text,
  rm_overall_desc text,
  emp_email varchar(100)  NOT NULL,
  emp_code varchar(20) DEFAULT NULL,
  rm_email varchar(50) DEFAULT NULL,
  reviewer_email varchar(50) DEFAULT NULL,
  PRIMARY KEY (performance_id),
  UNIQUE KEY my_performance_UN (review_period,emp_email),
  KEY my_performance_ibfk_1 (emp_email),
  CONSTRAINT my_performance_ibfk_1 FOREIGN KEY (emp_email) REFERENCES employee_master (emp_email) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;


CREATE TABLE my_performance_add (
  id int NOT NULL AUTO_INCREMENT,
  performance_id int DEFAULT NULL,
  appraise_rating int DEFAULT NULL,
  appraise_rating_desc text,
  appraiser_rating varchar(90) DEFAULT NULL,
  appraiser_rating_desc text,
  category varchar(90) DEFAULT NULL,
  rm_email varchar(50) DEFAULT NULL,
  PRIMARY KEY (id),
  KEY my_performance_add_FK (performance_id),
  CONSTRAINT my_performance_add_FK FOREIGN KEY (performance_id) REFERENCES my_performance (performance_id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;




CREATE TABLE `new_nominee_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nominee_name` varchar(400) NOT NULL,
  `nominee_address` text NOT NULL,
  `nominee_relation` varchar(100) NOT NULL,
  `nominee_dob` varchar(30) NOT NULL,
  `nominee_guardian_name` varchar(100) DEFAULT NULL,
  `nominee_guardian_address` varchar(100) DEFAULT NULL,
  `nominee_guardian_relation` varchar(100) DEFAULT NULL,
  `share_in_medical` int DEFAULT NULL,
  `share_in_full_and_Final` int DEFAULT NULL,
  `share_in_pension` int DEFAULT NULL,
  `share_in_pf` int DEFAULT NULL,
  `emp_email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `new_nominee_details_FK` (`emp_email`),
  CONSTRAINT `new_nominee_details_FK` FOREIGN KEY (`emp_email`) REFERENCES `employee_master` (`emp_email`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `office_time_sheet` (
  `emp_code` int NOT NULL,
  `date` date DEFAULT NULL,
  `check_in` datetime DEFAULT NULL,
  `check_out` datetime DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `otp_session` (
  `otp` varchar(100) DEFAULT NULL,
  `otp_requested_time` bigint DEFAULT NULL,
  `emp_email` varchar(100) NOT NULL,
  PRIMARY KEY (`emp_email`),
  CONSTRAINT `otp_session_ibfk_1` FOREIGN KEY (`emp_email`) REFERENCES `employee_master` (`emp_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `pan_details` (
  `emp_id` varchar(255) NOT NULL,
  `pan_num` varchar(10)  NOT NULL,
  `pan_card` mediumblob,
  `pan_key` varchar(10)  DEFAULT NULL,
  PRIMARY KEY (`emp_id`),
  CONSTRAINT `pan_details_FK` FOREIGN KEY (`emp_id`) REFERENCES `employee_master` (`emp_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `passport_details` (
  `emp_id` varchar(255) NOT NULL,
  `passport_num` varchar(50) DEFAULT NULL,
  `issuing_num` varchar(50) DEFAULT NULL,
  `date_of_issue` varchar(50) DEFAULT NULL,
  `date_of_expiry` varchar(50) DEFAULT NULL,
  `place_of_issue` varchar(50) DEFAULT NULL,
  `country_of_issue` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `proof_of_nationality` mediumblob,
  `name_on_passport` varchar(100)  DEFAULT NULL,
  `given_name_on_passport` varchar(100)  DEFAULT NULL,
  `surname_on_passport` varchar(100)  DEFAULT NULL,
  `last_page` mediumblob,
  PRIMARY KEY (`emp_id`),
  CONSTRAINT `passport_details_FK` FOREIGN KEY (`emp_id`) REFERENCES `employee_master` (`emp_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `payslip_details` (
  `year` varchar(10) NOT NULL,
  `month` varchar(15) NOT NULL,
  `month_year` varchar(15) DEFAULT NULL,
  `emp_name` varchar(100)  DEFAULT NULL,
  `emp_code` varchar(20) NOT NULL,
  `department` varchar(50) DEFAULT NULL,
  `designation` varchar(50) DEFAULT NULL,
  `date_of_joining` date DEFAULT NULL,
  `uan_num` varchar(20) DEFAULT NULL,
  `pan_num` varchar(20) DEFAULT NULL,
  `account_num` varchar(20) DEFAULT NULL,
  `bank_name` varchar(50) DEFAULT NULL,
  `ifsc_code` varchar(20) DEFAULT NULL,
  `basic_salary` varbinary(100) DEFAULT NULL,
  `food_allowance` varbinary(100) DEFAULT NULL,
  `holiday_allowance` varbinary(100) DEFAULT NULL,
  `house_allowance` varbinary(100) DEFAULT NULL,
  `performance_bonus` varbinary(100) DEFAULT NULL,
  `special_allowance` varbinary(100) DEFAULT NULL,
  `total_earnings` varbinary(100) DEFAULT NULL,
  `epf` varbinary(100) DEFAULT NULL,
  `pt` varbinary(100) DEFAULT NULL,
  `total_deductions` varbinary(100) DEFAULT NULL,
  `net_pay` varbinary(100) DEFAULT NULL,
  `file_name` varchar(20) DEFAULT NULL,
  `password` varbinary(100) DEFAULT NULL,
  `email` varchar(50)  DEFAULT NULL,
  `num_of_days` varchar(20) DEFAULT NULL,
  `shift_allowance` varbinary(100) DEFAULT NULL,
  `tds` varbinary(100) DEFAULT NULL,
  `mie` varbinary(100) DEFAULT NULL,
  `status` int DEFAULT '0',
  `created_on` date DEFAULT NULL,
  `arrears` varbinary(100) DEFAULT NULL,
  `arrears_lbl` varchar(200) DEFAULT NULL,
  `advance_repayment_lbl` varchar(200) DEFAULT NULL,
  `advance_repayment` varbinary(100) DEFAULT NULL,
  PRIMARY KEY (`year`,`month`,`emp_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `performance_rating` (
  `emp_code` varchar(255) NOT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `emp_name` varchar(255) DEFAULT NULL,
  `emp_join_date` date DEFAULT NULL,
  `performancerating` varchar(255) DEFAULT NULL,
  `project_name` varchar(255) DEFAULT NULL,
  `rm_email` varchar(255) DEFAULT NULL,
  `rm_emp_code` varchar(255) DEFAULT NULL,
  `rm_name` varchar(255) DEFAULT NULL,
  `year` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`emp_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `performance_settings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  `FY` varchar(100)  NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

INSERT INTO performance_settings (id, from_date, to_date, FY) VALUES(1, '2023-11-02', '2023-11-30', '2023-2024');

CREATE TABLE `pf_details` (
  `year` varchar(10) NOT NULL,
  `month` varchar(20) NOT NULL,
  `emp_code` varchar(15) NOT NULL,
  `department` varchar(20) DEFAULT NULL,
  `designation` varchar(100)  DEFAULT NULL,
  `doj` varchar(20) DEFAULT NULL,
  `pan_num` varchar(20) DEFAULT NULL,
  `account_num` varchar(20) DEFAULT NULL,
  `ifsc` varchar(20) DEFAULT NULL,
  `uan_num` varchar(20) DEFAULT NULL,
  `month_sheet` varchar(15) DEFAULT NULL,
  `date_of_credit` varchar(15) DEFAULT NULL,
  `employee_share` varchar(10) DEFAULT NULL,
  `employer_share` varchar(10) DEFAULT NULL,
  `total` varchar(10) DEFAULT NULL,
  `grand_total` varchar(10) DEFAULT NULL,
  `pf_id` varchar(30) DEFAULT NULL,
  `vpf_percentage` varchar(20) DEFAULT NULL,
  `vpf_amount` varchar(20) DEFAULT NULL,
  `super_annuation_id` varchar(20) DEFAULT NULL,
  `gratuity_id` varchar(20) DEFAULT NULL,
  `professional_tax_eligibility` varchar(20) DEFAULT NULL,
  `labor_welfare_fund` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`year`,`month`,`emp_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `previous_employer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `begin_date` varchar(50) DEFAULT NULL,
  `end_date` varchar(50) DEFAULT NULL,
  `details` varchar(255) DEFAULT NULL,
  `user_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_name` (`user_name`),
  CONSTRAINT `previous_employer_ibfk_1` FOREIGN KEY (`user_name`) REFERENCES `employee_master` (`emp_email`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `project_list_approvals` (
  `id` int NOT NULL AUTO_INCREMENT,
  `project_name` varchar(100) DEFAULT NULL,
  `plannedstart_date` varchar(50) DEFAULT NULL,
  `plannedend_date` varchar(50)  DEFAULT NULL,
  `actualstart_date` varchar(50) DEFAULT NULL,
  `actualend_date` varchar(50)  DEFAULT NULL,
  `client_name` varchar(50) DEFAULT NULL,
  `total_expenditure_of_the_project` varchar(50) DEFAULT NULL,
  `estimated_expenses` varchar(50) DEFAULT NULL,
  `actual_expenses` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `project_name` (`project_name`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;


CREATE TABLE `reporting_manager` (
  `id` int NOT NULL AUTO_INCREMENT,
  `emp_id` varchar(50)  NOT NULL,
  `manager_code` varchar(20) DEFAULT NULL,
  `begin_date` varchar(20) DEFAULT NULL,
  `end_date` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `manager_code` (`manager_code`),
  KEY `reporting_manager_FK` (`emp_id`),
  CONSTRAINT `reporting_manager_FK` FOREIGN KEY (`emp_id`) REFERENCES `employee_master` (`emp_email`)
) ENGINE=InnoDB AUTO_INCREMENT=164 DEFAULT CHARSET=utf8mb4;


CREATE TABLE `reporting_manager_requests` (
  `id` int NOT NULL AUTO_INCREMENT,
  `emp_id` varchar(50)  DEFAULT NULL,
  `request_type` varchar(20) DEFAULT NULL,
  `old_rm` varchar(15) DEFAULT NULL,
  `new_rm` varchar(15) DEFAULT NULL,
  `old_rm_approval` varchar(15) DEFAULT NULL,
  `new_rm_approval` varchar(15) DEFAULT NULL,
  `begin_date` varchar(20) DEFAULT NULL,
  `status` varchar(15) DEFAULT NULL,
  `created_date` varchar(20) DEFAULT NULL,
  `approved_date` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `taxable_hra_info` (
  `emp_code` varchar(10) NOT NULL,
  `finance_yr` varchar(10) NOT NULL,
  `taxable_hra_amount` varchar(100) DEFAULT NULL,
  `sum_basic` varchar(100) DEFAULT NULL,
  `sum_receive_hra` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`emp_code`,`finance_yr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `time_sheet` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `emp_id` varchar(100) NOT NULL,
  `task_id` int NOT NULL,
  `date` date NOT NULL,
  `time_hrs` varchar(22) NOT NULL,
  `status` varchar(100)  NOT NULL DEFAULT 'draft',
  `reporting_manager_id` varchar(100)  DEFAULT NULL,
  `approved_by` varchar(100) DEFAULT NULL,
  `approved_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `time_sheet_UN` (`emp_id`,`task_id`,`date`),
  KEY `reporting_manager_id` (`reporting_manager_id`),
  KEY `task_id` (`task_id`),
  CONSTRAINT `time_sheet_ibfk_2` FOREIGN KEY (`emp_id`) REFERENCES `employee_master` (`emp_email`) ON DELETE CASCADE,
  CONSTRAINT `time_sheet_ibfk_3` FOREIGN KEY (`reporting_manager_id`) REFERENCES `employee_master` (`emp_email`) ON DELETE CASCADE,
  CONSTRAINT `time_sheet_ibfk_4` FOREIGN KEY (`task_id`) REFERENCES `org_project_task` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=343 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `uan_details` (
  `emp_id` varchar(50)  NOT NULL,
  `uan` varchar(12)  NOT NULL,
  PRIMARY KEY (`emp_id`),
  UNIQUE KEY `uan_details_UN` (`uan`),
  CONSTRAINT `uan_details_FK` FOREIGN KEY (`emp_id`) REFERENCES `employee_master` (`emp_email`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;














