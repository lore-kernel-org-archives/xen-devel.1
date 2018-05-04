From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: reboot driver domain, vifX.Y = NO-CARRIER?
Date: Sat, 5 May 2018 01:03:15 +0200
Message-ID: <20180504230315.GX1124@mail-itl>
References: <f8d5d228-ff93-c388-6e64-5e1d92c85f22@citrix.com>
 <20180427171352.wftxapwflz2gm6qn@citrix.com>
 <23271.13494.638544.432776@mariner.uk.xensource.com>
 <20180430161609.GH17249@io.lakedaemon.net>
 <CAFLBxZadX15mEQbFCa_C94WneY0NiaNfgXhz=Vw0xkjjmf4zqQ@mail.gmail.com>
 <20180430181754.GK17249@io.lakedaemon.net>
 <CAFLBxZYZvrpmO_7exgARkKFZim+UHVHq=1otmcmxnD2x-7aAAg@mail.gmail.com>
 <20180501123751.GP17249@io.lakedaemon.net>
 <20180501125338.GR17249@io.lakedaemon.net>
 <726E5327-F75A-458B-B1D1-5C1DA2812E67@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5507213955742017042=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=t7bv=hx=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1fEjnP-0007c9-9C
 for xen-devel@lists.xenproject.org; Fri, 04 May 2018 23:07:23 +0000
In-Reply-To: <726E5327-F75A-458B-B1D1-5C1DA2812E67@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Rich Persaud <persaur@gmail.com>
Cc: Wei Liu <wei.liu2@citrix.com>, jandryuk@gmail.com, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <dunlapg@umich.edu>, Jason Cooper <xen@lakedaemon.net>, xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson <ian.jackson@citrix.com>
List-Id: xen-devel@lists.xenproject.org


--===============5507213955742017042==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Cbvl/UgeRTPlujdB"
Content-Disposition: inline


--Cbvl/UgeRTPlujdB
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 04, 2018 at 06:13:25PM -0400, Rich Persaud wrote:
> > On May 1, 2018, at 08:53, Jason Cooper <xen@lakedaemon.net> wrote:
> >=20
> > add the link to xen-users thread of me talking to myself.  :-))
> >=20
> >> On Tue, May 01, 2018 at 12:37:51PM +0000, Jason Cooper wrote:
> >> When I was first digging into this, I started a thread on xen-users [1=
],
> >> I've attached my xl-reboot.sh script here so you can see exactly what
> >> I'm attempting to do:
> >=20
> > [1] https://marc.info/?l=3Dxen-users&m=3D152389443206023&w=3D2
>=20
> You may want to look at the code (toolstack and/or frontend-backend drive=
rs) for Qubes and OpenXT, both of which use network driver domains and supp=
ort wired/wireless networks. =20
>=20
> Operational restart of a measured, non-persistent driver domain (instead =
of host) is a benefit of Xen disaggregation architectures.

In Qubes, on backend restart, we do equivalent of xl network-detach &&
xl network-attach (as you do in xl-reboot.sh). xl itself doesn't provide
any place to plug such script, but we use libvirt which provide events.
Also, we have full control over domain config (libvirt XML), so don't
need to extract vif list from xenstore...

The problem you describe looks related to
https://lkml.org/lkml/2018/2/28/289, but fix is included in 4.16...
There was also related libxl patch:
https://xen.markmail.org/thread/6qbgmwyjqsshjus7
(but it applies to the case where you first shutdown backend and only
then do xl network-detach)

Do you have xl devd running in your driver domain? Without that xl
network-attach wont work (AFAIR udev isn't used here anymore).

Also note that backend shutdown/restart/crash was a source of many
problems in frontend kernel and toolstack in the past. Even simple
dynamic network-attach/detach sometimes is problematic for the frontend.
Links:
https://github.com/QubesOS/qubes-issues/issues/3657 (frontend kernel
problem)
https://github.com/QubesOS/qubes-issues/issues/1426 (toolstack problem,
+ libvirt)
https://github.com/QubesOS/qubes-issues/issues/975 (frontend kernel
problem)

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--Cbvl/UgeRTPlujdB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAlrs5rIACgkQ24/THMrX
1yxFNQf8DoXymAkYmqSnqmZ8wSWir2kPRc8SsHmmYcOEOvBSX+l1zoLTndrvJQa/
j6nBpK+QX1bFnC18boexDJa8xYXPw2G0j5eE2Yei/kSyvi2U7oN6SG6neKJLbafm
UOXVs9TFkFHH/3M71paoTbMO43VHC0ClJRpADCNcu6TwvpxxmBLDDDGIiKCdRsqV
VYrpaiAP8WIuPsxJ/zHfAldquQSd2ZeSNwnIZKCr0X2s7lfT9GcX8jSPzQuAYF9I
NpbjenpfwbFHbv28AI/x/+EX/3eCT+gTXVWTc342XbaTmqSC1F7M8nLD5+te1nYF
CpaFwM7339ECQtU/4nUsBptRqVzI7A==
=LWEQ
-----END PGP SIGNATURE-----

--Cbvl/UgeRTPlujdB--


--===============5507213955742017042==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5507213955742017042==--
