<template>
<div class="bg-page-bg sm:pt-8 min-h-screen">
  <div class="rounded-lg bg-gray-200 overflow-hidden shadow divide-y divide-gray-200 mx-auto sm:max-w-7xl sm:divide-y-0 sm:grid sm:grid-cols-2 sm:gap-px">
    <div v-for="(action, actionIdx) in actions" :key="action.title" :class="[actionIdx === 0 ? 'rounded-tl-lg rounded-tr-lg sm:rounded-tr-none' : '', actionIdx === 1 ? 'sm:rounded-tr-lg' : '', actionIdx === actions.length - 2 ? 'sm:rounded-bl-lg' : '', actionIdx === actions.length - 1 ? 'rounded-bl-lg rounded-br-lg sm:rounded-bl-none' : '', 'relative group bg-white p-6 focus-within:ring-2 focus-within:ring-inset focus-within:ring-indigo-500']">
      <div>
        <span :class="[action.iconBackground, action.iconForeground, 'rounded-lg inline-flex p-3 ring-4 ring-white']">
          <component :is="action.icon" class="h-6 w-6" aria-hidden="true" />
        </span>
      </div>
      <div class="mt-8">
        <h3 class="text-lg font-medium">
          <a :href="action.href" class="focus:outline-none">
            <span class="absolute inset-0" aria-hidden="true" />
            {{ action.title }}
          </a>
        </h3>
        <p class="mt-2 text-sm text-gray-500">
          {{action.desc}}
        </p>
      </div>
      <span class="pointer-events-none absolute top-6 right-6 text-gray-300 group-hover:text-gray-400" aria-hidden="true">
        <svg class="h-6 w-6" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 24 24">
          <path d="M20 4h1a1 1 0 00-1-1v1zm-1 12a1 1 0 102 0h-2zM8 3a1 1 0 000 2V3zM3.293 19.293a1 1 0 101.414 1.414l-1.414-1.414zM19 4v12h2V4h-2zm1-1H8v2h12V3zm-.707.293l-16 16 1.414 1.414 16-16-1.414-1.414z" />
        </svg>
      </span>
    </div>
  </div>
</div>
</template>

<script setup>
import {
AcademicCapIcon,
BadgeCheckIcon,
CashIcon,
ClockIcon,
ReceiptRefundIcon,
UsersIcon
} from '@heroicons/vue/outline';

const actions = [
  {
    id: 1,
    title: '修仙DAO',
    href: '#/detail?id=1',
    desc: '注重传统文化和武侠文化的融合，以及人物的感情，历练，感悟。虽有着天马行空的想象力，但更富有侠客文化的‘道义精神’。',
    icon: ClockIcon,
    iconForeground: 'text-teal-700',
    iconBackground: 'bg-teal-50',
  },
  {
    id: 2,
    title: '科幻DAO',
    href: '#/detail?id=2',
    desc: '尊重科学结论的基础上进行合理设想。',
    icon: BadgeCheckIcon,
    iconForeground: 'text-purple-700',
    iconBackground: 'bg-purple-50',
  },
  {
    id: 3,
    title: '玄幻DAO',
    href: '#/detail?id=3',
    desc: '不受科学与人文的限制，也不受时空的限制，励志，热血。',
    icon: UsersIcon,
    iconForeground: 'text-sky-700',
    iconBackground: 'bg-sky-50',
  },
  { id: 4, title: '灵异DAO', href: '#/detail?id=4', desc: '着重于人自身的进化与发展，亦生动描绘了妖精灵怪的种种逸闻趣事，旨在志异。', icon: CashIcon, iconForeground: 'text-yellow-700', iconBackground: 'bg-yellow-50' },
  {
    id: 5,
    title: '悬疑DAO',
    href: '#/detail?id=5',
    desc: '把种种无法解释的悬念用科学的方法解释。',
    icon: ReceiptRefundIcon,
    iconForeground: 'text-rose-700',
    iconBackground: 'bg-rose-50',
  },
  {
    id: 6,
    title: '无限流DAO',
    href: '#/detail?id=6',
    desc: '现世所未知的科技或异能创造的独特空间。',
    icon: AcademicCapIcon,
    iconForeground: 'text-indigo-700',
    iconBackground: 'bg-indigo-50',
  },
]
</script>