From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: crash in csched_load_balance after xl vcpu-pin
Date: Tue, 10 Apr 2018 18:28:58 +0200
Message-ID: <ebdd4cb871b2d754959e8358641810d61b3d0856.camel@suse.com>
References: <20180410085729.GA472@aepfle.de> <20180410155949.GB7177@aepfle.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1636298864904622536=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180410155949.GB7177@aepfle.de>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Olaf Hering <olaf@aepfle.de>, xen-devel@lists.xen.org
Cc: George Dunlap <george.dunlap@citrix.com>
List-Id: xen-devel@lists.xenproject.org


--===============1636298864904622536==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-qkiEBORWwzwuiqoLCP/U"


--=-qkiEBORWwzwuiqoLCP/U
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2018-04-10 at 17:59 +0200, Olaf Hering wrote:
> On Tue, Apr 10, Olaf Hering wrote:
>=20
> > (XEN) Xen BUG at sched_credit.c:1694
>=20
> And another one with debug=3Dy and this config:
>
Wow...

> memory=3D4444
> vcpus=3D36
> cpu=3D"nodes:1,^node:0"
> cpu_soft=3D"nodes:1,^node:0"
>
As said, its cpus=3D and cpus_soft=3D, and you probably just need

cpus=3D"node:1"
cpus_soft=3D"node:1"

Or, even just:

cpus=3D"node:1"

as, if soft-affinity is set to be equal to hard, it is just ignored.

> (nodes=3D1 cycles between 1-3 for each following domU).
>=20
> (XEN) Assertion 'CSCHED_PCPU(cpu)->nr_runnable >=3D 1' failed at
> sched_credit.c:269
> (XEN) ----[ Xen-4.11.20180407T144959.e62e140daa-
> 4.bug1087289_411  x86_64  debug=3Dy   Not tainted ]----
> (XEN) CPU:    18
> (XEN) RIP:    e008:[<ffff82d08022b2e8>]
> sched_credit.c#csched_schedule+0x8fe/0xd42
> (XEN) RFLAGS: 0000000000010046   CONTEXT: hypervisor (d0v18)
> ...
> (XEN) Xen call trace:
> (XEN)    [<ffff82d08022b2e8>]
> sched_credit.c#csched_schedule+0x8fe/0xd42
> (XEN)    [<ffff82d080236406>] schedule.c#schedule+0x107/0x627
> (XEN)    [<ffff82d080239ec5>] softirq.c#__do_softirq+0x85/0x90
> (XEN)    [<ffff82d080239f1a>] do_softirq+0x13/0x15
> (XEN)    [<ffff82d08036e566>]
> x86_64/entry.S#process_softirqs+0x6/0x10
>
Yeah, thanks for trying with debugging on. Unfortunately, stack traces
in these case are not very helpful, as they only tell us that
schedule() is being called by do_softirq()... :-P

Still...

> (XEN) ****************************************
> (XEN) Panic on CPU 18:
> (XEN) Assertion 'CSCHED_PCPU(cpu)->nr_runnable >=3D 1' failed at
> sched_credit.c:269
>
...it is another, different, one, this time when removing (or not
reinserting) the vcpu from the runqueue.

What would be helpful, would be to catch the other side of the race,
i.e., the point when the vcpu is being re-insterted in the runqueue, or
when v->processor of a vcpu in the runqueue is changed.... Let's see if
the debug patch will help with this.

Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/
--=-qkiEBORWwzwuiqoLCP/U
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlrM5koACgkQFkJ4iaW4
c+4eSA//eB2STjBMZqzbsTWJbWirTlg2D9pKjfB/UUiyjG/akzrh1Ulwq+lzHuyw
5Vgl1q+cRHZaCNgMucNUVtI4b/usFEp5z2h/TEesy9aHLKVtDjWEQSj5x48e3Fau
bHc3c4HWtkDU4+JJa8tyEofsTrBl3trZW9a5eAAnALC5n0FG3hsDi+ZPMTJQ9hZr
hbUnr5IT8pQ+ecB7yj7t1vYjJOu9e5VIDly0M/J7rU9Mw23Y/o1FH/MezhXFAW2V
9ETvPQteShdw/tWuaX/rAfjIlCHo1rnQQ/G8kNIKb3WK5GXZwPNvu4lUuLi1ZQrh
srKUKxdfeexDptSPQcQpcZZmRttKkHCZmUrkfmkvOvHsPZCoo98WMvb0+hrsznfd
PQJYvg9QvZJzNvs7r7NVW63Vr6uZCoDZQ006PVi8U6lWklv+76v/iS0/Qf+nOa47
uMoBYtrL+ppt/VJYwpDwm/uauxKq0q/fc3cOoImsCEsoENypmYlJRpnIdvFhED3Z
kopCgPTyz9E/PFHvQSyJ3GbCG4JIGpfU5umYGq0TkReq5E0WWfx/RXbyi5JA8CZY
VH6+6bnNabjrEIHhGIpNg12fpl7L9S1lhyxEXlaghycwasjLVdev6EMSk+cRLT//
Z3q4JrzHRi1It37GHcwpnMX0dwdgpChaUEyJGRT9s8aUTSaaxhs=
=jWdc
-----END PGP SIGNATURE-----

--=-qkiEBORWwzwuiqoLCP/U--



--===============1636298864904622536==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1636298864904622536==--
