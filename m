From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: Ongoing/future speculative mitigation work
Date: Fri, 26 Oct 2018 09:31:12 +0200
Message-ID: <c545fe3a8e373de8b45765f1510c7e421fecb9c8.camel@suse.com>
References: <e3219697-0759-39fc-2486-715cdec1ca9e@citrix.com>
 <CABfawh=GYUi2nvx5Nc1xfu7McVSqCwYOMyA6fyCKgYJCGCRkXA@mail.gmail.com>
 <9270f77c23dad0855a00030cc53ce4b2b9366d22.camel@suse.com>
 <CABfawhkcGspr8+0=A-vLq66HrFK1D7H_abTyMKd21h3Mk2gvNg@mail.gmail.com>
 <faf8d9511adf38f9c769103596df7c85b97db4ca.camel@suse.com>
 <CABfawhknLovL9xsm_ZQb3jjXriKxQiSo0t8ids0HA9Q3+kRp1A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5073975233582923751=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <CABfawhknLovL9xsm_ZQb3jjXriKxQiSo0t8ids0HA9Q3+kRp1A@mail.gmail.com>
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


--===============5073975233582923751==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-MP738x09aoGQXbiHavbN"


--=-MP738x09aoGQXbiHavbN
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2018-10-25 at 11:29 -0600, Tamas K Lengyel wrote:
> On Thu, Oct 25, 2018 at 11:23 AM Dario Faggioli <dfaggioli@suse.com>
> wrote:
> >=20
> > Having _everyone_ wanting to do actual stuff on the CPUs is, IMO,
> > one
> > of the worst workloads for hyperthreading, and it is in fact a
> > workload
> > where I've always seen it having the least beneficial effect on
> > performance. I guess it's possible that, in your case, it's
> > actually
> > really doing more harm than good.
> >=20
> > It's an interesting data point, but I wouldn't use a workload like
> > that
> > to measure the benefit, or the impact, of an SMT related change.
>=20
> Thanks, and indeed this test is the worst-case scenario for
> hyperthreading, that's was our goal. While a typical work-load may
> not
> be similar, it is a possible one for the system we are concerned
> about.=20
>
Sure, and that is fine. But at the same time, it is not much, if at
all, related with speculative execution, L1TF and coscheduling. It's
just that, with this workload, hyperthreading is bad, and not much more
to say.

> So if at any given time the benefit of hyperthreading ranges
> between say +30% and -30% and we can't predict the workload or
> optimize it, it is looking like a safe bet to just disable
> hyperthreading. Would you agree?
>=20
That's, AFAICR, the OpenBSD's take, back at the time of when TLBLeed
came out. But, no, I don't really agree. Not entirely, at least.

The way I see it, is that there are special workloads where  SMT gives,
say, -30%, and those should just disable it, and be done.

For others, it's perfectly fine to keep it on, and we should, ideally,
find a solution to the security issues it introduces, without
nullifying the performance benefit it introduces.

And when it comes to judge how good, or bad, such solutions are, we
should consider both the best and the worst case scenarios, and I'd say
that the best case scenario is more important, as for the worst case,
one could just disable SMT, as said above.

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/

--=-MP738x09aoGQXbiHavbN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlvSwsEACgkQFkJ4iaW4
c+4T5w/8D8P5GYZzuEbzfYfpiCyzIiQ4YdQ85dhAMQMq+UZc6JkWf4vJV+47GD7E
XvtrulHDxhjAKikoljbK1B8Y0kltmFJf4NPHTDSilPA6vwep+Bx5XqqFC7PpCVeL
4oSXMSAWF2J2GTJtgGZY2VzYoL6ra+mAVRy29zV0mahp9d5mBJ7luPqFj699Ckj+
QV/EHDZOYvxiEoj/oyF9wj0rkzHPLEq9RIjrXVGbPNMrrMFq21jlRRgoCBsq6pAl
No9B6JHZQHNZ4MmOZ0e3o8WDlK5666UJiLZ4mKmGn5GQOpueBgp1FvuKnB660OdX
5Irc5dj84tW+a24G8x9y4s1mCHIWHnHKhL43Wz+OPdq/o4DvKlqypV4/U3g9EXyy
diQECc0mGNyJsyNzCb0d7YQGAAlzg7WDzCmRkUVBa7JkBuD6oz2lcQYCDhFRcis0
W3DB8cxGJWmfmpWEsR/5nPQGumxiJCsSSSoYussYsnMb0BKLjas97RsKzihXzlnq
is/XdPBVbPdnewG1hRAAbS/Di7fK5eYbvCpc0OOWhp5dBW/T8sD0PLhHKXTK1cCr
aHSmJkKUah2qew1IiWHW7qeDiNqUOv7R5DvDpIn/Ra+HAqNinqmq/ZVuWpI2Y4rb
fjP3mIQ/o3lBgHWWL82YcjTXqrA7oD9j/8Jvk6Z1H0sSYyQpJsc=
=ytvo
-----END PGP SIGNATURE-----

--=-MP738x09aoGQXbiHavbN--



--===============5073975233582923751==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5073975233582923751==--
