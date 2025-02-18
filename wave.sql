-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 24, 2025 at 07:02 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wave`
--

-- --------------------------------------------------------

--
-- Table structure for table `api_keys`
--

CREATE TABLE `api_keys` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `key` varchar(60) NOT NULL,
  `last_used_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `name` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `order`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, NULL, 1, 'Marketing', 'marketing', '2017-11-21 11:23:22', '2017-11-21 11:23:22'),
(2, NULL, 1, 'Tutorials', 'tutorials', '2017-11-21 11:23:22', '2017-11-21 11:23:22');

-- --------------------------------------------------------

--
-- Table structure for table `changelogs`
--

CREATE TABLE `changelogs` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `description` varchar(191) NOT NULL,
  `body` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `changelogs`
--

INSERT INTO `changelogs` (`id`, `title`, `description`, `body`, `created_at`, `updated_at`) VALUES
(1, 'Wave 1.0 Released', 'We have just released the first official version of Wave. Click here to learn more!', '<p>It\'s been a fun Journey creating this awesome SAAS starter kit and we are super excited to use it in many of our future projects. There are just so many features that Wave has that will make building the SAAS of your dreams easier than ever before.</p>\n<p>Make sure to stay up-to-date on our latest releases as we will be releasing many more features down the road :)</p>\n<p>Thanks! Talk to you soon.</p>', '2018-05-20 18:19:00', '2018-05-20 19:38:02'),
(2, 'Wave 2.0 Released', 'Wave V2 has been released with some awesome new features. Be sure to read up on what\'s new!', '<p>This new version of Wave includes the following updates:</p><ul><li>Update to the latest version of Laravel</li><li>New Payment integration with Paddle</li><li>Rewritten theme support</li><li>Deployment integration</li><li>Much more awesomeness</li></ul><p>Be sure to check out the official Wave v2 page at <a href=\"https://devdojo.com/wave\">https://devdojo.com/wave</a></p>', '2020-03-20 18:19:00', '2020-03-20 19:38:02'),
(3, 'Wave 3.0 Released', 'Version 3 has been released with some major updates. Click here to find out what\'s new!', '<p>Wave V3 has some awesome and significant changes. Below is an overview of all the things that have changed.</p><blockquote>BTW, this is the changelog where you can add/edit entries to explain to your users what\'s new in your product. <a href=\"/admin/changelogs/3/edit\">Click here to change this changelog entry</a></blockquote><p>In this new version of Wave we are no longer using <a href=\"https://github.com/thedevdojo/voyager\" target=\"_blank\"><span style=\"text-decoration: underline;\">Voyager</span></a> for our admin panel. Instead we are leveraging <a href=\"https://filamentphp.com\" target=\"_blank\"><span style=\"text-decoration: underline;\">FilamentPHP</span></a> which will give us so many things out of the box like a Form Builder, Table Builder, Notifications, and so much more.</p><p>We\'re also using an <a href=\"https://devdojo.com/auth\" target=\"_blank\"><span style=\"text-decoration: underline;\">Authenticaiton package</span></a> that will allow you to configure your authentication in one place and have it stay the same no matter which theme you use.</p><p>We have also decided to go all-in on the <a href=\"https://tallstack.dev\" target=\"_blank\"><span style=\"text-decoration: underline;\">Tall Stack</span></a>, this means that Livewire components can be used in any theme and anywhere on the site and it will just work 👌</p><p>There are so many additional things that have been included in the latest version. Be sure to check out the <a href=\"https://devdojo.com/wave\" target=\"_blank\">Wave page</a> here to learn more ✨</p>', '2024-08-01 07:00:00', '2024-08-01 07:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `changelog_user`
--

CREATE TABLE `changelog_user` (
  `changelog_id` int(10) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `changelog_user`
--

INSERT INTO `changelog_user` (`changelog_id`, `user_id`) VALUES
(1, 1),
(2, 1),
(3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `forms`
--

CREATE TABLE `forms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `fields` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`fields`)),
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `form_entries`
--

CREATE TABLE `form_entries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `form_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`data`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2024_03_29_225419_create_users_table', 1),
(2, '2024_03_29_225420_create_permission_roles_tables', 1),
(3, '2024_03_29_225435_create_categories_table', 1),
(4, '2024_03_29_225523_create_themes_table', 1),
(5, '2024_03_29_225656_create_changelogs_table', 1),
(6, '2024_03_29_225657_create_changelog_user_table', 1),
(7, '2024_03_29_225729_create_api_keys_table', 1),
(8, '2024_03_29_225928_create_notifications_table', 1),
(9, '2024_03_29_230148_create_pages_table', 1),
(10, '2024_03_29_230255_create_password_resets_table', 1),
(11, '2024_03_29_230312_create_plans_table', 1),
(12, '2024_03_29_230313_create_subscriptions_table', 1),
(13, '2024_03_29_230316_create_posts_table', 1),
(14, '2024_03_29_230531_create_settings_table', 1),
(15, '2024_03_29_230541_create_theme_options_table', 1),
(16, '2024_03_29_230648_create_key_values_table', 1),
(17, '2024_04_24_000001_add_user_social_provider_table', 1),
(18, '2024_04_24_000002_update_passwords_field_to_be_nullable', 1),
(19, '2024_05_07_000003_add_two_factor_auth_columns', 1),
(20, '2024_06_26_224315_create_forms_table', 1),
(21, '2024_07_31_133819_add_description_to_roles_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'users', 1),
(2, 'users', 2);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) NOT NULL,
  `type` varchar(191) NOT NULL,
  `notifiable_type` varchar(191) NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `excerpt` text DEFAULT NULL,
  `body` text NOT NULL,
  `image` varchar(191) DEFAULT NULL,
  `slug` varchar(191) NOT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_keywords` text DEFAULT NULL,
  `status` enum('ACTIVE','INACTIVE') NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `author_id`, `title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Example Page', 'This is an example page. Create a page in the Wave admin and have it show up on the site.', '<p>This is an example page to showcase how a simple page can be created. You\'ll notice that this page also routes to a URL on your website. In this case the URL is mapped to `/example-page`. You can create as many pages as you would like.</p><h3>Creating Pages</h3><p>To create a new page you can simply visit the admin section at `/admin/pages`. You can then create a new page and add content. Here are some advantages of creating the page inside the admin.</p><ul><li>Automatically routes to a URL</li><li>Simple to create new pages</li><li>Simple to edit page</li><li>Many more</li></ul><p>You can feel free to create a page via the admin or you can create the page by adding it to your themes pages directory. The choice is yours.</p><h3>Quick Warning</h3><p>If you create a page inside the admin that has a slug of `about` and then you create a page inside your theme directory at `/pages/about/index.blade.php`. The two pages will conflict and you\'ll only see it from your themes page directory. Just make sure you only create the page in one location.</p>', NULL, 'example-page', 'This is a simple meta description for SEO purposes', 'keyword1, keyword2', 'ACTIVE', '2017-11-21 11:23:23', '2017-11-21 11:23:23'),
(2, 1, 'About', 'Learn more about Wave. This is an example about page.', '<p>Wave is an all-in-one Software as a Service (SaaS) starter kit designed to give developers a head start in building their next big idea. Packed with essential features, Wave provides a smooth and powerful development experience, helping you skip the repetitive tasks and focus on what really matters: your unique application.</p><h3><strong>Why Choose Wave?</strong></h3><p>Wave offers an extensive toolkit to transform your application from an idea to a fully-fledged SaaS product. With Wave, developers can:</p><ul><li><strong>Jumpstart their SaaS application:</strong> Begin with built-in features like user management, authentication, and billing, so you don\'t have to reinvent the wheel.</li><li><strong>Fully customize:</strong> Tailor every aspect of your app, from themes to user roles, to match your brand\'s needs.</li><li><strong>Enjoy modern design:</strong> Wave is built using the TALL stack (Tailwind, Alpine, Laravel, Livewire), offering a sleek and responsive interface.</li><li><strong>Deploy with ease:</strong> Equipped with powerful tools, Wave simplifies the deployment process to get your application up and running quickly.</li></ul><p><br></p><h3><strong>Packed with Powerful Features</strong></h3><p>Wave isn\'t just a framework; it\'s a complete package that includes everything you need to launch a subscription-based application. Some of its standout features are:</p><ul><li><strong>User Management:</strong> Built-in user registration, authentication, and profile management, all customizable to fit your app\'s requirements.</li><li><strong>Subscription Billing:</strong> Integrated with Stripe and Paddle, Wave makes it easy to manage subscriptions, handle payments, and create invoices.</li><li><strong>Themes and Templates:</strong> Choose from beautifully designed themes, or create your own. Easily switch between themes using Wave\'s built-in theming engine.</li><li><strong>Admin Interface:</strong> Powered by FilamentPHP, Wave includes a robust admin panel to manage users, roles, and app settings efficiently.</li></ul><p><br></p><h3><strong>Start Building with Wave Today</strong></h3><p>Wave is more than just a SaaS starter kit; it\'s a robust platform designed to handle your application\'s future growth. Whether you\'re building an MVP, launching a new SaaS product, or scaling your existing platform, Wave equips you with the tools and flexibility to succeed.</p><p><strong>Key Benefits Recap</strong></p><ul><li><strong>Save Time:</strong> Skip the groundwork and start building right away with Wave\'s ready-to-use features.</li><li><strong>Scale with Confidence:</strong> Wave\'s modularity and customization options make it easy to evolve as your business grows.</li><li><strong>Optimized for Developers:</strong> Enjoy a developer-friendly experience with modern tools and a straightforward workflow.</li></ul><p>Ready to take your next SaaS project to the next level? Let Wave be your guide.</p><p>This structure provides a comprehensive overview of Wave while highlighting its key features and benefits. Feel free to tweak or expand on any sections to suit your needs!</p>', NULL, 'about', 'About Wave', 'about, wave', 'ACTIVE', '2018-03-29 22:04:51', '2018-03-29 22:04:51');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `guard_name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `plans`
--

CREATE TABLE `plans` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `features` varchar(191) NOT NULL,
  `monthly_price_id` varchar(191) DEFAULT NULL,
  `yearly_price_id` varchar(191) DEFAULT NULL,
  `onetime_price_id` varchar(191) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `default` tinyint(1) NOT NULL DEFAULT 0,
  `monthly_price` varchar(191) DEFAULT NULL,
  `yearly_price` varchar(191) DEFAULT NULL,
  `onetime_price` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `plans`
--

INSERT INTO `plans` (`id`, `name`, `description`, `features`, `monthly_price_id`, `yearly_price_id`, `onetime_price_id`, `active`, `role_id`, `default`, `monthly_price`, `yearly_price`, `onetime_price`, `created_at`, `updated_at`) VALUES
(1, 'Basic1', 'Signup for the Basic User Plan to access all the basic features.', 'Basic Feature Example 1, Basic Feature Example 2, Basic Feature Example 3, Basic Feature Example 4', '1432435435', '6324435466576', '453454365763576', 1, 4, 0, '100', '1000', '100', '2018-07-03 00:03:56', '2025-01-19 04:13:13'),
(2, 'Premium', 'Signup for our premium plan to access all our Premium Features.', 'Premium Feature Example 1, Premium Feature Example 2, Premium Feature Example 3, Premium Feature Example 4', NULL, NULL, NULL, 1, 4, 1, '8', '80', NULL, '2018-07-03 11:29:46', '2018-07-03 12:17:08'),
(3, 'Pro', 'Gain access to our pro features with the pro plan.', 'Pro Feature Example 1, Pro Feature Example 2, Pro Feature Example 3, Pro Feature Example 4', NULL, NULL, NULL, 1, 5, 0, '12', '120', NULL, '2018-07-03 11:30:43', '2018-08-22 17:26:19');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(191) NOT NULL,
  `seo_title` varchar(191) DEFAULT NULL,
  `excerpt` text DEFAULT NULL,
  `body` text NOT NULL,
  `image` varchar(191) DEFAULT NULL,
  `slug` varchar(191) NOT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_keywords` text DEFAULT NULL,
  `status` enum('PUBLISHED','DRAFT','PENDING') NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `author_id`, `category_id`, `title`, `seo_title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `featured`, `created_at`, `updated_at`) VALUES
(5, 1, 1, 'Best ways to market your application', 'Best ways to market your application', NULL, '<p>There are many different ways to market your application. First, let\'s start off at the beginning and then we will get more in-depth. You\'ll want to discover your target audience and after that, you\'ll want to run some ads.</p>\n<p>Let\'s not complicate things here, if you build a good product, you are going to have users. But you will need to let your users know where to find you. This is where social media and ads come in to play. You\'ll need to boast about your product and your app. If it\'s something that you really believe in, the odds are others will too.</p>\n<blockquote>\n<p>You may have a need to only want to make money from your application, but if your application can help others achieve a goal and you can make money from it too, you have a gold-mine.</p>\n</blockquote>\n<p>Some more info on your awesome post here. After this sentence, it\'s just going to be a little bit of jibberish. But you get a general idea. You\'ll want to blog about stuff to get your customers interested in your application. With leverage existing reliable initiatives before leveraged ideas. Rapidiously develops equity invested expertise rather than enabled channels. Monotonectally intermediate distinctive networks before highly efficient core competencies.</p>\n<h2>Seamlessly promote flexible growth strategies.</h2>\n<p><img src=\"/storage/demo/blog-1.jpg\" alt=\"blog\" /></p><p> Dramatically harness extensive value through the fully researched human capital. Seamlessly transition premium schemas vis-a-vis efficient convergence. Intrinsically build competitive e-commerce with cross-unit information. Collaboratively e-enable real-time processes before extensive technology. Authoritatively fabricate efficient metrics through intuitive quality vectors.</p>\n<p>Collaboratively deliver optimal vortals whereas backward-compatible models. Globally syndicate diverse leadership rather than high-payoff experiences. Uniquely pontificate unique metrics for cross-media human capital. Completely procrastinate professional collaboration and idea-sharing rather than 24/365 paradigms. Phosfluorescently initiates multimedia based outsourcing for interoperable benefits.</p>\n<h3>Seamlessly promote flexible growth strategies.</h3>\n<p>Progressively leverage other\'s e-business functionalities through corporate e-markets. Holistic repurpose timely systems via seamless total linkage. Appropriately maximize impactful \"outside the box\" thinking vis-a-vis visionary value. Authoritatively deploy interdependent technology through process-centric \"outside the box\" thinking. Interactively negotiate pandemic internal or \"organic\" sources whereas competitive relationships.</p>\n<figure><img src=\"/storage/demo/blog-2.jpg\" alt=\"wide\" />\n<figcaption>Keep working until you find success.</figcaption>\n</figure>\n<p>Enthusiastically deliver viral potentialities through multidisciplinary products. Synergistically plagiarize client-focused partnerships for adaptive applications. Seamlessly morph process-centric synergy whereas bricks-and-clicks deliverables. Continually disintermediate holistic action items without distinctive customer service. Enthusiastically seize enterprise web-readiness without effective schemas.</p>\n<h4>Seamlessly promote flexible growth strategies.</h4>\n<p>Assertively restore installed base data before sustainable platforms. Globally recapitalize orthogonal systems via clicks-and-mortar web services. Efficiently grow visionary action items through collaborative e-commerce. Efficiently architect highly efficient \"outside the box\" thinking before customer directed infomediaries. Proactively mesh holistic human capital rather than exceptional niches.</p>\n<p>Intrinsically create innovative value and pandemic resources. Progressively productize turnkey e-markets and economically sound synergy. Objectively supply turnkey imperatives vis-a-vis high standards in outsourcing. Dynamically exploit unique imperatives with dynamic systems. Appropriately formulate technically sound users and excellent expertise.</p>\n<p>Competently redefine long-term high-impact relationships rather than effective metrics. Distinctively maintain impactful platforms after strategic imperatives. Intrinsically evolve mission-critical deliverables after multimedia based e-business. Interactively mesh cooperative benefits whereas distributed process improvements. Progressively monetize an expanded array of e-services whereas.</p>', 'demo/post-market.jpg', 'best-ways-to-market-your-application', 'Find out the best ways to market your application in this article.', 'market, saas, market your app', 'PUBLISHED', 0, '2018-03-25 21:55:01', '2018-03-25 21:13:05'),
(6, 1, 1, 'Achieving your Dreams', 'Achieving your Dreams', NULL, '<p>What can be said about achieving your dreams? <br>Well... It\'s a good thing, and it\'s probably something you\'re dreaming of. Oh yeah, when you create an app and a product that you enjoy working on... You\'ll be pretty happy and your dreams will probably come true. Cool, right?</p>\n<p>I hope that you are ready for some cool stuff because there is some cool stuff right around the corner. By the time you\'ve reached the sky, you\'ll realize your true limits. That last sentence there... That was a little bit of jibberish, but I\'m trying to write about something cool. Bottom line is that Wave is going to help save you so much time.</p>\n<blockquote>\n<p>You may have a need to only want to make money from your application, but if your application can help others achieve a goal and you can make money from it too, you have a gold-mine.</p>\n</blockquote>\n<p>Some more info on your awesome post here. After this sentence, it\'s just going to be a little bit of jibberish. But you get a general idea. You\'ll want to blog about stuff to get your customers interested in your application. With leverage existing reliable initiatives before leveraged ideas. Rapidiously develops equity invested expertise rather than enabled channels. Monotonectally intermediate distinctive networks before highly efficient core competencies.</p>\n<h2>Seamlessly promote flexible growth strategies.</h2>\n<p><img src=\"/storage/demo/blog-1.jpg\" alt=\"blog\" /></p><p>Dramatically harness extensive value through the fully researched human capital. Seamlessly transition premium schemas vis-a-vis efficient convergence. Intrinsically build competitive e-commerce with cross-unit information. Collaboratively e-enable real-time processes before extensive technology. Authoritatively fabricate efficient metrics through intuitive quality vectors.</p>\n<p>Collaboratively deliver optimal vortals whereas backward-compatible models. Globally syndicate diverse leadership rather than high-payoff experiences. Uniquely pontificate unique metrics for cross-media human capital. Completely procrastinate professional collaboration and idea-sharing rather than 24/365 paradigms. Phosfluorescently initiates multimedia based outsourcing for interoperable benefits.</p>\n<h3>Seamlessly promote flexible growth strategies.</h3>\n<p>Progressively leverage other\'s e-business functionalities through corporate e-markets. Holistic repurpose timely systems via seamless total linkage. Appropriately maximize impactful \"outside the box\" thinking vis-a-vis visionary value. Authoritatively deploy interdependent technology through process-centric \"outside the box\" thinking. Interactively negotiate pandemic internal or \"organic\" sources whereas competitive relationships.</p>\n<figure><img src=\"/storage/demo/blog-2.jpg\" alt=\"wide\" />\n<figcaption>Keep working until you find success.</figcaption>\n</figure>\n<p>Enthusiastically deliver viral potentialities through multidisciplinary products. Synergistically plagiarize client-focused partnerships for adaptive applications. Seamlessly morph process-centric synergy whereas bricks-and-clicks deliverables. Continually disintermediate holistic action items without distinctive customer service. Enthusiastically seize enterprise web-readiness without effective schemas.</p>\n<h4>Seamlessly promote flexible growth strategies.</h4>\n<p>Assertively restore installed base data before sustainable platforms. Globally recapitalize orthogonal systems via clicks-and-mortar web services. Efficiently grow visionary action items through collaborative e-commerce. Efficiently architect highly efficient \"outside the box\" thinking before customer directed infomediaries. Proactively mesh holistic human capital rather than exceptional niches.</p>\n<p>Intrinsically create innovative value and pandemic resources. Progressively productize turnkey e-markets and economically sound synergy. Objectively supply turnkey imperatives vis-a-vis high standards in outsourcing. Dynamically exploit unique imperatives with dynamic systems. Appropriately formulate technically sound users and excellent expertise.</p>\n<p>Competently redefine long-term high-impact relationships rather than effective metrics. Distinctively maintain impactful platforms after strategic imperatives. Intrinsically evolve mission-critical deliverables after multimedia based e-business. Interactively mesh cooperative benefits whereas distributed process improvements. Progressively monetize an expanded array of e-services whereas.</p>', 'demo/post-dreams.jpg', 'achieving-your-dreams', 'In this post, you\'ll learn about achieving your dreams by building the SAAS app of your dreams', 'saas app, dreams', 'PUBLISHED', 0, '2018-03-25 21:50:18', '2018-03-25 21:15:18'),
(7, 1, 1, 'Building a solid foundation', 'Building a solid foundation', NULL, '<p>The foundation is one of the most important aspects. You\'ll want to make sure that you build your application on a solid foundation because this is where every other feature will grow on top of.</p>\n<p>If the foundation is unstable the rest of the application will be so as well. But a solid foundation will make mediocre features seem amazing. So, if you want to save yourself some time you will build your application on a solid foundation of cool features, awesome jumps, and killer waves... I don\'t know what this paragraph is about anymore.</p>\n<blockquote>\n<p>You may have a need to only want to make money from your application, but if your application can help others achieve a goal and you can make money from it too, you have a gold-mine.</p>\n</blockquote>\n<p>Some more info on your awesome post here. After this sentence, it\'s just going to be a little bit of jibberish. But you get a general idea. You\'ll want to blog about stuff to get your customers interested in your application. With leverage existing reliable initiatives before leveraged ideas. Rapidiously develops equity invested expertise rather than enabled channels. Monotonectally intermediate distinctive networks before highly efficient core competencies.</p>\n<h2>Seamlessly promote flexible growth strategies.</h2>\n<p><img src=\"/storage/demo/blog-1.jpg\" alt=\"blog\" /></p><p>Dramatically harness extensive value through the fully researched human capital. Seamlessly transition premium schemas vis-a-vis efficient convergence. Intrinsically build competitive e-commerce with cross-unit information. Collaboratively e-enable real-time processes before extensive technology. Authoritatively fabricate efficient metrics through intuitive quality vectors.</p>\n<p>Collaboratively deliver optimal vortals whereas backward-compatible models. Globally syndicate diverse leadership rather than high-payoff experiences. Uniquely pontificate unique metrics for cross-media human capital. Completely procrastinate professional collaboration and idea-sharing rather than 24/365 paradigms. Phosfluorescently initiates multimedia based outsourcing for interoperable benefits.</p>\n<h3>Seamlessly promote flexible growth strategies.</h3>\n<p>Progressively leverage other\'s e-business functionalities through corporate e-markets. Holistic repurpose timely systems via seamless total linkage. Appropriately maximize impactful \"outside the box\" thinking vis-a-vis visionary value. Authoritatively deploy interdependent technology through process-centric \"outside the box\" thinking. Interactively negotiate pandemic internal or \"organic\" sources whereas competitive relationships.</p>\n<figure><img src=\"/storage/demo/blog-2.jpg\" alt=\"wide\" />\n<figcaption>Keep working until you find success.</figcaption>\n</figure>\n<p>Enthusiastically deliver viral potentialities through multidisciplinary products. Synergistically plagiarize client-focused partnerships for adaptive applications. Seamlessly morph process-centric synergy whereas bricks-and-clicks deliverables. Continually disintermediate holistic action items without distinctive customer service. Enthusiastically seize enterprise web-readiness without effective schemas.</p>\n<h4>Seamlessly promote flexible growth strategies.</h4>\n<p>Assertively restore installed base data before sustainable platforms. Globally recapitalize orthogonal systems via clicks-and-mortar web services. Efficiently grow visionary action items through collaborative e-commerce. Efficiently architect highly efficient \"outside the box\" thinking before customer directed infomediaries. Proactively mesh holistic human capital rather than exceptional niches.</p>\n<p>Intrinsically create innovative value and pandemic resources. Progressively productize turnkey e-markets and economically sound synergy. Objectively supply turnkey imperatives vis-a-vis high standards in outsourcing. Dynamically exploit unique imperatives with dynamic systems. Appropriately formulate technically sound users and excellent expertise.</p>\n<p>Competently redefine long-term high-impact relationships rather than effective metrics. Distinctively maintain impactful platforms after strategic imperatives. Intrinsically evolve mission-critical deliverables after multimedia based e-business. Interactively mesh cooperative benefits whereas distributed process improvements. Progressively monetize an expanded array of e-services whereas.&nbsp;</p>', 'demo/post-foundation.jpg', 'building-a-solid-foundation', 'Building a solid foundation for your application is super important. Read on below.', 'foundation, app foundation', 'PUBLISHED', 0, '2018-03-25 21:24:43', '2018-03-25 21:24:43'),
(8, 1, 2, 'Finding the solution that fits for you', 'Finding the solution that fits for you', NULL, '<p>There is a fit for each person. Depending on the service you may want to focus on what each person needs. When you find this you\'ll be able to segregate your application to fit each person\'s needs.</p>\n<p>This is really just an example post. I could write some stuff about how this and that, but it would probably only be information about this and that. Who am I kidding? This really isn\'t going to make some sense, but thanks for still reading. Are you still reading this article? That\'s awesome. Thanks for being interested.</p>\n<blockquote>\n<p>You may have a need to only want to make money from your application, but if your application can help others achieve a goal and you can make money from it too, you have a gold-mine.</p>\n</blockquote>\n<p>Some more info on your awesome post here. After this sentence, it\'s just going to be a little bit of jibberish. But you get a general idea. You\'ll want to blog about stuff to get your customers interested in your application. With leverage existing reliable initiatives before leveraged ideas. Rapidiously develops equity invested expertise rather than enabled channels. Monotonectally intermediate distinctive networks before highly efficient core competencies.</p>\n<h2>Seamlessly promote flexible growth strategies.</h2>\n<p><img src=\"/storage/demo/blog-1.jpg\" alt=\"blog\" /></p><p>Dramatically harness extensive value through the fully researched human capital. Seamlessly transition premium schemas vis-a-vis efficient convergence. Intrinsically build competitive e-commerce with cross-unit information. Collaboratively e-enable real-time processes before extensive technology. Authoritatively fabricate efficient metrics through intuitive quality vectors.</p>\n<p>Collaboratively deliver optimal vortals whereas backward-compatible models. Globally syndicate diverse leadership rather than high-payoff experiences. Uniquely pontificate unique metrics for cross-media human capital. Completely procrastinate professional collaboration and idea-sharing rather than 24/365 paradigms. Phosfluorescently initiates multimedia based outsourcing for interoperable benefits.</p>\n<h3>Seamlessly promote flexible growth strategies.</h3>\n<p>Progressively leverage other\'s e-business functionalities through corporate e-markets. Holistic repurpose timely systems via seamless total linkage. Appropriately maximize impactful \"outside the box\" thinking vis-a-vis visionary value. Authoritatively deploy interdependent technology through process-centric \"outside the box\" thinking. Interactively negotiate pandemic internal or \"organic\" sources whereas competitive relationships.</p>\n<figure><img src=\"/storage/demo/blog-2.jpg\" alt=\"wide\" />\n<figcaption>Keep working until you find success.</figcaption>\n</figure>\n<p>Enthusiastically deliver viral potentialities through multidisciplinary products. Synergistically plagiarize client-focused partnerships for adaptive applications. Seamlessly morph process-centric synergy whereas bricks-and-clicks deliverables. Continually disintermediate holistic action items without distinctive customer service. Enthusiastically seize enterprise web-readiness without effective schemas.</p>\n<h4>Seamlessly promote flexible growth strategies.</h4>\n<p>Assertively restore installed base data before sustainable platforms. Globally recapitalize orthogonal systems via clicks-and-mortar web services. Efficiently grow visionary action items through collaborative e-commerce. Efficiently architect highly efficient \"outside the box\" thinking before customer directed infomediaries. Proactively mesh holistic human capital rather than exceptional niches.</p>\n<p>Intrinsically create innovative value and pandemic resources. Progressively productize turnkey e-markets and economically sound synergy. Objectively supply turnkey imperatives vis-a-vis high standards in outsourcing. Dynamically exploit unique imperatives with dynamic systems. Appropriately formulate technically sound users and excellent expertise.</p>\n<p>Competently redefine long-term high-impact relationships rather than effective metrics. Distinctively maintain impactful platforms after strategic imperatives. Intrinsically evolve mission-critical deliverables after multimedia based e-business. Interactively mesh cooperative benefits whereas distributed process improvements. Progressively monetize an expanded array of e-services whereas.&nbsp;</p>', 'demo/post-solution.jpg', 'finding-the-solution-that-fits-for-you', 'How to build an app and find a solution that fits each users needs', 'solution, app solution', 'PUBLISHED', 0, '2018-03-25 21:42:44', '2018-03-25 21:42:44'),
(9, 1, 2, 'Creating something useful', 'Creating something useful', NULL, '<p>It\'s not enough nowadays to create something you want, instead you\'ll need to focus on what people need. If you find a need for something that isn\'t available... You should create it. Odds are someone will find it useful as well.</p>\n<p>When you focus your energy on building something that you are passionate about it\'s going to show. Your customers will buy because it\'s a great application, but also because they believe in what you are trying to achieve. So, continue to focus on making something that people need and find useful.</p>\n<blockquote>\n<p>You may have a need to only want to make money from your application, but if your application can help others achieve a goal and you can make money from it too, you have a gold-mine.</p>\n</blockquote>\n<p>Some more info on your awesome post here. After this sentence, it\'s just going to be a little bit of jibberish. But you get a general idea. You\'ll want to blog about stuff to get your customers interested in your application. With leverage existing reliable initiatives before leveraged ideas. Rapidiously develops equity invested expertise rather than enabled channels. Monotonectally intermediate distinctive networks before highly efficient core competencies.</p>\n<h2>Seamlessly promote flexible growth strategies.</h2>\n<p><img src=\"/storage/demo/blog-1.jpg\" alt=\"blog\" /></p><p>Dramatically harness extensive value through the fully researched human capital. Seamlessly transition premium schemas vis-a-vis efficient convergence. Intrinsically build competitive e-commerce with cross-unit information. Collaboratively e-enable real-time processes before extensive technology. Authoritatively fabricate efficient metrics through intuitive quality vectors.</p>\n<p>Collaboratively deliver optimal vortals whereas backward-compatible models. Globally syndicate diverse leadership rather than high-payoff experiences. Uniquely pontificate unique metrics for cross-media human capital. Completely procrastinate professional collaboration and idea-sharing rather than 24/365 paradigms. Phosfluorescently initiates multimedia based outsourcing for interoperable benefits.</p>\n<h3>Seamlessly promote flexible growth strategies.</h3>\n<p>Progressively leverage other\'s e-business functionalities through corporate e-markets. Holistic repurpose timely systems via seamless total linkage. Appropriately maximize impactful \"outside the box\" thinking vis-a-vis visionary value. Authoritatively deploy interdependent technology through process-centric \"outside the box\" thinking. Interactively negotiate pandemic internal or \"organic\" sources whereas competitive relationships.</p>\n<figure><img src=\"/storage/demo/blog-2.jpg\" alt=\"wide\" />\n<figcaption>Keep working until you find success.</figcaption>\n</figure>\n<p>Enthusiastically deliver viral potentialities through multidisciplinary products. Synergistically plagiarize client-focused partnerships for adaptive applications. Seamlessly morph process-centric synergy whereas bricks-and-clicks deliverables. Continually disintermediate holistic action items without distinctive customer service. Enthusiastically seize enterprise web-readiness without effective schemas.</p>\n<h4>Seamlessly promote flexible growth strategies.</h4>\n<p>Assertively restore installed base data before sustainable platforms. Globally recapitalize orthogonal systems via clicks-and-mortar web services. Efficiently grow visionary action items through collaborative e-commerce. Efficiently architect highly efficient \"outside the box\" thinking before customer directed infomediaries. Proactively mesh holistic human capital rather than exceptional niches.</p>\n<p>Intrinsically create innovative value and pandemic resources. Progressively productize turnkey e-markets and economically sound synergy. Objectively supply turnkey imperatives vis-a-vis high standards in outsourcing. Dynamically exploit unique imperatives with dynamic systems. Appropriately formulate technically sound users and excellent expertise.</p>\n<p>Competently redefine long-term high-impact relationships rather than effective metrics. Distinctively maintain impactful platforms after strategic imperatives. Intrinsically evolve mission-critical deliverables after multimedia based e-business. Interactively mesh cooperative benefits whereas distributed process improvements. Progressively monetize an expanded array of e-services whereas.</p>', 'demo/post-useful.jpg', 'creating-something-useful', 'Find out how to Create something useful', 'useful, create something useful', 'PUBLISHED', 0, '2018-03-25 21:49:37', '2018-03-25 21:56:38'),
(10, 1, 1, 'Never Stop Creating', 'Never Stop Creating', NULL, '<p>The reason why we are the way we are is... Because we are designed for a purpose. Some people are created to help or service, and others are created to... Well... Create. Are you a creator.</p>\n<p>If you have a passion for creating new things and bringing ideas to life. You\'ll want to save yourself some time by using Wave to build the foundation. Wave has so many built-in features including Billing, User Profiles, User Settings, an API, and so much more.</p>\n<blockquote>\n<p>You may have a need to only want to make money from your application, but if your application can help others achieve a goal and you can make money from it too, you have a gold-mine.</p>\n</blockquote>\n<p>Some more info on your awesome post here. After this sentence, it\'s just going to be a little bit of jibberish. But you get a general idea. You\'ll want to blog about stuff to get your customers interested in your application. With leverage existing reliable initiatives before leveraged ideas. Rapidiously develops equity invested expertise rather than enabled channels. Monotonectally intermediate distinctive networks before highly efficient core competencies.</p>\n<h2>Seamlessly promote flexible growth strategies.</h2>\n<p><img src=\"/storage/demo/blog-1.jpg\" alt=\"blog\" /></p><p>Dramatically harness extensive value through the fully researched human capital. Seamlessly transition premium schemas vis-a-vis efficient convergence. Intrinsically build competitive e-commerce with cross-unit information. Collaboratively e-enable real-time processes before extensive technology. Authoritatively fabricate efficient metrics through intuitive quality vectors.</p>\n<p>Collaboratively deliver optimal vortals whereas backward-compatible models. Globally syndicate diverse leadership rather than high-payoff experiences. Uniquely pontificate unique metrics for cross-media human capital. Completely procrastinate professional collaboration and idea-sharing rather than 24/365 paradigms. Phosfluorescently initiates multimedia based outsourcing for interoperable benefits.</p>\n<h3>Seamlessly promote flexible growth strategies.</h3>\n<p>Progressively leverage other\'s e-business functionalities through corporate e-markets. Holistic repurpose timely systems via seamless total linkage. Appropriately maximize impactful \"outside the box\" thinking vis-a-vis visionary value. Authoritatively deploy interdependent technology through process-centric \"outside the box\" thinking. Interactively negotiate pandemic internal or \"organic\" sources whereas competitive relationships.</p>\n<figure><img src=\"/storage/demo/blog-2.jpg\" alt=\"wide\" />\n<figcaption>Keep working until you find success.</figcaption>\n</figure>\n<p>Enthusiastically deliver viral potentialities through multidisciplinary products. Synergistically plagiarize client-focused partnerships for adaptive applications. Seamlessly morph process-centric synergy whereas bricks-and-clicks deliverables. Continually disintermediate holistic action items without distinctive customer service. Enthusiastically seize enterprise web-readiness without effective schemas.</p>\n<h4>Seamlessly promote flexible growth strategies.</h4>\n<p>Assertively restore installed base data before sustainable platforms. Globally recapitalize orthogonal systems via clicks-and-mortar web services. Efficiently grow visionary action items through collaborative e-commerce. Efficiently architect highly efficient \"outside the box\" thinking before customer directed infomediaries. Proactively mesh holistic human capital rather than exceptional niches.</p>\n<p>Intrinsically create innovative value and pandemic resources. Progressively productize turnkey e-markets and economically sound synergy. Objectively supply turnkey imperatives vis-a-vis high standards in outsourcing. Dynamically exploit unique imperatives with dynamic systems. Appropriately formulate technically sound users and excellent expertise.</p>\n<p>Competently redefine long-term high-impact relationships rather than effective metrics. Distinctively maintain impactful platforms after strategic imperatives. Intrinsically evolve mission-critical deliverables after multimedia based e-business. Interactively mesh cooperative benefits whereas distributed process improvements. Progressively monetize an expanded array of e-services whereas.</p>', 'demo/post-never-stop.jpg', 'never-stop-creating', 'In this article you\'ll learn how important it is to never stop creating', 'creating, never stop', 'PUBLISHED', 0, '2018-03-25 21:08:02', '2018-06-28 01:14:31');

-- --------------------------------------------------------

--
-- Table structure for table `profile_key_values`
--

CREATE TABLE `profile_key_values` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` varchar(191) NOT NULL,
  `keyvalue_id` int(10) UNSIGNED NOT NULL,
  `keyvalue_type` varchar(191) NOT NULL,
  `key` varchar(191) NOT NULL,
  `value` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `profile_key_values`
--

INSERT INTO `profile_key_values` (`id`, `type`, `keyvalue_id`, `keyvalue_type`, `key`, `value`, `created_at`, `updated_at`) VALUES
(10, 'text_area', 1, 'users', 'about', 'Hello I am the admin user. You can update this information in the edit profile section. Hope you enjoy using Wave.', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `guard_name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `description` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`, `description`) VALUES
(1, 'admin', 'web', '2017-11-21 11:23:22', '2017-11-21 11:23:22', 'The admin user has full access to all features including the ability to access the admin panel.'),
(2, 'registered', 'web', '2017-11-21 11:23:22', '2017-11-21 11:23:22', 'This is the default user role. If a user has this role they have created an account; however, they have are not a subscriber.'),
(3, 'basic', 'web', '2017-11-21 11:23:22', '2017-11-21 11:23:22', 'This is the basic plan role. This role is usually associated with a user who has subscribed to the basic plan.'),
(4, 'premium', 'web', '2018-07-03 00:03:21', '2018-07-03 12:28:44', 'This is the premium plan role. This role is usually associated with a user who has subscribed to the premium plan.'),
(5, 'pro', 'web', '2018-07-03 11:27:16', '2018-07-03 12:28:38', 'This is the pro plan role. This role is usually associated with a user who has subscribed to the pro plan.');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(191) NOT NULL,
  `display_name` varchar(191) NOT NULL,
  `value` text DEFAULT NULL,
  `details` text DEFAULT NULL,
  `type` varchar(191) NOT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `group` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`, `created_at`, `updated_at`) VALUES
(1, 'site.title', 'Site Title', 'Wave', '', 'text', 1, 'Site', NULL, NULL),
(2, 'site.description', 'Site Description', 'The Software as a Service Starter Kit built with Laravel', '', 'text', 2, 'Site', NULL, NULL),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', NULL, '', 'text', 4, 'Site', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `social_provider_user`
--

CREATE TABLE `social_provider_user` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `provider_slug` varchar(191) NOT NULL,
  `provider_user_id` varchar(191) NOT NULL,
  `nickname` varchar(191) DEFAULT NULL,
  `name` varchar(191) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `avatar` varchar(191) DEFAULT NULL,
  `provider_data` text DEFAULT NULL,
  `token` varchar(191) NOT NULL,
  `refresh_token` varchar(191) DEFAULT NULL,
  `token_expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `billable_type` varchar(191) NOT NULL,
  `billable_id` bigint(20) UNSIGNED NOT NULL,
  `plan_id` int(10) UNSIGNED NOT NULL,
  `vendor_slug` varchar(191) NOT NULL,
  `vendor_product_id` varchar(191) DEFAULT NULL,
  `vendor_transaction_id` varchar(191) DEFAULT NULL,
  `vendor_customer_id` varchar(191) DEFAULT NULL,
  `vendor_subscription_id` varchar(191) DEFAULT NULL,
  `status` varchar(191) NOT NULL,
  `cycle` enum('month','year','onetime') NOT NULL DEFAULT 'month',
  `seats` int(11) NOT NULL DEFAULT 1,
  `trial_ends_at` timestamp NULL DEFAULT NULL,
  `ends_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `themes`
--

CREATE TABLE `themes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `folder` varchar(191) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `version` varchar(255) NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `themes`
--

INSERT INTO `themes` (`id`, `name`, `folder`, `active`, `version`, `created_at`, `updated_at`) VALUES
(1, 'Anchor', 'anchor', 1, '1.0', NULL, '2025-01-21 23:04:04');

-- --------------------------------------------------------

--
-- Table structure for table `theme_options`
--

CREATE TABLE `theme_options` (
  `id` int(10) UNSIGNED NOT NULL,
  `theme_id` int(10) UNSIGNED NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `email` varchar(191) NOT NULL,
  `avatar` varchar(191) NOT NULL DEFAULT 'demo/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) DEFAULT NULL,
  `two_factor_secret` text DEFAULT NULL,
  `two_factor_recovery_codes` text DEFAULT NULL,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `username` varchar(191) NOT NULL,
  `trial_ends_at` datetime DEFAULT NULL,
  `verification_code` varchar(191) DEFAULT NULL,
  `verified` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `remember_token`, `created_at`, `updated_at`, `username`, `trial_ends_at`, `verification_code`, `verified`) VALUES
(1, 'Wave Admin', 'admin@admin.com', 'demo/default.png', NULL, '$2y$10$uRK1.Iou3EMnN/AqmieIc.hbI79u1nTfHjkIXORgouMBkwAvneaA2', NULL, NULL, NULL, 'DiDh9bfTaTZPqhntparWdQuwUjdphxrJIiNyf8xByh0wUO3EvmSOmIqFnaPu', '2017-11-21 11:07:22', '2018-09-22 18:34:02', 'admin', NULL, NULL, 1),
(2, 'Waseem Mushtaq', 'waseemmushtaq088@gmail.com', 'demo/default.png', NULL, '$2y$10$fi.Ey0w/vxLxIi9Ir0nqaeormDuIi8SIZQowi.cz1Dvoffdx0tkxq', NULL, NULL, NULL, NULL, '2025-01-24 12:00:24', '2025-01-24 12:00:24', 'waseemmushtaq', NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `api_keys`
--
ALTER TABLE `api_keys`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `api_keys_key_unique` (`key`),
  ADD KEY `api_keys_user_id_foreign` (`user_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `changelogs`
--
ALTER TABLE `changelogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `changelog_user`
--
ALTER TABLE `changelog_user`
  ADD PRIMARY KEY (`changelog_id`,`user_id`),
  ADD KEY `changelog_user_changelog_id_index` (`changelog_id`),
  ADD KEY `changelog_user_user_id_index` (`user_id`);

--
-- Indexes for table `forms`
--
ALTER TABLE `forms`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `forms_slug_unique` (`slug`);

--
-- Indexes for table `form_entries`
--
ALTER TABLE `form_entries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `form_entries_form_id_foreign` (`form_id`),
  ADD KEY `form_entries_user_id_foreign` (`user_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_slug_unique` (`slug`),
  ADD KEY `pages_author_id_foreign` (`author_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `plans`
--
ALTER TABLE `plans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `plans_role_id_foreign` (`role_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`),
  ADD KEY `posts_author_id_foreign` (`author_id`),
  ADD KEY `posts_category_id_foreign` (`category_id`);

--
-- Indexes for table `profile_key_values`
--
ALTER TABLE `profile_key_values`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `profile_key_values_keyvalue_type_key_unique` (`keyvalue_id`,`keyvalue_type`,`key`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Indexes for table `social_provider_user`
--
ALTER TABLE `social_provider_user`
  ADD PRIMARY KEY (`user_id`,`provider_slug`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `subscriptions_vendor_slug_vendor_subscription_id_unique` (`vendor_slug`,`vendor_subscription_id`),
  ADD KEY `subscriptions_billable_type_billable_id_index` (`billable_type`,`billable_id`),
  ADD KEY `subscriptions_billable_id_billable_type_plan_id_index` (`billable_id`,`billable_type`,`plan_id`),
  ADD KEY `subscriptions_plan_id_foreign` (`plan_id`);

--
-- Indexes for table `themes`
--
ALTER TABLE `themes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `themes_folder_unique` (`folder`);

--
-- Indexes for table `theme_options`
--
ALTER TABLE `theme_options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `theme_options_theme_id_foreign` (`theme_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_username_unique` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `api_keys`
--
ALTER TABLE `api_keys`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `changelogs`
--
ALTER TABLE `changelogs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `forms`
--
ALTER TABLE `forms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `form_entries`
--
ALTER TABLE `form_entries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `plans`
--
ALTER TABLE `plans`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `profile_key_values`
--
ALTER TABLE `profile_key_values`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `themes`
--
ALTER TABLE `themes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `theme_options`
--
ALTER TABLE `theme_options`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `api_keys`
--
ALTER TABLE `api_keys`
  ADD CONSTRAINT `api_keys_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `changelog_user`
--
ALTER TABLE `changelog_user`
  ADD CONSTRAINT `changelog_user_changelog_id_foreign` FOREIGN KEY (`changelog_id`) REFERENCES `changelogs` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `changelog_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `form_entries`
--
ALTER TABLE `form_entries`
  ADD CONSTRAINT `form_entries_form_id_foreign` FOREIGN KEY (`form_id`) REFERENCES `forms` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `form_entries_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `pages`
--
ALTER TABLE `pages`
  ADD CONSTRAINT `pages_author_id_foreign` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `plans`
--
ALTER TABLE `plans`
  ADD CONSTRAINT `plans_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_author_id_foreign` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `posts_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `social_provider_user`
--
ALTER TABLE `social_provider_user`
  ADD CONSTRAINT `social_provider_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD CONSTRAINT `subscriptions_plan_id_foreign` FOREIGN KEY (`plan_id`) REFERENCES `plans` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `theme_options`
--
ALTER TABLE `theme_options`
  ADD CONSTRAINT `theme_options_theme_id_foreign` FOREIGN KEY (`theme_id`) REFERENCES `themes` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
