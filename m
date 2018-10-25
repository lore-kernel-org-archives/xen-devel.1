From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: Ongoing/future speculative mitigation work
Date: Thu, 25 Oct 2018 19:23:36 +0200
Message-ID: <faf8d9511adf38f9c769103596df7c85b97db4ca.camel@suse.com>
References: <e3219697-0759-39fc-2486-715cdec1ca9e@citrix.com>
 <CABfawh=GYUi2nvx5Nc1xfu7McVSqCwYOMyA6fyCKgYJCGCRkXA@mail.gmail.com>
 <9270f77c23dad0855a00030cc53ce4b2b9366d22.camel@suse.com>
 <CABfawhkcGspr8+0=A-vLq66HrFK1D7H_abTyMKd21h3Mk2gvNg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3260293027989696463=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <CABfawhkcGspr8+0=A-vLq66HrFK1D7H_abTyMKd21h3Mk2gvNg@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Cc: mpohlack@amazon.de, Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>, joao.m.martins@oracle.com, Stefano Stabellini <sstabellini@kernel.org>, Daniel Kiper <daniel.kiper@oracle.com>, Marek =?ISO-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>, aliguori@amazon.com, uwed@amazon.de, Lars Kurth <lars.kurth@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, ross.philipson@oracle.com, Matt Wilson <msw@amazon.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, JGross@suse.com, sergey.dyasli@citrix.com, Wei Liu <wei.liu2@citrix.com>, George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xen.org>, mdontu <mdontu@bitdefender.com>, dwmw@amazon.co.uk, Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org


--===============3260293027989696463==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-8Nbm41r/DQQZ0aTrFqJz"


--=-8Nbm41r/DQQZ0aTrFqJz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2018-10-25 at 10:25 -0600, Tamas K Lengyel wrote:
> On Thu, Oct 25, 2018 at 10:01 AM Dario Faggioli <dfaggioli@suse.com>
> wrote:
> >=20
> > Which is indeed very interesting. But, as we're discussing in the
> > other
> > thread, I would, in your case, do some more measurements, varying
> > the
> > configuration of the system, in order to be absolutely sure you are
> > not
> > hitting some bug or anomaly.
>=20
> Sure, I would be happy to repeat tests that were done in the past to
> see whether they are still holding. We have run this test with Xen
> 4.10, 4.11 and 4.12-unstable on laptops and desktops, using credit1
> and credit2, and it is consistent that hyperthreading yields the
> worst
> performance.=20
>
So, just to be clear, I'm not saying it's impossible to find a workload
for which HT is detrimental. Quite the opposite. And these benchmarks
you're running might well fall into that category.

I'm just suggesting to double check that. :-)

> It varies between platforms but it's around 10-40%
> performance hit with hyperthread on. This test we do is a very CPU
> intensive test where we heavily oversubscribe the system. But I don't
> think it would be all that unusual to run into such a setup in the
> real world from time-to-time.
>=20
Ah, ok, so you're _heavily_ oversubscribing...

So, I don't think that an heavily oversubscribed host, where all vCPUs
would want to run 100% CPU intensive activities --and this not being
some transient situation-- is that common. And for the ones for which
it is, there is not much we can do, hyperthreading or not.

In any case, hyperthreading works best when the workload is mixed,
where it helps making sure that IO-bound tasks have enough chances to
file a lot of IO requests, without conflicting too much with the CPU-
bound tasks doing their number/logic crunching.

Having _everyone_ wanting to do actual stuff on the CPUs is, IMO, one
of the worst workloads for hyperthreading, and it is in fact a workload
where I've always seen it having the least beneficial effect on
performance. I guess it's possible that, in your case, it's actually
really doing more harm than good.

It's an interesting data point, but I wouldn't use a workload like that
to measure the benefit, or the impact, of an SMT related change.

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/

--=-8Nbm41r/DQQZ0aTrFqJz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlvR/BgACgkQFkJ4iaW4
c+5QFRAA6JzTPYf+BKtNQ+vca1XK8IBr7/PXYXl9IyldAsisz26DV6JCzm4Oq5VU
Wn7kCfOdXQ+jbR9A0oXL7aQ/x2m5w5mZai/+MZZndByjfDEfRMkmnY9Pb1DMwYNL
NKjKtUlA96+XR1bJpFVM8Wy99l4BbJqMXA/Bizt6w7heuqT+WROGkL5crwkfFki5
Ait8U0my/0aGtMw32Vj6tlj7EFzOXkZTuBb1Tc409AKXa2X5yl4SJ7J+rqhjGLiN
gnjdYhYXOkArrNHiZa7uUoetpktWf3mqs+aHRm/jMQp6yxQshfYRRjcZ1LCpqiF0
xtobvHTiTdCzyHgfRspy2PAanEY4jUObeY82hqk/OkdJfBYfKLZbHt2gnjMTKZEO
AcOJF6EeuEIQuyb6KU9cP4qEoCySngZmOEBGOjy+/nOcW8/V0XkyaQLVyr6whrqN
uzOCMAmNjKlfaQEYNq9SmHkNrADcF1z3KcdTCxbTDuf+6YdGsjMtqEZ8+o4kZ0Tj
Nb6qyit1dCXeI/5Ph9VA3iK415ikcbJDmDuXiwSvaB7HtAWBCwgV2gqH4EfvzwVD
4C0jsp6IpxQmCutQva7pu0rszZLvr4xN9kAMrmHARkxITLu532czs6ieQnh9vM2Z
Xelsizzinb2yflGYMh1IeFQ9zHt+I1hCRqV3wsJaZqOxRuS/nSs=
=T4RO
-----END PGP SIGNATURE-----

--=-8Nbm41r/DQQZ0aTrFqJz--



--===============3260293027989696463==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3260293027989696463==--
