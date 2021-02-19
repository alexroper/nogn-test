// This is where project configuration and plugin options are located.
// Learn more: https://gridsome.org/docs/config

// Changes here require a server restart.
// To restart press CTRL + C in terminal and run `gridsome develop`

module.exports = {
  siteName: 'Nogn Test',
  plugins: [
    {
      use: '@nogn/gridsome-source-craft',
      options: {
        url: process.env.CRAFT_API_URL,
        livePreview: process.env.CRAFT_LIVE_PREVIEW || false, // Use false in production
      },
    },
  ],
}
