module.exports = {
	content: ['./index.html', './src/**/*.{vue,js,ts,jsx,tsx}'],
	theme: {
		extend: {
			colors: {
				'page-bg': '#f0f2f5',
				'page-bg-red': 'red',
				'page-bg-editor': '#edeff3',
			},
			width: {
				1200: '1200px',
			},
		},
	},
	plugins: [],
}
