From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: intel_pstate driver patches by Wei Wang from 2015
Date: Mon, 17 Dec 2018 12:09:27 +0100
Message-ID: <20181217110927.GA23474@mail-itl>
References: <20181214141654.GF989@mail-itl>
 <5C176180.3090200@intel.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8729145802176403541=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XHFb=O2=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1gYqmD-0006ka-V9
 for xen-devel@lists.xenproject.org; Mon, 17 Dec 2018 11:09:34 +0000
In-Reply-To: <5C176180.3090200@intel.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Wang <wei.w.wang@intel.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, wei.liu2@citrix.com, jbeulich@suse.com
List-Id: xen-devel@lists.xenproject.org


--===============8729145802176403541==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ikeVEW9yuYc//A+q"
Content-Disposition: inline


--ikeVEW9yuYc//A+q
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 17, 2018 at 04:42:40PM +0800, Wei Wang wrote:
> On 12/14/2018 10:16 PM, Marek Marczykowski-G=C3=B3recki wrote:
> > Hi,
> >=20
> > I wonder what happened to intel_pstate patch series[1] back in 2015?
> > I've seen there was some review feedback[2][3][4][5][6][7] on v6,
> > patches 4/6 and 6/6 were acked. Were the review comments ever addressed
> > (can't find it)?  Or maybe there is some other mechanism in place for p=
roper
> > power management on recent Intel CPUs? Apparently acpi-cpufreq driver
> > not always does its job well[8].
> >=20
> > [1] https://lists.xenproject.org/archives/html/xen-devel/2015-10/msg030=
48.html
> > [2] https://lists.xenproject.org/archives/html/xen-devel/2015-11/msg020=
43.html
> > [3] https://lists.xenproject.org/archives/html/xen-devel/2015-11/msg024=
10.html
> > [4] https://lists.xenproject.org/archives/html/xen-devel/2015-11/msg024=
30.html
> > [5] https://lists.xenproject.org/archives/html/xen-devel/2015-11/msg024=
43.html
> > [6] https://lists.xenproject.org/archives/html/xen-devel/2015-11/msg024=
56.html
> > [7] https://lists.xenproject.org/archives/html/xen-devel/2015-10/msg030=
86.html
> > [8] https://github.com/QubesOS/qubes-issues/issues/4604#issuecomment-44=
6816536
> >=20
>=20
> Hi Marek,
>=20
> It was paused because there was no users in the clouds - people usually h=
ave
> P-state disabled.

I see. FWIW Xen have also non-cloud use cases, like Qubes OS.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--ikeVEW9yuYc//A+q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAlwXg+cACgkQ24/THMrX
1yzC/gf/SdDsGGj506XjcTDmfuxoZdGlp5P8kWLMp0NvAql7j/ZVYjE8dmAcwcmk
YxBDn3CTThQFzV5g3LApws/V3qupsYR+tusTfoGKHvc+UNNLxWvEIqcf9Nf+DnpQ
hYXJSgu2vWE0rNHV5L8QzZUSIkQSis5vNNaEz/Tq8BOUy7zrhrbIjGKPLiMCADFQ
wqvtRtN1DYLHo/gNyvEJRa460afq9vJsYqV4HSnf/YDa6/xL91R1V2ZDYXdeVzOg
aGQF6DH12pHVvw11y3HpGnTPomjyh2Lnt+edvq//7LJtUv0KMSmEYaZojd38FG9E
b31Lu9ThwHioWRW0tG4862BP/E98AQ==
=bOGy
-----END PGP SIGNATURE-----

--ikeVEW9yuYc//A+q--


--===============8729145802176403541==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8729145802176403541==--
