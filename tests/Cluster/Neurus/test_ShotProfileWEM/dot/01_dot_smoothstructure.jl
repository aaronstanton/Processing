using Seismic

m_adj,h = SeisRead("../adj/mpp");
m_rand = rand(size(m_adj));
d_rand = rand(size(m_adj));
SeisWrite("m_rand",m_rand,h);
SeisWrite("d_rand",d_rand,h);

