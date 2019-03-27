From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH 1/6] xen/sched: call cpu_disable_scheduler()
 via cpu notifier
Date: Wed, 27 Mar 2019 17:24:42 +0100
Message-ID: <42e0d691a0e00149ba585382e26494159dbb71f9.camel@suse.com>
References: <20190318131155.29450-1-jgross@suse.com>
 <20190318131155.29450-2-jgross@suse.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1272188953352952117=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/lXT=R6=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1h9BMY-0005Tj-AI
 for xen-devel@lists.xenproject.org; Wed, 27 Mar 2019 16:25:14 +0000
In-Reply-To: <20190318131155.29450-2-jgross@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org


--===============1272188953352952117==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-8UrNjM1LZ8u0xxGCmv1u"


--=-8UrNjM1LZ8u0xxGCmv1u
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2019-03-18 at 14:11 +0100, Juergen Gross wrote:
> cpu_disable_scheduler() is being called from __cpu_disable() today.
> There is no need to call it on the cpu just being disabled, so use
> the CPU_DEAD case of the cpu notifier chain.
>=20
So, what do you mean with "There is no need to call it on the cpu just
being disabled"?

Because we still (even after this patch, I mean) call
cpu_disable_scheduler() on all non-boot CPUs, aren't we? It's just that
right now we call it from __cpu_disable(), with the patch we call it
slightly later.

And another difference looks to me to be that right now we call
cpu_disable_scheduler() from stop-machine context, which I think is no
longer true with this patch. Perhaps the changelog could tell why that
is ok?

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/

--=-8UrNjM1LZ8u0xxGCmv1u
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlybo8sACgkQFkJ4iaW4
c+46LQ/8C7QasKTZ1eJwQuzyiazKj5PMS/1Z2NMWu3ev22hy8ExSSn0+QCy00JPT
sFZazJObHW8CDzcduATVVulu55DlTOFr73h2kWYEeRueAqPpx9bHDfjHwPQiUch/
B2nahEE8+wkhicIs3vdWMlpgKaTBlJDiVrqRzvznKvqTWN3UEfMd3DB+2wp68R2z
OtIEJJ8ggBiXcauzv4u6FADcLV5Mq3QCBQ7cDYosvLHAM8hr+TkhyoXg4muzGQ2N
B6oUaSvw5ZBHdTZ03EpkkWX3Is+38uV9w+f6fUjfPQYcQQfF1oykZfxCFBdF+znl
d/YEvc21UBc0E2t9BodeO9WxzmIs9rykQYa6Gc1NdgRmzFnm86p5uZQJLgbuQoGH
hD4d0OETeYk3soUJ1RHV6rUI/8TBQDny/Fylo+R0kX2JmzGDPrhtX+NF22iDdKOl
wQDm4umC3k+Ud6rQe3Z8ubbnOf0CX1XphvLYes0zVr89FMYFU9tN6mIaw7L23fi/
5j4XmbSj+eLlHEp/ThrHiWPqQu2DxD8D9u52/0q14MFvOugqHEIDtb/LJBPNSc7B
de7xplpnGH4AJrVZW0teCMs/frqrwgJimki1h7U+h9fugf9GyQNlYePKdhj8eaf9
7+uGUBFCZVPqwkgqfDW6Dh0m43wchYQYCP0DGHMS7i+SHgjb+Pk=
=1d0b
-----END PGP SIGNATURE-----

--=-8UrNjM1LZ8u0xxGCmv1u--



--===============1272188953352952117==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1272188953352952117==--
