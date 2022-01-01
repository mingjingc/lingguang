<template>
  <!-- 首屏介绍 -->
  <div class='relative overflow-hidden'>
    <main>
      <div class="pt-10 bg-gray-900 sm:pt-16 lg:pt-8 lg:pb-14 lg:overflow-hidden">
          <div class="mx-auto max-w-7xl lg:px-8">
            <div class="lg:grid lg:grid-cols-2 lg:gap-8">
              <div class="mx-auto max-w-md px-4 sm:max-w-2xl sm:px-6 sm:text-center lg:px-0 lg:text-left lg:flex lg:items-center">
                <div class="lg:py-24">
                  <h1 class="mt-4 text-4xl tracking-tight font-extrabold text-white sm:mt-5 sm:text-6xl lg:mt-6 xl:text-6xl">
                    <span class="block">灵光</span>
                    <span class="pb-3 mt-6 block text-base sm:text-xl lg:text-lg xl:text-xl bg-clip-text text-transparent bg-gradient-to-r from-teal-200 to-cyan-400 sm:pb-5">
                      灵光是由灵光DAO打造的去中心化协作创作平台，意在于收集单人的零散灵感，借助于多人的协作力量，让单人的灵感可以被他人续写，用多人的力量共同推动有趣灵感落地，同时通过经济规则让创作者、投资人和用户都能获取收益。
                    </span>
                  </h1>
                  <!-- <p class="text-base text-gray-300 sm:text-xl lg:text-lg xl:text-xl">
                    用户可以在灵光DAO做什么，获得什么（待文案）
                  </p> -->
                </div>
              </div>
              <div class="mt-12 -mb-16 sm:-mb-48 lg:m-0 lg:relative">
                <div class="mx-auto max-w-md px-4 sm:max-w-2xl sm:px-6 lg:max-w-none lg:px-0">
                  <img class="w-full lg:absolute lg:inset-y-0 lg:left-0 lg:h-full lg:w-auto lg:max-w-none" src="../../assets/images/banner1.svg" alt="" />
                </div>
              </div>
            </div>
          </div>
        </div>
    </main>
  </div>

  <!-- 愿景 -->
  <div class="relative bg-white py-16 sm:py-20 lg:py-24">
    <div class="mx-auto max-w-md px-4 text-center sm:max-w-3xl sm:px-6 lg:px-8 lg:max-w-7xl">
      <!-- <h2 class="text-base font-semibold tracking-wider text-indigo-600 uppercase"></h2> -->
      <p class="mt-2 text-3xl font-extrabold text-gray-900 tracking-tight sm:text-4xl">
        我们的愿景
      </p>
      <p class="mt-5 max-w-prose mx-auto text-xl text-gray-500">
        让灵光耀眼，为灵感变现！
      </p>
      <div class="mt-12">
        <div class="grid grid-cols-1 gap-8 sm:grid-cols-2 lg:grid-cols-3">
          <div v-for="feature in features" :key="feature.name" class="pt-6">
            <div class="flow-root bg-gray-50 rounded-lg px-6 pb-8">
              <div class="-mt-6">
                <div>
                  <span class="inline-flex items-center justify-center p-3 bg-indigo-500 rounded-md shadow-lg">
                    <component :is="feature.icon" class="h-6 w-6 text-white" aria-hidden="true" />
                  </span>
                </div>
                <h3 class="mt-8 text-lg font-medium text-gray-900 tracking-tight">{{ feature.name }}</h3>
                <p class="mt-5 text-base text-gray-500">
                  {{feature.desc}}
                </p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- 我们的组织 -->
  <div class="relative bg-white pb16 sm:pb-24 lg:pb-32">
     <div class="mx-auto max-w-md px-4 text-center sm:max-w-3xl sm:px-6 lg:px-8 lg:max-w-7xl">
      <!-- <h2 class="text-base font-semibold tracking-wider text-indigo-600 uppercase"></h2> -->
      <p class="mt-2 text-3xl font-extrabold text-gray-900 tracking-tight sm:text-4xl">
        我们的组织
      </p>
      <!-- <div class="flex justify-center items-center mt-9 bg-gray-50 mx-auto max-w-2xl h-96 text-gray-500">

      </div> -->
      <div class="mx-auto max-w-md px-4 sm:max-w-2xl sm:px-6 lg:max-w-none lg:px-0">
        <img class="w-full mx-auto lg:h-full lg:w-auto lg:max-w-none" src="../../assets/images/organize.svg" alt="" />
      </div>
    </div>
  </div>

  <!-- 投资DAO -->
  <div class="bg-gray-50">
    <div class="max-w-7xl mx-auto py-12 px-4 divide-y divide-gray-200 sm:px-6 lg:py-16 lg:px-8">
      <h2 class="text-3xl font-extrabold text-gray-900">
        投资DAO
      </h2>
      <div class="mt-8">
        <dl class="divide-y divide-gray-200">
          <div v-for="faq in faqs_1" :key="faq.id" class="pt-6 pb-8 md:grid md:grid-cols-12 md:gap-8">
            <dt class="text-base font-medium text-gray-900 md:col-span-5">
              {{ faq.question }}
            </dt>
            <dd class="mt-2 md:mt-0 md:col-span-7">
              <p class="text-base text-gray-500">
                {{ faq.answer }}
              </p>
            </dd>
          </div>
        </dl>
      </div>
    </div>
  </div>
  
  <!-- 加入DAO -->
  <div class="bg-gray-50">
    <div class="max-w-7xl mx-auto pb-12 px-4 divide-y divide-gray-200 sm:px-6 lg:pb-16 lg:px-8">
      <h2 class="text-3xl font-extrabold text-gray-900">
        加入DAO
      </h2>
      <div class="mt-8">
        <dl class="divide-y divide-gray-200">
          <div v-for="faq in faqs_2" :key="faq.id" class="pt-6 pb-8 md:grid md:grid-cols-12 md:gap-8">
            <dt class="text-base font-medium text-gray-900 md:col-span-5">
              {{ faq.question }}
            </dt>
            <dd class="mt-2 md:mt-0 md:col-span-7">
              <p class="text-base text-gray-500">
                {{ faq.answer }}
              </p>
            </dd>
          </div>
        </dl>
      </div>
    </div>
  </div>
</template>

<script setup>
import {
CloudUploadIcon, LockClosedIcon, RefreshIcon
} from '@heroicons/vue/outline';

const features = [
  { name: '去中心化', icon: CloudUploadIcon, desc: '没有垄断和剥削，人人都能在DAO中自由创作' },
  { name: '灵感协作', icon: LockClosedIcon, desc: '记录个人灵感碎片，多人协作一起将其实现' },
  { name: '共享收益', icon: RefreshIcon, desc: '每个DAO成员都可以依托代币规则来享受收益' }
]
const faqs_1 = [
  {
    id: 1,
    question: "你能投资什么",
    answer:
      "与传统的投资人概念稍有不同，在灵光DAO中，每一个成员既是DAO的参与者，又是DAO的投资人和受益人。在灵光平台中只要是持有代币就是在做投资，每个投资人都能够从自己所持有的代币所对应的DAO的发展中获得收益。只要拥有代币就是拥有DAO的所有权，直接可以参与到对应DAO的发展建设中去，可以为DAO提供发展提议，也可以给其他人的提议投票。良好的提议和理性的投票都能够为自己带来额外的收入。",
  },
  {
    id: 2,
    question: "你能获得什么",
    answer:
      "持有代币的成员都能公平的享受到那个代币所对应的DAO的发展收益。",
  }
]
const faqs_2 = [
  {
    id: 1,
    question: "你能做什么",
    answer:
      "作为开发者：为灵光平台提供技术支持，可以开发、升级、维护灵光平台。同时还可以参与到开发者DAO自身的建设中去，为开发者DAO的发展提供提议，或为他人的提议投票。良好的提议和理性的投票都能够为自己带来额外的收入。 作为创作者：创作者可以在灵光上组建自己的DAO或加入其它创作者的DAO共同创作，可以借助于平台工具与多人协作的力量将自身想法实现，还可以发行自己的DAO的代币用于管理DAO自身及在dao市场中进行融资。每一个DAO都是自由、独立运行的，他们可以保持独立创作，也可以选择与其他创作者DAO进行合作创作。",
  },
  {
    id: 2,
    question: "你能获得什么",
    answer:
      "作为开发者：开发者DAO的工作是为整个灵光DAO提供技术支撑，灵光DAO会将灵光平台总收入的一定比例分配给开发者DAO（这个分配比例将会定期由整个灵光DAO成员通过投票达成共识来调整），再根据开发者DAO内部的经济规则进行分配（开发者DAO内部的经济规则也会定期由所有开发者投票达成共识来做调整），以确保每一个开发者都能拿到与其付出相对应的收入。作为创作者：对于早期入驻灵光平台的创作者DAO，灵光平台会以按时间递减的方式给予他们创作奖励以帮助其更好发展（奖励金额和递减规则将由早期灵光DAO成员达成共识一起制定）。灵光中的每一个DAO所创作出的作品都会被打上NFT，其所有权属于DAO自身，DAO可自由决定如何使用他们的作品，也可以选择拿到dao市场上进行出售或拍卖。对于有优秀作品的DAO，灵光平台还会为他们做宣传和推广，甚至是投资他们或他们的作品，以及与他们合作。",
  }
]
</script>