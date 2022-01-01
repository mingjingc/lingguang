<template>
  <div class="min-h-full">
    <header class="bg-gray-50 py-8">
      <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 xl:flex xl:items-center xl:justify-between">
        <div class="flex-1 min-w-0">
          <nav class="flex" aria-label="Breadcrumb">
            <ol role="list" class="flex items-center space-x-4">
              <li>
                <div @click="router.back()" class="flex">
                  <a href="javascript:;" class="text-sm font-medium text-gray-500 hover:text-gray-700">返回</a>
                  <ChevronRightIcon class="flex-shrink-0 h-5 w-5 text-gray-400" aria-hidden="true" />
                </div>
              </li>
            </ol>
          </nav>
          <h1 class="mt-2 text-2xl font-bold leading-7 text-gray-900 sm:text-3xl sm:truncate">
            {{detailMap[route.query.id - 1].title}}
          </h1>
          <div class="mt-1 flex flex-col sm:flex-row sm:flex-wrap sm:mt-0 sm:space-x-8">
            <div class="mt-2 flex items-center text-sm text-gray-500">
              <BriefcaseIcon class="flex-shrink-0 mr-1.5 h-5 w-5 text-gray-400" aria-hidden="true" />
              文学
            </div>
            <div class="mt-2 flex items-center text-sm text-gray-500">
              <CurrencyDollarIcon class="flex-shrink-0 mr-1.5 h-5 w-5 text-gray-400" aria-hidden="true" />
              $120k &ndash; $140k
            </div>
            <div class="mt-2 flex items-center text-sm text-gray-500">
              <CalendarIcon class="flex-shrink-0 mr-1.5 h-5 w-5 text-gray-400" aria-hidden="true" />
              2021/12/25
            </div>
          </div>
        </div>
        <div class="mt-5 flex justify-end xl:mt-0 xl:ml-4">
          <span class="block">
            <button @click="join" type="button" class="inline-flex items-center px-4 py-2 border border-gray-300 rounded-md shadow-sm text-sm font-medium text-gray-700 bg-white hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-offset-gray-50 focus:ring-purple-500">
              <BookmarkIcon class="-ml-1 mr-2 h-5 w-5 text-gray-400" aria-hidden="true" />
              申请加入
            </button>
          </span>
        </div>
      </div>
    </header>

    <main class="pt-8 pb-16">
      <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
        <div class="px-4 sm:px-0">
          <div class="block">
            <div class="border-b border-gray-200">
              <nav class="mt-2 -mb-px flex space-x-8" aria-label="Tabs">
                <div v-for="(tab,tabIndex) in tabs" :key="tab.name" @click="changeTab(tabIndex)" :class="[tab.current ? 'border-purple-500 text-purple-600' : 'border-transparent text-gray-500 hover:text-gray-700 hover:border-gray-200', 'whitespace-nowrap py-4 px-1 border-b-2 font-medium text-sm']">
                  {{ tab.name }}
                  <span v-if="tab.count" :class="[tab.current ? 'bg-purple-100 text-purple-600' : 'bg-gray-100 text-gray-900', 'ml-2 py-0.5 px-2.5 rounded-full text-xs font-medium md:inline-block']">{{ tab.count }}</span>
                </div>
              </nav>
            </div>
          </div>
        </div>

        <div class="sm:flex w-full">
          <div v-show="currentTabIndex === 0" class="flex-1 px-4 sm:px-0">
            <div class="rounded-lg bg-gray-200 overflow-hidden shadow divide-y divide-gray-200 mx-auto sm:max-w-7xl sm:divide-y-0 sm:grid sm:grid-cols-2 sm:gap-px">
              <div v-for="(action, actionIdx) in actions" :key="action.title" :class="[actionIdx === 0 ? 'rounded-tl-lg rounded-tr-lg sm:rounded-tr-none' : '', actionIdx === 1 ? 'sm:rounded-tr-lg' : '', actionIdx === actions.length - 2 ? 'sm:rounded-bl-lg' : '', actionIdx === actions.length - 1 ? 'rounded-bl-lg rounded-br-lg sm:rounded-bl-none' : '', 'relative group bg-white p-6 focus-within:ring-2 focus-within:ring-inset focus-within:ring-indigo-500']">
                <div class="mt-8">
                  <h3 class="text-lg font-medium">
                    <a href="javascript:;" class="focus:outline-none">
                      <span class="absolute inset-0" aria-hidden="true" />
                      {{ action.title }}
                    </a>
                  </h3>
                  <p class="mt-2 text-sm text-gray-500">
                    {{action.desc}}
                  </p>
                </div>
                <div class="mt-5 flex justify-end xl:mt-0 xl:ml-4 relative z-10">
                  <span class="block ml-3">
                    <button @click="toEdit" type="button" class="inline-flex items-center px-4 py-2 border border-gray-300 rounded-md shadow-sm text-sm font-medium text-gray-700 bg-white hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-offset-gray-50 focus:ring-purple-500">
                      <PencilIcon class="-ml-1 mr-2 h-5 w-5 text-gray-400" aria-hidden="true" />
                      编辑
                    </button>
                  </span>
                  <span class="block ml-3">
                    <button @click="toRead" type="button" class="inline-flex items-center px-4 py-2 border border-gray-300 rounded-md shadow-sm text-sm font-medium text-white bg-purple-500 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-offset-gray-50 focus:ring-purple-500">
                      <LinkIcon class="-ml-1 mr-2 h-5 w-5 text-white" aria-hidden="true" />
                      阅读
                    </button>
                  </span>
                </div>
              </div>
            </div>
          </div>
          <div v-show="currentTabIndex === 1" class="flex-1 px-4 sm:px-0">
            <div class="rounded-lg bg-gray-200 overflow-hidden shadow divide-y divide-gray-200 mx-auto sm:max-w-7xl sm:divide-y-0 sm:grid sm:grid-cols-2 sm:gap-px">
              <div v-for="(action, actionIdx) in proposalList" :key="action.title" :class="[actionIdx === 0 ? 'rounded-tl-lg rounded-tr-lg sm:rounded-tr-none' : '', actionIdx === 1 ? 'sm:rounded-tr-lg' : '', actionIdx === actions.length - 2 ? 'sm:rounded-bl-lg' : '', actionIdx === actions.length - 1 ? 'rounded-bl-lg rounded-br-lg sm:rounded-bl-none' : '', 'flex justify-between relative group bg-white p-6 focus-within:ring-2 focus-within:ring-inset focus-within:ring-indigo-500']">
                <div class="">
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
                <div>票数：{{action.vote}}</div>
              </div>
            </div>
          </div>
          <div class="w-full sm:w-64 lg:w-72 p-4">
            <h2 class="mb-3">关于</h2>
            <p class="text-sm text-gray-700">{{detailMap[route.query.id - 1].desc}}</p>
            <h2 class="my-3">成员</h2>
            <div class="flex -space-x-2 overflow-hidden">
              <img class="inline-block h-10 w-10 rounded-full ring-2 ring-white" src="../../assets/images/avatar1.jpeg" alt="" />
              <img class="inline-block h-10 w-10 rounded-full ring-2 ring-white" src="../../assets/images/avatar2.jpeg" alt="" />
              <img class="inline-block h-10 w-10 rounded-full ring-2 ring-white" src="../../assets/images/avatar3.jpeg" alt="" />
              <img class="inline-block h-10 w-10 rounded-full ring-2 ring-white" src="../../assets/images/avatar4.jpeg" alt="" />
            </div>
          </div>
        </div>
      </div>
    </main>
  </div>
</template>

<script setup>
import {
AcademicCapIcon,
BadgeCheckIcon, BookmarkIcon, BriefcaseIcon,
CalendarIcon, CashIcon, ChevronRightIcon, ClockIcon, CurrencyDollarIcon,
LinkIcon, PencilIcon, ReceiptRefundIcon,
UsersIcon
} from '@heroicons/vue/solid'
import { ElNotification } from 'element-plus'
import { h, onMounted, ref } from 'vue'
import { useRoute, useRouter } from 'vue-router'
const router = useRouter()
const route = useRoute()

const currentTabIndex = ref(0)

onMounted(() => {
  console.log('router:', router)
  console.log('route:', route.query.id)
})

const actions = [
  {
    title: '作品一',
    href: '#/detail',
    desc: '描述',
    icon: ClockIcon,
    iconForeground: 'text-teal-700',
    iconBackground: 'bg-teal-50',
  },
  {
    title: '作品二',
    href: '#/detail',
    desc: '描述',
    icon: BadgeCheckIcon,
    iconForeground: 'text-purple-700',
    iconBackground: 'bg-purple-50',
  },
  {
    title: '作品三',
    href: '#/detail',
    desc: '描述',
    icon: UsersIcon,
    iconForeground: 'text-sky-700',
    iconBackground: 'bg-sky-50',
  },
  { title: '作品四', href: '#/detail', desc: '描述', icon: CashIcon, iconForeground: 'text-yellow-700', iconBackground: 'bg-yellow-50' },
  {
    title: '作品五',
    href: '#/detail',
    desc: '描述',
    icon: ReceiptRefundIcon,
    iconForeground: 'text-rose-700',
    iconBackground: 'bg-rose-50',
  },
  {
    title: '作品六',
    href: '#/detail',
    desc: '描述',
    icon: AcademicCapIcon,
    iconForeground: 'text-indigo-700',
    iconBackground: 'bg-indigo-50',
  },
]
const proposalList = [
  {
    title: '提案一',
    vote: 20,
    href: '#/detail',
    desc: '描述',
    icon: ClockIcon,
    iconForeground: 'text-teal-700',
    iconBackground: 'bg-teal-50',
  },
  {
    title: '提案二',
    vote: 30,
    href: '#/detail',
    desc: '描述',
    icon: BadgeCheckIcon,
    iconForeground: 'text-purple-700',
    iconBackground: 'bg-purple-50',
  },
  {
    title: '提案三',
    vote: 40,
    href: '#/detail',
    desc: '描述',
    icon: UsersIcon,
    iconForeground: 'text-sky-700',
    iconBackground: 'bg-sky-50',
  },
  { title: '提案四', vote: 50, href: '#/detail', desc: '描述', icon: CashIcon, iconForeground: 'text-yellow-700', iconBackground: 'bg-yellow-50' },
  {
    title: '提案五',
    vote: 34,
    href: '#/detail',
    desc: '描述',
    icon: ReceiptRefundIcon,
    iconForeground: 'text-rose-700',
    iconBackground: 'bg-rose-50',
  },
  {
    title: '提案六',
    vote: 55,
    href: '#/detail',
    desc: '描述',
    icon: AcademicCapIcon,
    iconForeground: 'text-indigo-700',
    iconBackground: 'bg-indigo-50',
  },
]
const tabs = ref([
  // { name: '简介', href: '#', count: 0, current: true },
  { name: '作品展区', href: '#', count: actions.length, current: true },
  // { name: '成员', href: '#', count: 4, current: false },
  { name: '提案投票', href: '#', count: proposalList.length, current: false },
  // { name: 'Offer', href: '#', current: false },
  // { name: 'Disqualified', href: '#', current: false },
])
const detailMap = [
  {
    id: 1,
    title: '修仙DAO',
    href: '#/detail?id=1',
    desc: '注重传统文化和武侠文化的融合，以及人物的感情，历练，感悟。虽有着天马行空的想象力，但更富有侠客文化的‘道义精神’。'
  },
  {
    id: 2,
    title: '科幻DAO',
    href: '#/detail?id=2',
    desc: '尊重科学结论的基础上进行合理设想。'
  },
  {
    id: 3,
    title: '玄幻DAO',
    href: '#/detail?id=3',
    desc: '不受科学与人文的限制，也不受时空的限制，励志，热血。'
  },
  { id: 4, title: '灵异DAO', href: '#/detail?id=4', desc: '着重于人自身的进化与发展，亦生动描绘了妖精灵怪的种种逸闻趣事，旨在志异。' },
  {
    id: 5,
    title: '悬疑DAO',
    href: '#/detail?id=5',
    desc: '把种种无法解释的悬念用科学的方法解释。'
  },
  {
    id: 6,
    title: '无限流DAO',
    href: '#/detail?id=6',
    desc: '现世所未知的科技或异能创造的独特空间。'
  }
]
const changeTab = (index) => {
  currentTabIndex.value = index
  tabs.value.forEach((item,itemIndex) => {
    if(itemIndex === index) {
      item.current = true
    } else {
      item.current = false
    }
  })
}

const toEdit = () => {
  router.push('/markdown')
}
const toRead = () => {
  router.push('/reader')
}
const join = () => {
  ElNotification({
    title: '申请成功～',
    message: h('i', { style: 'color: teal' }, '待投票通过后即可成为该DAO的一员'),
  })
}
</script>