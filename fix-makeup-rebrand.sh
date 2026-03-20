#!/bin/bash

# 1. Update Navigation
cat << 'INNEREOF' > src/navigation.ts
import { getPermalink } from './utils/permalinks';

export const headerData = {
  links: [
    { text: 'Grow Your Studio', href: getPermalink('/#features') },
    { text: 'How It Works', href: getPermalink('/#howitworks') },
    { text: 'The Story', href: getPermalink('/about') },
    { text: 'Lifetime Access - Order Now', href: getPermalink('/pricing') },
  ],
  actions: [
    { text: 'Get Lifetime Access - $99', variant: 'primary', href: '/pricing' }
  ],
};

export const footerData = {
  links: [
    {
      title: 'Grow Your Studio’s Buzz',
      links: [
        { text: "Claim Your Spot – Just $99", href: getPermalink('/pricing') },
        { text: 'Why We Love Makeup Artists', href: getPermalink('/about') },
        { text: 'Get in Touch', href: getPermalink('/contact') },
      ],
    },
  ],
  secondaryLinks: [
    { text: 'Terms of Service', href: getPermalink('/terms') },
    { text: 'Privacy Policy', href: getPermalink('/privacy') },
  ],
  socialLinks: [],
  footNote: `
    <div class="inline-flex items-center justify-center flex-wrap">
      <img class='w-5 h-5 mr-2 rounded-sm align-middle' src='/images/footer-icon.webp' alt='Testimonial Makeup' loading='lazy'>
      <span class="align-middle">💄 Your artistry, amplified. | © ${new Date().getFullYear()} <a class="text-blue-600 underline dark:text-muted" href="#">Testimonial Makeup</a> All rights reserved.</span>
    </div>
  `,
};
INNEREOF

# 2. Update Home Page (Fixed syntax)
cat << 'INNEREOF' > src/pages/index.astro
---
import Layout from '~/layouts/PageLayout.astro';
import Header from '~/components/widgets/Header.astro';
import Hero2 from '~/components/widgets/Hero2.astro';
import Features from '~/components/widgets/Features.astro';
import Steps2 from '~/components/widgets/Steps2.astro';
import Content from '~/components/widgets/Content.astro';
import Pricing from '~/components/widgets/Pricing.astro';
import { headerData } from '~/navigation';
import FAQs from '~/components/widgets/FAQs.astro';
import { lifetimeDeal } from '~/data/pricingData';

const metadata = {
  title: 'The Five-Star Secret to a Full Book | Testimonial Makeup | $99 Forever',
  description: 'The seamless review engine built for busy makeup artists. Automatically gather five-star love on Google, protect your studio’s reputation, and fill your books on autopilot.',
  ignoreTitleTemplate: true,
};
---

<Layout metadata={metadata}>
  <Fragment slot="header">
    <Header {...headerData} isSticky />
  </Fragment>
  
  <Hero2
    tagline="The #1 Review Engine for Makeup Artists & Studios"
    title='<span class="text-accent dark:text-white">More 5-Star Reviews Without Putting Down the Brushes</span>'
    subtitle="We automate glowing reviews. Turn your client's 'post-glam glow' into your best marketing ever!"
    actions={[
      { variant: 'primary', text: 'Claim My Lifetime Deal Today', href: '/pricing/' },
      { text: 'See How It Works', href: '#howitworks' },
    ]}
    video="/images/hero-animation.mp4" 
    poster="/images/hero-poster.webp" 
    image={{ width: 1024, height: 576 }}
    testimonial={{
        quote: "This is a game-changer! My books are full and my Google rating shot up in weeks. It pays for itself in one bridal booking.",
        name: "Sarah L., Studio Owner"
    }}
  />
  
  <Features
    class="-mt-16"
    id="features"
    title="Everything You Need to Dominate Local Search"
    subtitle="We handle the tech. You focus on the makeup. Here is how we help you grow your studio:"
    columns={2}
    items={[
        { title: 'The "Final Look" Capture', description: 'Catch clients when they feel most beautiful—right at the makeup station. Our 3-click QR system makes it effortless.', icon: 'tabler:sparkles' },
        { title: 'Local SEO Dominance', description: 'Stop paying for ads. Consistent, fresh reviews rank your studio at the top of local search results automatically.', icon: 'tabler:rocket' },
        { title: 'Done-For-You Setup', description: 'Hate tech? We do the heavy lifting. We configure your Google sync and design your codes.', icon: 'tabler:settings-automation' },
        { title: 'No Monthly Fees', description: 'Stop paying $150/month for reputation software. One payment of $99 secures your system forever.', icon: 'tabler:pig-money' },
    ]}
  />

<Content
    class="-mt-16"
    items={[
        { title: 'Rank Higher on Google Maps', description: 'Google prioritizes studios with frequent reviews. We help you jump to the top of the "Makeup Artist Near Me" list.', icon: 'tabler:map-pin' },
        { title: 'Showcase Your Artistry', description: 'Automatically sync your best 5-star Google reviews into a beautiful wall of love on your site.', icon: 'tabler:user-check' },
        { title: 'Beat the Competition', description: 'When new clients compare artists, the one with 100+ reviews always wins.', icon: 'tabler:trending-up' },
    ]}
    image={{ src: '/images/testimonial-2.webp', alt: 'Makeup artist working' }}
  >
    <Fragment slot="content">
      <h3 class="text-2xl font-bold tracking-tight dark:text-white sm:text-3xl mb-2">
        <span class="text-accent dark:text-white">Why Google Reviews are Your Best Sales Team</span>
      </h3>
    </Fragment>
    <Fragment slot="bg"><div class="absolute inset-0 bg-blue-50 dark:bg-transparent"></div></Fragment>
  </Content>

  <div id="howitworks" class="scroll-mt-20">
    <Steps2
      title="From Setup to 5-Stars in 24 Hours"
      subtitle="Three simple steps to automate your studio's reputation."
      items={[
        { title: 'Step 1: Secure Your License', description: 'Purchase your $99 lifetime deal. No hidden fees.', icon: 'tabler:number-1' },
        { title: 'Step 2: We Build Your Engine', description: 'We set up your profile, Google sync, and custom QR codes.', icon: 'tabler:number-2' },
        { title: 'Step 3: Watch Reviews Roll In', description: 'Display your QR code. Clients scan, review, and your rating climbs.', icon: 'tabler:number-3' },
      ]}
      image={{ src: '/images/testimonial-6.webp', alt: 'Makeup Testimonial', width: 1024, height: 1024 }}
    />
  </div>

  <Pricing
    title='<span class="text-accent dark:text-white">One-Time Investment. Lifetime Growth.</span>'
    prices={[lifetimeDeal]}
  />

  <FAQs
    class="-mt-16 px-6"
    title="Frequently Asked Questions"
    items={[
        { title: 'How is this different from a QR code?', description: 'A standard QR opens a link. Our engine uses smart deep-linking and a 3-click flow optimized for busy artists.', icon: 'tabler:help' },
        { title: 'Is it really a one-time payment?', description: 'Yes. We charge a single flat fee for the complete setup. You own it for life.', icon: 'tabler:currency-dollar' },
    ]}
  />
</Layout>
INNEREOF

# 3. Update About Page (Fixed syntax)
cat << 'INNEREOF' > src/pages/about.astro
---
import Hero2 from '~/components/widgets/Hero2.astro';
import Content from '~/components/widgets/Content.astro';
import Layout from '~/layouts/PageLayout.astro';
import Pricing from '~/components/widgets/Pricing.astro';
import { lifetimeDeal } from '~/data/pricingData';

const metadata = {
  title: 'Our Mission - Testimonial Makeup | Built for Artists',
  description: 'We help makeup studios dominate Google without the monthly fees.',
  ignoreTitleTemplate: true,
};
---

<Layout metadata={metadata}>
<Hero2
    tagline="We Grow Your Studio"
    title='You Create the Art.<br/><span class="text-accent dark:text-white">We Build Your Reputation.</span>'
    subtitle="Amazing artists lose bookings without reviews. We ensure your reputation matches your talent."
    actions={[{ variant: 'primary', text: 'Claim My Lifetime Access - $99', href: '/pricing/' }]}
  />
  <Content
    isReversed
    items={[
        { title: 'The "Mirror Reveal"', description: 'The best time for a review is the second your client sees their transformation.', icon: 'tabler:sparkles' },
        { title: 'Client Retention', description: 'A client who leaves a 5-star review is 40% more likely to re-book.', icon: 'tabler:users' },
    ]}
  >
    <Fragment slot="content">
      <h3 class="text-2xl font-bold tracking-tight dark:text-white sm:text-3xl mb-2">
        Why your studio needs <span class="text-accent">Reviews on Autopilot</span>
      </h3>
    </Fragment>
  </Content>
  <Pricing prices={[lifetimeDeal]} />
</Layout>
INNEREOF

# 4. Update Pricing Page (Fixed syntax)
cat << 'INNEREOF' > src/pages/pricing.astro
---
import Layout from '~/layouts/PageLayout.astro';
import HeroText from '~/components/widgets/HeroText.astro';
import Pricing from '~/components/widgets/Pricing.astro';
import Features3 from '~/components/widgets/Features3.astro';
import { lifetimeDeal } from '~/data/pricingData';

const metadata = {
  title: 'Pricing - Testimonial Makeup',
  description: 'One-time $99 payment for a lifetime of reviews.',
  ignoreTitleTemplate: true,
};
---

<Layout metadata={metadata}>
  <HeroText 
    tagline="The Last Review System You'll Ever Buy"
    title="Stop Paying Monthly Fees." 
    subtitle="Most software charges $150 every month. We charge $99 once."
  />
  <Pricing id="pricing" title="Invest Once. Grow Forever." prices={[lifetimeDeal]} />
  <Features3
    title="What is included?"
    columns={3}
    items={[
      { title: 'Branded QR Signs', description: 'Custom signs for your makeup station.', icon: 'tabler:qrcode' },
      { title: 'Google Maps Sync', description: 'Direct connection to your Google profile.', icon: 'tabler:brand-google' },
      { title: 'Wall of Love', description: 'Automated widget for your website.', icon: 'tabler:code' },
    ]}
  />
</Layout>
INNEREOF

# 5. Ensure Pricing Component is clean
sed -i 's/HairTestimonial/MakeupTestimonial/g' src/components/widgets/Pricing.astro
sed -i 's/Salon/Studio/g' src/components/widgets/Pricing.astro

# 6. Push to Github
git add .
git commit -m "Fix syntax errors and complete makeup studio rebrand"
git push origin main

echo "Syntax fixed and rebrand pushed!"
