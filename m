From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: crash in csched_load_balance after xl vcpu-pin
Date: Fri, 13 Apr 2018 13:41:17 +0200
Message-ID: <d12f9045c4e455c20ff7a6998de5c31c4ba77629.camel@suse.com>
References: <6924f2c528355dd77a4876c5dd51b3e4b0c948f7.camel@suse.com>
 <f4b652f2-4bc5-d3e7-31a1-18cfb0c6bd4d@citrix.com>
 <960702b6d9dfb67bfae72ae02ae502210695416b.camel@suse.com>
 <20180410203741.GF7177@aepfle.de>
 <67eef3b540612c6161131160da08323858ae979e.camel@suse.com>
 <1fa7f9b8ff690cde4308da4ffb5f5ec5508f9420.camel@suse.com>
 <20180411100006.GI7177@aepfle.de> <20180411150312.GL7177@aepfle.de>
 <20180411152745.GM7177@aepfle.de>
 <eb978b7160b9e2d54f56c088e0e7a24f1ec813c3.camel@suse.com>
 <20180411204359.GP7177@aepfle.de>
 <CAAWQectJz5nGbMQJMsgv2MVE4DRwAw5DOA+roT5TFadO06TTHg@mail.gmail.com>
 <862386BF-2092-428A-AE9E-766D109EF7DC@citrix.com>
 <b4e178344a2923404528bd0af07d583fc011b9ab.camel@suse.com>
 <20180412144553.74da01bc.olaf@aepfle.de>
 <95725e3ecc825da13f9c0ab01ba74b11ed678d33.camel@suse.com>
 <a6057cd8eadc20b04797a4a8fc9cb5570d44544d.camel@suse.com>
 <6b119ba762dbad0c1949bf814694ffbfd39d16c4.camel@suse.com>
 <070DC511-31E1-4C0C-BFD0-C49590FDE54B@citrix.com>
 <4533b7d93e3249dad4f830cea2c27d3e3088e9b6.camel@suse.com>
 <9A9ED35B-FC55-4DF7-B93A-444EA2DDDD02@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6406238925013353187=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <9A9ED35B-FC55-4DF7-B93A-444EA2DDDD02@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <George.Dunlap@citrix.com>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, Olaf Hering <olaf@aepfle.de>, "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org


--===============6406238925013353187==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-1FVg5eY6AC7CZNinSl2W"


--=-1FVg5eY6AC7CZNinSl2W
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2018-04-13 at 11:29 +0000, George Dunlap wrote:
> I think as far as backports go, my current RFC would be
> fine.  Another possibility, though, would be to simply add a
> migrate() callback to remove the vcpu from the runqueue before
> switching v->processor, *without* removing any of the current song
> and dance about vcpu_sleep_nosync().  That should be fairly simple
> and straightforward to backport, and won=E2=80=99t make anything worse (s=
ince
> in theory it should have been removed by that point anyway).  Then
> for 4.12 we can figure out what we want to do going forward.
>=20
FYI, adapting (but then I haven't even compiled) the first two patches
to as far as 4.7 was rather easy.

And, modulo the fact that I still have to properly review them (which
I'll do... but I looked at them, and they seem fine), I do prefer the
series, to the Credit1 migrate callback.

*Especially* if you are right, and the invariant is entirely Credit1
specific. In fact, that means here might be other code paths, in
sched_credit.c, that relies on it, and hence I'd prefer for it to be
enforced better, rather than relaxed, at this point in the cycle.

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/
--=-1FVg5eY6AC7CZNinSl2W
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlrQl10ACgkQFkJ4iaW4
c+4KjBAAlWbkel5yYISrwf77xGcQHKXOQc4OZa4DpSNvdwtumgBD1owHJ0997H+U
qZJmG4FI8iCjQD2MsHgFHTJlrg4M+745iamafESDedFUJQjNWQKGSHaPEqD/9p0j
6JXz1LiPWnB9wPeE/zb4M0AWlKOxNL75x0bG7WjnGkdiPAyoSjXRo7yGiaGfrD0k
N/BbdDOmYLSjlvjOrRA9tWGEQCDTQ/lqMxCLr2hq8Dk3x/CLI4mA4xpM3uxIvGC9
4e8M4DUfu2NHeOVGWA4R/vE6tEbcoVhWsMD+AOUCC5AOfYW8jvf+4P8HeA5JZdmx
O6SZjEQlYMGqbQHk2IpYGvbwS1RBTq8Cb2PsZtX/k3fEUEdTum+aheRF7UFkaHBw
/36ISRig+aUhurvmzhTAu/znuYvVnfYvmTnvJQwxxgm5ugaKpE8BC7pYuQGcXuYG
m4weTgdc2FEAsdh0uVpl+u8kt0eM1oXM99vybzc1iscT5a6aNeJ2pshw6Gv62nZz
H+T0Fpe+C04dkSlzqal6QLrlJwRWf1Z4EQg5szwwk0qiRYSkhzT5nh+yAVdJhKj3
NLsxpYi8ImpM/WT/3bNcaGsyzO8LzMetGUR28wAI3E5BJZkXiiYKwLAA0WcNHleE
Aytj+zT4ZhWhChP0cRYRA34d8Eom36mjUrXa/lGtOA0TEvRkoWw=
=QH1f
-----END PGP SIGNATURE-----

--=-1FVg5eY6AC7CZNinSl2W--



--===============6406238925013353187==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6406238925013353187==--
