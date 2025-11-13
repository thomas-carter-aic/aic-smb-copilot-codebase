
import Fastify from 'fastify'
import fetch from 'node-fetch'
const app = Fastify({ logger: true })
const ORDERS = process.env.ORDERS_URL || 'http://orders:8080'
app.get('/health', async () => ({ ok: true }))
app.post('/api/orders', async (req, reply) => {
  const res = await fetch(`${ORDERS}/orders`, { method:'POST', headers:{'content-type':'application/json'}, body: JSON.stringify(req.body || {}) })
  const data = await res.json()
  reply.code(res.status).send(data)
})
app.get('/api/orders/:id', async (req, reply) => {
  const res = await fetch(`${ORDERS}/orders/${req.params.id}`)
  const data = await res.json().catch(() => ({}))
  reply.code(res.status).send(data)
})
const port = process.env.PORT || 8080
app.listen({ port, host:'0.0.0.0' })
