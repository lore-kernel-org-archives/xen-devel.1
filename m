From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH v10 09/11] x86/ctxt: Issue a speculation
 barrier between vcpu contexts
Date: Fri, 26 Jan 2018 12:13:39 +0100
Message-ID: <1516965219.15341.100.camel@suse.com>
References: <1516799535-5778-1-git-send-email-andrew.cooper3@citrix.com>
 <1516799535-5778-10-git-send-email-andrew.cooper3@citrix.com>
 <5A6A0C7A02000078001A275A@prv-mh.provo.novell.com>
 <345bd2ef-1319-d9a6-522c-31e42bcd2c2e@citrix.com>
 <1516906149.15341.66.camel@suse.com> <1516928885.15341.72.camel@suse.com>
 <5A6B064C02000078001A2A68@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5954520776229789606=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5A6B064C02000078001A2A68@prv-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Dario Faggioli <dario.faggioli@citrix.com>, David Woodhouse <dwmw@amazon.co.uk>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org


--===============5954520776229789606==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-QrOpbQwUyTAZqjdrOfAo"


--=-QrOpbQwUyTAZqjdrOfAo
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2018-01-26 at 02:43 -0700, Jan Beulich wrote:
> > > > On 26.01.18 at 02:08, <dfaggioli@suse.com> wrote:
> > And in order to go and investigate this a bit further, Jan, what is
> > it
> > that you were doing when you saw what you described above? AFAIUI,
> > that's booting an HVM guest, isn't it?
>=20
> Yes, plus then run some arbitrary work inside it.
>=20
Ok. And you've seen the "spurious" migrations only/mostly during boot,
or even afterwords, while running this work?

> > How many vCPUs on how many pCPUs? Basically, I would just need a
> > confirmation that the system was not oversubscribed, but if, while
> > we're here, you can tell me the details, I'll put together an as
> > much
> > as possible similar scenario.
>=20
> 12 pCPU-s, HVM guest has 8 vCPU-s, Dom0 has 12 pCPU-s (but
> no other load than that caused by the guest).=20
>
Ok.

> If you want, I could
> bring the code I've used for monitoring into patch form and hand
> it to you.
>=20
If it's not a problem, and whenever you have time, yes, that would be
useful, I think.

Thanks and Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/
--=-QrOpbQwUyTAZqjdrOfAo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlprDWMACgkQFkJ4iaW4
c+5R9xAA0T6u0KIpN214wqdDj8AMZ/Zus8Uf2K+bp2ZXwydmMnx9gsyUyjs1xFIN
PVD3IoysFcuhaVLQoh3FJSzyXrdKt3gnva6oyg9xI1xVWyvNlrKQgaGjYcoztDFl
/Gdfm3sPLcPN6KT200+8Kp+FNK1n/m/u04+k9mUFwYfpTzD471++2iCsulGl5dyA
ZqWswxXhXHWizS59u1Ib8o90uc5GzQpiakPRhOZPVN9ZvBzsp6G5sJb73CZgR25a
mOHk9oQAGOD9waza2Cnd9oNxEzpYVreNwWaO3LbOVZYTXUnUT08znM9Q7UhoDSVc
xSrECmWYVB38eXmoT5ocmGK+LSF3XSd6jNNj81WnQp0kpLSMqSVcdiZAGk8rBRM/
6DSZGzS01K/Kgqy1vSwyOa52S5ftU1p/U1lNop8erCV01eXbP+4/49z2a0N/5r+E
adlfp3D8uF2qSkARFZHHYQfhleCicsblwKDP6chjomjrhos3nZ2OCYbX/mOeeUqZ
kNJfWKftq15R4ghrjmG0lab0NVgJ7buAcHtXaM+NJyKgUGSmg8LTc/mWIPHOk695
RDSxiuYdJqH8o0f9zff5yDrqbDFZlufWh+gseDJNgDcipj5zlTu1x2tbkogTTJrk
NHh1fgoTmv0d/u67KWgGuQANm7/WF1Go+6AE8dkV9CCV+j4eYHs=
=cOKK
-----END PGP SIGNATURE-----

--=-QrOpbQwUyTAZqjdrOfAo--



--===============5954520776229789606==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5954520776229789606==--
