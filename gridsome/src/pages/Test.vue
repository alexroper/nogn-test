<template>
  <Layout>
    <h2>Testing Nogn</h2>
    <pre>
      #{{ $page.craft.entry.id }}: {{ $page.craft.entry.title }}
    </pre>
  </Layout>
</template>

<page-query>
  query {
    craft {
      entry (section: "test") {
        id
        title
      }
    }
  }
</page-query>