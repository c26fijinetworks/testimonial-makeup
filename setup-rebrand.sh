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
  footNote: \`
    <div class="inline-flex items-center justify-center flex-wrap">
      <img class='w-5 h-5 mr-2 rounded-sm align-middle' src='/images/footer-icon.webp' alt='Testimonial Makeup' loading='lazy'>
      <span class="align-middle">💄 Your artistry, amplified. | © \${new Date().getFullYear()} <a class="text-blue-600 underline dark:text-muted" href="#">Testimonial Makeup</a> All rights reserved.</span>
    </div>
  \`,
};
INNEREOF

# 2. Update Main Index Page
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
  description: 'The seamless review engine built for busy makeup artists. Automatically gather five-star love on Google, protect your studio’s reputation, and fill your books on autopilot. No monthly fees—just one price for a lifetime of word-of-mouth.',
  ignoreTitleTemplate: true,
};
---

<Layout metadata={metadata}>
  <Fragment slot="header">
    <Header {...headerData} isSticky />
  </Fragment>
  
  <Hero2
    tagline="The #1 Review Engine for Makeup Artists & Studios ⭐⭐⭐⭐⭐"
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
        quote: "⭐⭐⭐⭐⭐ This is a game-changer! My books are full and my Google rating shot up in weeks. It pays for itself in one bridal booking.",
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
        { title: 'The "Final Look" Capture', description: 'Catch clients when they feel most beautiful—right at the makeup chair. Our 3-click QR system makes it effortless for them to rave about you.', icon: 'tabler:sparkles' },
        { title: 'Local SEO Dominance', description: 'Stop paying for ads. Consistent, fresh reviews trigger Google’s algorithm to rank your studio at the top of local search results automatically.', icon: 'tabler:rocket' },
        { title: 'Done-For-You Setup', description: 'Hate tech? We do the heavy lifting. We configure your Google sync, design your codes, and help you install the widget. You just focus on your art.', icon: 'tabler:settings-automation' },
        { title: 'No Monthly Fees', description: 'Stop paying $150/month for reputation software. One payment of $99 secures your system for the life of your business. No subscriptions ever!', icon: 'tabler:pig-money' },
    ]}
  />

<Content
    class="-mt-16"
    items={[
        { title: 'Rank Higher on Google Maps', description: 'Google prioritizes studios with frequent, fresh reviews. We help you jump to the top of the "Makeup Artist Near Me" list.', icon: 'tabler:map-pin' },
        { title: 'Showcase Your Artistry', description: 'Automatically sync your best 5-star Google reviews into a beautiful wall of love on your website to build instant trust.', icon: 'tabler:user-check' },
        { title: 'Beat the Competition', description: 'When new clients compare artists, the one with 100+ reviews always wins. We make sure that artist is yours.', icon: 'tabler:trending-up' },
        { title: 'Voice Search Priority', description: 'Be the first name Siri and Alexa speak when someone says, "Find me the best makeup artist in town."', icon: 'tabler:microphone' },
    ]}
    image={{ src: '/images/testimonial-2.webp', alt: 'Makeup artist working on a client' }}
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
        {
          title: 'Step 1: Secure Your License',
          description: 'Purchase your $99 lifetime deal. No hidden fees or recurring subscriptions.',
          icon: 'tabler:number-1',
        },
        {
          title: 'Step 2: We Build Your Engine',
          description: 'Tell us your studio name. We set up your brand profile, Google sync, and custom QR codes.',
          icon: 'tabler:number-2',
        },
        {
          title: 'Step 3: Watch the Reviews Roll In',
          description: 'Display your QR code at your station. Clients scan, review, and your rating climbs.',
          icon: 'tabler:number-3',
        },
      ]}
      image={{ 
        src: '/images/testimonial-6.webp', 
        alt: 'Testimonial Makeup system in action',
        width: 1024,
        height: 1024 
      }}
    />
  </div>

  <Pricing
    title={\`<span class="text-accent dark:text-white">One-Time Investment. Lifetime Growth.</span>\`}
    prices={[lifetimeDeal]}
  />

  <FAQs
    class="-mt-16 px-6"
    title="Frequently Asked Questions"
    items={[
        { title: 'How is this different from a QR code I make myself?', description: 'A standard QR code just opens a link. Our engine uses smart deep-linking to open your branded Studio review form instantly, with a website widget and a 3-click flow.', icon: 'tabler:help' },
        { title: 'Do I need to give you my Google login?', description: 'No. We use your public Google Business link to sync everything. Your account stays 100% secure.', icon: 'tabler:lock' },
        { title: 'What if I have multiple locations?', description: 'Each studio location requires its own setup. Contact us for "Multi-Artist" or "Multi-Location" discounts!', icon: 'tabler:building-store' },
        { title: 'Is it really a one-time payment?', description: 'Yes. Instead of charging you rent every month like competitors, we charge a single flat fee for the complete setup. You own it for life.', icon: 'tabler:currency-dollar' },
    ]}
  >
    <Fragment slot="bg"><div class="absolute inset-0 bg-blue-50 dark:bg-transparent"></div></Fragment>
  </FAQs>

<Steps2
    class="-mt-16"
    title="Ready to dominate your local market?"
    subtitle="Grow your studio using Testimonial Makeup on autopilot. 100% White-Glove Setup."
    items={[
      {
        title: 'Same-Day Delivery',
        description: 'Get your custom codes and widget instructions in less than 24 hours.',
        icon: 'tabler:bolt',
      },
      {
        title: 'Zero Tech Skills Required',
        description: 'If you can print a piece of paper, you can use this system.',
        icon: 'tabler:tool',
      },
      {
        title: 'Save $600+ Per Year',
        description: 'Stop the "subscription drain." Pay once and never worry about your reputation bill again.',
        icon: 'tabler:coin',
      },
    ]}
    callToAction={{ text: 'Get Started Now - $99 Forever', href: '/pricing/' }}
    image={{ src: '/images/testimonial-3.webp', alt: 'Testimonial Makeup Studio', width: 600, height: 600 }}
  />
</Layout>
INNEREOF

# 3. Update About Page
cat << 'INNEREOF' > src/pages/about.astro
---
import Hero from '~/components/widgets/Hero.astro';
import Hero2 from '~/components/widgets/Hero2.astro';
import Content from '~/components/widgets/Content.astro';
import Layout from '~/layouts/PageLayout.astro';
import Pricing from '~/components/widgets/Pricing.astro';
import { lifetimeDeal } from '~/data/pricingData';

const metadata = {
  title: 'Our Mission - Testimonial Makeup | Built for Artists',
  description: 'We built Testimonial Makeup because artistry is about talent, but business is about trust. Learn how we help makeup studios dominate Google.',
  ignoreTitleTemplate: true,
};
---

<Layout metadata={metadata}>
<Hero2
    tagline="We Grow Your Studio ⭐⭐⭐⭐⭐"
    title='You Create the Art.<br/><span class="text-accent dark:text-white">We Help You Build Your Reputation.</span>'
    subtitle="Amazing makeup artists lose bookings without reviews. We ensure your reputation matches your talent. No monthly fees—just an automated system to keep your books full."
    video="/images/hero-animation.mp4" 
    poster="/images/hero-poster.webp"
    actions={[
      { variant: 'primary', text: 'Claim My Lifetime Access - $99', href: '/pricing/' },
    ]}
  />
  <Content
    isReversed
    items={[
        { title: 'The "Mirror Reveal"', description: 'The best time for a review is the second your client sees their transformation. Your branded QR codes capture that glow before they even leave your chair.', icon: 'tabler:sparkles' },
        { title: 'Local Search SEO', description: 'When someone searches "best makeup artist near me," Google looks for star rating and recency. We automate all three.', icon: 'tabler:map-pin' },
        { title: 'Client Retention', description: 'A client who leaves a 5-star review is 40% more likely to re-book. Our system turns a one-time glam into a lifelong client.', icon: 'tabler:users' },
    ]}
  >
    <Fragment slot="content">
      <h3 class="text-2xl font-bold tracking-tight dark:text-white sm:text-3xl mb-2">
        Why your studio needs <span class="text-accent">Reviews on Autopilot ⭐⭐⭐⭐⭐</span>
      </h3>
      <p>In the beauty industry, your reviews are your digital portfolio—we make sure yours is a 5-star introduction.</p>
    </Fragment>
    <Fragment slot="image">
       <img src="/images/testimonial-4.webp" alt="Happy makeup studio client" class="rounded-lg shadow-xl w-full" />
    </Fragment>
  </Content>

  <Pricing
    class="pb-0"
    title={\`<span class="text-accent dark:text-white">Invest in Your Studio’s Future.</span>\`}
    prices={[lifetimeDeal]}
  />
</Layout>
INNEREOF

# 4. Update Pricing Page
cat << 'INNEREOF' > src/pages/pricing.astro
---
import Layout from '~/layouts/PageLayout.astro';
import HeroText from '~/components/widgets/HeroText.astro';
import Pricing from '~/components/widgets/Pricing.astro';
import FAQs from '~/components/widgets/FAQs.astro';
import Features3 from '~/components/widgets/Features3.astro';
import CallToAction from '~/components/widgets/CallToAction.astro';
import { lifetimeDeal } from '~/data/pricingData';
import Hero from '~/components/widgets/Hero.astro';

const metadata = {
  title: 'Pricing - Testimonial Makeup | Save $600/year',
  description: 'One-time $99 payment for a lifetime of 5-star Google reviews. No monthly fees for your makeup studio.',
  ignoreTitleTemplate: true,
};
---

<Layout metadata={metadata}>
  <HeroText 
    tagline="The Last Review System You'll Ever Buy ⭐⭐⭐⭐⭐"
    title="Stop Paying Monthly Fees." 
    subtitle="Most reputation software charges $50–$150 every month. We charge a flat $99 one-time fee. That is $600+ back in your pocket in the first year alone to invest in your studio."
  />

  <div class="-mt-16">
    <Pricing
      id="pricing"
      title="Invest Once. Grow Forever."
      subtitle="Full White-Glove Setup Included. We build the engine; you focus on your clients."
      prices={[lifetimeDeal]}
    />
  </div>

  <Features3
    title="What is included in your $99 setup?"
    subtitle="We handle the heavy lifting so you can stay at the makeup station."
    columns={3}
    items={[
      {
        title: 'High-Scan Station Signs',
        description: 'Custom-designed QR codes for your makeup station, optimized to capture that "post-glam glow".',
        icon: 'tabler:qrcode',
      },
      {
        title: 'Direct Google Maps Sync',
        description: 'We connect your engine directly to your Google Business Profile to boost your local rankings.',
        icon: 'tabler:brand-google',
      },
      {
        title: 'The "Wall of Love" Widget',
        description: 'A beautiful, automated widget for your website that showcases your best 5-star reviews.',
        icon: 'tabler:code',
      },
      {
        title: 'Unlimited 5-Star Reviews',
        description: 'No caps or per-review fees. Collect 10 or 10,000—your price never changes.',
        icon: 'tabler:infinity',
      },
    ]}
  />
</Layout>
INNEREOF

# 5. Update Pricing Component (PayPal Verbiage)
sed -i 's/HairTestimonial QR Review Engine Forever Plan/MakeupTestimonial QR Review Engine Forever Plan/g' src/components/widgets/Pricing.astro
sed -i 's/HTFP99/MTFP99/g' src/components/widgets/Pricing.astro
sed -i 's/Salon Name/Studio Name/g' src/components/widgets/Pricing.astro
sed -i 's/Salon Business Name/Studio Business Name/g' src/components/widgets/Pricing.astro

# 6. Update Contact Page
sed -i "s/Let's Talk About Your Salon/Let's Talk About Your Studio/g" src/pages/contact.astro
sed -i 's/faster than a blow-dry/faster than a setting spray/g' src/pages/contact.astro

# 7. Update Announcement
cat << 'INNEREOF' > src/components/widgets/Announcement.astro
---
---
<div class="dark text-sm bg-black hidden md:flex items-center justify-center overflow-hidden px-3 py-2 relative text-ellipsis whitespace-nowrap">
  <div class="flex items-center gap-2">
    <span>⭐️⭐️⭐️⭐️⭐️ </span>
    <span class="text-white font-medium">
      ✨ Capture glowing reviews effortlessly and boost your studio&#39;s bookings.
    </span>
  </div>
  <div class="absolute right-4 top-0 h-full flex items-center">
    <span class="text-white font-medium">Same-day setup. Just $99</span>
  </div>
</div>
INNEREOF

# 8. Git Push
git add .
git commit -m "Rebrand complete: Hair Salon to Makeup Studio"
git push origin main

echo "Rebrand successfully applied and pushed to GitHub!"
