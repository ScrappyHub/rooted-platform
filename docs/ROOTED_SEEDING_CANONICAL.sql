-- SEEDING_CANONICAL_V1.sql
-- ROOTED canonical taxonomy + governance seeds
-- Safe to run multiple times (ON CONFLICT DO NOTHING)

BEGIN;

------------------------------------------------------------
-- 1. TRUST LAYER — BADGES
------------------------------------------------------------

INSERT INTO public.badges (code, name, description, badge_type)
VALUES
  ('INSURED', 'Insured',
   'Provider carries active insurance suitable for their operations.',
   'TRUST'),

  ('LICENSED', 'Licensed',
   'Provider holds required licenses or certifications for their field.',
   'COMPLIANCE'),

  ('ETHICALLY_SOURCED', 'Ethically Sourced',
   'Provider demonstrates ethical sourcing practices for goods or services.',
   'SUSTAINABILITY'),

  ('ORGANIC', 'Organic',
   'Provider offers certified or self-attested organic products.',
   'SUSTAINABILITY'),

  ('GREEN', 'Green',
   'Provider follows environmentally conscious practices.',
   'SUSTAINABILITY'),

  ('YOUTH_SAFE', 'Youth Safe',
   'Provider has youth-safe practices and environment for kids/families.',
   'SAFETY'),

  ('EMERGENCY_CERTIFIED', 'Emergency Certified',
   'Provider is certified or recognized as part of emergency/disaster response.',
   'SAFETY'),

  ('GOVERNMENT_PARTNER', 'Government Partner',
   'Provider has an established partnership or contract with public institutions.',
   'PARTNERSHIP'),

  ('COMMUNITY_VERIFIED', 'Community Verified',
   'Provider has strong community reputation and positive local feedback.',
   'TRUST')
ON CONFLICT (code) DO NOTHING;

------------------------------------------------------------
-- 2. GLOBAL SPECIALTY TAXONOMY — SPECIALTY_TYPES
------------------------------------------------------------

INSERT INTO public.specialty_types
(code, label, vertical_group, requires_compliance, kids_allowed, default_visibility)
VALUES

-- 🌾 AGRICULTURE & LOCAL FOOD
('FARM', 'Farm', 'AGRICULTURE_FOOD', true, true, true),
('BAKERY', 'Bakery', 'AGRICULTURE_FOOD', true, true, true),
('BUTCHER', 'Butcher', 'AGRICULTURE_FOOD', true, true, true),
('DAIRY', 'Dairy', 'AGRICULTURE_FOOD', true, true, true),
('MARKET', 'Market', 'AGRICULTURE_FOOD', true, true, true),
('FOOD_COOP', 'Food Co-op', 'AGRICULTURE_FOOD', true, true, true),
('FOOD_HUB', 'Food Hub', 'AGRICULTURE_FOOD', true, true, true),
('ORCHARD', 'Orchard', 'AGRICULTURE_FOOD', true, true, true),
('GREENHOUSE', 'Greenhouse', 'AGRICULTURE_FOOD', true, true, true),
('APIARY', 'Apiary', 'AGRICULTURE_FOOD', true, true, true),
('AQUACULTURE', 'Aquaculture', 'AGRICULTURE_FOOD', true, true, true),

-- 🏗️ CONSTRUCTION & BUILT ENVIRONMENT
('GENERAL_CONTRACTOR', 'General Contractor', 'CONSTRUCTION', true, false, true),
('ELECTRICIAN', 'Electrician', 'CONSTRUCTION', true, false, true),
('PLUMBER', 'Plumber', 'CONSTRUCTION', true, false, true),
('HVAC', 'HVAC', 'CONSTRUCTION', true, false, true),
('WELDER', 'Welder', 'CONSTRUCTION', true, false, true),
('MASONRY', 'Masonry', 'CONSTRUCTION', true, false, true),
('CARPENTRY', 'Carpentry', 'CONSTRUCTION', true, false, true),
('ROOFING', 'Roofing', 'CONSTRUCTION', true, false, true),
('STRUCTURAL_ENGINEERING', 'Structural Engineering', 'CONSTRUCTION', true, false, true),
('CONCRETE', 'Concrete', 'CONSTRUCTION', true, false, true),
('LUMBER_SUPPLIER', 'Lumber Supplier', 'CONSTRUCTION', true, false, true),
('MATERIAL_DISTRIBUTOR', 'Material Distributor', 'CONSTRUCTION', true, false, true),

-- 🏥 HEALTHCARE & COMMUNITY HEALTH (NON-CLINICAL)
('CLINIC', 'Clinic', 'HEALTH_COMMUNITY', true, true, true),
('URGENT_CARE', 'Urgent Care', 'HEALTH_COMMUNITY', true, true, true),
('THERAPY_CENTER', 'Therapy Center', 'HEALTH_COMMUNITY', true, true, true),
('PUBLIC_HEALTH_PROGRAM', 'Public Health Program', 'HEALTH_COMMUNITY', true, true, true),
('TRANSPORT_MEDICAL', 'Medical Transport', 'HEALTH_COMMUNITY', true, true, true),
('PPE_SUPPLIER', 'PPE Supplier', 'HEALTH_COMMUNITY', true, true, true),
('FOOD_SERVICE_HEALTH', 'Health Food Service', 'HEALTH_COMMUNITY', true, true, true),

-- 🚨 EMERGENCY & DISASTER RESPONSE
('FIRE_DEPARTMENT', 'Fire Department', 'EMERGENCY_RESPONSE', true, true, true),
('EMS', 'Emergency Medical Services', 'EMERGENCY_RESPONSE', true, true, true),
('DISASTER_VENDOR', 'Disaster Vendor', 'EMERGENCY_RESPONSE', true, true, true),
('EMERGENCY_SUPPLIES', 'Emergency Supplies', 'EMERGENCY_RESPONSE', true, true, true),
('SHELTER_OPERATOR', 'Shelter Operator', 'EMERGENCY_RESPONSE', true, true, true),
('FUEL_PROVIDER', 'Fuel Provider', 'EMERGENCY_RESPONSE', true, true, true),

-- 🏛️ GOVERNMENT & CIVIC SERVICES
('PUBLIC_WORKS', 'Public Works', 'GOVERNMENT_CIVIC', true, true, true),
('PARKS_AND_RECREATION', 'Parks and Recreation', 'GOVERNMENT_CIVIC', true, true, true),
('LIBRARY', 'Library', 'GOVERNMENT_CIVIC', true, true, true),
('TOWN_HALL', 'Town Hall', 'GOVERNMENT_CIVIC', true, true, true),
('TRANSPORT_DEPARTMENT', 'Transportation Department', 'GOVERNMENT_CIVIC', true, true, true),
('SANITATION', 'Sanitation', 'GOVERNMENT_CIVIC', true, true, true),

-- 🏫 EDUCATION & WORKFORCE
('ELEMENTARY_SCHOOL', 'Elementary School', 'EDUCATION_WORKFORCE', true, true, true),
('MIDDLE_SCHOOL', 'Middle School', 'EDUCATION_WORKFORCE', true, true, true),
('HIGH_SCHOOL', 'High School', 'EDUCATION_WORKFORCE', true, true, true),
('UNIVERSITY', 'University', 'EDUCATION_WORKFORCE', true, true, true),
('TRADE_SCHOOL', 'Trade School', 'EDUCATION_WORKFORCE', true, true, true),
('AFTER_SCHOOL_PROGRAM', 'After School Program', 'EDUCATION_WORKFORCE', true, true, true),
('INTERNSHIP_PROVIDER', 'Internship Provider', 'EDUCATION_WORKFORCE', true, true, true),

-- 🌱 ENVIRONMENT & SUSTAINABILITY
('CONSERVATION_GROUP', 'Conservation Group', 'ENVIRONMENT_SUSTAINABILITY', true, true, true),
('RECYCLING_CENTER', 'Recycling Center', 'ENVIRONMENT_SUSTAINABILITY', true, true, true),
('URBAN_FARM', 'Urban Farm', 'ENVIRONMENT_SUSTAINABILITY', true, true, true),
('WATER_AUTHORITY', 'Water Authority', 'ENVIRONMENT_SUSTAINABILITY', true, true, true),
('FORESTRY_SERVICE', 'Forestry Service', 'ENVIRONMENT_SUSTAINABILITY', true, true, true),
('LAND_TRUST', 'Land Trust', 'ENVIRONMENT_SUSTAINABILITY', true, true, true),

-- 😃 COMMUNITY SERVICES & NONPROFITS
('FOOD_BANK', 'Food Bank', 'COMMUNITY_SERVICES', true, true, true),
('HOMELESS_OUTREACH', 'Homeless Outreach', 'COMMUNITY_SERVICES', true, true, true),
('YOUTH_PROGRAM', 'Youth Program', 'COMMUNITY_SERVICES', true, true, true),
('CLOTHING_DISTRIBUTION', 'Clothing Distribution', 'COMMUNITY_SERVICES', true, true, true),
('TRANSPORT_ASSISTANCE', 'Transport Assistance', 'COMMUNITY_SERVICES', true, true, true),

-- 🏭 MANUFACTURING & SUPPLY CHAIN
('SMALL_FACTORY', 'Small Factory', 'MANUFACTURING_SUPPLY', true, true, true),
('ASSEMBLY_PLANT', 'Assembly Plant', 'MANUFACTURING_SUPPLY', true, true, true),
('RAW_MATERIAL_PROCESSING', 'Raw Material Processing', 'MANUFACTURING_SUPPLY', true, true, true),
('DISTRIBUTION_CENTER', 'Distribution Center', 'MANUFACTURING_SUPPLY', true, true, true),

-- ⚡ UTILITIES & ENERGY
('ELECTRIC_PROVIDER', 'Electric Provider', 'UTILITIES_ENERGY', true, true, true),
('WATER_PROVIDER', 'Water Provider', 'UTILITIES_ENERGY', true, true, true),
('GAS_PROVIDER', 'Gas Provider', 'Gas Provider', 'UTILITIES_ENERGY', true, true, true),
('INTERNET_PROVIDER', 'Internet Provider', 'UTILITIES_ENERGY', true, true, true),
('RENEWABLE_ENERGY', 'Renewable Energy', 'UTILITIES_ENERGY', true, true, true),

-- 🚛 LOGISTICS, TRANSPORT & TRANSIT
('TRUCKING', 'Trucking', 'LOGISTICS_TRANSIT', true, true, true),
('WAREHOUSING', 'Warehousing', 'LOGISTICS_TRANSIT', true, true, true),
('RAIL_OPERATOR', 'Rail Operator', 'LOGISTICS_TRANSIT', true, true, true),
('PORT_OPERATOR', 'Port Operator', 'LOGISTICS_TRANSIT', true, true, true),
('PUBLIC_TRANSIT', 'Public Transit', 'LOGISTICS_TRANSIT', true, true, true),

-- 🧱 HOUSING & COMMUNITY DEVELOPMENT
('HOUSING_AUTHORITY', 'Housing Authority', 'HOUSING_DEVELOPMENT', true, true, true),
('INSPECTION_DEPARTMENT', 'Inspection Department', 'HOUSING_DEVELOPMENT', true, true, true),
('REDEVELOPMENT_AGENCY', 'Redevelopment Agency', 'HOUSING_DEVELOPMENT', true, true, true),
('SHELTER_PROVIDER', 'Shelter Provider', 'HOUSING_DEVELOPMENT', true, true, true),

-- 🧠 MENTAL HEALTH & WELLNESS (NON-CLINICAL)
('WELLNESS_CENTER', 'Wellness Center', 'MENTAL_HEALTH_WELLNESS', true, true, true),
('YOUTH_COUNSELING_PROGRAM', 'Youth Counseling Program', 'MENTAL_HEALTH_WELLNESS', true, true, true),
('COMMUNITY_SUPPORT_GROUP', 'Community Support Group', 'MENTAL_HEALTH_WELLNESS', true, true, true),

-- 🎭 ARTS, CULTURE & HERITAGE
('MUSEUM', 'Museum', 'ARTS_CULTURE', true, true, true),
('THEATER', 'Theater', 'ARTS_CULTURE', true, true, true),
('GALLERY', 'Gallery', 'ARTS_CULTURE', true, true, true),
('CULTURAL_CENTER', 'Cultural Center', 'ARTS_CULTURE', true, true, true),
('HISTORICAL_SOCIETY', 'Historical Society', 'ARTS_CULTURE', true, true, true),

-- 🏕️ RECREATION, PARKS & TOURISM
('CAMPGROUND', 'Campground', 'RECREATION_TOURISM', true, true, true),
('KAYAKING', 'Kayaking', 'RECREATION_TOURISM', true, true, true),
('BIKE_TRAILS', 'Bike Trails', 'RECREATION_TOURISM', true, true, true),
('TOUR_GUIDES', 'Tour Guides', 'RECREATION_TOURISM', true, true, true),
('OUTDOOR_EDUCATION', 'Outdoor Education', 'RECREATION_TOURISM', true, true, true),

-- 🧪 SCIENCE, MAKER & INNOVATION
('MAKER_SPACE', 'Maker Space', 'SCIENCE_MAKER', true, true, true),
('ROBOTICS_CLUB', 'Robotics Club', 'SCIENCE_MAKER', true, true, true),
('STEM_LAB', 'STEM Lab', 'SCIENCE_MAKER', true, true, true),
('RESEARCH_CENTER', 'Research Center', 'SCIENCE_MAKER', true, true, true),

-- 🛠️ TRADES, SKILLS & APPRENTICESHIPS
('APPRENTICESHIP_PROVIDER', 'Apprenticeship Provider', 'TRADES_APPRENTICESHIP', true, true, true),
('TRADE_TRAINING_CENTER', 'Trade Training Center', 'TRADES_APPRENTICESHIP', true, true, true),
('WORKFORCE_DEVELOPMENT', 'Workforce Development', 'TRADES_APPRENTICESHIP', true, true, true),

-- 🏜️ LAND & NATURAL RESOURCE MGMT
('SOIL_CONSERVATION', 'Soil Conservation', 'LAND_MANAGEMENT', true, true, true),
('WATER_MANAGEMENT', 'Water Management', 'LAND_MANAGEMENT', true, true, true),
('FORESTRY_MANAGEMENT', 'Forestry Management', 'LAND_MANAGEMENT', true, true, true),

-- 🛡️ PUBLIC SAFETY & COMMUNITY WATCH
('CAMPUS_SAFETY', 'Campus Safety', 'PUBLIC_SAFETY', true, true, true),
('NEIGHBORHOOD_WATCH', 'Neighborhood Watch', 'PUBLIC_SAFETY', true, true, true),
('PRIVATE_SECURITY_EDUCATION', 'Private Security Education', 'PUBLIC_SAFETY', true, true, true),

-- 🧬 RESEARCH, DATA & REGIONAL PLANNING
('URBAN_PLANNING', 'Urban Planning', 'RESEARCH_PLANNING', true, true, true),
('DATA_RESEARCH', 'Data Research', 'RESEARCH_PLANNING', true, true, true),
('INFRASTRUCTURE_MODELING', 'Infrastructure Modeling', 'RESEARCH_PLANNING', true, true, true),
('FORECASTING_ANALYTICS', 'Forecasting Analytics', 'RESEARCH_PLANNING', true, true, true)
ON CONFLICT (code) DO NOTHING;

------------------------------------------------------------
-- 3. EXPERIENCE TYPES
------------------------------------------------------------

INSERT INTO public.experience_types
(code, label, requires_waiver, kids_allowed, insurance_required, seasonal_lockable)
VALUES
  ('FARM_TOUR', 'Farm Tour', true, true, true, true),
  ('HARVEST_DAY', 'Harvest Day', true, true, true, true),
  ('TRADE_DEMO', 'Trade Demonstration', true, true, true, false),
  ('JOB_SHADOW', 'Job Shadow', true, true, true, false),
  ('FIELD_TRIP', 'Field Trip', true, true, true, false),
  ('DISASTER_DRILL', 'Disaster Drill', true, true, true, false),
  ('EMERGENCY_TRAINING', 'Emergency Training', true, true, true, false),
  ('CLEANUP_DAY', 'Cleanup Day', true, true, true, true),
  ('TREE_PLANTING', 'Tree Planting', true, true, true, true),
  ('ART_WORKSHOP', 'Art Workshop', false, true, false, false),
  ('SCIENCE_WORKSHOP', 'Science Workshop', false, true, false, false),
  ('HISTORIC_TOUR', 'Historic Tour', false, true, false, false),
  ('VOLUNTEER_SHIFT', 'Volunteer Shift', true, true, true, false)
ON CONFLICT (code) DO NOTHING;

------------------------------------------------------------
-- 4. COMPLIANCE OVERLAYS
------------------------------------------------------------

INSERT INTO public.compliance_overlays
(code, label, description)
VALUES
  ('FOOD_SAFETY', 'Food Safety',
   'Requirements and checks related to safe handling, storage, and preparation of food.'),
  ('INSURANCE_REQUIRED', 'Insurance Required',
   'Entity must maintain and verify active insurance suitable for its operations.'),
  ('LICENSE_REQUIRED', 'License Required',
   'Entity must hold valid licenses or certifications to operate in its specialty.'),
  ('HI_PII_RESTRICTED', 'High PII Restricted',
   'High-risk personally identifiable information must not be stored or exposed.'),
  ('NO_MEDICAL_DATA', 'No Medical Data',
   'No protected medical records or clinical charts may be stored in ROOTED.'),
  ('YOUTH_SAFETY', 'Youth Safety',
   'Entity must comply with youth protection, supervision, and safety standards.'),
  ('CRITICAL_INFRASTRUCTURE', 'Critical Infrastructure',
   'Entity participates in critical infrastructure systems such as utilities and emergency services.'),
  ('GOVERNMENT_MONITORED', 'Government Monitored',
   'Entity operates under additional public or government oversight.'),
  ('ENVIRONMENTAL_REPORTING', 'Environmental Reporting',
   'Entity has reporting duties related to environmental impact and sustainability.'),
  ('EMERGENCY_PRIORITY_ACCESS', 'Emergency Priority Access',
   'Entity is prioritized for emergency coordination and disaster response.')
ON CONFLICT (code) DO NOTHING;

------------------------------------------------------------
-- 5. LANDMARK TYPES
------------------------------------------------------------

INSERT INTO public.landmark_types
(code, label)
VALUES
  ('HISTORIC_FARM', 'Historic Farm'),
  ('HISTORIC_BRIDGE', 'Historic Bridge'),
  ('HISTORIC_SCHOOL', 'Historic School'),
  ('HOSPITAL_LANDMARK', 'Hospital Landmark'),
  ('FIRE_STATION', 'Fire Station'),
  ('SHELTER', 'Shelter'),
  ('LIBRARY', 'Library'),
  ('MILL', 'Mill'),
  ('POWER_PLANT', 'Power Plant'),
  ('RAIL_YARD', 'Rail Yard'),
  ('NATURE_PRESERVE', 'Nature Preserve'),
  ('PUBLIC_MONUMENT', 'Public Monument')
ON CONFLICT (code) DO NOTHING;

------------------------------------------------------------
-- 6. KIDS MODE OVERLAYS
------------------------------------------------------------

INSERT INTO public.kids_mode_overlays
(code, label)
VALUES
  ('ANIMAL_EDUCATION', 'Animal Education'),
  ('FOOD_SYSTEMS', 'Food Systems'),
  ('CONSTRUCTION_EDUCATION', 'Construction Education'),
  ('BODY_EDUCATION', 'Body Education'),
  ('SAFETY_EDUCATION', 'Safety Education'),
  ('ENVIRONMENTAL_SCIENCE', 'Environmental Science'),
  ('ART_EDUCATION', 'Art Education'),
  ('STEM_EDUCATION', 'STEM Education'),
  ('EMOTIONAL_EDUCATION', 'Emotional Education')
ON CONFLICT (code) DO NOTHING;

COMMIT;
