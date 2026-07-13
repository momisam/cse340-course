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

-- Paste the 50 INSERT statements we created earlier here.
-- Do not change them.

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