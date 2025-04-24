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
    user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
    title VARCHAR(100) NOT NULL,
    description TEXT,
    completed BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Insert seed users
INSERT INTO users (username, email) VALUES
    ('john_doe', 'john@example.com'),
    ('jane_smith', 'jane@example.com'),
    ('bob_wilson', 'bob@example.com'),
    ('alice_brown', 'alice@example.com'),
    ('charlie_davis', 'charlie@example.com'),
    ('diana_miller', 'diana@example.com'),
    ('edward_jones', 'edward@example.com'),
    ('fiona_garcia', 'fiona@example.com'),
    ('george_lee', 'george@example.com'),
    ('helen_taylor', 'helen@example.com');

-- Insert seed todos for each user with varying counts and completion ratios
INSERT INTO todos (user_id, title, description, completed) VALUES
    -- John's todos (7 todos, 3 completed)
    (1, 'Complete project proposal', 'Write and submit the project proposal document', false),
    (1, 'Schedule team meeting', 'Set up weekly team sync', true),
    (1, 'Review pull requests', 'Check and merge pending PRs', false),
    (1, 'Update documentation', 'Add new API endpoints to docs', false),
    (1, 'Fix bug in login flow', 'Investigate authentication issues', true),
    (1, 'Plan sprint', 'Create tasks for next sprint', false),
    (1, 'Deploy to staging', 'Push latest changes to staging environment', true),

    -- Jane's todos (5 todos, 4 completed - high completion rate)
    (2, 'Design new UI components', 'Create mockups for dashboard', true),
    (2, 'Implement dark mode', 'Add theme switching functionality', true),
    (2, 'Create user guide', 'Write documentation for new features', true),
    (2, 'Test responsive design', 'Check mobile compatibility', false),
    (2, 'Update color scheme', 'Implement new brand colors', true),

    -- Bob's todos (10 todos, 2 completed - low completion rate)
    (3, 'Set up CI/CD pipeline', 'Configure GitHub Actions', true),
    (3, 'Implement logging', 'Add structured logging system', false),
    (3, 'Configure monitoring', 'Set up Prometheus and Grafana', false),
    (3, 'Backup strategy', 'Implement automated backups', false),
    (3, 'Security audit', 'Review security measures', false),
    (3, 'Performance testing', 'Run load tests', false),
    (3, 'Update SSL certificates', 'Renew expiring certificates', false),
    (3, 'Configure firewalls', 'Set up security rules', false),
    (3, 'Implement rate limiting', 'Add API rate limiting', false),
    (3, 'Set up alerts', 'Configure monitoring alerts', true),

    -- Alice's todos (3 todos, 1 completed)
    (4, 'Write blog post', 'Draft technical article', false),
    (4, 'Prepare presentation', 'Create slides for tech talk', true),
    (4, 'Review code', 'Perform code review', false),

    -- Charlie's todos (8 todos, 5 completed - high completion rate)
    (5, 'Optimize database', 'Add indexes and optimize queries', true),
    (5, 'Implement caching', 'Add Redis caching layer', true),
    (5, 'Scale application', 'Set up load balancing', false),
    (5, 'Migrate data', 'Move to new database version', true),
    (5, 'Backup data', 'Create database backup', true),
    (5, 'Monitor performance', 'Set up performance tracking', false),
    (5, 'Clean up old data', 'Archive unused records', true),
    (5, 'Update schema', 'Modify database structure', true),
    
    -- Diana's todos (6 todos, 0 completed - all open)
    (6, 'Implement user authentication', 'Set up OAuth with multiple providers', false),
    (6, 'Create user profiles', 'Design and implement user profile pages', false),
    (6, 'Add role-based access control', 'Implement RBAC system', false),
    (6, 'Set up password reset flow', 'Create secure password reset process', false),
    (6, 'Implement 2FA', 'Add two-factor authentication', false),
    (6, 'Create user onboarding', 'Design user onboarding flow', false),
    
    -- Edward's todos (4 todos, 2 completed)
    (7, 'Set up automated testing', 'Configure test automation pipeline', true),
    (7, 'Write unit tests', 'Create comprehensive unit test suite', false),
    (7, 'Implement integration tests', 'Add integration test coverage', true),
    (7, 'Create end-to-end tests', 'Set up E2E testing framework', false),
    
    -- Fiona's todos (9 todos, 7 completed - very high completion rate)
    (8, 'Design mobile app', 'Create mobile app wireframes', true),
    (8, 'Implement responsive design', 'Make website mobile-friendly', true),
    (8, 'Create app icons', 'Design app icons for different platforms', true),
    (8, 'Set up push notifications', 'Implement push notification system', true),
    (8, 'Optimize for tablets', 'Ensure tablet compatibility', true),
    (8, 'Implement offline mode', 'Add offline functionality', false),
    (8, 'Create mobile navigation', 'Design mobile navigation menu', true),
    (8, 'Optimize touch targets', 'Ensure proper touch target sizes', false),
    (8, 'Implement mobile gestures', 'Add swipe and gesture support', true),
    
    -- George's todos (5 todos, 1 completed)
    (9, 'Set up analytics', 'Implement analytics tracking', false),
    (9, 'Create dashboards', 'Design analytics dashboards', false),
    (9, 'Implement event tracking', 'Add custom event tracking', false),
    (9, 'Set up conversion tracking', 'Track user conversions', true),
    (9, 'Implement A/B testing', 'Set up A/B testing framework', false),
    
    -- Helen's todos (7 todos, 3 completed)
    (10, 'Optimize SEO', 'Improve search engine optimization', false),
    (10, 'Create sitemap', 'Generate XML sitemap', true),
    (10, 'Implement structured data', 'Add schema markup', false),
    (10, 'Optimize meta tags', 'Improve meta descriptions and titles', true),
    (10, 'Create robots.txt', 'Set up robots.txt file', false),
    (10, 'Implement canonical URLs', 'Add canonical URL tags', true),
    (10, 'Optimize images for SEO', 'Add alt tags and optimize images', false); 