**Project SimpleRadiologyDatabase**

This is a personal SQL project where I try to apply what I learned from university unit database management and try to build my own database. I used MySQL workbench along with MySQL Server. Everything produced including the entities and attributes are all hypothetical and is not real - they're made based off my domain knowledge of healthcare as someone with a radiology background.

**Entity Relationship Diagram**

This is the ERD I made with crowfoot notations before I tried implementing it into a database.

![image](https://github.com/NguyenMav/Project_MySQL_SimpleRadiologyDatabase/assets/149219810/3bcb25cf-1606-4b7a-9701-cb88b0d0c4de)

**Populating The Database**

After the database was made, I populated all tables with AI-generated entries, so none of them are real.

Here's the table for Staff:

![image](https://github.com/NguyenMav/Project_MySQL_SimpleRadiologyDatabase/assets/149219810/3b4d9881-0eca-45e3-b399-27f84b15871f)

Here's the table for Radiographers:

![image](https://github.com/NguyenMav/Project_MySQL_SimpleRadiologyDatabase/assets/149219810/803eda17-338e-43f5-91a3-982a4737700c)

Here's the table for Radiologists:

![image](https://github.com/NguyenMav/Project_MySQL_SimpleRadiologyDatabase/assets/149219810/1c1d2a14-050f-4b66-af2f-488c9586f743)

Here's the table for Receptionists:

![image](https://github.com/NguyenMav/Project_MySQL_SimpleRadiologyDatabase/assets/149219810/1013353c-3a9e-403c-b1d9-5e8d7eb3089a)

Here's the table for Patients:

![image](https://github.com/NguyenMav/Project_MySQL_SimpleRadiologyDatabase/assets/149219810/bddba13c-20bd-4f37-b287-1f43d4f7e18d)

Here's the table for Referring Doctors:

![image](https://github.com/NguyenMav/Project_MySQL_SimpleRadiologyDatabase/assets/149219810/6239b7c7-ed93-4769-866c-23e7ec5af561)

Here's the table for Referral:

![image](https://github.com/NguyenMav/Project_MySQL_SimpleRadiologyDatabase/assets/149219810/dff7f755-a980-474c-a42c-308770ced288)

Here's the table for Appointment:

![image](https://github.com/NguyenMav/Project_MySQL_SimpleRadiologyDatabase/assets/149219810/03cbb358-ecc6-474b-8779-bb42443ea80a)

Here's the table for Scanner:

![image](https://github.com/NguyenMav/Project_MySQL_SimpleRadiologyDatabase/assets/149219810/bff26c39-01a2-43b0-9699-5374f9c4136c)

Here's the table for Examination:

![image](https://github.com/NguyenMav/Project_MySQL_SimpleRadiologyDatabase/assets/149219810/d37f1079-8451-4a48-a6e5-5438198b2b39)

Here's the table for Diagnostic Reports:

![image](https://github.com/NguyenMav/Project_MySQL_SimpleRadiologyDatabase/assets/149219810/a363a6c6-042b-42cd-a2cd-24a351d72a18)

Here's the table for Billing Invoice:

![image](https://github.com/NguyenMav/Project_MySQL_SimpleRadiologyDatabase/assets/149219810/0ff3ee24-a744-4457-8ae2-eae9a1c96aaf)














**SQL Statements Demonstrations**

Here's the table to demonstrate what changes were made according to the SQL statement I made to manipulate or show something in the database:

Adding Column in table Patient:

Before

![image](https://github.com/NguyenMav/Project_MySQL_SimpleRadiologyDatabase/assets/149219810/c4c57f17-c39e-4f2e-a0e4-0e2a994cef07)

After

![image](https://github.com/NguyenMav/Project_MySQL_SimpleRadiologyDatabase/assets/149219810/42ab14b0-b9a3-4076-b7a3-c022d81e7c30)

Updating Patient's States:

Before

![image](https://github.com/NguyenMav/Project_MySQL_SimpleRadiologyDatabase/assets/149219810/a31f889a-501c-462c-986c-17c8593259df)

After

![image](https://github.com/NguyenMav/Project_MySQL_SimpleRadiologyDatabase/assets/149219810/5b631ea3-ccd3-40cd-8182-b4f836617b0a)

Wanting to find the names of radiographers and their specialties, sorted by specialty in ascending order:

![image](https://github.com/NguyenMav/Project_MySQL_SimpleRadiologyDatabase/assets/149219810/669cec82-6e54-4e07-9664-15f98060c1ab)

Looking up Patient's phone number to call them about rescheduling their appointment:

![image](https://github.com/NguyenMav/Project_MySQL_SimpleRadiologyDatabase/assets/149219810/56b6c08d-3dfe-4051-b2ad-405b7c05a1cf)

Finding the month and year of when the scanners last had their maintenance to book for the next one:

![image](https://github.com/NguyenMav/Project_MySQL_SimpleRadiologyDatabase/assets/149219810/30a41dd5-49e6-4097-92e0-043037de60f8)

Showing radiologists who work at Vision Radiology and their details:

![image](https://github.com/NguyenMav/Project_MySQL_SimpleRadiologyDatabase/assets/149219810/73a22301-f89b-4ced-b459-79d773c02e96)
