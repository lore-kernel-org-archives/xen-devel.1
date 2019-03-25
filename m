From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH] x86/xen: Add "xen_timer_slop" command line
 option
Date: Mon, 25 Mar 2019 11:36:00 +0100
Message-ID: <8eec0949bac18d8ee6f151027ff68de9827f143d.camel__17983.1970877544$1553510268$gmane$org@suse.com>
References: <1553279397-130201-1-git-send-email-ryan.thibodeaux@starlab.io>
 <abf65a68-9463-0f0e-1f51-6eefd3cacc88@oracle.com>
 <20190323120052.GB11100@centos-dev.localdomain>
 <20190324180724.GA4400@nat-wireless-guest-reg-153-50.bu.edu>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4870994685448797824=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ytoJ=R4=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1h8My0-00047C-TN
 for xen-devel@lists.xenproject.org; Mon, 25 Mar 2019 10:36:32 +0000
In-Reply-To: <20190324180724.GA4400@nat-wireless-guest-reg-153-50.bu.edu>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, Ryan Thibodeaux <thibodux@gmail.com>
Cc: jgross@suse.com, oleksandr_andrushchenko@epam.com, "luca.abeni" <luca.abeni@santannapisa.it>, linux-kernel@vger.kernel.org, ryan.thibodeaux@starlab.io, xen-devel@lists.xenproject.org, tglx@linutronix.de
List-Id: xen-devel@lists.xenproject.org


--===============4870994685448797824==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-2Aj+Mypawqc5P5Mv2XTx"


--=-2Aj+Mypawqc5P5Mv2XTx
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2019-03-24 at 14:07 -0400, Boris Ostrovsky wrote:
> On Sat, Mar 23, 2019 at 08:00:52AM -0400, Ryan Thibodeaux wrote:
> > This test system was configured to use a TSC clocksource, disabled
> > C states, and lowered the timer slop. I am not claiming the timer
> > slop change was solely responsible for the best results.
>=20
> How can we then be sure that the proposed change will indeed provide
> some sort of benefit?
>=20
> Were there any other changes between your tests to think that slop
> time modification may not be responsible for better results?
>=20
FWIW, in mine and Luca's experiments, changing lowering both timer_slop
in Xen and TIMER_SLOP in Linux, improved latency dramatically, without
any other change.

We also tried _only_ playing with the Xen tunable (as there's a Xen
boot parameter for it already) but that wasn't enough. It was only when
we also tuned TIMER_SLOP in Linux's Xen clockevent device that we got
decent numbers (i.e., comparable to KVM ones).

Reason why we had not share these results yet was that we were still
"polishing" them, and because we also found a couple of other issues,
and we were trying to understand them better, before sending anything
out. But those other issues were --although still about achieving low
latencies-- orthogonal from this, and lowering the default slop is
absolute prerequisite for even talking about having a reasonable vcpu
response time.

A patch like this one, was something we were thinking to submit ourself
sooner or later (backed up by our results). Personally, in addition to
making the value tunable, which I think is a good thing, I also would
lower the default.

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/

--=-2Aj+Mypawqc5P5Mv2XTx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlyYrxAACgkQFkJ4iaW4
c+4RBw/+Jb25t+D3NqB7raaBYvuDFoFlEdJJEBtsPLe8HNDFU3aD8p3Mr+v9m0KU
hWiWBcAfqISbCk3gsb4Qfw5met5E1hg9EsA1qJVhsKdPiwPUrDnRfwxOHRgLSw/6
FPZ+MKo0REE9VvXPkuhcebmM7Ec98Q4iiqXS9POF0iTlDnu1NqiQ2e1II9Eu2/L7
+Bdaq6kbSsTLRuI5HBNdOCcoFMJ74NcI+p6xSvVZOkHTyPFlNiXfhc/tXVXvkPJP
jdJPyqGvVNUtawG/AtEDDwIUxhrEbr+iq4tFRGpVqEQBlYfqI1DbJMCRInEEGA+v
n2bMWJGGSYTteIe1pyxnanCNrVr4q7IdIip0AIxnur6mwx2TDTdzTFI9kBjWZtGb
VfzzXt6YXYiCAtcOIYNdd81xtVJukYsmuWLy8kG2/SCDLTSK1EaBidmUJzcydmfY
pkpN2rS/4SyIw/uiAFxLuC3DaDNumVmiB+kJSJd0sOw+381YDmKr9O0YtiFD8E8K
sgHSaaev73etzvIDawbZJ/6zwVp4wGzzll+lnLEqenzNaq7oPVc1AXag3JWU5dwU
hT11iJseaqIcDhDZHJjQug//9enDk6gBDTcsCX/pGNi3wqrCm1BSSrD8fFqfCJWO
Gc69tHtjXCUjJpOBign0HbJuni4P6LJcklcKyejceSCBwcaUsi8=
=0s/V
-----END PGP SIGNATURE-----

--=-2Aj+Mypawqc5P5Mv2XTx--



--===============4870994685448797824==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4870994685448797824==--
