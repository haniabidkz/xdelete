<div class="section xdelete-section-padding3 bg-light position-relative">
    <div class="container">
        <div class="xdelete-section-title center">
            <h2>Rational planning for rapid growth</h2>
        </div>

        <!-- Toggle Button -->
        <div class="pricing-btn">
    <label>Billed yearly</label> <!-- Update this -->
    <div class="toggle-btn">
        <input
            class="form-check-input btn-toggle price-deck-trigger"
            type="checkbox"
            id="billingToggle"
        />
    </div>
    <label>Billed monthly</label> <!-- Update this -->
</div>

        <!-- Pricing Plans -->
        <div class="row" id="table-price-value">
            @foreach(Wave\Plan::where('active', 1)->get() as $plan)
            @php $features = explode(',', $plan->features); @endphp
            <div class="col-xl-4 col-md-6 plan-container" data-monthly-price="{{ $plan->monthly_price }}"
                data-yearly-price="{{ $plan->yearly_price }}">
                <div class="xdelete-pricing-wrap {{ $plan->default ? 'active' : '' }}">
                    <div class="xdelete-pricing-header">
                        <h5>{{ $plan->name }}</h5>
                    </div>

                    <div class="xdelete-pricing-price">
                        <h2>$</h2>
                        <!-- <div class="xdelete-price dynamic-value price-value" data-active="19" data-monthly="19" data-yearly="39"></div> -->
                        <div>
                        <h2><span class="price-value">{{ $plan->monthly_price }}</span></h2>
                        </div>
                        <p class="price-cycle">USD/Billed monthly</p>
                    </div>

                    <div class="xdelete-pricing-description">
                        <p>{{ $plan->description }}</p>
                    </div>
                    <div class="xdelete-pricing-body">
                        <ul>
                            @foreach($features as $feature)
                            <li>
                                <img src="assets-custom/images/v2/check2.png" alt="">
                                {{ $feature }}
                            </li>
                            @endforeach
                        </ul>
                    </div>
                    <a class="xdelete-pricing-btn {{ $plan->default ? 'active' : '' }}" href="/settings/subscription">
                        Select the plan
                    </a>
                </div>
            </div>
            @endforeach
        </div>
    </div>
    <div class="xdelete-pricing-shape">
        <img src="assets-custom/images/v2/shape4-v2.png" alt="">
    </div>
</div>

<script>
    // JavaScript Logic for Toggle Button
    document.addEventListener('DOMContentLoaded', function () {
    const toggleInput = document.getElementById('billingToggle');
    const planContainers = document.querySelectorAll('.plan-container');

    // Initialize to Monthly or Yearly pricing based on the toggle state
    function updatePricing(isYearly) {
        planContainers.forEach(container => {
            const monthlyPrice = container.dataset.monthlyPrice;
            const yearlyPrice = container.dataset.yearlyPrice;

            const priceValue = container.querySelector('.price-value');
            const priceCycle = container.querySelector('.price-cycle');

            if (isYearly) {
                priceValue.textContent = yearlyPrice;
                priceCycle.textContent = 'USD/Billed yearly';
            } else {
                priceValue.textContent = monthlyPrice;
                priceCycle.textContent = 'USD/Billed monthly';
            }
        });
    }

    // Event listener for the toggle
    toggleInput.addEventListener('change', function () {
        updatePricing(toggleInput.checked);
    });

    // Set initial state
    updatePricing(toggleInput.checked);
});

</script>
