From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: null scheduler bug
Date: Thu, 27 Sep 2018 16:23:10 +0200
Message-ID: <4fd5ae27606dbcafd7c4c3ead3c60cd1941481d3.camel@suse.com>
References: <alpine.DEB.2.10.1809121559330.4255@sstabellini-ThinkPad-X260>
 <a938e477609ae123ae61aec515daa34ccaf0b8f3.camel@suse.com>
 <CADJ6SV2G=51BK2p-bouNGfiS5sP2tiV6ztZZ7PFGjiptRw_P3w@mail.gmail.com>
 <44174941bcd8f250a6ecd42ea10a78bf12453134.camel@suse.com>
 <CADJ6SV2wis2kOz9j4OGTzRLd+2O2f_SuxktFWRq2A_tbng_3Ug@mail.gmail.com>
 <529d38d04b140d90d33e424a064d401cf06f14cf.camel@suse.com>
 <CADJ6SV09MS1x+qGJOu71W8M6cVhRaVuODBYDReHWmOm4c1NEfQ@mail.gmail.com>
 <CADJ6SV0+O5c52_qwOUEakuX82C2+8Z-M4mKj0x+13GXjaiJjvw@mail.gmail.com>
 <a468e3dfc55bb6a421d47b908f89d9112075cc04.camel@suse.com>
 <CADJ6SV0=p3efMNmdx5ud8BAPscOZpSBqBZ2LJieE3M+Rq3phNQ@mail.gmail.com>
 <b9c1a71c455e8a1682bb13527503c7c0f0135887.camel@suse.com>
 <2ec1f6c5-df53-fce3-9062-123832ae8e6a@arm.com>
 <2bb4df76339b020351720927d05f2d1e565cebbc.camel@suse.com>
 <04bed226-f787-e86f-4373-d05186ab03cf@arm.com>
 <d8d276a20e4567e427ad48d5dd494366dde4f963.camel@suse.com>
 <39666f3710ae7adfbb43c9dc0efac0d60245c411.camel@suse.com>
 <CADJ6SV2FP6Deu7SevTDNjT2sOJ2nQMeAOUS0J8jemamONfftiA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8262624967857424677=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=r25c=mj=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1g5XCK-0003Dv-0X
 for xen-devel@lists.xenproject.org; Thu, 27 Sep 2018 14:23:20 +0000
In-Reply-To: <CADJ6SV2FP6Deu7SevTDNjT2sOJ2nQMeAOUS0J8jemamONfftiA@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Milan Boberic <milanboberic94@gmail.com>
Cc: Andrew.Cooper3@citrix.com, tim@xen.org, julien.grall@arm.com, stefano@stabellini.net, JBeulich@suse.com, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org


--===============8262624967857424677==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-X44tMo/ghvz8R34RSb1d"


--=-X44tMo/ghvz8R34RSb1d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2018-09-27 at 15:15 +0200, Milan Boberic wrote:
> Hi,
> I applied patch and vwfi=3Dnative and everything works fine, I can
> create and destroy guest domain as many times as I want.
>=20
> I have to ask, will this patch have any impact on performance (I will
> test it later, but I just need your opinions)?
>
Well, with a question like this, the only possible answer is "depends".
:-)

Basically, there is a little bit of overhead to be expected, with this
patch applied, every time that call_rcu() is invoked, inside Xen. Now,
you can look at when that happens, and you'll notice that this
basically never happen in an hot-path.

In your case, there is at least one call in the domain destruction
path. You can try to measure whether actually destroying the domain
takes more time _with_ "wfi=3Dnative" (plus this patch) as compared to
how long it takes _without_ "wfi=3Dnative" (and also without this patch).
I don't think you'll be able to appreciate any significant difference.

The point is more, I think, whether "wfi=3Dnative" helps your use case.
Have you measure that? I mean, have you checked what is the difference
in performance (or latency, or whatever you're interested in) between
the "wfi=3Dnative" case and the default?
If you have, and "wfi=3Dnative" helps, then you also need something like
this patch, or domain destruction won't work (in fact, I call the fact
that it takes 'around 7 seconds', not working). If "wfi=3Dnative" does
not help your use case, then you're better off not using neither it nor
this patch.

> And what this patch exactly do? I need to fully understand it because
> I need to document it in my master thesis which will be finished soon
> thanks to you people :D
>=20
Have you heard about RCU? It's a very clever synchronization solution,
widely used in the Linux kernel. Xen has that too, but we use an old
version of the Linux code, and we don't use it that much.

This is, IMO, some good introductory material, but, really, just google
"RCU" or "RCU linux", and you'll hit tons of articles and docs:
https://lwn.net/Articles/262464/

Well, our implementation of RCU requires that, from time to time, the
various physical CPUs of your box become idle, or get an interrupt, or
go executing inside Xen (for hypercalls, vmexits, etc). In fact, a CPU
going through Xen is what allow us to tell that it reached a so-called
'quiescent state', which in turns is necessary for declaring a so-
called 'RCU grace period' over.

Usually, as soon as a guest (or dom0) vCPU become idle, the pCPU on
which it was running does go through Xen, to figure out whether or not
there is another vCPU, from the same or from another guest, to be run.
If not, the pCPU stays idle, but it stays idle _in_Xen_, and that is
good for RCU quiescence and grace period tracking.

Now, with the combination of "sched=3Dnull" and "wfi=3Dnative", when the
guest (or dom0) vCPU becomes idle, we _stay_in_the_guest_, until
something (typically an interrupt) comes. This means that the vCPU in
question never let Xen's RCU know that he has gone through a quiescent
state, and grace periods risk lasting very long, if not forever.

In fact, the reason why everything was working again with a printk()
was, as Julien noted, that an interrupt was being injected. Check the
old discussion on xen-devel about the RCU bug that I linked to in one
of my first messages in this thread to even more insights.

https://www.mail-archive.com/xen-devel@lists.xen.org/msg105388.html

https://lists.xenproject.org/archives/html/xen-devel/2017-07/msg02770.html

https://lists.xen.org/archives/html/xen-devel/2017-09/msg01855.html
https://lists.xen.org/archives/html/xen-devel/2017-09/msg03515.html
https://lists.xenproject.org/archives/html/xen-devel/2017-09/msg01855.html

Setting the qhimark, qlowmark and blimit to the values you see in the
patch, partially defeats the purpose of RCU, as the update of the data
structure is not deferred to some future point in time, but it is
basically always performed synchronously with the modification, and
that's why I dislike just doing it all the time, and I prefer limiting
to doing it when we're using "wfi=3Dnative".

For some more details about the meaning of the qhimark, qlowmark and
blimit values, check these:
https://www.systutorials.com/linux-kernels/132439/patch-rcu-batch-tuning-li=
nux-2-6-16/
https://lwn.net/Articles/166647/

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/

--=-X44tMo/ghvz8R34RSb1d
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlus59EACgkQFkJ4iaW4
c+4fDQ//brMMqCC2mbVuYdncWY7iBgx7qOqfSvBQmsdzmSHsHpNPK89+oR1FJvMl
We2I1EeaCQbSZmR3uLyXzQxJVLaUh6ytw2uF8kidFLiq/Aj9T9Wwf5MxS7qJI+qo
ufmPGzGPvOpYy9NQ3aYLE1pyCDD9ZeNMgyo+yYQq9T+kuFBNOVTODoLpruMOVRBa
rdmzAyauM0MrdUK7J2w05sP/buoNrOQjaOoQxhocm7XmXAxttnYIaxwvswk4Y6mH
Ic9GhtDxnIbyCJnuh9jol7ALXyV1c2GO7lpWL1fW/Qob9Q6V0ihSU4aFncTiqhc3
qHFZ+x4Vvtq0TpB8I/VG5C1O+/TTFphb1Ond5UUQQwHzewUS1jAkiB3fikcwGIFy
54bjDRwrubKCiwwIXy1hph/JUNaFg3kGO7qe6fiUDeYMRZi2IS/c8eIo234D/ErX
JDp2P5IaV3gsyzj0ObkJ/M+Qi6IR6QgHKbTdOExgUKQrE4lfgvm9FT+cf87OHMhA
U/3usLhYoIya7nBNPaufB9wAIK9LgRCDpGYFYzH/OMG03If9qFIh9tmbiwiunWDh
GdWc0tAMJF99z0xHCl3YVhbEGzKf1GSKe8JL6NhOTFWlH4c5NYjXsG49LPxBLExX
kmdadjiOvlWGD0Lf0BmzxKmH2CHArg1l3bYonwpr2XpvtqAy3Z4=
=piau
-----END PGP SIGNATURE-----

--=-X44tMo/ghvz8R34RSb1d--



--===============8262624967857424677==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8262624967857424677==--
