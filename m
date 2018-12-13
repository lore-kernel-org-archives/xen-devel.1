From: Olaf Hering <olaf@aepfle.de>
Subject: Re: [PATCH v11] tolerate jitter in cpu_khz calculation
 to avoid TSC emulation
Date: Thu, 13 Dec 2018 10:04:42 +0100
Message-ID: <20181213100442.3510b91b.olaf@aepfle.de>
References: <20181212152056.20480-1-olaf@aepfle.de>
 <5C1139BD0200007800205934@prv1-mh.provo.novell.com>
 <20181213091845.54212b83.olaf@aepfle.de>
 <5C121C330200007800205BC8@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2316028937083701634=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=AwXq=OW=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1gXMvM-000879-NG
 for xen-devel@lists.xenproject.org; Thu, 13 Dec 2018 09:04:53 +0000
In-Reply-To: <5C121C330200007800205BC8@prv1-mh.provo.novell.com>
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

--===============2316028937083701634==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/Yw909u3LfUouAMMXdEtpQ3u"; protocol="application/pgp-signature"

--Sig_/Yw909u3LfUouAMMXdEtpQ3u
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Thu, 13 Dec 2018 01:45:39 -0700
schrieb "Jan Beulich" <JBeulich@suse.com>:

> >>> On 13.12.18 at 09:18, <olaf@aepfle.de> wrote: =20
> > Am Wed, 12 Dec 2018 09:39:25 -0700
> > schrieb "Jan Beulich" <JBeulich@suse.com>:
> >  =20
> >> >>> On 12.12.18 at 16:20, <olaf@aepfle.de> wrote:   =20
> >> > If a domU uses TSC as clocksoure it also must run NTP in some way to
> >> > avoid the potential drift what will most likely happen, independent =
of
> >> > any migration.   =20
> >> Which drift? While anyone's well advised to run NTP, a completely
> >> isolated set of systems may have no need to, if their interactions don=
't
> >> depend on exactly matching time. =20
> >=20
> > If these hosts do not sync time to some reference host, the advancing o=
f time
> > is undefined before and after my change. =20
>=20
> I'm lost. I simply don't understand what you're trying to tell me,
> or how your answer relates to my question.

Then please rephrase the question? I do not see how my path affects the
advancing of time in domUs running on isolated systems. If their hardware
clocks advance at the same speed, my patch will not affect it. And if they
do advance at a different speed, what can emulation do to help with "correc=
tness"?

Olaf

--Sig_/Yw909u3LfUouAMMXdEtpQ3u
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCXBIgqgAKCRBdQqD6ppg2
fqBkAKCAJzQt0IEZIynNd/PaDCkkrdiMkgCbBR0k0vDnjWbiY1mPRw8mIjnZhMQ=
=bQUu
-----END PGP SIGNATURE-----

--Sig_/Yw909u3LfUouAMMXdEtpQ3u--


--===============2316028937083701634==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2316028937083701634==--
