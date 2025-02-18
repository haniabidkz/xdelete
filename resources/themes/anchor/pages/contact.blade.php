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
    ]"
>


<div class="xdelete-breadcrumb">
    <div class="container">
      <h1 class="post__title">Contact Us</h1>
      <nav class="breadcrumbs">
        <ul>
          <li><a href="index.html">Home</a></li>
          <li aria-current="page"> Contact Us</li>
        </ul>
      </nav>

    </div>
  </div>
  <!-- End breadcrumb -->

  <div class="section xdelete-section-padding2">
    <div class="container">
      <div class="row">
        <div class="col-lg-6">
          <div class="xdelete-default-content m-right">
            <h2>Contact our support team</h2>
            <p>Book an appointment with our team now! If you have any questions about growing your business, contact our team and schedule a call.</p>
            <div class="xdelete-extara-mt">
              <div class="xdelete-iconbox-wrap-left d-block">
                <div class="xdelete-iconbox-data data-small">
                  <span>Office Location:</span>
                  <p>4132 Thornridge City, New York.</p>
                </div>
              </div>
              <div class="xdelete-iconbox-wrap-left d-block">
                <div class="xdelete-iconbox-data data-small">
                  <span>Social Media:</span>
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
        </div>
        <div class="col-lg-6">
          <div class="xdelete-form-wrap">
            <h3>Fill the from below</h3>
            <form action="#">
              <div class="row">
                <div class="col-lg-6">
                  <div class="xdelete-main-form">
                    <input type="text" placeholder="Your Name*">
                  </div>
                </div>
                <div class="col-lg-6">
                  <div class="xdelete-main-form">
                    <input type="email" placeholder="Email Address*">
                  </div>
                </div>
              </div>
              <div class="xdelete-main-form">
                <input type="text" placeholder="Subject">
              </div>
              <div class="xdelete-main-form">
                <textarea name="textarea" placeholder="Write us your comment"></textarea>
              </div>
              <button id="xdelete-submit-btn" type="button"><span>Send Message</span></button>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- end section -->

  <div class="section dark-bg xdelete-section-padding6">
    <div class="container">
      <div class="row">
        <div class="col-lg-4 col-md-6">
          <a href="tel:123">
            <div class="xdelete-iconbox-wrap-left text-center-lg rt-mb-24">
              <div class="xdelete-iconbox-icon">
                <img src="assets/images/icon/call2.svg" alt="">
              </div>
              <div class="xdelete-iconbox-data light">
                <h3>Call us directly</h3>
                <p>+088-234-6532-789<br>
                +088-456-3217-005</p>
              </div>
            </div>
          </a>
        </div>
        <div class="col-lg-4 col-md-6">
          <a href="mailto:name@email.com">
            <div class="xdelete-iconbox-wrap-left text-center-lg rt-mb-24">
              <div class="xdelete-iconbox-icon">
                <img src="assets/images/icon/email3.svg" alt="">
              </div>
              <div class="xdelete-iconbox-data light">
                <h3>Email us</h3>
                <p>example@gmail.com<br>
                example@gmail.com</p>
              </div>
            </div>
          </a>
        </div>
        <div class="col-lg-4 col-md-6">
          <div class="xdelete-iconbox-wrap-left text-center-lg rt-mb-24">
            <div class="xdelete-iconbox-icon">
              <img src="assets/images/icon/map2.svg" alt="">
            </div>
            <div class="xdelete-iconbox-data light">
              <h3>Our office address</h3>
              <p>4132 Thornridge City,<br> New York.</p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- End section -->

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
              <img src="assets/images/v3/plus.png" alt="">
            </div>
            <div class="xdelete-inactive-icon">
              <img src="assets/images/v3/minus.png" alt="">
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
              <img src="assets/images/v3/plus.png" alt="">
            </div>
            <div class="xdelete-inactive-icon">
              <img src="assets/images/v3/minus.png" alt="">
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
              <img src="assets/images/v3/plus.png" alt="">
            </div>
            <div class="xdelete-inactive-icon">
              <img src="assets/images/v3/minus.png" alt="">
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
              <img src="assets/images/v3/plus.png" alt="">
            </div>
            <div class="xdelete-inactive-icon">
              <img src="assets/images/v3/minus.png" alt="">
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
              <img src="assets/images/v3/plus.png" alt="">
            </div>
            <div class="xdelete-inactive-icon">
              <img src="assets/images/v3/minus.png" alt="">
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