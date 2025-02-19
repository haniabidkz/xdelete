<?php

use function Laravel\Folio\{name};

name('home');
?>

<x-layouts.marketing
  :seo="[
        'title'         => setting('site.title', 'Laravel Wave'),
        'description'   => setting('site.description', 'Software as a Service Starter Kit'),
        'image'         => url('/og_image.png'),
        'type'          => 'website'
    ]">

  <div class="xdelete-hero-section2">
    <div class="container">
      <div class="row xdelete_screenfix_right">
        <div class="col-lg-6">
          <div class="xdelete-hero-content xdelete-default-content">
            <div class="xdelete-hero-rating">
              <!-- <ul>
                <li><img src="assets-custom/images/v2/rating.png" alt=""></li>
                <li>4.8/5 on TrustPilot reviews</li>
              </ul> -->
            </div>
            <h2>Delete Tweets (X Posts): Easily and Instantly</h2>
            <p>Our proprietary platform streamlines your X, formerly Twitter, page with ease. Delete X posts using our filtering tool. Then, let TweetDelete do the hard work and bulk delete all your tweets/posts. It's that simple. Really.
            </p>
            <div class="xdelete-hero-btn-wrap">
              <a class="xdelete-default-btn pill" href="{{route('twitter.login'))}}"> <span>Sign in with X.com</span> </a>
              <a class="xdelete-login-btn m-0" href="service.html">View all features</a>
            </div>
          </div>
        </div>
        <div class="col-lg-6">
          <div class="xdelete-hero-thumb2">
            <img src="assets-custom/images/v2/dashboard.png" alt="">
            <div class="xdelete-hero-shape2">
              <img src="assets-custom/images/v2/shape1-v2.png" alt="">
            </div>
            <div class="xdelete-hero-shape3">
              <img src="assets-custom/images/v2/shape2-v2.png" alt="">
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- End section -->

  <div class="section dark-bg xdelete-section-padding4">
    <div class="container">
      <div class="row">
        <div class="col-lg-5">
          <div class="xdelete-brand-logo-content">
            <h3>Over 50,000 people rely on our app for their money choices</h3>
          </div>
        </div>
        <div class="col-lg-7">
          <div class="xdelete-brand-slider">
            <div class="xdelete-brand-item">
              <img src="assets-custom/images/v1/b_1.png" alt="">
            </div>
            <div class="xdelete-brand-item">
              <img src="assets-custom/images/v1/b_2.png" alt="">
            </div>
            <div class="xdelete-brand-item">
              <img src="assets-custom/images/v1/b_3.png" alt="">
            </div>
            <div class="xdelete-brand-item">
              <img src="assets-custom/images/v1/b_4.png" alt="">
            </div>
            <div class="xdelete-brand-item">
              <img src="assets-custom/images/v1/b_5.png" alt="">
            </div>
            <div class="xdelete-brand-item">
              <img src="assets-custom/images/v1/b_6.png" alt="">
            </div>
          </div>
          <div class="xdelete-brand-slider2">
            <div class="xdelete-brand-item">
              <img src="assets-custom/images/v1/b_1.png" alt="">
            </div>
            <div class="xdelete-brand-item">
              <img src="assets-custom/images/v1/b_2.png" alt="">
            </div>
            <div class="xdelete-brand-item">
              <img src="assets-custom/images/v1/b_3.png" alt="">
            </div>
            <div class="xdelete-brand-item">
              <img src="assets-custom/images/v1/b_4.png" alt="">
            </div>
            <div class="xdelete-brand-item">
              <img src="assets-custom/images/v1/b_5.png" alt="">
            </div>
            <div class="xdelete-brand-item">
              <img src="assets-custom/images/v1/b_6.png" alt="">
            </div>
          </div>
        </div>
      </div>

    </div>
  </div>
  <!-- End section -->

  <div class="section xdelete-section-padding2">
    <div id="xdelete-counter"></div>
    <div class="container">
      <div class="row">
        <div class="col-lg-5">
          <div class="xdelete-v2-thumb thumb-mr">
            <img src="assets-custom/images/v2/x lap.png" alt="">
            <div class="xdelete-v2-thumb-shape">
              <img src="assets-custom/images/v2/shape3-v2.png" alt="">
            </div>
          </div>
        </div>
        <div class="col-lg-7">
          <div class="xdelete-default-content">
            <h2>Enables improved customer service</h2>
            <p>CRM software enables better customer service by tracking all customer inquiries, issues, & support requests. Support teams can respond more effectively and promptly, leading to higher customer satisfaction.</p>
            <div class="xdelete-extara-mt">
              <div class="xdelete-counter-wrap">
                <div class="xdelete-counter-data">
                  <h2 class="xdelete-counter-number"><span data-percentage="99" class="xdelete-counter"></span>%</h2>
                  <p>Customer satisfaction</p>
                </div>
                <div class="xdelete-counter-data">
                  <h2 class="xdelete-counter-number"><span data-percentage="3.5" class="xdelete-counter"></span>X</h2>
                  <p>Close deals faster</p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- End section -->

  <div class="section xdelete-section-padding3 bg-light">
    <div class="container">
      <div class="xdelete-section-title center">
        <h2>What TweetDelete Can Do For You
        </h2>
      </div>
      <div class="row">
        <div class="col-xl-4 col-md-6">
          <div class="xdelete-iconbox-wrap center">
            <div class="xdelete-iconbox-icon">
              <img src="assets-custom/images/v1/icon3.png" alt="">
            </div>
            <div class="xdelete-iconbox-data">
              <h3>Delete All My Tweets / X Posts
              </h3>
              <p>Have you ever asked yourself, “How do I delete all my tweets?” TweetDelete helps you bulk delete past tweets. Enter the date range of the tweets (X posts) you want deleted, and our platform does the rest. Rest assured that TweetDelete gives your X, formerly Twitter, timeline a clean slate to start your journey all over again.</p>
            </div>
          </div>
        </div>
        <div class="col-xl-4 col-md-6 ">
          <div class="xdelete-iconbox-wrap center">
            <div class="xdelete-iconbox-icon">
              <img src="assets-custom/images/v1/icon4.png" alt="">
            </div>
            <div class="xdelete-iconbox-data">
              <h3>See Deleted Tweets / X Posts</h3>
              <p>If you want to see deleted tweets, you have a good reason. Deleted X posts hold people accountable for their words. You use them for research or to learn about history. It’s no wonder people want to view deleted tweets on X.com — whether it's their own, other platform users’ or media tweets. If you want to see your own.</p>
            </div>
          </div>
        </div>
        <div class="col-xl-4 col-md-6">
          <div class="xdelete-iconbox-wrap center">
            <div class="xdelete-iconbox-icon">
              <img src="assets-custom/images/v1/icon5.png" alt="">
            </div>
            <div class="xdelete-iconbox-data">
              <h3>Unlike Tweets / X Posts</h3>
              <p>Have you liked a tweet / X post but later changed your mind about it? TweetDelete helps you unlike X posts/tweets, to remove your endorsement. It’s helpful if you no longer agree with the post. Or, maybe you don't want to associate with the message anymore. Whatever the reason, TweetDelete assists.</p>
            </div>
          </div>
        </div>
        <div class="col-xl-4 col-md-6">
          <div class="xdelete-iconbox-wrap center">
            <div class="xdelete-iconbox-icon">
              <img src="assets-custom/images/v1/icon6.png" alt="">
            </div>
            <div class="xdelete-iconbox-data">
              <h3>Delete Multiple Tweets / X Posts</h3>
              <p>We know it’s tedious to delete multiple tweets/posts one at a time. Is your Twitter feed on X.com cluttered with old tweets? Maybe there are a few embarrassing posts you want to erase. Deleting tweets in bulk helps you clean up your feed and make it more organized. Put time back into your day and let TweetDelete delete all your tweets and old posts at once. </p>
            </div>
          </div>
        </div>
        <div class="col-xl-4 col-md-6">
          <div class="xdelete-iconbox-wrap center">
            <div class="xdelete-iconbox-icon">
              <img src="assets-custom/images/v1/icon7.png" alt="">
            </div>
            <div class="xdelete-iconbox-data">
              <h3>Delete Tweets From Archive</h3>
              <p>If you’re an avid tweeter with more than 3,200 tweets under your belt, TweetDelete helps you erase X posts and tweets you can’t see. After 3,200 posts on the X platform, the site archives your old posts aka old tweets automatically. Protect your privacy and let TweetDelete delete tweets from archive data. Archival post and tweet deleting is important, especially if your current views.</p>
            </div>
          </div>
        </div>
        <div class="col-xl-4 col-md-6">
          <div class="xdelete-iconbox-wrap center">
            <div class="xdelete-iconbox-icon">
              <img src="assets-custom/images/v1/icon8.png" alt="">
            </div>
            <div class="xdelete-iconbox-data">
              <h3>Auto Delete Tweets / X Posts</h3>
              <p>Schedule a task and walk away with TweetDelete’s auto-delete tweets functionality. Manually deleting X posts is time-consuming, especially if you have a lot of old tweets. TweetDelete helps automate this process so that you can spend less time on X.com and more time on other things. You control how often you want TweetDelete to erase your tweets (X posts), and tweet likes.</p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- End Section -->

  <div class="xdelete-testimonial-slider-section xdelete-section-padding2" style="background-image: url(assets-custom/images/v2/t-bg.png)">
    <div class="container">
      <div class="xdelete-testimonial-slider">
        <div class="xdelete-testimonial-slider-item">
          <div class="xdelete-testimonial-slider-data">
            <div class="xdelete-testimonial-slider-rating">
              <ul>
                <li><img src="assets-custom/images/v2/rating2.png" alt=""></li>
                <li><img src="assets-custom/images/v2/rating2.png" alt=""></li>
                <li><img src="assets-custom/images/v2/rating2.png" alt=""></li>
                <li><img src="assets-custom/images/v2/rating2.png" alt=""></li>
                <li><img src="assets-custom/images/v2/rating2.png" alt=""></li>
              </ul>
            </div>
            <h3> "A Game Changer for Our Business"</h3>
            <p>I bet everyone has cringe things that they Tweeted in the past. While you may not see them easily, future employers can so it’s a good idea to find and sweep all old tweets when applying just in case.</p>
          </div>
          <div class="xdelete-testimonial-slider-author">

            <div class="xdelete-testimonial-slider-author-data">
              <span>Jonas Aly</span>
              <p>Founder @ Company</p>
            </div>
          </div>
        </div>
        <div class="xdelete-testimonial-slider-item">
          <div class="xdelete-testimonial-slider-data">
            <div class="xdelete-testimonial-slider-rating">
              <ul>
                <li><img src="assets-custom/images/v2/rating2.png" alt=""></li>
                <li><img src="assets-custom/images/v2/rating2.png" alt=""></li>
                <li><img src="assets-custom/images/v2/rating2.png" alt=""></li>
                <li><img src="assets-custom/images/v2/rating2.png" alt=""></li>
                <li><img src="assets-custom/images/v2/rating2.png" alt=""></li>
              </ul>
            </div>
            <h3> "A Game Changer for Our Business"</h3>
            <p>We've been using this CRM platform for over a year now, and I can't stress enough how transformative it has been for our business. The impact this has had on our customer relations, sales and overall efficiency is tremendous.</p>
          </div>
          <div class="xdelete-testimonial-slider-author">
            <div class="xdelete-testimonial-slider-author-thumb">
              <img src="assets-custom/images/v2/t-user.png" alt="">
            </div>
            <div class="xdelete-testimonial-slider-author-data">
              <span>Jonas Aly</span>
              <p>Founder @ Company</p>
            </div>
          </div>
        </div>
        <div class="xdelete-testimonial-slider-item ">
          <div class="xdelete-testimonial-slider-data">
            <div class="xdelete-testimonial-slider-rating">
              <ul>
                <li><img src="assets-custom/images/v2/rating2.png" alt=""></li>
                <li><img src="assets-custom/images/v2/rating2.png" alt=""></li>
                <li><img src="assets-custom/images/v2/rating2.png" alt=""></li>
                <li><img src="assets-custom/images/v2/rating2.png" alt=""></li>
                <li><img src="assets-custom/images/v2/rating2.png" alt=""></li>
              </ul>
            </div>
            <h3> "A Game Changer for Our Business"</h3>
            <p>We've been using this CRM platform for over a year now, and I can't stress enough how transformative it has been for our business. The impact this has had on our customer relations, sales and overall efficiency is tremendous.</p>
          </div>
          <div class="xdelete-testimonial-slider-author">
            <div class="xdelete-testimonial-slider-author-thumb">
              <img src="assets-custom/images/v2/t-user.png" alt="">
            </div>
            <div class="xdelete-testimonial-slider-author-data">
              <span>Jonas Aly</span>
              <p>Founder @ Company</p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- End section -->


  <div class="section xdelete-section-padding2">
    <div class="container">
      <div class="row">
        <div class="col-lg-5 order-lg-2">
          <div class="xdelete-v2-thumb thumb-ml">
            <img src="assets-custom/images/v2/x lap.png" alt="">
          </div>
        </div>
        <div class="col-lg-7">
          <div class="xdelete-default-content">
            <h3>Delete Tweets (Posts) and Clean Up Your Twitter Account on X.com</h3>
            <p>Our software is designed to meet your specific needs. Offers sales automation, marketing tools, and comprehensive analytics.</p>
            <div class="xdelete-extara-mt">
              <div class="xdelete-iconbox-wrap-left">
                <div class="xdelete-iconbox-icon none-bg">
                  <img src="assets-custom/images/v2/check.png" alt="">
                </div>
                <div class="xdelete-iconbox-data">
                  <span>Sign In With Your X Account, formerly Your Twitter Account</span>
                  <p>Login to TweetDelete using your X account, aka Twitter account, credentials. No need
                    for separate log-ins. We keep it simple.

                  </p>
                </div>
              </div>
              <div class="xdelete-iconbox-wrap-left">
                <div class="xdelete-iconbox-icon none-bg">
                  <img src="assets-custom/images/v2/check.png" alt="">
                </div>
                <div class="xdelete-iconbox-data">
                  <span>Search For All Your Old Tweets, X Posts, and Likes
                  </span>
                  <p>Our platform lets you use our filters to find old tweets and tweet
                    likes. Search via keyword, the original Twitter ID number, or a date
                    range.

                  </p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- End section -->
  <x-container class="py-10">
    <x-marketing.sections.pricing />
  </x-container>

  <!-- End Section -->

  <!-- End Section -->
  <div class="section xdelete-section-padding2">
    <div class="container">
      <div class="xdelete-section-title center">
        <h2>Find all the answers to your confusion</h2>
      </div>
      <div class="xdelete-accordion-wrap xdelete-accordion-wrap2" id="xdelete-accordion">
        <div class="xdelete-accordion-item open">
          <div class="xdelete-accordion-header">
            <p>Q: What makes your SaaS solution stand out from competitors?</p>
            <div class="xdelete-active-icon">
              <img src="assets-custom/images/v3/plus.png" alt="">
            </div>
            <div class="xdelete-inactive-icon">
              <img src="assets-custom/images/v3/minus.png" alt="">
            </div>
          </div>
          <div class="xdelete-accordion-body">
            <p> Our SaaS platform distinguishes itself through a combination of user-friendly design, robust feature set, and a commitment to constant innovation. We prioritize customer feedback to ensure we stay ahead of the curve and meet evolving business needs.</p>
          </div>
        </div>
        <div class="xdelete-accordion-item">
          <div class="xdelete-accordion-header">
            <p>Q: How secure is the data stored on your platform?</p>
            <div class="xdelete-active-icon">
              <img src="assets-custom/images/v3/plus.png" alt="">
            </div>
            <div class="xdelete-inactive-icon">
              <img src="assets-custom/images/v3/minus.png" alt="">
            </div>
          </div>
          <div class="xdelete-accordion-body">
            <p>Security is our top priority. We employ state-of-the-art encryption, regular security audits, and compliance with industry standards to safeguard your data. Our commitment is to provide a secure environment for your valuable information.</p>
          </div>
        </div>
        <div class="xdelete-accordion-item">
          <div class="xdelete-accordion-header">
            <p>Q: Can your SaaS solution integrate with other tools we use?</p>
            <div class="xdelete-active-icon">
              <img src="assets-custom/images/v3/plus.png" alt="">
            </div>
            <div class="xdelete-inactive-icon">
              <img src="assets-custom/images/v3/minus.png" alt="">
            </div>
          </div>
          <div class="xdelete-accordion-body">
            <p>Absolutely. We understand the importance of seamless integration. Our SaaS solution is designed to work harmoniously with a variety of popular tools and platforms, ensuring a smooth workflow and reducing any disruptions to your current processes.</p>
          </div>
        </div>
        <div class="xdelete-accordion-item">
          <div class="xdelete-accordion-header">
            <p>Q: What kind of customer support can we expect?</p>
            <div class="xdelete-active-icon">
              <img src="assets-custom/images/v3/plus.png" alt="">
            </div>
            <div class="xdelete-inactive-icon">
              <img src="assets-custom/images/v3/minus.png" alt="">
            </div>
          </div>
          <div class="xdelete-accordion-body">
            <p>Our customer support team is dedicated to your success. You can expect prompt responses, helpful resources, and, if needed, personalized assistance. We believe in building long-lasting relationships with our users, and exceptional support.</p>
          </div>
        </div>
        <div class="xdelete-accordion-item">
          <div class="xdelete-accordion-header">
            <p>Q: How does your pricing model work, and is there flexibility as our business grows?</p>
            <div class="xdelete-active-icon plus">
              <img src="assets-custom/images/v3/plus.png" alt="">
            </div>
            <div class="xdelete-inactive-icon">
              <img src="assets-custom/images/v3/minus.png" alt="">
            </div>
          </div>
          <div class="xdelete-accordion-body">
            <p>We offer a range of flexible pricing plans to accommodate businesses of all sizes. Whether you're a startup or an enterprise, our pricing scales with your needs. You can choose from monthly or annual billing.</p>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- End Section -->

  <div class="xdelete-cta-section2">
    <div class="container">
      <div class="xdelete-cta-wrap" style="background-image: url(assets-custom/images/v2/cta-bg.png)">
        <div class="xdelete-cta-content">
          <h2>Start managing your money now!</h2>
          <div class="xdelete-subscribe-two">
            <form action="#">
              <input type="email" placeholder="Enter your e-mail address">
              <button class="xdelete-default-btn xdelete-subscription-btn two" id="xdelete-subscription-btn" type="submit">
                <span>Get started</span>
              </button>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>



  <footer class="xdelete-footer-section">
    <div class="container">
      <div class="xdelete-footer-top">
        <div class="row">
          <div class="col-xl-12 col-lg-12">
            <div class="xdelete-footer-textarea">
              <a href="index.html">
                <h3>X Delete</h3>
              </a>
              <p>We're your innovation partner, delivering cutting-edge solutions that elevate your business to the next level.</p>
              <div class="xdelete-social-icon social-box">
                <ul>
                  <li>
                    <a href="https://twitter.com/" target="_blank">
                      <i class="fab fa-twitter"></i>
                    </a>
                  </li>
                  <li>
                    <a href="https://facebook.com/" target="_blank">
                      <i class="fab fa-facebook-f"></i>
                    </a>
                  </li>
                  <li>
                    <a href="https://www.linkedin.com/" target="_blank">
                      <i class="fab fa-linkedin"></i>
                    </a>
                  </li>
                  <li>
                    <a href="https://github.com/" target="_blank">
                      <i class="fab fa-github"></i>
                    </a>
                  </li>
                </ul>
              </div>
            </div>
          </div>

        </div>
      </div>
      <div class="xdelete-footer-bottom center">
        <div class="xdelete-copywright">
          <p> &copy;Copyright 2024, All Rights Reserved by X Delete</p>
        </div>
      </div>
    </div>
  </footer>




</x-layouts.marketing>