From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: crash in csched_load_balance after xl vcpu-pin
Date: Tue, 10 Apr 2018 12:33:20 +0200
Message-ID: <fb3c729d6f2f98e8663287fcd4746bd2c11994e1.camel@suse.com>
References: <20180410085729.GA472@aepfle.de>
 <1FC4A4E4-BA31-4B3A-9D3A-7E31CAAC9AE5@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6181891034185227054=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1FC4A4E4-BA31-4B3A-9D3A-7E31CAAC9AE5@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <George.Dunlap@citrix.com>, Olaf Hering <olaf@aepfle.de>
Cc: "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org


--===============6181891034185227054==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-saUfEpPsSLk3XgxxsqS4"


--=-saUfEpPsSLk3XgxxsqS4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2018-04-10 at 09:34 +0000, George Dunlap wrote:
> Assuming the bug is this one:
>=20
> BUG_ON( cpu !=3D snext->vcpu->processor );
>=20
Yes, it is that one.

Another stack trace, this time from a debug=3Dy built hypervisor, of what
we are thinking it is the same bug (although reproduced in a slightly
different way) is this:

(XEN) ----[ Xen-4.7.2_02-36.1.12847.11.PTF  x86_64  debug=3Dy  Not tainted =
]----
(XEN) CPU:    45
(XEN) RIP:    e008:[<ffff82d08012508f>] sched_credit.c#csched_schedule+0x36=
1/0xaa9
...
(XEN) Xen call trace:
(XEN)    [<ffff82d08012508f>] sched_credit.c#csched_schedule+0x361/0xaa9
(XEN)    [<ffff82d08012c233>] schedule.c#schedule+0x109/0x5d6
(XEN)    [<ffff82d08012fb5f>] softirq.c#__do_softirq+0x7f/0x8a
(XEN)    [<ffff82d08012fbb4>] do_softirq+0x13/0x15
(XEN)    [<ffff82d0801fd5c5>] vmx_asm_do_vmentry+0x25/0x2a

(I can provide it all, if necessary.)

I've done some analysis, although when we still were not entirely sure
that changing the affinities was the actual cause (or, at least, what
is triggering the whole thing).

In the specific case of this stack trace, the current vcpu running on
CPU 45 is d3v11. It is not in the runqueue, because it has been
removed, and not added back to it, and the reason is it is not runnable
(it has VPF_migrating on in pause_flags).

The runqueue of pcpu 45 looks fine (i.e., it is not corrupt or anything
like that), it has d3v10,d9v1,d32767v45 in it (in this order)

d3v11->processor is 45, so that is also fine.

Basically, d3v11 wants to move away from pcpu 45, and this might (but
that's not certain) be the reson because we're rescheduling. The fact
that there are vcpus wanting to migrate can very well be the cause of
affinity being changed.

Now, the problem is that, looking into the runqueue, I found out that
d3v10->processor=3D32. I.e., d3v10 is queued in pcpu 45's runqueue, with
processor=3D32, which really shouldn't happen.

This leads to the bug triggering, as, in csched_schedule(), we read the
head of the runqueue with:

snext =3D __runq_elem(runq->next);

and then we pass snext to csched_load_balance(), where the BUG_ON is.

Another thing that I've found out, is that all "misplaced" vcpus (i.e.,
in this and also in other manifestations of this bug) have their
csched_vcpu.flags=3D4, which is CSCHED_FLAGS_VCPU_MIGRATING.

This, basically, is again a sign of vcpu_migrate() having been called,
on d3v10 as well, which in turn has called csched_vcpu_pick().

> a nasty race condition=E2=80=A6 a vcpu has just been taken off the runque=
ue
> of the current pcpu, but it=E2=80=99s apparently been assigned to a diffe=
rent
> cpu.
>=20
Nasty indeed. I've been looking into this on and off, but so far I
haven't found the root cause.

Now that we know for sure that it is changing affinity that trigger it,
the field of the investigation can be narrowed a little bit... But I
still am finding hard to spot where the race happens.

I'll look more into this later in the afternoon. I'll let know if
something comes to mind.

> Let me take a look.
>=20
Thanks! :-)
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/
--=-saUfEpPsSLk3XgxxsqS4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlrMkvEACgkQFkJ4iaW4
c+6S5g//UsRYoSJk68SGmPopjAjTG0vVdCOVQBTjU69uwocrrG8GgucVMAHXV9iH
fR3pVLDMXADwViMZYewi2uAeX613yyCKfOj6UfJWHGlPRKlc7kCQSL8v6/+Rer2l
4gHkdhTpUoMKTS3wN/uSPZaNde4X7nujsYg686+PuOOAV9OURqRSwgzV+/wfMV9D
ZwO4Rscar4OteZYB1WfMtnXgVxfVsN980fntyU7NQxSqzfIWwp/+2l/PLPARm+G9
NqprmX7oa+ULsr1ZQie/QSAQlCFl6fjvHds7ClbUAGD4du/USIRflOo7S3ceH+T0
SGF4dqL3/snBLhQlG6owcGDTmAwVAfKovBi3YUBOY+WxXxRxdS3qrYkaovq9etTY
2bhq3xzIosaWz8N08SjJpYyk0rsT1/AUsvSOkMCw3NeGJ2Q6v8bQkls7B1dxn5FT
r54MQsdflZPdspCEFH8DGcJnnb43NlXiT9yfbyGgBsNtzuE5vtBu6vAFtf3x8qSl
f0AZ8hAfJxvM/iXi+OaMULUHfrjjSKV+ATZdJ72INfMUVPI4lySeEJeKEgW7xofb
Pj8nFI9WPoqqj7iJCpXtW7d04RIFf6kEEgcPHwm0EKkr9tqT3fdQFF+kygJ311QE
vX9J2D/DFbudfToXTjyw+yhjoKjiX1Ghz4eTqMrZ9IYQXqyRMGo=
=zh+n
-----END PGP SIGNATURE-----

--=-saUfEpPsSLk3XgxxsqS4--



--===============6181891034185227054==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6181891034185227054==--
