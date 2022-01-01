<template>
  <global-header v-if="!excludeList.includes(route.path)"></global-header>
  <div :class="{'pt-16': !excludeList.includes(route.path)}">
    <router-view></router-view>
  </div>
  <global-footer v-if="route.path === '/'"></global-footer>
</template>

<script setup>
import { useRoute } from 'vue-router';
import GlobalFooter from './components/GlobalFooter.vue';
import GlobalHeader from './components/GlobalHeader.vue';
const route = useRoute()
const excludeList = ['/markdown', '/reader']
</script>