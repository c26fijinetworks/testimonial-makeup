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
