From: "ebradsha@gmail.com" <ebradsha@gmail.com>
Subject: Frequent NIC lock-ups requiring power cycle
Date: Sun, 1 Jul 2018 04:54:51 -0700
Message-ID: <CAK+Cf7PgBBh1G3BZ=mVz5b6189gk4nT8RD+GOzCETSCS4+bnOQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0672820191876286106=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=2hf0=jr=gmail.com=ebradsha@srs-us1.protection.inumbo.net>)
 id 1fZax7-0004Kj-4i
 for xen-devel@lists.xenproject.org; Sun, 01 Jul 2018 11:55:37 +0000
Received: by mail-lf0-x241.google.com with SMTP id m13-v6so9901893lfb.12
 for <xen-devel@lists.xenproject.org>; Sun, 01 Jul 2018 04:55:33 -0700 (PDT)
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

--===============0672820191876286106==
Content-Type: multipart/alternative; boundary="0000000000000879cf056feec2ca"

--0000000000000879cf056feec2ca
Content-Type: text/plain; charset="UTF-8"

We have a server with running CentOS 7 with the 4.9.75-29.el7.x86_64 kernel
and a Broadcom PCI network card BCM-95720A2003G.

The server receives a fair amount of traffic (~3-4TB per month) with an
even split between uploads/downloads and ~40 HTTP requests per second. Not
a trivial amount of traffic, but nothing crazy either.

We've had recurring problems where our NIC locks up and the server must be
power cycled in order to restore network connectivity. We've had this both
with the on-board Intel NIC, a PCI Broadcom network card (listed above), on
CentOS 6, CentOS 7 and on different physical machines (albeit all of them
Dell C6100s with XS23-TY3 mobo).

Our system logs show the following at the time of the crash (see below).

The issue appears to be related to the Xen kernel and/or the network
driver. Given that we've had this same issue across different brands of
network cards -- I'm guessing it's more related to the kernel.

Anyone have any suggestions for how we might resolve or mitigate this issue?

Jun 29 23:03:52 server1 kernel: ------------[ cut here ]------------
Jun 29 23:03:52 server1 kernel: WARNING: CPU: 0 PID: 0 at
net/sched/sch_generic.c:316 dev_watchdog+0x217/0x220
Jun 29 23:03:52 server1 kernel: NETDEV WATCHDOG: p55p1 (tg3): transmit
queue 0 timed out
Jun 29 23:03:52 server1 kernel: Modules linked in: br_netfilter
xen_blkfront dm_crypt tun drbd lru_cache libcrc32c bridge stp llc
ip6t_REJECT nf_reject_ipv6 nf_conntrack_ipv6 nf_defrag_ipv6 xt_conntrack
nf_conntrack ip6table_filter ip6_$
Jun 29 23:03:52 server1 kernel: CPU: 0 PID: 0 Comm: swapper/0 Not tainted
4.9.75-29.el7.x86_64 #1
Jun 29 23:03:52 server1 kernel: Hardware name: Dell     XS23-TY3    /
, BIOS 1.62 06/24/2011
Jun 29 23:03:52 server1 kernel: ffff88007ca03dd0 ffffffff813f6f05
ffff88007ca03e20 0000000000000000
Jun 29 23:03:52 server1 kernel: ffff88007ca03e10 ffffffff810a7341
0000013c11b64726 0000000000000000
Jun 29 23:03:52 server1 kernel: ffff880074dbe000 0000000000000005
0000000000000000 ffff880074dbe000
Jun 29 23:03:52 server1 kernel: Call Trace:
Jun 29 23:03:52 server1 kernel: <IRQ>
Jun 29 23:03:52 server1 kernel: [<ffffffff813f6f05>] dump_stack+0x63/0x8e
Jun 29 23:03:52 server1 kernel: [<ffffffff810a7341>] __warn+0xd1/0xf0
Jun 29 23:03:52 server1 kernel: [<ffffffff810a73af>]
warn_slowpath_fmt+0x4f/0x60
Jun 29 23:03:52 server1 kernel: [<ffffffff811198ea>] ?
hrtimer_interrupt+0xca/0x190
Jun 29 23:03:52 server1 kernel: [<ffffffff81787387>]
dev_watchdog+0x217/0x220
Jun 29 23:03:52 server1 kernel: [<ffffffff81787170>] ?
dev_deactivate_queue.constprop.27+0x60/0x60
Jun 29 23:03:52 server1 kernel: [<ffffffff81116c05>]
call_timer_fn+0x35/0x120
Jun 29 23:03:52 server1 kernel: [<ffffffff8111770c>]
run_timer_softirq+0x1dc/0x460
Jun 29 23:03:52 server1 kernel: [<ffffffff810228a5>] ?
xen_clocksource_read+0x15/0x20
Jun 29 23:03:52 server1 kernel: [<ffffffff81035639>] ? sched_clock+0x9/0x10
Jun 29 23:03:52 server1 kernel: [<ffffffff810d7672>] ?
sched_clock_cpu+0x72/0xa0
Jun 29 23:03:52 server1 kernel: [<ffffffff81883881>] __do_softirq+0xd1/0x283
Jun 29 23:03:52 server1 kernel: [<ffffffff810ad479>] irq_exit+0xe9/0x100
Jun 29 23:03:52 server1 kernel: [<ffffffff814ded65>]
xen_evtchn_do_upcall+0x35/0x50
Jun 29 23:03:52 server1 kernel: [<ffffffff81880c5e>]
xen_do_hypervisor_callback+0x1e/0x40
Jun 29 23:03:52 server1 kernel: <EOI>
Jun 29 23:03:52 server1 kernel: [<ffffffff810013aa>] ?
xen_hypercall_sched_op+0xa/0x20
Jun 29 23:03:52 server1 kernel: [<ffffffff810013aa>] ?
xen_hypercall_sched_op+0xa/0x20
Jun 29 23:03:52 server1 kernel: [<ffffffff81022710>] ?
xen_safe_halt+0x10/0x20
Jun 29 23:03:52 server1 kernel: [<ffffffff8187efae>] ?
default_idle+0x1e/0xd0
Jun 29 23:03:52 server1 kernel: [<ffffffff810368ff>] ?
arch_cpu_idle+0xf/0x20
Jun 29 23:03:52 server1 kernel: [<ffffffff8187f3cc>] ?
default_idle_call+0x2c/0x40
Jun 29 23:03:52 server1 kernel: [<ffffffff810ecd2c>] ?
cpu_startup_entry+0x1ac/0x240
Jun 29 23:03:52 server1 kernel: [<ffffffff818729b7>] ? rest_init+0x77/0x80
Jun 29 23:03:52 server1 kernel: [<ffffffff81fb0148>] ?
start_kernel+0x4ac/0x4b9
Jun 29 23:03:52 server1 kernel: [<ffffffff81fafa8a>] ?
set_init_arg+0x55/0x55
Jun 29 23:03:52 server1 kernel: [<ffffffff81faf5d7>] ?
x86_64_start_reservations+0x24/0x26
Jun 29 23:03:52 server1 kernel: [<ffffffff81fb6cf7>] ?
xen_start_kernel+0x56a/0x576
Jun 29 23:03:52 server1 kernel: ---[ end trace e79c6881e97dc64a ]---
Jun 29 23:03:52 server1 kernel: tg3 0000:03:00.0 p55p1: transmit timed out,
resetting
Jun 29 23:03:52 server1 kernel: tg3 0000:03:00.0 p55p1: 0x00000000:
0x165f14e4, 0x00100546, 0x02000000, 0x00800040
Jun 29 23:03:52 server1 kernel: tg3 0000:03:00.0 p55p1: 0x00000010:
0xf9fd000c, 0x00000000, 0xf9ff000c, 0x00000000
Jun 29 23:03:52 server1 kernel: tg3 0000:03:00.0 p55p1: 0x00000460:
0x00000008, 0x00002620, 0x01ff0106, 0x00000000
Jun 29 23:03:52 server1 kernel: tg3 0000:03:00.0 p55p1: 0x00000470:
0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff
Jun 29 23:03:52 server1 kernel: tg3 0000:03:00.0 p55p1: 0x00000480:
0x42000000, 0x7fffffff, 0x06000004, 0x7fffffff

--0000000000000879cf056feec2ca
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">We have a server with running CentOS 7 with the=C2=A04.9.7=
5-29.el7.x86_64 kernel and a Broadcom PCI network card=C2=A0BCM-95720A2003G=
.<div><br></div><div>The server receives a fair amount of traffic (~3-4TB p=
er month) with an even split between uploads/downloads and ~40 HTTP request=
s per second. Not a trivial amount of traffic, but nothing crazy either.</d=
iv><div><br></div><div>We&#39;ve had recurring problems where our NIC locks=
 up and the server must be power cycled in order to restore network connect=
ivity. We&#39;ve had this both with the on-board Intel NIC, a PCI Broadcom =
network card (listed above), on CentOS 6, CentOS 7 and on different physica=
l machines (albeit all of them Dell C6100s with=C2=A0XS23-TY3 mobo).</div><=
div><br></div><div>Our system logs show the following at the time of the cr=
ash (see below).</div><div><br></div><div>The issue appears to be related t=
o the Xen kernel and/or the network driver. Given that we&#39;ve had this s=
ame issue across different brands of network cards -- I&#39;m guessing it&#=
39;s more related to the kernel.</div><div><br></div><div>Anyone have any s=
uggestions for how we might resolve or mitigate this issue?</div><div><br><=
/div><div><div>Jun 29 23:03:52 server1 kernel: ------------[ cut here ]----=
--------</div><div>Jun 29 23:03:52 server1 kernel: WARNING: CPU: 0 PID: 0 a=
t net/sched/sch_generic.c:316 dev_watchdog+0x217/0x220</div><div>Jun 29 23:=
03:52 server1 kernel: NETDEV WATCHDOG: p55p1 (tg3): transmit queue 0 timed =
out</div><div>Jun 29 23:03:52 server1 kernel: Modules linked in: br_netfilt=
er xen_blkfront dm_crypt tun drbd lru_cache libcrc32c bridge stp llc ip6t_R=
EJECT nf_reject_ipv6 nf_conntrack_ipv6 nf_defrag_ipv6 xt_conntrack nf_connt=
rack ip6table_filter ip6_$</div><div>Jun 29 23:03:52 server1 kernel: CPU: 0=
 PID: 0 Comm: swapper/0 Not tainted 4.9.75-29.el7.x86_64 #1</div><div>Jun 2=
9 23:03:52 server1 kernel: Hardware name: Dell=C2=A0 =C2=A0 =C2=A0XS23-TY3=
=C2=A0 =C2=A0 /=C2=A0 =C2=A0 =C2=A0 , BIOS 1.62 06/24/2011</div><div>Jun 29=
 23:03:52 server1 kernel: ffff88007ca03dd0 ffffffff813f6f05 ffff88007ca03e2=
0 0000000000000000</div><div>Jun 29 23:03:52 server1 kernel: ffff88007ca03e=
10 ffffffff810a7341 0000013c11b64726 0000000000000000</div><div>Jun 29 23:0=
3:52 server1 kernel: ffff880074dbe000 0000000000000005 0000000000000000 fff=
f880074dbe000</div><div>Jun 29 23:03:52 server1 kernel: Call Trace:</div><d=
iv>Jun 29 23:03:52 server1 kernel: &lt;IRQ&gt;</div><div>Jun 29 23:03:52 se=
rver1 kernel: [&lt;ffffffff813f6f05&gt;] dump_stack+0x63/0x8e</div><div>Jun=
 29 23:03:52 server1 kernel: [&lt;ffffffff810a7341&gt;] __warn+0xd1/0xf0</d=
iv><div>Jun 29 23:03:52 server1 kernel: [&lt;ffffffff810a73af&gt;] warn_slo=
wpath_fmt+0x4f/0x60</div><div>Jun 29 23:03:52 server1 kernel: [&lt;ffffffff=
811198ea&gt;] ? hrtimer_interrupt+0xca/0x190</div><div>Jun 29 23:03:52 serv=
er1 kernel: [&lt;ffffffff81787387&gt;] dev_watchdog+0x217/0x220</div><div>J=
un 29 23:03:52 server1 kernel: [&lt;ffffffff81787170&gt;] ? dev_deactivate_=
queue.constprop.27+0x60/0x60</div><div>Jun 29 23:03:52 server1 kernel: [&lt=
;ffffffff81116c05&gt;] call_timer_fn+0x35/0x120</div><div>Jun 29 23:03:52 s=
erver1 kernel: [&lt;ffffffff8111770c&gt;] run_timer_softirq+0x1dc/0x460</di=
v><div>Jun 29 23:03:52 server1 kernel: [&lt;ffffffff810228a5&gt;] ? xen_clo=
cksource_read+0x15/0x20</div><div>Jun 29 23:03:52 server1 kernel: [&lt;ffff=
ffff81035639&gt;] ? sched_clock+0x9/0x10</div><div>Jun 29 23:03:52 server1 =
kernel: [&lt;ffffffff810d7672&gt;] ? sched_clock_cpu+0x72/0xa0</div><div>Ju=
n 29 23:03:52 server1 kernel: [&lt;ffffffff81883881&gt;] __do_softirq+0xd1/=
0x283</div><div>Jun 29 23:03:52 server1 kernel: [&lt;ffffffff810ad479&gt;] =
irq_exit+0xe9/0x100</div><div>Jun 29 23:03:52 server1 kernel: [&lt;ffffffff=
814ded65&gt;] xen_evtchn_do_upcall+0x35/0x50</div><div>Jun 29 23:03:52 serv=
er1 kernel: [&lt;ffffffff81880c5e&gt;] xen_do_hypervisor_callback+0x1e/0x40=
</div><div>Jun 29 23:03:52 server1 kernel: &lt;EOI&gt;</div><div>Jun 29 23:=
03:52 server1 kernel: [&lt;ffffffff810013aa&gt;] ? xen_hypercall_sched_op+0=
xa/0x20</div><div>Jun 29 23:03:52 server1 kernel: [&lt;ffffffff810013aa&gt;=
] ? xen_hypercall_sched_op+0xa/0x20</div><div>Jun 29 23:03:52 server1 kerne=
l: [&lt;ffffffff81022710&gt;] ? xen_safe_halt+0x10/0x20</div><div>Jun 29 23=
:03:52 server1 kernel: [&lt;ffffffff8187efae&gt;] ? default_idle+0x1e/0xd0<=
/div><div>Jun 29 23:03:52 server1 kernel: [&lt;ffffffff810368ff&gt;] ? arch=
_cpu_idle+0xf/0x20</div><div>Jun 29 23:03:52 server1 kernel: [&lt;ffffffff8=
187f3cc&gt;] ? default_idle_call+0x2c/0x40</div><div>Jun 29 23:03:52 server=
1 kernel: [&lt;ffffffff810ecd2c&gt;] ? cpu_startup_entry+0x1ac/0x240</div><=
div>Jun 29 23:03:52 server1 kernel: [&lt;ffffffff818729b7&gt;] ? rest_init+=
0x77/0x80</div><div>Jun 29 23:03:52 server1 kernel: [&lt;ffffffff81fb0148&g=
t;] ? start_kernel+0x4ac/0x4b9</div><div>Jun 29 23:03:52 server1 kernel: [&=
lt;ffffffff81fafa8a&gt;] ? set_init_arg+0x55/0x55</div><div>Jun 29 23:03:52=
 server1 kernel: [&lt;ffffffff81faf5d7&gt;] ? x86_64_start_reservations+0x2=
4/0x26</div><div>Jun 29 23:03:52 server1 kernel: [&lt;ffffffff81fb6cf7&gt;]=
 ? xen_start_kernel+0x56a/0x576</div><div>Jun 29 23:03:52 server1 kernel: -=
--[ end trace e79c6881e97dc64a ]---</div><div>Jun 29 23:03:52 server1 kerne=
l: tg3 0000:03:00.0 p55p1: transmit timed out, resetting</div><div>Jun 29 2=
3:03:52 server1 kernel: tg3 0000:03:00.0 p55p1: 0x00000000: 0x165f14e4, 0x0=
0100546, 0x02000000, 0x00800040</div><div>Jun 29 23:03:52 server1 kernel: t=
g3 0000:03:00.0 p55p1: 0x00000010: 0xf9fd000c, 0x00000000, 0xf9ff000c, 0x00=
000000</div><div>Jun 29 23:03:52 server1 kernel: tg3 0000:03:00.0 p55p1: 0x=
00000460: 0x00000008, 0x00002620, 0x01ff0106, 0x00000000</div><div>Jun 29 2=
3:03:52 server1 kernel: tg3 0000:03:00.0 p55p1: 0x00000470: 0xffffffff, 0xf=
fffffff, 0xffffffff, 0xffffffff</div><div>Jun 29 23:03:52 server1 kernel: t=
g3 0000:03:00.0 p55p1: 0x00000480: 0x42000000, 0x7fffffff, 0x06000004, 0x7f=
ffffff</div></div></div>

--0000000000000879cf056feec2ca--


--===============0672820191876286106==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0672820191876286106==--
