DROP TABLE IF EXISTS project_category CASCADE;
DROP TABLE IF EXISTS project CASCADE;
DROP TABLE IF EXISTS category CASCADE;
DROP TABLE IF EXISTS organization CASCADE;


-- ========================================
-- Organization Table
-- ========================================

CREATE TABLE organization (
    organization_id SERIAL PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    description TEXT NOT NULL,
    contact_email VARCHAR(255) NOT NULL,
    logo_filename VARCHAR(255) NOT NULL
);


-- ========================================
-- Insert Sample Organizations
-- ========================================

INSERT INTO organization (name, description, contact_email, logo_filename)
VALUES
('BrightFuture Builders', 'A nonprofit focused on improving community infrastructure through sustainable construction projects.', 'info@brightfuturebuilders.org', 'brightfuture-logo.png'),
('GreenHarvest Growers', 'An urban farming collective promoting food sustainability and education in local neighborhoods.', 'contact@greenharvest.org', 'greenharvest-logo.png'),
('UnityServe Volunteers', 'A volunteer coordination group supporting local charities and service initiatives.', 'hello@unityserve.org', 'unityserve-logo.png'),
('Helping Hands Foundation', 'Dedicated to supporting families through food drives, clothing donations, and emergency relief programs.', 'support@helpinghands.org', 'helpinghands-logo.png'),
('Community Care Network', 'Works with volunteers to organize health outreach, educational workshops, and neighborhood improvement projects.', 'contact@communitycare.org', 'communitycare-logo.png'),
('HopeBridge Services', 'Connects volunteers with organizations that provide shelter, counseling, and support for vulnerable communities.', 'info@hopebridge.org', 'hopebridge-logo.png'),
('Future Leaders Initiative', 'Empowers young people through mentorship, leadership training, and educational service projects.', 'hello@futureleaders.org', 'futureleaders-logo.png'),
('Clean Earth Alliance', 'Organizes environmental conservation projects including tree planting, recycling campaigns, and community cleanups.', 'contact@cleanearth.org', 'cleanearth-logo.png'),
('Global Outreach Volunteers', 'Coordinates international and local volunteer opportunities that strengthen communities through service.', 'info@globaloutreach.org', 'globaloutreach-logo.png'),
('Care for All Foundation', 'Provides community support through medical outreach, disaster relief, and volunteer-driven social programs.', 'admin@careforall.org', 'careforall-logo.png');

-- ========================================
-- Project Table
-- ========================================

CREATE TABLE project (
    project_id SERIAL PRIMARY KEY,
    organization_id INTEGER NOT NULL,
    title VARCHAR(150) NOT NULL,
    description TEXT NOT NULL,
    location VARCHAR(150) NOT NULL,
    project_date DATE NOT NULL,

    CONSTRAINT fk_project_organization
        FOREIGN KEY (organization_id)
        REFERENCES organization (organization_id)
        ON DELETE CASCADE
);




-- ========================================
-- Insert Sample Projects
-- ========================================

INSERT INTO project (organization_id, title, description, location, project_date)
VALUES

-- BrightFuture Builders (Organization 1)
(1,'Community Park Renovation','Renovated a public park with new walkways and playground equipment.','Lagos','2026-01-15'),
(1,'Bridge Repair Initiative','Repaired damaged community bridges for safer transportation.','Ibadan','2026-02-10'),
(1,'School Building Upgrade','Renovated classrooms and installed new furniture.','Abuja','2026-03-05'),
(1,'Road Safety Improvement','Installed road signs and speed bumps near schools.','Kano','2026-04-18'),
(1,'Water Well Construction','Constructed clean water wells for rural communities.','Jos','2026-05-22'),

-- GreenHarvest Growers (Organization 2)
(2,'Urban Garden Project','Established community vegetable gardens.','Lagos','2026-01-20'),
(2,'Tree Planting Campaign','Planted over 2,000 trees across neighborhoods.','Benin City','2026-02-14'),
(2,'Farmers Training Workshop','Trained local farmers on sustainable farming.','Ilorin','2026-03-11'),
(2,'School Garden Initiative','Created gardens in primary schools.','Akure','2026-04-09'),
(2,'Composting Program','Introduced composting education for residents.','Enugu','2026-05-19'),

-- UnityServe Volunteers (Organization 3)
(3,'Food Distribution Drive','Distributed food packages to families.','Port Harcourt','2026-01-28'),
(3,'Volunteer Recruitment Fair','Recruited volunteers for local charities.','Lagos','2026-02-26'),
(3,'Community Cleanup','Organized neighborhood sanitation exercise.','Owerri','2026-03-22'),
(3,'Senior Citizen Support','Visited and assisted elderly residents.','Abeokuta','2026-04-12'),
(3,'Youth Mentorship Program','Mentored teenagers through leadership activities.','Kaduna','2026-05-15'),

-- Helping Hands Foundation (Organization 4)
(4,'School Supply Donation','Provided school materials to students.','Ibadan','2026-01-18'),
(4,'Clothing Donation Program','Distributed clothing to disadvantaged families.','Lagos','2026-02-16'),
(4,'Emergency Relief Support','Delivered emergency supplies after flooding.','Makurdi','2026-03-25'),
(4,'Holiday Food Drive','Organized seasonal food donations.','Calabar','2026-04-21'),
(4,'Family Support Workshop','Hosted parenting and financial literacy workshops.','Uyo','2026-05-30'),

-- Community Care Network (Organization 5)
(5,'Health Awareness Campaign','Provided free health education and screenings.','Enugu','2026-01-24'),
(5,'Medical Outreach','Offered free medical consultations.','Lokoja','2026-02-18'),
(5,'Community Health Fair','Conducted health education programs.','Minna','2026-03-20'),
(5,'Blood Donation Campaign','Organized voluntary blood donations.','Lagos','2026-04-15'),
(5,'Nutrition Education','Promoted healthy eating habits.','Osogbo','2026-05-10'),

-- HopeBridge Services (Organization 6)
(6,'Shelter Renovation','Improved facilities at community shelters.','Kaduna','2026-01-17'),
(6,'Counseling Services','Provided counseling support for families.','Abuja','2026-02-11'),
(6,'Housing Assistance','Supported low-income families with housing.','Ilorin','2026-03-07'),
(6,'Refugee Support Program','Assisted displaced persons with essential supplies.','Yola','2026-04-19'),
(6,'Life Skills Training','Organized vocational training workshops.','Bauchi','2026-05-25'),

-- Future Leaders Initiative (Organization 7)
(7,'Leadership Bootcamp','Trained young leaders in communication skills.','Lagos','2026-01-14'),
(7,'Career Development Workshop','Prepared students for future careers.','Abuja','2026-02-08'),
(7,'Coding for Youth','Introduced programming to secondary school students.','Ibadan','2026-03-16'),
(7,'Scholarship Seminar','Guided students on scholarship opportunities.','Benin City','2026-04-08'),
(7,'Entrepreneurship Training','Taught business startup skills.','Owerri','2026-05-17'),

-- Clean Earth Alliance (Organization 8)
(8,'Beach Cleanup','Removed waste from coastal areas.','Lagos','2026-01-30'),
(8,'Recycling Awareness','Educated communities on recycling.','Port Harcourt','2026-02-24'),
(8,'Tree Restoration','Replanted trees in deforested areas.','Jos','2026-03-14'),
(8,'Plastic-Free Campaign','Reduced plastic waste in schools.','Akure','2026-04-17'),
(8,'Environmental Workshop','Hosted sustainability seminars.','Calabar','2026-05-20'),

-- Global Outreach Volunteers (Organization 9)
(9,'International Volunteer Exchange','Connected volunteers across countries.','Abuja','2026-01-27'),
(9,'Community Literacy Program','Improved literacy through volunteer tutors.','Enugu','2026-02-22'),
(9,'Water Sanitation Project','Improved access to clean water.','Sokoto','2026-03-12'),
(9,'Disaster Recovery Support','Assisted communities after natural disasters.','Maiduguri','2026-04-20'),
(9,'Volunteer Training','Prepared volunteers for outreach programs.','Lagos','2026-05-28'),

-- Care for All Foundation (Organization 10)
(10,'Free Medical Clinic','Provided free healthcare services.','Lagos','2026-01-19'),
(10,'Vaccination Campaign','Organized community vaccination events.','Abuja','2026-02-21'),
(10,'Maternal Health Program','Supported pregnant women with healthcare.','Kano','2026-03-18'),
(10,'Child Wellness Initiative','Delivered health services for children.','Jos','2026-04-23'),
(10,'Disaster Relief Mission','Provided emergency medical assistance.','Port Harcourt','2026-05-29');


-- ========================================
-- Category Table
-- ========================================

CREATE TABLE category (
    category_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

-- ========================================
-- Insert Sample Categories
-- ========================================

INSERT INTO category (name)
VALUES
('Environmental'),
('Educational'),
('Community Service'),
('Health and Wellness');

-- ========================================
-- Project Category Junction Table
-- ========================================

CREATE TABLE project_category (
    project_id INTEGER NOT NULL,
    category_id INTEGER NOT NULL,

    PRIMARY KEY (project_id, category_id),

    CONSTRAINT fk_project
        FOREIGN KEY (project_id)
        REFERENCES project(project_id)
        ON DELETE CASCADE,

    CONSTRAINT fk_category
        FOREIGN KEY (category_id)
        REFERENCES category(category_id)
        ON DELETE CASCADE
);

-- ========================================
-- Link Projects to Categories
-- ========================================

INSERT INTO project_category (project_id, category_id)
VALUES

-- BrightFuture Builders
(1,1),
(2,1),
(3,3),
(4,3),
(5,2),

-- GreenHarvest Growers
(6,1),
(7,1),
(8,2),
(9,2),
(10,3),

-- UnityServe Volunteers
(11,3),
(12,3),
(13,3),
(14,4),
(15,3),

-- Helping Hands Foundation
(16,2),
(17,3),
(18,4),
(19,3),
(20,3),

-- Community Care Network
(21,4),
(22,2),
(23,4),
(24,4),
(25,4),

-- HopeBridge Services
(26,3),
(27,4),
(28,2),
(29,2),
(30,3),

-- Future Leaders Initiative
(31,2),
(32,2),
(33,2),
(34,2),
(35,2),

-- Clean Earth Alliance
(36,1),
(37,1),
(38,1),
(39,1),
(40,2),

-- Global Outreach Volunteers
(41,3),
(42,3),
(43,3),
(44,2),
(45,3),

-- Care for All Foundation
(46,4),
(47,4),
(48,4),
(49,4),
(50,4);
