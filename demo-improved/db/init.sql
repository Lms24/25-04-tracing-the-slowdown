-- Create users table
CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Create todos table
CREATE TABLE IF NOT EXISTS todos (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    completed BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert seed users
INSERT INTO users (username, email) VALUES
    ('sigrid', 'sigrid@santry.io'),
    ('charly', 'charly@santry.io'),
    ('lukas', 'lukas@santry.io'),
    ('david', 'david@santry.io'),
    ('sairah', 'sairah@santry.io'),
    ('emma', 'emma@santry.io'),
    ('marcus', 'marcus@santry.io'),
    ('sophia', 'sophia@santry.io'),
    ('alex', 'alex@santry.io'),
    ('nina', 'nina@santry.io');

-- Insert some initial conference tasks
INSERT INTO todos (title, completed) VALUES
    ('Prepare keynote presentation', false),
    ('Set up registration system', false),
    ('Organize workshop materials', false),
    ('Coordinate with speakers', false),
    ('Prepare venue layout', false),
    ('Set up networking area', false),
    ('Prepare swag bags', false),
    ('Test AV equipment', false),
    ('Prepare schedule board', false),
    ('Set up sponsor booths', false);

-- Insert seed todos for each user with varying counts and completion ratios
INSERT INTO todos (user_id, title, description, completed) VALUES
    -- Sigrid's todos (7 todos, 3 completed)
    (1, 'Set up demo application', 'Create a SvelteKit app for the Svelte Summit booth', false),
    (1, 'Design booth layout', 'Plan the booth space and equipment setup', true),
    (1, 'Order booth furniture', 'Rent tables, chairs, and display stands', false),
    (1, 'Create presentation slides', 'Prepare slides for the booth demo', false),
    (1, 'Schedule booth staff', 'Assign team members to booth shifts', true),
    (1, 'Prepare giveaway items', 'Order branded swag for attendees', false),
    (1, 'Set up registration system', 'Create a system to collect visitor information', true),

    -- Charly's todos (5 todos, 4 completed - high completion rate)
    (2, 'Design booth graphics', 'Create banners and signage for the booth', true),
    (2, 'Order branded merchandise', 'Select and order t-shirts, stickers, and other items', true),
    (2, 'Create social media content', 'Prepare posts to promote our presence', true),
    (2, 'Set up booth lighting', 'Configure lighting for product demonstrations', false),
    (2, 'Design interactive demo', 'Create an engaging demo for visitors', true),

    -- Lukas's todos (10 todos, 2 completed - low completion rate)
    (3, 'Develop tracing demo', 'Create a demo showing OpenTelemetry integration', true),
    (3, 'Set up CI/CD pipeline', 'Configure automated deployment for the demo app', false),
    (3, 'Implement error tracking', 'Add Sentry integration to the demo', false),
    (3, 'Create documentation', 'Write user guides for the demo application', false),
    (3, 'Prepare technical presentation', 'Create slides for the technical talk', false),
    (3, 'Set up monitoring', 'Configure performance monitoring for the demo', false),
    (3, 'Test cross-browser compatibility', 'Ensure demo works across browsers', false),
    (3, 'Optimize demo performance', 'Improve loading times and responsiveness', false),
    (3, 'Create backup plan', 'Prepare contingency for technical issues', false),
    (3, 'Schedule demo sessions', 'Plan live demo times during the conference', true),

    -- David's todos (3 todos, 1 completed)
    (4, 'Design booth giveaway', 'Create an engaging contest for attendees', false),
    (4, 'Prepare prize packages', 'Assemble premium giveaway items', true),
    (4, 'Set up entry system', 'Create a system for collecting contest entries', false),

    -- Sairah's todos (8 todos, 5 completed - high completion rate)
    (5, 'Order conference tickets', 'Purchase passes for the team', true),
    (5, 'Book team accommodations', 'Reserve hotel rooms for the team', true),
    (5, 'Arrange transportation', 'Set up shuttle service to the venue', false),
    (5, 'Create team schedule', 'Plan activities and meetings during the conference', true),
    (5, 'Prepare team briefing', 'Create information packet for booth staff', true),
    (5, 'Set up networking events', 'Organize meetups with potential partners', false),
    (5, 'Create follow-up plan', 'Develop strategy for post-conference engagement', true),
    (5, 'Prepare budget report', 'Track expenses and ROI projections', true),
    
    -- Emma's todos (6 todos, 0 completed - all open)
    (6, 'Design booth interactive elements', 'Create engaging activities for visitors', false),
    (6, 'Develop QR code system', 'Set up system for collecting contact information', false),
    (6, 'Create booth signage', 'Design directional and informational signs', false),
    (6, 'Prepare product brochures', 'Create printed materials for distribution', false),
    (6, 'Set up social media wall', 'Display live social media mentions at the booth', false),
    (6, 'Design photo opportunity', 'Create an Instagram-worthy booth feature', false),
    
    -- Marcus's todos (4 todos, 2 completed)
    (7, 'Set up demo environment', 'Configure cloud resources for the demo', true),
    (7, 'Implement security measures', 'Ensure demo data is properly protected', false),
    (7, 'Create backup systems', 'Set up redundant systems for reliability', true),
    (7, 'Test demo scalability', 'Ensure demo can handle multiple concurrent users', false),
    
    -- Sophia's todos (9 todos, 7 completed - very high completion rate)
    (8, 'Design booth layout', 'Create detailed floor plan for the space', true),
    (8, 'Order promotional materials', 'Purchase banners, flyers, and brochures', true),
    (8, 'Create product videos', 'Produce short videos for booth displays', true),
    (8, 'Set up lead capture system', 'Implement system to collect visitor information', true),
    (8, 'Prepare product demonstrations', 'Create scripts for product demos', true),
    (8, 'Design interactive displays', 'Create engaging visual elements for the booth', false),
    (8, 'Order branded apparel', 'Purchase team uniforms for the event', true),
    (8, 'Set up appointment scheduling', 'Create system for booking meetings', false),
    (8, 'Prepare post-conference reports', 'Create templates for collecting feedback', true),
    
    -- Alex's todos (5 todos, 1 completed)
    (9, 'Research competitor presence', 'Analyze other companies attending the conference', false),
    (9, 'Create competitive analysis', 'Compare our booth strategy with competitors', false),
    (9, 'Develop unique selling points', 'Highlight what makes our booth special', false),
    (9, 'Set up analytics tracking', 'Implement system to measure booth success', true),
    (9, 'Prepare post-conference survey', 'Create questionnaire for gathering feedback', false),
    
    -- Nina's todos (7 todos, 3 completed)
    (10, 'Design booth theme', 'Create cohesive visual identity for the booth', false),
    (10, 'Order custom furniture', 'Rent specialized furniture for the space', true),
    (10, 'Create branded environment', 'Design immersive experience for visitors', false),
    (10, 'Prepare lighting design', 'Plan ambient and accent lighting', true),
    (10, 'Design interactive elements', 'Create engaging activities for visitors', false),
    (10, 'Set up photo opportunities', 'Create Instagram-worthy spots in the booth', true),
    (10, 'Prepare environmental graphics', 'Design wall coverings and floor graphics', false); 