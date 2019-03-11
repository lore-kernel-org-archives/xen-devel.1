From: Olaf Hering <olaf@aepfle.de>
Subject: Re: [PATCH v12] tolerate jitter in cpu_khz calculation
 to avoid TSC emulation
Date: Mon, 11 Mar 2019 11:26:53 +0100
Message-ID: <20190311112653.0f9997b4.olaf@aepfle.de>
References: <20190308192059.24610-1-olaf@aepfle.de>
 <20190308202907.56f7609a.olaf@aepfle.de>
 <5C863226020000780021D1DB@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8915616584730552162=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=y/+I=RO=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1h3I98-0007X1-VY
 for xen-devel@lists.xenproject.org; Mon, 11 Mar 2019 10:27:03 +0000
In-Reply-To: <5C863226020000780021D1DB@prv1-mh.provo.novell.com>
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

--===============8915616584730552162==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/OJHxtF.oAm19=u_vP1g1STj"; protocol="application/pgp-signature"

--Sig_/OJHxtF.oAm19=u_vP1g1STj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Mon, 11 Mar 2019 04:02:14 -0600
schrieb "Jan Beulich" <JBeulich@suse.com>:

> > One interesting aspect is: the xenlinux based kernels report clocksourc=
e=3Dtsc, =20
> I don't think they do - iirc they are hardcoded to clocksource=3Dxen.

For HVM they do:

 # dmesg | grep -Ei '(clock|hz)'
[    0.000000] hpet clockevent registered
[    0.000000] tsc: Detected 2000.225 MHz processor
[    0.142074] smpboot: CPU0: Intel(R) Xeon(R) CPU           E5504  @ 2.00G=
Hz (fam: 06, model: 1a, stepping: 05)
[    0.322108] hpet0: 3 comparators, 64-bit 62.500000 MHz counter
[    0.324095] Switched to clocksource hpet
[    2.436321] tsc: Refined TSC clocksource calibration: 2000.084 MHz
[    3.437123] Switched to clocksource tsc

But PV shows just that:

 # dmesg | grep -Ei '(clock|hz)'
[    0.000000] Xen reported: 2000.084 MHz processor.
[    0.316671] Switched to clocksource xen

> > There was even that 'independent_wallclock' knob. Why is that? =20
> Why is what? Are you questioning the presence of the setting in
> the XenoLinux kernels, or its absence in the pv-ops ones?

I'm just curious why HVM uses tsc, but nothing states that using ntpd would=
 be a requirement.

However, a brief search suggests that reported "clock issues" are indeed so=
lved by running ntp in HVM.

Olaf

--Sig_/OJHxtF.oAm19=u_vP1g1STj
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCXIY37QAKCRBdQqD6ppg2
fhC1AKD4847zoYrBcZjMgWMhDXdnvSA0jACdH0i3HbwOw81IOuycWOAEJPtCuiY=
=TJIz
-----END PGP SIGNATURE-----

--Sig_/OJHxtF.oAm19=u_vP1g1STj--


--===============8915616584730552162==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8915616584730552162==--
