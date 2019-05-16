From: Olaf Hering <olaf@aepfle.de>
Subject: Re: [PATCH v1] hotplug/Linux: fix starting of xenstored
 with systemd
Date: Thu, 16 May 2019 08:53:43 +0200
Message-ID: <20190516085343.01250b3d.olaf@aepfle.de>
References: <20190515150632.16269-1-olaf@aepfle.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2358738765707162894=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ZPM6=TQ=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1hRAH8-0001Jw-KO
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 06:53:59 +0000
In-Reply-To: <20190515150632.16269-1-olaf@aepfle.de>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

--===============2358738765707162894==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/=q6ML=f/DlTio6ClyIvX0gA"; protocol="application/pgp-signature"

--Sig_/=q6ML=f/DlTio6ClyIvX0gA
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Wed, 15 May 2019 17:06:32 +0200
schrieb Olaf Hering <olaf@aepfle.de>:

> A followup change will remove the code which calls to sd_notify, they
> are not needed after the separation of Type=3Doneshot for domain and
> Type=3Dsimple for daemon.

This is not accurate. Type=3Dnotify has to be used because units that do
depend on xenstored must be started once it is ready to serve them.
The sd_notify exists exactly for this purpose, systemd can not assume
a daemon is ready right after exec().

I will rework this patch.

Olaf

--Sig_/=q6ML=f/DlTio6ClyIvX0gA
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCXN0I9wAKCRBdQqD6ppg2
fsR6AKCtg3B0eOqHNJZxsnL2BpuG4TMSkACgqE6+4FYOAHkUf71nMCry07/UF0A=
=2S9T
-----END PGP SIGNATURE-----

--Sig_/=q6ML=f/DlTio6ClyIvX0gA--


--===============2358738765707162894==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2358738765707162894==--
