From: Olaf Hering <olaf@aepfle.de>
Subject: Re: [PATCH v12] tolerate jitter in cpu_khz calculation
 to avoid TSC emulation
Date: Tue, 12 Mar 2019 11:03:59 +0100
Message-ID: <20190312110359.56532ab3.olaf@aepfle.de>
References: <20190308192059.24610-1-olaf@aepfle.de>
 <5C863567020000780021D1FE@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3562106207932146930=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=pQKW=RP=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1h3eGW-0001RL-PC
 for xen-devel@lists.xenproject.org; Tue, 12 Mar 2019 10:04:09 +0000
In-Reply-To: <5C863567020000780021D1FE@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

--===============3562106207932146930==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/drmSmmVHiulyLuRHPx40XkG"; protocol="application/pgp-signature"

--Sig_/drmSmmVHiulyLuRHPx40XkG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Mon, 11 Mar 2019 04:16:07 -0600
schrieb "Jan Beulich" <JBeulich@suse.com>:

> >>> On 08.03.19 at 20:20, <olaf@aepfle.de> wrote: =20
> > To reiterate the second paragraph: if a domU uses TSC as primary clock
> > source, it is expected that it runs NTP to cover for the resulting
> > drift. Therefore this change does no need a knob to turn it on or off. =
=20
>=20
> Did you omit a 't' or a 'w' above? Judging from the patch I think you
> mean "not", but I don't see how this follows, especially with your
> subsequent reply validly stating that such a requirement did not
> exist with the XenoLinux kernels. And please don't forget that
> Linux is not the only possible guest OS. What is or is not a
> requirement inside the guest depends not only on Xen's behavior,
> but also on the OS'es. Hence uniformly (and even by default)
> changing the behavior for everyone is imo not acceptable.

If I interpret the various docs, which are available online, correctly
there is always a recommendation to sync with an external clocksource,
IF the system clock has to be somewhat accurate.
For example the XenServer docs mentions that for Windows, PV and HVM.
If that external source is a pvclock driver, then it just means the
syncing has to be done by dom0. I have not verified it, but I think
NTP in dom0 will sync Xen, which in turn allows pvclock to sync domU.

The change exchanges one sort of inaccuracy with another. In other words,
it was broken before and will remain broken after migration/restore.

> > +#define VTSC_JITTER_RANGE_KHZ 200UL   /* Assumed jitter in cpu_khz */ =
=20
> I'm struggling to understand the comment: Surely not every single
> CPU surfaces a jitter of precisely 200kHz?

I think that variable describes something like 'range' or 'dispersion'
of measurement results, of something that can not be measured accurately.
So VTSC_MEASUREMENT_INACCURACY_RANGE_KHZ may work.

Olaf

--Sig_/drmSmmVHiulyLuRHPx40XkG
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCXIeEDwAKCRBdQqD6ppg2
fv+rAKC0i3pyN2q1hH/rpb3wnazg/utiwwCguJBmY73j5+GBzQ6HP2UsavbbbGo=
=j5R8
-----END PGP SIGNATURE-----

--Sig_/drmSmmVHiulyLuRHPx40XkG--


--===============3562106207932146930==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3562106207932146930==--
