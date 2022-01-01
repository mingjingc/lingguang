import { createRouter, createWebHashHistory } from 'vue-router'

const routes = [
	{
		path: '/',
		name: 'home',
		component: () => import('../views/home/home.vue'),
	},
	{
		path: '/literature',
		name: 'literature',
		component: () => import('../views/literature/literature.vue'),
	},
	{
		path: '/cartoon',
		name: 'cartoon',
		component: () => import('../views/cartoon/cartoon.vue'),
	},
	{
		path: '/video',
		name: 'video',
		component: () => import('../views/video/video.vue'),
	},
	{
		path: '/market',
		name: 'market',
		component: () => import('../views/market/market.vue'),
	},
	{
		path: '/detail',
		name: 'detail',
		component: () => import('../views/detail/detail.vue'),
	},
	{
		path: '/markdown',
		name: 'markdown',
		component: () => import('../views/markdown/markdown.vue'),
	},
	{
		path: '/reader',
		name: 'reader',
		component: () => import('../views/reader/reader.vue'),
	},
	{
		path: '/:pathMatch(.*)*',
		name: '404',
		component: () => import('../views/404/404.vue'),
	},
]

const router = createRouter({
	routes,
	history: createWebHashHistory(),
})

router.beforeEach((to) => {})

export default router
