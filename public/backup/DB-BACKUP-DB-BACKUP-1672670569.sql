DROP TABLE IF EXISTS branches;

CREATE TABLE `branches` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `contact_email` varchar(191) DEFAULT NULL,
  `contact_phone` varchar(191) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `descriptions` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO branches VALUES('1','London','Lloydbanklondon@accountant.com','','','','2022-12-30 01:01:15','2022-12-30 01:01:15');



DROP TABLE IF EXISTS currency;

CREATE TABLE `currency` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(3) NOT NULL,
  `exchange_rate` decimal(10,6) NOT NULL,
  `base_currency` tinyint(4) NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO currency VALUES('1','GBP','1.000000','1','1','','2022-12-30 11:35:00');
INSERT INTO currency VALUES('2','EUR','0.850000','0','1','','');
INSERT INTO currency VALUES('3','USD','74.500000','0','1','','');



DROP TABLE IF EXISTS database_backups;

CREATE TABLE `database_backups` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `file` varchar(191) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE IF EXISTS deposit_methods;

CREATE TABLE `deposit_methods` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `image` varchar(191) DEFAULT NULL,
  `currency_id` bigint(20) NOT NULL,
  `minimum_amount` decimal(10,2) NOT NULL,
  `maximum_amount` decimal(10,2) NOT NULL,
  `fixed_charge` decimal(10,2) NOT NULL,
  `charge_in_percentage` decimal(10,2) NOT NULL,
  `descriptions` text DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `requirements` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE IF EXISTS deposit_requests;

CREATE TABLE `deposit_requests` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `method_id` bigint(20) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `description` text DEFAULT NULL,
  `requirements` text DEFAULT NULL,
  `attachment` varchar(191) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `transaction_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE IF EXISTS email_sms_templates;

CREATE TABLE `email_sms_templates` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `subject` varchar(191) NOT NULL,
  `email_body` text DEFAULT NULL,
  `sms_body` text DEFAULT NULL,
  `shortcode` text DEFAULT NULL,
  `email_status` tinyint(4) NOT NULL DEFAULT 1,
  `sms_status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO email_sms_templates VALUES('1','Deposit Money','DEPOSIT_MONEY','Deposit Money','<div>
<div>Dear Sir,</div>
<div>Your account has been credited by {{amount}} on {{dateTime}}</div>
</div>','Dear Sir, Your account has been credited by {{amount}} on {{dateTime}}','{{name}} {{email}} {{phone}} {{amount}} {{dateTime}}','0','0','','');
INSERT INTO email_sms_templates VALUES('2','Deposit Request Approved','DEPOSIT_REQUEST_APPROVED','Deposit Request Approved','<div>
<div>Dear Sir,</div>
<div>Your deposit request has been approved. Your account has been credited by {{amount}} on {{dateTime}}</div>
</div>','Dear Sir, Your deposit request has been approved. Your account has been credited by {{amount}} on {{dateTime}}','{{name}} {{email}} {{phone}} {{amount}} {{dateTime}} {{depositMethod}}','0','0','','');
INSERT INTO email_sms_templates VALUES('3','FDR Request Approved','FDR_REQUEST_APPROVED','FDR Request Approved','<div>
<div>Dear Sir,</div>
<div>Your FDR request of {{amount}} has been approved on {{dateTime}}</div>
</div>','Dear Sir, Your FDR request of {{amount}} has been approved on {{dateTime}}','{{name}} {{email}} {{phone}} {{amount}} {{dateTime}}','0','0','','');
INSERT INTO email_sms_templates VALUES('4','Loan Request Approved','LOAN_REQUEST_APPROVED','Loan Request Approved','<div>
<div>Dear Sir,</div>
<div>Your loan request has been approved. Your account has been credited by {{amount}} on {{dateTime}}</div>
</div>','Dear Sir, Your loan request has been approved. Your account has been credited by {{amount}} on {{dateTime}}','{{name}} {{email}} {{phone}} {{amount}} {{dateTime}}','0','0','','');
INSERT INTO email_sms_templates VALUES('5','Transfer Request Approved','TRANSFER_REQUEST_APPROVED','Transfer Request Approved','<div>
<div>Dear Sir,</div>
<div>Your transfer request has been approved. Your account has been debited by {{amount}} on {{dateTime}}</div>
</div>','Dear Sir, Your transfer request has been approved. Your account has been debited by {{amount}} on {{dateTime}}','{{name}} {{email}} {{phone}} {{amount}} {{dateTime}}','0','0','','');
INSERT INTO email_sms_templates VALUES('6','Wire Transfer Request Approved','WIRE_TRANSFER_REQUEST_APPROVED','Wire Transfer Request Approved','<div>
<div>Dear Sir,</div>
<div>Your wire transfer request has been approved. Your account has been debited by {{amount}} on {{dateTime}}</div>
</div>','Dear Sir, Your wire transfer request has been approved. Your account has been debited by {{amount}} on {{dateTime}}','{{name}} {{email}} {{phone}} {{amount}} {{dateTime}}','0','0','','');
INSERT INTO email_sms_templates VALUES('7','Withdraw Request Approved','WITHDRAW_REQUEST_APPROVED','Withdraw Request Approved','<div>
<div>Dear Sir,</div>
<div>Your withdraw request has been approved. Your account has been debited by {{amount}} on {{dateTime}}</div>
</div>','Dear Sir, Your withdraw request has been approved. Your account has been debited by {{amount}} on {{dateTime}}','{{name}} {{email}} {{phone}} {{amount}} {{dateTime}}','0','0','','');
INSERT INTO email_sms_templates VALUES('8','FDR Matured','FDR_MATURED','FDR Matured','<div>
<div>Dear Sir,</div>
<div>Your FDR is already matured. Your account has been credited by {{amount}} on {{dateTime}}</div>
</div>','Dear Sir, Your FDR is already matured. Your account has been credited by {{amount}} on {{dateTime}}','{{name}} {{email}} {{phone}} {{amount}} {{dateTime}}','0','0','','');
INSERT INTO email_sms_templates VALUES('9','Payment Request','PAYMENT_REQUEST','You have Received New Payment Request','<div>Dear Sir,</div>
<div>Your have received new payment request of {{amount}} on {{dateTime}}.</div>
<div>&nbsp;</div>
<div>{{payNow}}</div>','Dear Sir, Your have received new payment request of {{amount}} on {{dateTime}}','{{name}} {{email}} {{phone}} {{amount}} {{dateTime}} {{payNow}}','0','0','','');
INSERT INTO email_sms_templates VALUES('10','Payment Completed','PAYMENT_COMPLETED','Payment Completed','<div>Dear Sir,</div>
<div>Good news, You have received a payment of {{amount}} on {{dateTime}} from {{paidBy}}</div>','Dear Sir, Good news, You have received a payment of {{amount}} on {{dateTime}} from {{paidBy}}','{{name}} {{email}} {{phone}} {{amount}} {{dateTime}} {{paidBy}}','0','0','','');
INSERT INTO email_sms_templates VALUES('11','Deposit Request Rejected','DEPOSIT_REQUEST_REJECTED','Deposit Request Rejected','<div>
<div>Dear Sir,</div>
<div>Your deposit request of {{amount}} has been rejected.</div>
<div>&nbsp;</div>
<div>Amount:&nbsp;{{amount}}</div>
<div>Deposit Method: {{depositMethod}}</div>
</div>','Dear Sir, Your deposit request of {{amount}} has been rejected.','{{name}} {{email}} {{phone}} {{amount}} {{depositMethod}}','0','0','','');
INSERT INTO email_sms_templates VALUES('12','FDR Request Rejected','FDR_REQUEST_REJECTED','FDR Request Rejected','<div>
<div>Dear Sir,</div>
<div>Your FDR request has been rejected. Your FDR amount {{amount}} has returned back to your account.</div>
</div>','Dear Sir, Your FDR request has been rejected. Your FDR amount {{amount}} has returned back to your account.','{{name}} {{email}} {{phone}} {{amount}}','0','0','','');
INSERT INTO email_sms_templates VALUES('13','Loan Request Rejected','LOAN_REQUEST_REJECTED','Loan Request Rejected','<div>
<div>Dear Sir,</div>
<div>Your loan request of {{amount}} has been rejected on {{dateTime}}</div>
</div>','Dear Sir, Your loan request of {{amount}} has been rejected on {{dateTime}}','{{name}} {{email}} {{phone}} {{amount}} {{dateTime}}','0','0','','');
INSERT INTO email_sms_templates VALUES('14','Transfer Request Rejected','TRANSFER_REQUEST_REJECTED','Transfer Request Rejected','<div>
<div>Dear Sir,</div>
<div>Your transfer request has been rejected. Your transferred amount {{amount}} has returned back to your account.</div>
</div>','Dear Sir, Your transfer request has been rejected. Your transferred amount {{amount}} has returned back to your account.','{{name}} {{email}} {{phone}} {{amount}}','0','0','','');
INSERT INTO email_sms_templates VALUES('15','Wire Transfer Rejected','WIRE_TRANSFER_REJECTED','Wire Transfer Rejected','<div>
<div>Dear Sir,</div>
<div>Your wire transfer request has been rejected. Your transferred amount {{amount}} has returned back to your account.</div>
</div>','Dear Sir, Your wire transfer request has been rejected. Your transferred amount {{amount}} has returned back to your account.','{{name}} {{email}} {{phone}} {{amount}}','1','0','','2023-01-02 09:57:43');
INSERT INTO email_sms_templates VALUES('16','Withdraw Request Rejected','WITHDRAW_REQUEST_REJECTED','Withdraw Request Rejected','<div>
<div>Dear Sir, Your withdraw request has been rejected. Your transferred amount {{amount}} has returned back to your account.</div>
</div>','Dear Sir, Your withdraw request has been rejected. Your transferred amount {{amount}} has returned back to your account.','{{name}} {{email}} {{phone}} {{amount}}','0','0','','');
INSERT INTO email_sms_templates VALUES('17','Withdraw Money','WITHDRAW_MONEY','Withdraw Money','<div>
<div>Dear Sir,</div>
<div>Your account has been debited by {{amount}} on {{dateTime}}</div>
</div>','Dear Sir, Your account has been debited by {{amount}} on {{dateTime}}','{{name}} {{email}} {{phone}} {{amount}} {{dateTime}} {{withdrawMethod}}','0','0','','');



DROP TABLE IF EXISTS email_templates;

CREATE TABLE `email_templates` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `subject` text NOT NULL,
  `body` longtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE IF EXISTS failed_jobs;

CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE IF EXISTS faq_translations;

CREATE TABLE `faq_translations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `faq_id` bigint(20) unsigned NOT NULL,
  `locale` varchar(191) NOT NULL,
  `question` text NOT NULL,
  `answer` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `faq_translations_faq_id_locale_unique` (`faq_id`,`locale`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO faq_translations VALUES('1','1','English','How to open an account?','Account opening is very easy. Just need to click Sign Up and enter some initial details for opening account. After that you need to verify your email address and that\'s ready to go.','2021-08-31 10:07:50','2021-09-05 15:37:10');
INSERT INTO faq_translations VALUES('2','2','English','How to deposit money?','You can deposit money via online payment gateway such as PayPal, Stripe, Razorpay, Paystack, Flutterwave as well as BlockChain for bitcoin. You can also deposit money by coming to our office physically.','2021-08-31 10:09:26','2021-09-05 15:38:39');
INSERT INTO faq_translations VALUES('3','3','English','How to withdraw money from my account?','We have different types of withdraw method. You can withdraw money to your bank account as well as your mobile banking account.','2021-08-31 10:09:39','2021-09-05 15:47:11');
INSERT INTO faq_translations VALUES('7','4','English','How to Apply for Loan?','You can apply loan based on your collateral.','2021-09-05 15:47:59','2021-09-05 15:47:59');
INSERT INTO faq_translations VALUES('8','5','English','How to Apply for Fixed Deposit?','If you have available balance in your account then you can apply for fixed deposit.','2021-09-05 15:58:05','2021-09-05 15:58:05');



DROP TABLE IF EXISTS faqs;

CREATE TABLE `faqs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `order` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO faqs VALUES('1','1','','2021-08-31 10:06:18','2021-08-31 10:06:18');
INSERT INTO faqs VALUES('2','1','','2021-08-31 10:09:26','2021-08-31 10:09:26');
INSERT INTO faqs VALUES('3','1','','2021-08-31 10:09:39','2021-08-31 10:09:39');
INSERT INTO faqs VALUES('4','1','','2021-09-05 15:47:59','2021-09-05 15:47:59');
INSERT INTO faqs VALUES('5','1','','2021-09-05 15:58:05','2021-09-05 15:58:05');



DROP TABLE IF EXISTS fdr_plans;

CREATE TABLE `fdr_plans` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `minimum_amount` decimal(10,2) NOT NULL,
  `maximum_amount` decimal(10,2) NOT NULL,
  `interest_rate` decimal(10,2) NOT NULL,
  `duration` int(11) NOT NULL,
  `duration_type` varchar(15) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO fdr_plans VALUES('1','Basic','10.00','500.00','8.00','12','month','1','','2021-08-09 14:34:14','2021-09-05 13:39:27');
INSERT INTO fdr_plans VALUES('2','Standard','100.00','1000.00','10.00','24','month','1','','2021-09-05 13:39:11','2021-09-05 13:39:34');
INSERT INTO fdr_plans VALUES('3','Professional','500.00','20000.00','15.00','36','month','1','','2021-09-05 13:40:06','2021-09-05 13:40:06');



DROP TABLE IF EXISTS fdrs;

CREATE TABLE `fdrs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `fdr_plan_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `currency_id` bigint(20) unsigned NOT NULL,
  `deposit_amount` decimal(10,2) NOT NULL,
  `return_amount` decimal(10,2) NOT NULL,
  `attachment` text DEFAULT NULL,
  `remarks` text DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `approved_date` date DEFAULT NULL,
  `mature_date` date DEFAULT NULL,
  `transaction_id` bigint(20) DEFAULT NULL,
  `approved_user_id` bigint(20) DEFAULT NULL,
  `created_user_id` bigint(20) DEFAULT NULL,
  `updated_user_id` bigint(20) DEFAULT NULL,
  `branch_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE IF EXISTS gift_cards;

CREATE TABLE `gift_cards` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `currency_id` bigint(20) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `user_id` bigint(20) DEFAULT NULL,
  `used_at` datetime DEFAULT NULL,
  `branch_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE IF EXISTS loan_collaterals;

CREATE TABLE `loan_collaterals` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `loan_id` bigint(20) unsigned NOT NULL,
  `name` varchar(191) NOT NULL,
  `collateral_type` varchar(191) NOT NULL,
  `serial_number` varchar(191) DEFAULT NULL,
  `estimated_price` decimal(10,2) NOT NULL,
  `attachments` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE IF EXISTS loan_payments;

CREATE TABLE `loan_payments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `loan_id` bigint(20) NOT NULL,
  `paid_at` date NOT NULL,
  `late_penalties` decimal(10,2) NOT NULL,
  `interest` decimal(10,2) NOT NULL,
  `amount_to_pay` decimal(10,2) NOT NULL,
  `remarks` text DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  `transaction_id` bigint(20) NOT NULL,
  `repayment_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE IF EXISTS loan_products;

CREATE TABLE `loan_products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `minimum_amount` decimal(10,2) NOT NULL,
  `maximum_amount` decimal(10,2) NOT NULL,
  `description` text DEFAULT NULL,
  `interest_rate` decimal(10,2) NOT NULL,
  `interest_type` varchar(191) NOT NULL,
  `term` int(11) NOT NULL,
  `term_period` varchar(15) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO loan_products VALUES('1','Student Loan','100.00','1000.00','','5.00','flat_rate','24','+1 month','1','2021-08-09 11:06:19','2021-08-10 07:47:20');
INSERT INTO loan_products VALUES('2','Business Loan','1000.00','100000.00','','12.00','mortgage','12','+1 month','1','2021-08-09 11:05:37','2021-08-10 07:47:10');
INSERT INTO loan_products VALUES('3','Enterprise Loan','5000.00','50000.00','','12.00','mortgage','36','+1 month','1','2021-09-05 13:42:11','2021-09-05 13:42:11');



DROP TABLE IF EXISTS loan_repayments;

CREATE TABLE `loan_repayments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `loan_id` bigint(20) NOT NULL,
  `repayment_date` date NOT NULL,
  `amount_to_pay` decimal(10,2) NOT NULL,
  `penalty` decimal(10,2) NOT NULL,
  `principal_amount` decimal(10,2) NOT NULL,
  `interest` decimal(10,2) NOT NULL,
  `balance` decimal(10,2) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE IF EXISTS loans;

CREATE TABLE `loans` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `loan_id` varchar(30) DEFAULT NULL,
  `loan_product_id` bigint(20) unsigned NOT NULL,
  `borrower_id` bigint(20) unsigned NOT NULL,
  `first_payment_date` date NOT NULL,
  `release_date` date DEFAULT NULL,
  `currency_id` bigint(20) NOT NULL,
  `applied_amount` decimal(10,2) NOT NULL,
  `total_payable` decimal(10,2) DEFAULT NULL,
  `total_paid` decimal(10,2) DEFAULT NULL,
  `late_payment_penalties` decimal(10,2) NOT NULL,
  `attachment` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `remarks` text DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `approved_date` date DEFAULT NULL,
  `approved_user_id` bigint(20) DEFAULT NULL,
  `created_user_id` bigint(20) DEFAULT NULL,
  `branch_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE IF EXISTS migrations;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO migrations VALUES('1','2014_10_12_000000_create_users_table','1');
INSERT INTO migrations VALUES('2','2014_10_12_100000_create_password_resets_table','1');
INSERT INTO migrations VALUES('3','2018_11_12_152015_create_email_templates_table','1');
INSERT INTO migrations VALUES('4','2019_08_19_000000_create_failed_jobs_table','1');
INSERT INTO migrations VALUES('5','2019_09_01_080940_create_settings_table','1');
INSERT INTO migrations VALUES('6','2020_07_02_145857_create_database_backups_table','1');
INSERT INTO migrations VALUES('7','2020_07_06_142817_create_roles_table','1');
INSERT INTO migrations VALUES('8','2020_07_06_143240_create_permissions_table','1');
INSERT INTO migrations VALUES('9','2021_03_22_071324_create_setting_translations','1');
INSERT INTO migrations VALUES('10','2021_07_02_145504_create_pages_table','1');
INSERT INTO migrations VALUES('11','2021_07_02_145952_create_page_translations_table','1');
INSERT INTO migrations VALUES('12','2021_08_06_104648_create_branches_table','1');
INSERT INTO migrations VALUES('13','2021_08_07_100944_create_other_banks_table','1');
INSERT INTO migrations VALUES('14','2021_08_07_111236_create_currency_table','1');
INSERT INTO migrations VALUES('15','2021_08_08_132702_create_payment_gateways_table','1');
INSERT INTO migrations VALUES('16','2021_08_08_152535_create_deposit_methods_table','1');
INSERT INTO migrations VALUES('17','2021_08_08_164152_create_withdraw_methods_table','1');
INSERT INTO migrations VALUES('18','2021_08_09_064023_create_transactions_table','1');
INSERT INTO migrations VALUES('19','2021_08_09_132854_create_fdr_plans_table','1');
INSERT INTO migrations VALUES('20','2021_08_10_075622_create_gift_cards_table','1');
INSERT INTO migrations VALUES('21','2021_08_10_095536_create_fdrs_table','1');
INSERT INTO migrations VALUES('22','2021_08_10_102503_create_support_tickets_table','1');
INSERT INTO migrations VALUES('23','2021_08_10_102527_create_support_ticket_messages_table','1');
INSERT INTO migrations VALUES('24','2021_08_20_092846_create_payment_requests_table','1');
INSERT INTO migrations VALUES('25','2021_08_20_150101_create_deposit_requests_table','1');
INSERT INTO migrations VALUES('26','2021_08_20_160124_create_withdraw_requests_table','1');
INSERT INTO migrations VALUES('27','2021_08_23_160216_create_notifications_table','1');
INSERT INTO migrations VALUES('28','2021_08_31_070908_create_services_table','1');
INSERT INTO migrations VALUES('29','2021_08_31_071002_create_service_translations_table','1');
INSERT INTO migrations VALUES('30','2021_08_31_075115_create_news_table','1');
INSERT INTO migrations VALUES('31','2021_08_31_075125_create_news_translations_table','1');
INSERT INTO migrations VALUES('32','2021_08_31_094252_create_faqs_table','1');
INSERT INTO migrations VALUES('33','2021_08_31_094301_create_faq_translations_table','1');
INSERT INTO migrations VALUES('34','2021_08_31_101309_create_testimonials_table','1');
INSERT INTO migrations VALUES('35','2021_08_31_101319_create_testimonial_translations_table','1');
INSERT INTO migrations VALUES('36','2021_08_31_201125_create_navigations_table','1');
INSERT INTO migrations VALUES('37','2021_08_31_201126_create_navigation_items_table','1');
INSERT INTO migrations VALUES('38','2021_08_31_201127_create_navigation_item_translations_table','1');
INSERT INTO migrations VALUES('39','2021_09_04_142110_create_teams_table','1');
INSERT INTO migrations VALUES('40','2021_10_04_082019_create_loan_products_table','1');
INSERT INTO migrations VALUES('41','2021_10_06_070947_create_loans_table','1');
INSERT INTO migrations VALUES('42','2021_10_06_071153_create_loan_collaterals_table','1');
INSERT INTO migrations VALUES('43','2021_10_09_110842_add_2fa_columns_to_users_table','1');
INSERT INTO migrations VALUES('44','2021_10_12_071843_add_allow_withdrawal_to_users_table','1');
INSERT INTO migrations VALUES('45','2021_10_12_104151_create_loan_repayments_table','1');
INSERT INTO migrations VALUES('46','2021_10_14_065743_create_loan_payments_table','1');
INSERT INTO migrations VALUES('47','2021_10_22_070458_create_email_sms_templates_table','1');
INSERT INTO migrations VALUES('48','2022_02_01_071417_add_account_number_to_users_table','1');
INSERT INTO migrations VALUES('49','2022_02_10_053301_add_document_verified_at_to_users_table','1');
INSERT INTO migrations VALUES('50','2022_02_10_063611_create_user_documents_table','1');



DROP TABLE IF EXISTS navigation_item_translations;

CREATE TABLE `navigation_item_translations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `navigation_item_id` bigint(20) unsigned NOT NULL,
  `locale` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `navigation_item_translations_navigation_item_id_locale_unique` (`navigation_item_id`,`locale`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO navigation_item_translations VALUES('6','6','English','Home','2021-08-31 17:17:46','2021-08-31 17:17:46');
INSERT INTO navigation_item_translations VALUES('7','7','English','About','2021-08-31 17:17:58','2021-08-31 17:17:58');
INSERT INTO navigation_item_translations VALUES('8','8','English','Services','2021-08-31 17:18:44','2021-08-31 17:18:44');
INSERT INTO navigation_item_translations VALUES('10','10','English','FAQ','2021-08-31 17:19:27','2021-08-31 17:19:27');
INSERT INTO navigation_item_translations VALUES('11','11','English','Contact','2021-08-31 17:19:43','2021-08-31 17:19:43');
INSERT INTO navigation_item_translations VALUES('15','15','English','Contact','2021-08-31 18:12:42','2021-09-04 16:22:15');
INSERT INTO navigation_item_translations VALUES('26','20','English','About','2021-09-04 16:21:32','2021-09-04 16:21:32');
INSERT INTO navigation_item_translations VALUES('27','21','English','Services','2021-09-04 16:22:06','2021-09-04 16:22:06');
INSERT INTO navigation_item_translations VALUES('28','22','English','Terms & Condition','2021-09-04 16:22:58','2021-09-04 16:22:58');
INSERT INTO navigation_item_translations VALUES('29','23','English','Privacy Policy','2021-09-04 16:23:10','2021-09-04 16:23:10');
INSERT INTO navigation_item_translations VALUES('30','24','English','FAQ','2021-09-04 16:23:20','2021-09-04 16:23:20');



DROP TABLE IF EXISTS navigation_items;

CREATE TABLE `navigation_items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `navigation_id` bigint(20) unsigned NOT NULL,
  `type` varchar(20) NOT NULL,
  `page_id` bigint(20) unsigned DEFAULT NULL,
  `url` varchar(191) DEFAULT NULL,
  `icon` varchar(191) DEFAULT NULL,
  `target` varchar(191) NOT NULL,
  `parent_id` bigint(20) unsigned DEFAULT NULL,
  `position` int(10) unsigned DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `css_class` varchar(191) DEFAULT NULL,
  `css_id` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `navigation_items_parent_id_foreign` (`parent_id`),
  KEY `navigation_items_page_id_foreign` (`page_id`),
  KEY `navigation_items_navigation_id_index` (`navigation_id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO navigation_items VALUES('6','1','dynamic_url','','/','','_self','','1','1','','','2021-08-31 17:17:46','2021-08-31 17:28:52');
INSERT INTO navigation_items VALUES('7','1','dynamic_url','','/about','','_self','','2','1','','','2021-08-31 17:17:58','2021-08-31 17:28:52');
INSERT INTO navigation_items VALUES('8','1','dynamic_url','','/services','','_self','','3','1','','','2021-08-31 17:18:44','2021-08-31 17:28:52');
INSERT INTO navigation_items VALUES('10','1','dynamic_url','','faq','','_self','','4','1','','','2021-08-31 17:19:27','2021-09-04 16:20:28');
INSERT INTO navigation_items VALUES('11','1','dynamic_url','','/contact','','_self','','5','1','','','2021-08-31 17:19:43','2021-09-04 16:20:28');
INSERT INTO navigation_items VALUES('15','2','dynamic_url','','/contact','','_self','','1','1','','','2021-08-31 18:12:42','2021-09-04 16:22:17');
INSERT INTO navigation_items VALUES('20','2','dynamic_url','','/about','','_self','','2','1','','','2021-09-04 16:21:32','2021-09-04 16:22:17');
INSERT INTO navigation_items VALUES('21','2','dynamic_url','','/services','','_self','','3','1','','','2021-09-04 16:22:06','2021-09-04 16:22:17');
INSERT INTO navigation_items VALUES('22','3','page','2','','','_self','','2','1','','','2021-09-04 16:22:58','2021-09-04 16:23:26');
INSERT INTO navigation_items VALUES('23','3','page','1','','','_self','','1','1','','','2021-09-04 16:23:10','2021-09-04 16:23:26');
INSERT INTO navigation_items VALUES('24','3','dynamic_url','','/faq','','_self','','3','1','','','2021-09-04 16:23:20','2021-09-04 16:23:26');



DROP TABLE IF EXISTS navigations;

CREATE TABLE `navigations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO navigations VALUES('1','Primary Menu','1','2021-08-31 11:11:31','2021-08-31 11:11:31');
INSERT INTO navigations VALUES('2','Quick Explore','1','2021-08-31 18:11:36','2021-08-31 18:11:36');
INSERT INTO navigations VALUES('3','Pages','1','2021-08-31 18:11:43','2021-09-04 16:22:30');



DROP TABLE IF EXISTS news;

CREATE TABLE `news` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(191) NOT NULL,
  `image` varchar(191) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_user_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE IF EXISTS news_translations;

CREATE TABLE `news_translations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `news_id` bigint(20) unsigned NOT NULL,
  `locale` varchar(191) NOT NULL,
  `title` varchar(191) NOT NULL,
  `short_description` text NOT NULL,
  `content` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `news_translations_news_id_locale_unique` (`news_id`,`locale`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE IF EXISTS notifications;

CREATE TABLE `notifications` (
  `id` char(36) NOT NULL,
  `type` varchar(191) NOT NULL,
  `notifiable_type` varchar(191) NOT NULL,
  `notifiable_id` bigint(20) unsigned NOT NULL,
  `data` text NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO notifications VALUES('00f53ced-fea6-4afd-86d0-297837b2c6bd','App\\Notifications\\DepositMoney','App\\Models\\User','2','{\"message\":\"Dear Sir, Your account has been credited by $10,000,000.00 on 2022-12-29 00:00\"}','','2022-12-30 08:25:07','2022-12-30 08:25:07');
INSERT INTO notifications VALUES('5217e0be-c345-457e-aec6-0a7fa6978db0','App\\Notifications\\DepositMoney','App\\Models\\User','3','{\"message\":\"Dear Sir, Your account has been credited by $1,000,000.00 on 2010-12-22 00:00\"}','','2022-12-30 11:34:05','2022-12-30 11:34:05');
INSERT INTO notifications VALUES('786496db-3860-4bec-ac04-bd791ae7a489','App\\Notifications\\ApprovedWireTransfer','App\\Models\\User','3','{\"message\":\"Dear Sir, Your wire transfer request has been approved. Your account has been debited by $47,120.50 on 2022-12-30 12:01\"}','2022-12-30 12:09:41','2022-12-30 12:08:17','2022-12-30 12:09:41');
INSERT INTO notifications VALUES('676e9663-16f3-4d1f-a114-7b6b79aa643e','App\\Notifications\\DepositMoney','App\\Models\\User','4','{\"message\":\"Dear Sir, Your account has been credited by $1,000,000,000.00 on 2022-12-30 00:00\"}','','2022-12-30 14:13:49','2022-12-30 14:13:49');
INSERT INTO notifications VALUES('7b8a65dc-47e7-411e-9744-a01c49b5478a','App\\Notifications\\ApprovedWireTransfer','App\\Models\\User','3','{\"message\":\"Dear Sir, Your wire transfer request has been approved. Your account has been debited by $2,053.00 on 2022-12-30 15:14\"}','','2022-12-31 16:36:05','2022-12-31 16:36:05');
INSERT INTO notifications VALUES('406359ec-27c4-43f5-94ab-57d871847097','App\\Notifications\\ApprovedWireTransfer','App\\Models\\User','3','{\"message\":\"Dear Sir, Your wire transfer request has been approved. Your account has been debited by $7,060.50 on 2022-12-30 14:44\"}','','2022-12-31 16:36:09','2022-12-31 16:36:09');
INSERT INTO notifications VALUES('997692a0-c123-459e-b7d6-db53a6307017','App\\Notifications\\ApprovedWireTransfer','App\\Models\\User','3','{\"message\":\"Dear Sir, Your wire transfer request has been approved. Your account has been debited by $2,553.75 on 2022-12-30 11:42\"}','','2022-12-31 16:36:14','2022-12-31 16:36:14');
INSERT INTO notifications VALUES('08f3184c-79f6-4fd8-bf2c-5266fc60e192','App\\Notifications\\ApprovedWireTransfer','App\\Models\\User','3','{\"message\":\"Dear Sir, Your wire transfer request has been approved. Your account has been debited by $4,056.00 on 2022-12-30 12:15\"}','','2022-12-31 16:36:18','2022-12-31 16:36:18');
INSERT INTO notifications VALUES('61ef3d6e-7074-4fd7-a910-771fbcd67253','App\\Notifications\\ApprovedWireTransfer','App\\Models\\User','3','{\"message\":\"Dear Sir, Your wire transfer request has been approved. Your account has been debited by $3,054.50 on 2022-12-31 16:40\"}','','2022-12-31 20:09:59','2022-12-31 20:09:59');
INSERT INTO notifications VALUES('51e6268a-82b7-4a00-b903-b59e6220e6bb','App\\Notifications\\ApprovedWireTransfer','App\\Models\\User','4','{\"message\":\"Dear Sir, Your wire transfer request has been approved. Your account has been debited by $20,080.00 on 2022-12-30 14:18\"}','','2022-12-31 20:10:05','2022-12-31 20:10:05');
INSERT INTO notifications VALUES('7fe540d6-96c0-4015-9914-be35827a189c','App\\Notifications\\ApprovedWireTransfer','App\\Models\\User','3','{\"message\":\"Dear Sir, Your wire transfer request has been approved. Your account has been debited by $3,054.50 on 2022-12-30 14:49\"}','','2022-12-31 20:10:16','2022-12-31 20:10:16');
INSERT INTO notifications VALUES('4709e151-5f97-4ea3-a9c1-8c61c4f334ad','App\\Notifications\\ApprovedWireTransfer','App\\Models\\User','4','{\"message\":\"Dear Sir, Your wire transfer request has been approved. Your account has been debited by $2,053.00 on 2023-01-02 09:18\"}','','2023-01-02 09:48:28','2023-01-02 09:48:28');
INSERT INTO notifications VALUES('815310b8-fe10-4949-b3b9-6e633fb95ddf','App\\Notifications\\ApprovedWireTransfer','App\\Models\\User','4','{\"message\":\"Dear Sir, Your wire transfer request has been approved. Your account has been debited by $2,053.00 on 2023-01-02 09:15\"}','','2023-01-02 09:48:33','2023-01-02 09:48:33');
INSERT INTO notifications VALUES('2f8b552e-27da-4b23-905a-32c4d4ac058e','App\\Notifications\\ApprovedWireTransfer','App\\Models\\User','4','{\"message\":\"Dear Sir, Your wire transfer request has been approved. Your account has been debited by $5,057.50 on 2023-01-02 09:55\"}','','2023-01-02 09:55:58','2023-01-02 09:55:58');
INSERT INTO notifications VALUES('addeacee-6688-4c30-aa9b-fe5cd16d749c','App\\Notifications\\ApprovedWireTransfer','App\\Models\\User','4','{\"message\":\"Dear Sir, Your wire transfer request has been approved. Your account has been debited by $2,053.00 on 2023-01-02 09:58\"}','','2023-01-02 09:59:14','2023-01-02 09:59:14');
INSERT INTO notifications VALUES('5ec6ab47-2846-482b-96f4-44edca52c784','App\\Notifications\\DepositMoney','App\\Models\\User','5','{\"message\":\"Dear Sir, Your account has been credited by \\u00a31,040.00 on 2022-12-19 02:10\"}','2023-01-02 13:31:10','2023-01-02 13:27:39','2023-01-02 13:31:10');
INSERT INTO notifications VALUES('ade60458-da1e-4fc1-84a6-a39992790f0b','App\\Notifications\\DepositMoney','App\\Models\\User','5','{\"message\":\"Dear Sir, Your account has been credited by $9,100,000.00 on 2022-12-23 00:00\"}','','2023-01-02 13:37:58','2023-01-02 13:37:58');
INSERT INTO notifications VALUES('1a142366-7e57-404d-b3cc-57d2be980cf4','App\\Notifications\\RejectWireTransfer','App\\Models\\User','5','{\"message\":\"Dear Sir, Your wire transfer request has been rejected. Your transferred amount $50,125.00 has returned back to your account.\"}','','2023-01-02 13:46:44','2023-01-02 13:46:44');
INSERT INTO notifications VALUES('bb8eba2b-3b4d-4218-9d3e-a3364e26e2b8','App\\Notifications\\ApprovedWireTransfer','App\\Models\\User','5','{\"message\":\"Dear Sir, Your wire transfer request has been approved. Your account has been debited by $50,125.00 on 2023-01-02 13:49\"}','2023-01-02 13:50:43','2023-01-02 13:50:23','2023-01-02 13:50:43');
INSERT INTO notifications VALUES('a6c833ba-583d-48dd-9372-f8f37f743428','App\\Notifications\\ApprovedWireTransfer','App\\Models\\User','5','{\"message\":\"Dear Sir, Your wire transfer request has been approved. Your account has been debited by $40,110.00 on 2023-01-02 13:59\"}','2023-01-02 14:20:14','2023-01-02 14:09:49','2023-01-02 14:20:14');



DROP TABLE IF EXISTS other_banks;

CREATE TABLE `other_banks` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `swift_code` varchar(20) NOT NULL,
  `bank_country` varchar(191) NOT NULL,
  `bank_currency` bigint(20) NOT NULL,
  `minimum_transfer_amount` decimal(10,2) NOT NULL,
  `maximum_transfer_amount` decimal(10,2) NOT NULL,
  `fixed_charge` decimal(10,2) NOT NULL,
  `charge_in_percentage` decimal(10,2) NOT NULL,
  `descriptions` text DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO other_banks VALUES('1','WESTPAC BANK','CTBAAU2S','Australia','3','1000.00','1000000.00','50.00','0.15','Transfer Activated','1','2022-12-30 11:39:14','2022-12-30 11:39:14');



DROP TABLE IF EXISTS page_translations;

CREATE TABLE `page_translations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `page_id` bigint(20) unsigned NOT NULL,
  `locale` varchar(191) NOT NULL,
  `title` text NOT NULL,
  `body` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `page_translations_page_id_locale_unique` (`page_id`,`locale`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO page_translations VALUES('1','1','English','Privacy Policy','<h3>Information We Collect</h3>
<p>Information we collect includes both information you knowingly and actively provide us when using or participating in any of our services and promotions, and any information automatically sent by your devices in the course of accessing our products and services.</p>
<h4>Log Data</h4>
<p>When you visit our website, our servers may automatically log the standard data provided by your web browser. It may include your device’s Internet Protocol (IP) address, your browser type and version, the pages you visit, the time and date of your visit, the time spent on each page, other details about your visit, and technical details that occur in conjunction with any errors you may encounter.</p>
<p>Please be aware that while this information may not be personally identifying by itself, it may be possible to combine it with other data to personally identify individual persons.</p>
<h4>Personal Information</h4>
<p>We may ask for personal information which may include one or more of the following:</p>
<ul>
<li>Name</li>
<li>Email</li>
<li>Date of birth</li>
<li>Phone/mobile number</li>
</ul>
<h4>Legitimate Reasons for Processing Your Personal Information</h4>
<p>We only collect and use your personal information when we have a legitimate reason for doing so. In which instance, we only collect personal information that is reasonably necessary to provide our services to you.</p>
<h4>Collection and Use of Information</h4>
<p>We may collect personal information from you when you do any of the following on our website:</p>
<ul>
<li>Sign up to receive updates from us via email or social media channels</li>
<li>Use a mobile device or web browser to access our content</li>
<li>Contact us via email, social media, or on any similar technologies</li>
<li>When you mention us on social media</li>
</ul>
<p>We may collect, hold, use, and disclose information for the following purposes, and personal information will not be further processed in a manner that is incompatible with these purposes:</p>
<p>We may collect, hold, use, and disclose information for the following purposes, and personal information will not be further processed in a manner that is incompatible with these purposes:</p>
<ul>
<li>to contact and communicate with you</li>
<li>to enable you to access and use our website, associated applications, and associated social media platforms</li>
<li>for internal record keeping and administrative purposes</li>
<li>for security and fraud prevention, and to ensure that our sites and apps are safe, secure, and used in line with our terms of use</li>
</ul>
<p>Please be aware that we may combine information we collect about you with general information or research data we receive from other trusted sources.</p>
<h4>Security of Your Personal Information</h4>
<p>When we collect and process personal information, and while we retain this information, we will protect it within commercially acceptable means to prevent loss and theft, as well as unauthorized access, disclosure, copying, use, or modification.</p>
<p>Although we will do our best to protect the personal information you provide to us, we advise that no method of electronic transmission or storage is 100% secure, and no one can guarantee absolute data security. We will comply with laws applicable to us in respect of any data breach.</p>
<p>You are responsible for selecting any password and its overall security strength, ensuring the security of your own information within the bounds of our services.</p>
<h4>How Long We Keep Your Personal Information</h4>
<p>We keep your personal information only for as long as we need to. This time period may depend on what we are using your information for, in accordance with this privacy policy. If your personal information is no longer required, we will delete it or make it anonymous by removing all details that identify you.</p>
<p>However, if necessary, we may retain your personal information for our compliance with a legal, accounting, or reporting obligation or for archiving purposes in the public interest, scientific, or historical research purposes or statistical purposes.</p>
<h3>Children’s Privacy</h3>
<p>We do not aim any of our products or services directly at children under the age of 13, and we do not knowingly collect personal information about children under 13.</p>
<h3>Disclosure of Personal Information to Third Parties</h3>
<p>We may disclose personal information to:</p>
<ul>
<li>a parent, subsidiary, or affiliate of our company</li>
<li>third party service providers for the purpose of enabling them to provide their services, for example, IT service providers, data storage, hosting and server providers, advertisers, or analytics platforms</li>
<li>our employees, contractors, and/or related entities</li>
<li>our existing or potential agents or business partners</li>
<li>sponsors or promoters of any competition, sweepstakes, or promotion we run</li>
<li>courts, tribunals, regulatory authorities, and law enforcement officers, as required by law, in connection with any actual or prospective legal proceedings, or in order to establish, exercise, or defend our legal rights</li>
<li>third parties, including agents or sub-contractors, who assist us in providing information, products, services, or direct marketing to you third parties to collect and process data</li>
</ul>
<h3>International Transfers of Personal Information</h3>
<p>The personal information we collect is stored and/or processed where we or our partners, affiliates, and third-party providers maintain facilities. Please be aware that the locations to which we store, process, or transfer your personal information may not have the same data protection laws as the country in which you initially provided the information. If we transfer your personal information to third parties in other countries: (i) we will perform those transfers in accordance with the requirements of applicable law; and (ii) we will protect the transferred personal information in accordance with this privacy policy.</p>
<h3>Your Rights and Controlling Your Personal Information</h3>
<p>You always retain the right to withhold personal information from us, with the understanding that your experience of our website may be affected. We will not discriminate against you for exercising any of your rights over your personal information. If you do provide us with personal information you understand that we will collect, hold, use and disclose it in accordance with this privacy policy. You retain the right to request details of any personal information we hold about you.</p>
<p>If we receive personal information about you from a third party, we will protect it as set out in this privacy policy. If you are a third party providing personal information about somebody else, you represent and warrant that you have such person’s consent to provide the personal information to us.</p>
<p>If you have previously agreed to us using your personal information for direct marketing purposes, you may change your mind at any time. We will provide you with the ability to unsubscribe from our email-database or opt out of communications. Please be aware we may need to request specific information from you to help us confirm your identity.</p>
<p>If you believe that any information we hold about you is inaccurate, out of date, incomplete, irrelevant, or misleading, please contact us using the details provided in this privacy policy. We will take reasonable steps to correct any information found to be inaccurate, incomplete, misleading, or out of date.</p>
<p>If you believe that we have breached a relevant data protection law and wish to make a complaint, please contact us using the details below and provide us with full details of the alleged breach. We will promptly investigate your complaint and respond to you, in writing, setting out the outcome of our investigation and the steps we will take to deal with your complaint. You also have the right to contact a regulatory body or data protection authority in relation to your complaint.</p>
<h3>Use of Cookies</h3>
<p>We use “cookies” to collect information about you and your activity across our site. A cookie is a small piece of data that our website stores on your computer, and accesses each time you visit, so we can understand how you use our site. This helps us serve you content based on preferences you have specified.</p>
<h3>Limits of Our Policy</h3>
<p>Our website may link to external sites that are not operated by us. Please be aware that we have no control over the content and policies of those sites, and cannot accept responsibility or liability for their respective privacy practices.</p>
<h3>Changes to This Policy</h3>
<p>At our discretion, we may change our privacy policy to reflect updates to our business processes, current acceptable practices, or legislative or regulatory changes. If we decide to change this privacy policy, we will post the changes here at the same link by which you are accessing this privacy policy.</p>
<p>If required by law, we will get your permission or give you the opportunity to opt in to or opt out of, as applicable, any new uses of your personal information.</p>','2021-08-31 10:42:32','2021-09-05 14:27:37');
INSERT INTO page_translations VALUES('2','2','English','Terms & Condition','<h2><strong>Terms and Conditions</strong></h2>
<p>Welcome to LivoBank!</p>
<p>These terms and conditions outline the rules and regulations for the use of Livo Bank\'s Website, located at https://livo-bank.trickycode.xyz.</p>
<p>By accessing this website we assume you accept these terms and conditions. Do not continue to use LivoBank if you do not agree to take all of the terms and conditions stated on this page.</p>
<p>The following terminology applies to these Terms and Conditions, Privacy Statement and Disclaimer Notice and all Agreements: \"Client\", \"You\" and \"Your\" refers to you, the person log on this website and compliant to the Company’s terms and conditions. \"The Company\", \"Ourselves\", \"We\", \"Our\" and \"Us\", refers to our Company. \"Party\", \"Parties\", or \"Us\", refers to both the Client and ourselves. All terms refer to the offer, acceptance and consideration of payment necessary to undertake the process of our assistance to the Client in the most appropriate manner for the express purpose of meeting the Client’s needs in respect of provision of the Company’s stated services, in accordance with and subject to, prevailing law of Netherlands. Any use of the above terminology or other words in the singular, plural, capitalization and/or he/she or they, are taken as interchangeable and therefore as referring to same.</p>
<h3><strong>Cookies</strong></h3>
<p>We employ the use of cookies. By accessing LivoBank, you agreed to use cookies in agreement with the Livo Bank\'s Privacy Policy.</p>
<p>Most interactive websites use cookies to let us retrieve the user’s details for each visit. Cookies are used by our website to enable the functionality of certain areas to make it easier for people visiting our website. Some of our affiliate/advertising partners may also use cookies.</p>
<h3><strong>License</strong></h3>
<p>Unless otherwise stated, Livo Bank and/or its licensors own the intellectual property rights for all material on LivoBank. All intellectual property rights are reserved. You may access this from LivoBank for your own personal use subjected to restrictions set in these terms and conditions.</p>
<p>You must not:</p>
<ul>
<li>Republish material from LivoBank</li>
<li>Sell, rent or sub-license material from LivoBank</li>
<li>Reproduce, duplicate or copy material from LivoBank</li>
<li>Redistribute content from LivoBank</li>
</ul>
<p>This Agreement shall begin on the date hereof. Our Terms and Conditions were created with the help of the <a href=\"https://www.termsandconditionsgenerator.com\">Terms And Conditions Generator</a>.</p>
<p>Parts of this website offer an opportunity for users to post and exchange opinions and information in certain areas of the website. Livo Bank does not filter, edit, publish or review Comments prior to their presence on the website. Comments do not reflect the views and opinions of Livo Bank,its agents and/or affiliates. Comments reflect the views and opinions of the person who post their views and opinions. To the extent permitted by applicable laws, Livo Bank shall not be liable for the Comments or for any liability, damages or expenses caused and/or suffered as a result of any use of and/or posting of and/or appearance of the Comments on this website.</p>
<p>Livo Bank reserves the right to monitor all Comments and to remove any Comments which can be considered inappropriate, offensive or causes breach of these Terms and Conditions.</p>
<p>You warrant and represent that:</p>
<ul>
<li>You are entitled to post the Comments on our website and have all necessary licenses and consents to do so;</li>
<li>The Comments do not invade any intellectual property right, including without limitation copyright, patent or trademark of any third party;</li>
<li>The Comments do not contain any defamatory, libelous, offensive, indecent or otherwise unlawful material which is an invasion of privacy</li>
<li>The Comments will not be used to solicit or promote business or custom or present commercial activities or unlawful activity.</li>
</ul>
<p>You hereby grant Livo Bank a non-exclusive license to use, reproduce, edit and authorize others to use, reproduce and edit any of your Comments in any and all forms, formats or media.</p>
<h3><strong>Hyperlinking to our Content</strong></h3>
<p>The following organizations may link to our Website without prior written approval:</p>
<ul>
<li>Government agencies;</li>
<li>Search engines;</li>
<li>News organizations;</li>
<li>Online directory distributors may link to our Website in the same manner as they hyperlink to the Websites of other listed businesses; and</li>
<li>System wide Accredited Businesses except soliciting non-profit organizations, charity shopping malls, and charity fundraising groups which may not hyperlink to our Web site.</li>
</ul>
<p>These organizations may link to our home page, to publications or to other Website information so long as the link: (a) is not in any way deceptive; (b) does not falsely imply sponsorship, endorsement or approval of the linking party and its products and/or services; and (c) fits within the context of the linking party’s site.</p>
<p>We may consider and approve other link requests from the following types of organizations:</p>
<ul>
<li>commonly-known consumer and/or business information sources;</li>
<li>dot.com community sites;</li>
<li>associations or other groups representing charities;</li>
<li>online directory distributors;</li>
<li>internet portals;</li>
<li>accounting, law and consulting firms; and</li>
<li>educational institutions and trade associations.</li>
</ul>
<p>We will approve link requests from these organizations if we decide that: (a) the link would not make us look unfavorably to ourselves or to our accredited businesses; (b) the organization does not have any negative records with us; (c) the benefit to us from the visibility of the hyperlink compensates the absence of Livo Bank; and (d) the link is in the context of general resource information.</p>
<p>These organizations may link to our home page so long as the link: (a) is not in any way deceptive; (b) does not falsely imply sponsorship, endorsement or approval of the linking party and its products or services; and (c) fits within the context of the linking party’s site.</p>
<p>If you are one of the organizations listed in paragraph 2 above and are interested in linking to our website, you must inform us by sending an e-mail to Livo Bank. Please include your name, your organization name, contact information as well as the URL of your site, a list of any URLs from which you intend to link to our Website, and a list of the URLs on our site to which you would like to link. Wait 2-3 weeks for a response.</p>
<p>Approved organizations may hyperlink to our Website as follows:</p>
<ul>
<li>By use of our corporate name; or</li>
<li>By use of the uniform resource locator being linked to; or</li>
<li>By use of any other description of our Website being linked to that makes sense within the context and format of content on the linking party’s site.</li>
</ul>
<p>No use of Livo Bank\'s logo or other artwork will be allowed for linking absent a trademark license agreement.</p>
<h3><strong>iFrames</strong></h3>
<p>Without prior approval and written permission, you may not create frames around our Webpages that alter in any way the visual presentation or appearance of our Website.</p>
<h3><strong>Content Liability</strong></h3>
<p>We shall not be hold responsible for any content that appears on your Website. You agree to protect and defend us against all claims that is rising on your Website. No link(s) should appear on any Website that may be interpreted as libelous, obscene or criminal, or which infringes, otherwise violates, or advocates the infringement or other violation of, any third party rights.</p>
<h3><strong>Your Privacy</strong></h3>
<p>Please read Privacy Policy</p>
<h3><strong>Reservation of Rights</strong></h3>
<p>We reserve the right to request that you remove all links or any particular link to our Website. You approve to immediately remove all links to our Website upon request. We also reserve the right to amen these terms and conditions and it’s linking policy at any time. By continuously linking to our Website, you agree to be bound to and follow these linking terms and conditions.</p>
<h3><strong>Removal of links from our website</strong></h3>
<p>If you find any link on our Website that is offensive for any reason, you are free to contact and inform us any moment. We will consider requests to remove links but we are not obligated to or so or to respond to you directly.</p>
<p>We do not ensure that the information on this website is correct, we do not warrant its completeness or accuracy; nor do we promise to ensure that the website remains available or that the material on the website is kept up to date.</p>
<h3><strong>Disclaimer</strong></h3>
<p>To the maximum extent permitted by applicable law, we exclude all representations, warranties and conditions relating to our website and the use of this website. Nothing in this disclaimer will:</p>
<ul>
<li>limit or exclude our or your liability for death or personal injury;</li>
<li>limit or exclude our or your liability for fraud or fraudulent misrepresentation;</li>
<li>limit any of our or your liabilities in any way that is not permitted under applicable law; or</li>
<li>exclude any of our or your liabilities that may not be excluded under applicable law.</li>
</ul>
<p>The limitations and prohibitions of liability set in this Section and elsewhere in this disclaimer: (a) are subject to the preceding paragraph; and (b) govern all liabilities arising under the disclaimer, including liabilities arising in contract, in tort and for breach of statutory duty.</p>
<p>As long as the website and the information and services on the website are provided free of charge, we will not be liable for any loss or damage of any nature.</p>','2021-08-31 10:44:42','2021-09-05 14:34:10');



DROP TABLE IF EXISTS pages;

CREATE TABLE `pages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(191) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pages_slug_unique` (`slug`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO pages VALUES('1','privacy-policy','1','2021-08-31 10:42:32','2021-08-31 10:42:32');
INSERT INTO pages VALUES('2','terms-condition','1','2021-08-31 10:44:42','2021-08-31 10:44:42');



DROP TABLE IF EXISTS password_resets;

CREATE TABLE `password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE IF EXISTS payment_gateways;

CREATE TABLE `payment_gateways` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `slug` varchar(30) NOT NULL,
  `image` varchar(191) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `parameters` text DEFAULT NULL,
  `currency` varchar(3) DEFAULT NULL,
  `supported_currencies` text DEFAULT NULL,
  `extra` text DEFAULT NULL,
  `exchange_rate` decimal(10,6) DEFAULT NULL,
  `fixed_charge` decimal(10,2) NOT NULL DEFAULT 0.00,
  `charge_in_percentage` decimal(10,2) NOT NULL DEFAULT 0.00,
  `minimum_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `maximum_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO payment_gateways VALUES('1','PayPal','PayPal','paypal.png','0','{\"client_id\":\"\",\"client_secret\":\"\",\"environment\":\"sandbox\"}','','{\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"HKD\":\"HKD\",\"HUF\":\"HUF\",\"INR\":\"INR\",\"ILS\":\"ILS\",\"JPY\":\"JPY\",\"MYR\":\"MYR\",\"MXN\":\"MXN\",\"TWD\":\"TWD\",\"NZD\":\"NZD\",\"NOK\":\"NOK\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"GBP\":\"GBP\",\"RUB\":\"RUB\",\"SGD\":\"SGD\",\"SEK\":\"SEK\",\"CHF\":\"CHF\",\"THB\":\"THB\",\"USD\":\"USD\"}','','','0.00','0.00','0.00','0.00','','');
INSERT INTO payment_gateways VALUES('2','Stripe','Stripe','stripe.png','0','{\"secret_key\":\"\",\"publishable_key\":\"\"}','','{\"USD\":\"USD\",\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"INR\":\"INR\",\"JPY\":\"JPY\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PLN\":\"PLN\",\"SEK\":\"SEK\",\"SGD\":\"SGD\"}','','','0.00','0.00','0.00','0.00','','');
INSERT INTO payment_gateways VALUES('3','Razorpay','Razorpay','razorpay.png','0','{\"razorpay_key_id\":\"\",\"razorpay_key_secret\":\"\"}','','{\"INR\":\"INR\"}','','','0.00','0.00','0.00','0.00','','');
INSERT INTO payment_gateways VALUES('4','Paystack','Paystack','paystack.png','0','{\"paystack_public_key\":\"\",\"paystack_secret_key\":\"\"}','','{\"GHS\":\"GHS\",\"NGN\":\"NGN\",\"ZAR\":\"ZAR\"}','','','0.00','0.00','0.00','0.00','','');
INSERT INTO payment_gateways VALUES('5','BlockChain','BlockChain','blockchain.png','0','{\"blockchain_api_key\":\"\",\"blockchain_xpub\":\"\"}','','{\"BTC\":\"BTC\"}','','','0.00','0.00','0.00','0.00','','');
INSERT INTO payment_gateways VALUES('6','Flutterwave','Flutterwave','flutterwave.png','0','{\"public_key\":\"\",\"secret_key\":\"\",\"encryption_key\":\"\",\"environment\":\"sandbox\"}','','{\"BIF\":\"BIF\",\"CAD\":\"CAD\",\"CDF\":\"CDF\",\"CVE\":\"CVE\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"GHS\":\"GHS\",\"GMD\":\"GMD\",\"GNF\":\"GNF\",\"KES\":\"KES\",\"LRD\":\"LRD\",\"MWK\":\"MWK\",\"MZN\":\"MZN\",\"NGN\":\"NGN\",\"RWF\":\"RWF\",\"SLL\":\"SLL\",\"STD\":\"STD\",\"TZS\":\"TZS\",\"UGX\":\"UGX\",\"USD\":\"USD\",\"XAF\":\"XAF\",\"XOF\":\"XOF\",\"ZMK\":\"ZMK\",\"ZMW\":\"ZMW\",\"ZWD\":\"ZWD\"}','','','0.00','0.00','0.00','0.00','','');



DROP TABLE IF EXISTS payment_requests;

CREATE TABLE `payment_requests` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `currency_id` bigint(20) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `description` text DEFAULT NULL,
  `sender_id` bigint(20) NOT NULL,
  `receiver_id` bigint(20) NOT NULL,
  `transaction_id` bigint(20) DEFAULT NULL,
  `branch_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE IF EXISTS permissions;

CREATE TABLE `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) NOT NULL,
  `permission` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE IF EXISTS roles;

CREATE TABLE `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE IF EXISTS service_translations;

CREATE TABLE `service_translations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `service_id` bigint(20) unsigned NOT NULL,
  `locale` varchar(191) NOT NULL,
  `title` varchar(191) NOT NULL,
  `body` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `service_translations_service_id_locale_unique` (`service_id`,`locale`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO service_translations VALUES('1','2','English','Money Transfer','We offers you secure and easy transfer. Transfer money between users within a minutes.','2021-08-31 07:34:38','2021-08-31 07:34:38');
INSERT INTO service_translations VALUES('2','3','English','Multi Currency','We supports multi currency. Bank conveniently with currencies of your choice.','2021-08-31 07:35:33','2021-09-05 11:34:07');
INSERT INTO service_translations VALUES('3','4','English','Exchange Currency','We offer lowest exchange fee so you can exchange your currency anytime.','2021-08-31 07:38:26','2021-08-31 07:38:26');
INSERT INTO service_translations VALUES('4','5','English','Fixed Deposit','We offers long term investment and you will get good interest rate after maturity.','2021-08-31 07:38:44','2021-08-31 07:38:44');
INSERT INTO service_translations VALUES('5','6','English','Apply Loan','We offers different types loan with low interest rate. You can get a loan easily.','2021-08-31 07:39:01','2021-08-31 07:39:01');
INSERT INTO service_translations VALUES('6','7','English','Payment Request','You can make payment request to you customer for any types of product or services.','2021-08-31 07:39:19','2021-08-31 07:50:50');



DROP TABLE IF EXISTS services;

CREATE TABLE `services` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `icon` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO services VALUES('2','<i class=\"icofont-paper-plane\"></i>','2021-08-31 07:34:38','2021-09-05 15:33:22');
INSERT INTO services VALUES('3','<i class=\"icofont-money\"></i>','2021-08-31 07:35:33','2021-09-05 11:29:47');
INSERT INTO services VALUES('4','<i class=\"icofont-exchange\"></i>','2021-08-31 07:38:26','2021-09-05 11:30:04');
INSERT INTO services VALUES('5','<i class=\"icofont-bank-alt\"></i>','2021-08-31 07:38:44','2021-09-05 11:30:19');
INSERT INTO services VALUES('6','<i class=\"icofont-file-text\"></i>','2021-08-31 07:39:01','2021-09-05 11:30:32');
INSERT INTO services VALUES('7','<i class=\"icofont-pay\"></i>','2021-08-31 07:39:19','2021-09-05 11:30:43');



DROP TABLE IF EXISTS setting_translations;

CREATE TABLE `setting_translations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `setting_id` bigint(20) unsigned NOT NULL,
  `locale` varchar(191) NOT NULL,
  `value` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `setting_translations_setting_id_locale_unique` (`setting_id`,`locale`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE IF EXISTS settings;

CREATE TABLE `settings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `value` longtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=108 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO settings VALUES('1','mail_type','smtp','','2022-12-31 16:34:44');
INSERT INTO settings VALUES('2','backend_direction','ltr','','2023-01-02 14:00:59');
INSERT INTO settings VALUES('3','language','English','','2023-01-02 13:56:36');
INSERT INTO settings VALUES('4','email_verification','enabled','','2023-01-02 14:00:59');
INSERT INTO settings VALUES('5','allow_singup','no','','2023-01-02 14:00:59');
INSERT INTO settings VALUES('6','company_name','LLOYDS BANK','2022-12-29 23:53:24','2023-01-02 13:56:36');
INSERT INTO settings VALUES('7','site_title','Lloyds Bank Internet Banking','2022-12-29 23:53:24','2023-01-02 13:56:36');
INSERT INTO settings VALUES('8','phone','740 425 3863','2022-12-29 23:53:24','2023-01-02 13:56:36');
INSERT INTO settings VALUES('9','email','customerservice@nonresidentlb.com','2022-12-29 23:53:24','2023-01-02 13:56:36');
INSERT INTO settings VALUES('10','timezone','Europe/London','2022-12-29 23:53:24','2023-01-02 13:56:36');
INSERT INTO settings VALUES('38','main_heading','Smart way to keep your money safe and secure','2021-08-31 15:38:10','2021-09-05 11:47:17');
INSERT INTO settings VALUES('39','sub_heading','Transfer money within minutes and save money for your future. All of your desired service in single platform.','2021-08-31 15:39:15','2021-09-05 11:47:17');
INSERT INTO settings VALUES('41','copyright','Copyright © 2022 <a href=\"#\" target=\"_blank\">Lloyds Bank</a>  -  All Rights Reserved.
','2021-08-31 15:39:15','2021-09-05 11:24:45');
INSERT INTO settings VALUES('46','meta_keywords','','2021-08-31 15:39:15','2021-08-31 15:39:15');
INSERT INTO settings VALUES('47','meta_content','','2021-08-31 15:39:15','2021-08-31 15:39:15');
INSERT INTO settings VALUES('49','footer_about_us','Lloyds Bank believes that we can build economic vitality together. We do that by putting our priority on people and the communities they live in. That’s true if  Lloyds Bank is your personal bank, business bank, or private bank. 

','2021-08-31 15:58:14','2021-09-05 11:24:45');
INSERT INTO settings VALUES('51','primary_menu','1','2021-08-31 17:30:14','2021-08-31 17:30:14');
INSERT INTO settings VALUES('52','footer_menu_1','2','2021-08-31 17:30:14','2021-08-31 18:13:31');
INSERT INTO settings VALUES('53','footer_menu_1_title','Quick Explore','2021-09-01 06:50:56','2021-09-01 06:50:56');
INSERT INTO settings VALUES('54','footer_menu_2_title','Pages','2021-09-01 06:50:56','2021-09-05 11:24:45');
INSERT INTO settings VALUES('55','footer_menu_2','3','2021-09-01 06:50:56','2021-09-01 06:50:56');
INSERT INTO settings VALUES('56','home_about_us_heading','About Us','2021-09-05 10:52:18','2021-09-05 10:54:38');
INSERT INTO settings VALUES('58','home_service_content','You can choose any of our services','2021-09-05 10:52:18','2021-09-05 11:12:10');
INSERT INTO settings VALUES('59','home_fixed_deposit_heading','Fixed Deposit Plans','2021-09-05 10:52:18','2021-09-05 11:19:41');
INSERT INTO settings VALUES('60','home_fixed_deposit_content','You will get maximum rewards with us by making long term deposit','2021-09-05 10:52:18','2021-09-05 11:19:41');
INSERT INTO settings VALUES('61','home_loan_heading','Loan Packages','2021-09-05 10:52:18','2021-09-05 11:19:41');
INSERT INTO settings VALUES('62','home_loan_content','We offers different types loan with low interest rate. You will get hassle free loan easily.','2021-09-05 10:52:18','2021-09-05 11:19:41');
INSERT INTO settings VALUES('63','home_testimonial_heading','We served over 500+ Customers','2021-09-05 10:52:18','2021-09-05 11:19:41');
INSERT INTO settings VALUES('64','home_testimonial_content','','2021-09-05 10:52:18','2021-09-05 11:19:41');
INSERT INTO settings VALUES('65','home_partner_heading','Partners who support us','2021-09-05 10:52:18','2021-09-05 11:19:41');
INSERT INTO settings VALUES('66','home_partner_content','','2021-09-05 10:52:18','2021-09-05 11:19:41');
INSERT INTO settings VALUES('67','home_about_us_content','Livo Bank is a micro banking system. We offers different types of financial services to our customers all over the world. We have multiple branches to provide different services such as Loan, Wire transfer, Long term deposit, savings and some other related services.','2021-09-05 10:54:15','2021-09-05 10:54:15');
INSERT INTO settings VALUES('68','home_service_heading','Our Services','2021-09-05 10:54:38','2021-09-05 11:12:10');
INSERT INTO settings VALUES('69','total_customer','500','2021-09-05 11:06:39','2021-09-05 11:08:10');
INSERT INTO settings VALUES('70','total_branch','5','2021-09-05 11:06:39','2021-09-05 11:11:53');
INSERT INTO settings VALUES('71','total_transactions','1','2021-09-05 11:06:39','2021-09-05 11:11:53');
INSERT INTO settings VALUES('72','total_countries','200','2021-09-05 11:06:39','2021-09-05 11:11:53');
INSERT INTO settings VALUES('73','about_page_title',' Who We Are','2021-09-05 15:07:18','2021-09-05 15:07:18');
INSERT INTO settings VALUES('74','our_team_title','Meet Our Team','2021-09-05 15:07:18','2021-09-05 15:07:18');
INSERT INTO settings VALUES('75','our_team_sub_title','','2021-09-05 15:07:18','2021-09-05 15:07:18');
INSERT INTO settings VALUES('76','about_us_content','<p>Livo Bank is a micro banking system. We offers different types of financial services to our customers all over the world. </p><p>We have multiple branches to provide different services such as Loan, Wire transfer, Long term deposit, savings and some other related services.</p>','2021-09-05 15:08:15','2021-09-05 15:08:15');
INSERT INTO settings VALUES('77','privacy_policy_page','privacy-policy','2022-06-01 15:07:18','2022-06-01 15:07:18');
INSERT INTO settings VALUES('78','terms_condition_page','terms-condition','2022-06-01 15:07:18','2022-06-01 15:07:18');
INSERT INTO settings VALUES('79','APP_VERSION','1.3.3','2022-12-29 23:53:24','2022-12-29 23:53:24');
INSERT INTO settings VALUES('80','address','113-117 Oxford Street London, W1D 2HW – England','2022-12-29 23:54:59','2023-01-02 13:56:36');
INSERT INTO settings VALUES('81','website_enable','yes','2022-12-30 00:03:45','2023-01-02 14:00:59');
INSERT INTO settings VALUES('82','currency_position','left','2022-12-30 00:03:45','2023-01-02 14:00:59');
INSERT INTO settings VALUES('83','date_format','Y-m-d','2022-12-30 00:03:45','2023-01-02 14:00:59');
INSERT INTO settings VALUES('84','time_format','24','2022-12-30 00:03:45','2023-01-02 14:00:59');
INSERT INTO settings VALUES('85','mobile_verification','enabled','2022-12-30 00:03:45','2023-01-02 14:00:59');
INSERT INTO settings VALUES('86','enable_2fa','yes','2022-12-30 00:03:45','2023-01-02 14:00:59');
INSERT INTO settings VALUES('87','enable_kyc','no','2022-12-30 00:03:45','2023-01-02 14:00:59');
INSERT INTO settings VALUES('88','next_account_number','20221005','2022-12-30 00:03:45','2023-01-02 14:00:59');
INSERT INTO settings VALUES('89','logo','logo.png','2022-12-30 00:36:00','2022-12-30 00:36:38');
INSERT INTO settings VALUES('90','favicon','file_1672360600.png','2022-12-30 00:36:02','2022-12-30 00:36:40');
INSERT INTO settings VALUES('91','send_money_action','1','2022-12-30 12:02:34','2022-12-30 14:42:14');
INSERT INTO settings VALUES('92','send_money_otp','1','2022-12-30 12:02:34','2022-12-30 14:42:14');
INSERT INTO settings VALUES('93','exchange_money_action','1','2022-12-30 12:02:34','2022-12-30 14:42:14');
INSERT INTO settings VALUES('94','exchange_money_otp','1','2022-12-30 12:02:34','2022-12-30 14:42:14');
INSERT INTO settings VALUES('95','withdraw_money_otp','1','2022-12-30 12:02:34','2022-12-30 14:42:14');
INSERT INTO settings VALUES('96','wire_transfer_otp','1','2022-12-30 12:02:34','2022-12-30 14:42:14');
INSERT INTO settings VALUES('97','enable_sms','1','2022-12-30 14:06:34','2022-12-30 14:06:34');
INSERT INTO settings VALUES('98','twilio_account_sid','AC4ce95a38f58d37bb4aaa429fbeaa4c49','2022-12-30 14:06:34','2022-12-30 14:06:34');
INSERT INTO settings VALUES('99','twilio_auth_token','e60ca97bcc4ec0ba13d173dfbcc6a65e','2022-12-30 14:06:34','2022-12-30 14:06:34');
INSERT INTO settings VALUES('100','twilio_mobile_number','+15627849260','2022-12-30 14:06:34','2022-12-30 14:06:34');
INSERT INTO settings VALUES('101','from_email','noreply@nonresidentlb.com','2022-12-30 14:09:37','2022-12-31 16:34:44');
INSERT INTO settings VALUES('102','from_name','Lloyds Bank London','2022-12-30 14:09:37','2022-12-31 16:34:44');
INSERT INTO settings VALUES('103','smtp_host','host70.registrar-servers.com','2022-12-30 14:09:37','2022-12-31 16:34:44');
INSERT INTO settings VALUES('104','smtp_port','465','2022-12-30 14:09:37','2022-12-31 16:34:44');
INSERT INTO settings VALUES('105','smtp_username','noreply@nonresidentlb.com','2022-12-30 14:09:37','2022-12-31 16:34:44');
INSERT INTO settings VALUES('106','smtp_password','7FZQ=H{IY5{8','2022-12-30 14:09:37','2022-12-31 16:34:44');
INSERT INTO settings VALUES('107','smtp_encryption','ssl','2022-12-30 14:09:37','2022-12-31 16:34:44');



DROP TABLE IF EXISTS support_ticket_messages;

CREATE TABLE `support_ticket_messages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `support_ticket_id` bigint(20) NOT NULL,
  `message` text NOT NULL,
  `sender_id` bigint(20) NOT NULL,
  `attachment` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE IF EXISTS support_tickets;

CREATE TABLE `support_tickets` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `subject` varchar(191) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `priority` tinyint(4) NOT NULL DEFAULT 0,
  `created_user_id` bigint(20) NOT NULL,
  `operator_id` bigint(20) DEFAULT NULL,
  `closed_user_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE IF EXISTS teams;

CREATE TABLE `teams` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `image` varchar(191) NOT NULL,
  `role` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE IF EXISTS testimonial_translations;

CREATE TABLE `testimonial_translations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `testimonial_id` bigint(20) unsigned NOT NULL,
  `locale` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `testimonial` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `testimonial_translations_testimonial_id_locale_unique` (`testimonial_id`,`locale`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE IF EXISTS testimonials;

CREATE TABLE `testimonials` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `image` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE IF EXISTS transactions;

CREATE TABLE `transactions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `currency_id` bigint(20) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `fee` decimal(10,2) NOT NULL DEFAULT 0.00,
  `dr_cr` varchar(2) NOT NULL,
  `type` varchar(20) NOT NULL,
  `method` varchar(20) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `note` text DEFAULT NULL,
  `loan_id` bigint(20) DEFAULT NULL,
  `ref_id` bigint(20) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `other_bank_id` bigint(20) DEFAULT NULL,
  `gateway_id` bigint(20) DEFAULT NULL,
  `created_user_id` bigint(20) DEFAULT NULL,
  `updated_user_id` bigint(20) DEFAULT NULL,
  `branch_id` bigint(20) DEFAULT NULL,
  `transaction_details` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO transactions VALUES('1','2','1','10000000.00','0.00','cr','Deposit','Manual','2','','','','','','','1','','','','2022-12-29 00:00:00','2022-12-30 08:25:07');
INSERT INTO transactions VALUES('2','3','1','1000000.00','0.00','cr','Deposit','Manual','2','','','','','','','1','','','','2010-12-22 00:00:00','2022-12-30 11:34:05');
INSERT INTO transactions VALUES('3','3','1','500000.00','0.00','dr','Exchange','Online','2','','','','','','','3','','1','','2022-12-30 11:41:31','2022-12-30 11:41:31');
INSERT INTO transactions VALUES('4','3','3','37250000.00','0.00','cr','Exchange','Online','2','','','','3','','','3','','1','','2022-12-30 11:41:31','2022-12-30 11:41:31');
INSERT INTO transactions VALUES('5','3','3','2553.75','53.75','dr','Wire_Transfer','Manual','2','transfer to walter','','','','1','','3','','1','{\"account_number\":\"875764\",\"account_holder_name\":\"hank walter\"}','2022-12-30 11:42:49','2022-12-31 16:36:14');
INSERT INTO transactions VALUES('6','3','3','47120.50','120.50','dr','Wire_Transfer','Manual','2','','','','','1','','3','','1','{\"account_number\":\"45345453434\",\"account_holder_name\":\"hank mark\"}','2022-12-30 12:01:15','2022-12-30 12:08:17');
INSERT INTO transactions VALUES('7','3','3','4056.00','56.00','dr','Wire_Transfer','Manual','2','','','','','1','','3','','1','{\"account_number\":\"93948493\",\"account_holder_name\":\"jan jack\"}','2022-12-30 12:15:02','2022-12-31 16:36:18');
INSERT INTO transactions VALUES('8','4','3','99999999.99','0.00','cr','Deposit','Manual','2','','','','','','','1','','','','2022-12-30 00:00:00','2022-12-30 14:13:49');
INSERT INTO transactions VALUES('9','4','3','20080.00','80.00','dr','Wire_Transfer','Manual','2','','','','','1','','4','','1','{\"account_number\":\"20221002\",\"account_holder_name\":\"Shelia Jahn\"}','2022-12-30 14:18:07','2022-12-31 20:10:05');
INSERT INTO transactions VALUES('10','3','3','7060.50','60.50','dr','Wire_Transfer','Manual','2','','','','','1','','3','','1','{\"account_number\":\"393939393\",\"account_holder_name\":\"kendet\"}','2022-12-30 14:44:45','2022-12-31 16:36:09');
INSERT INTO transactions VALUES('11','3','3','3054.50','54.50','dr','Wire_Transfer','Manual','2','','','','','1','','3','','1','{\"account_number\":\"858484953\",\"account_holder_name\":\"jee dee\"}','2022-12-30 14:49:35','2022-12-31 20:10:16');
INSERT INTO transactions VALUES('12','3','3','2053.00','53.00','dr','Wire_Transfer','Manual','2','','','','','1','','3','','1','{\"account_number\":\"73648374\",\"account_holder_name\":\"check mark\"}','2022-12-30 15:14:11','2022-12-31 16:36:05');
INSERT INTO transactions VALUES('13','3','3','3054.50','54.50','dr','Wire_Transfer','Manual','2','','','','','1','','3','','1','{\"account_number\":\"138474839\",\"account_holder_name\":\"Hang ok\"}','2022-12-31 16:40:46','2022-12-31 20:09:59');
INSERT INTO transactions VALUES('22','5','3','50125.00','125.00','dr','Wire_Transfer','Manual','0','','','','','1','','5','','1','{\"account_number\":\"34335556\",\"account_holder_name\":\"HKEE\"}','2023-01-02 13:44:16','2023-01-02 13:46:44');
INSERT INTO transactions VALUES('15','4','3','2053.00','53.00','dr','Wire_Transfer','Manual','2','asdfasdfasdfasdf','','','','1','','4','','1','{\"account_number\":\"20221001\",\"account_holder_name\":\"Ghancem\"}','2023-01-02 09:15:42','2023-01-02 09:48:33');
INSERT INTO transactions VALUES('16','4','3','2053.00','53.00','dr','Wire_Transfer','Manual','2','sdfsdfsd','','','','1','','4','','1','{\"account_number\":\"20221001\",\"account_holder_name\":\"Ghancen\"}','2023-01-02 09:18:13','2023-01-02 09:48:28');
INSERT INTO transactions VALUES('17','4','3','5057.50','57.50','dr','Wire_Transfer','Manual','2','sdfsdf','','','','1','','4','','1','{\"account_number\":\"20221001\",\"account_holder_name\":\"asdfasdf\"}','2023-01-02 09:55:27','2023-01-02 09:55:58');
INSERT INTO transactions VALUES('18','4','3','2053.00','53.00','dr','Wire_Transfer','Manual','2','sdfsdfsdf','','','','1','','4','','1','{\"account_number\":\"20221001\",\"account_holder_name\":\"dfgdfg\"}','2023-01-02 09:58:43','2023-01-02 09:59:14');
INSERT INTO transactions VALUES('20','5','1','1040.00','0.00','cr','Deposit','Manual','2','Account Opening Charge','','','','','','1','','','','2022-12-19 02:10:00','2023-01-02 13:27:39');
INSERT INTO transactions VALUES('21','5','3','9100000.00','0.00','cr','Deposit','Manual','2','Ghana Commercial Bank','','','','','','1','','','','2022-12-23 00:00:00','2023-01-02 13:37:58');
INSERT INTO transactions VALUES('23','5','3','50125.00','125.00','dr','Wire_Transfer','Manual','2','','','','','1','','5','','1','{\"account_number\":\"2334454\",\"account_holder_name\":\"HK\"}','2023-01-02 13:49:45','2023-01-02 13:50:23');
INSERT INTO transactions VALUES('24','5','3','40110.00','110.00','dr','Wire_Transfer','Manual','2','Transfer wire','','','','1','','5','','1','{\"account_number\":\"20383404\",\"account_holder_name\":\"gk\"}','2023-01-02 13:59:13','2023-01-02 14:09:49');



DROP TABLE IF EXISTS user_documents;

CREATE TABLE `user_documents` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `document_name` varchar(50) NOT NULL,
  `document` varchar(191) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE IF EXISTS users;

CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `account_number` varchar(30) DEFAULT NULL,
  `user_type` varchar(20) NOT NULL,
  `role_id` bigint(20) DEFAULT NULL,
  `branch_id` bigint(20) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `profile_picture` varchar(191) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `sms_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) DEFAULT NULL,
  `provider` varchar(191) DEFAULT NULL,
  `provider_id` varchar(191) DEFAULT NULL,
  `country_code` varchar(10) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `two_factor_code` varchar(10) DEFAULT NULL,
  `two_factor_expires_at` datetime DEFAULT NULL,
  `otp` varchar(10) DEFAULT NULL,
  `otp_expires_at` datetime DEFAULT NULL,
  `allow_withdrawal` tinyint(4) NOT NULL DEFAULT 1,
  `document_verified_at` timestamp NULL DEFAULT NULL,
  `document_submitted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO users VALUES('1','Admincoin','verify@coinunionbank.com','','','admin','','','1','default.png','2022-12-29 23:50:08','','$2y$10$WDHNZmYjwtcZivWtoVU6wuOa6Xg2TE4FZ2nqlh/SUpK/Bh6yNZO6.','','','','','2022-12-29 23:50:08','2022-12-29 23:50:08','','','','','1','','');
INSERT INTO users VALUES('3','Shelia Jahn','sheilaric36@gmail.com','0555218045','20221002','customer','','1','1','','2022-12-30 11:32:33','2022-12-30 11:32:33','$2y$10$wh4yFoaBv95JgW7BZDUvQehJmrh5b8R.yrppvKDGLbuwoHvEoqSVm','','','233','','2022-12-30 11:33:29','2022-12-30 11:33:29','','','940315','2023-01-02 10:04:13','1','','');
INSERT INTO users VALUES('4','Trevillion','abotsistanley0@gmail.com','0552711468','20221003','customer','','1','1','','2022-12-30 14:16:39','2022-12-30 14:11:02','$2y$10$vR7ac0F9e.O/2xP.6PW1S.L.MAJR/9z.rG0yXmXiNmeEoJElpviay','','','233','','2022-12-30 14:13:04','2022-12-30 14:16:39','','','413601','2023-01-02 14:44:40','1','','');
INSERT INTO users VALUES('5','Goerge Dennis','george.dennis31@yahoo.com','555218045','20221004','customer','','1','1','1672665877eggggggggggggg.jpg','2023-01-02 13:22:39','2023-01-02 13:22:39','$2y$10$oIKHfkiIfKxiKlEYpmGVJOzaXo9dqu/LYpBCqon1rWtft5yw3K62i','','','233','','2023-01-02 13:24:37','2023-01-02 13:24:37','','','575013','2023-01-02 14:03:32','1','','');
INSERT INTO users VALUES('6','AdminBank','arizolna1470@yahoo.com','','','admin','','','1','','2023-01-02 14:15:43','','$2y$10$craURKNrOfS7JwtXg9o9oeij3kw2AdJOmaH1vUSFywx3qmUVTXO.W','','','','','2023-01-02 14:15:43','2023-01-02 14:15:43','','','','','1','','');



DROP TABLE IF EXISTS withdraw_methods;

CREATE TABLE `withdraw_methods` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `image` varchar(191) DEFAULT NULL,
  `currency_id` bigint(20) NOT NULL,
  `minimum_amount` decimal(10,2) NOT NULL,
  `maximum_amount` decimal(10,2) NOT NULL,
  `fixed_charge` decimal(10,2) NOT NULL,
  `charge_in_percentage` decimal(10,2) NOT NULL,
  `descriptions` text DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `requirements` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE IF EXISTS withdraw_requests;

CREATE TABLE `withdraw_requests` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `method_id` bigint(20) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `description` text DEFAULT NULL,
  `requirements` text DEFAULT NULL,
  `attachment` varchar(191) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `transaction_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




