From: Olaf Hering <olaf@aepfle.de>
Subject: Re: pvscsi is not supported by xl command
Date: Tue, 30 Jan 2018 09:51:07 +0100
Message-ID: <20180130095107.4ce8dfcd.olaf@aepfle.de>
References: <f784ecce-dc58-c841-5c00-8fc95f2017e2@oracle.com>
 <71831361-99bd-9ef8-218a-31db55d31f50@suse.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2029308853792544848=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=oldl=ez=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1egRdP-00070L-HZ
 for xen-devel@lists.xenproject.org; Tue, 30 Jan 2018 08:51:20 +0000
In-Reply-To: <71831361-99bd-9ef8-218a-31db55d31f50@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Dongli Zhang <dongli.zhang@oracle.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

--===============2029308853792544848==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/BpeO755AboGDzKZmOveiX=f"; protocol="application/pgp-signature"

--Sig_/BpeO755AboGDzKZmOveiX=f
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On 24/01/18 06:08, Dongli Zhang wrote:
> > Are scsi-attach/scsi-detach still on the roadmap and will be added to x=
l in the
> > future, or this is deprecated? =20

libxl never knew about pvscsi, so in this sense it is not depreciated.

The plan is still to upstream it one day. Unfortunately I developed my vari=
ant towards a dead-end, it handles migration poorly. Once I get the chance =
to revisit this part I will resubmit. Until then, a variant of the livxl.pv=
scsi.patch for 4.10 can be found here:
https://build.opensuse.org/package/show/Virtualization/xen

Olaf

--Sig_/BpeO755AboGDzKZmOveiX=f
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCWnAx+wAKCRBdQqD6ppg2
frebAJ9gBRelWLEMrQR2Xvt0Vs12+grRYACgvucimgpyvXPdhPTRAbYLtyFqVCc=
=dnrw
-----END PGP SIGNATURE-----

--Sig_/BpeO755AboGDzKZmOveiX=f--


--===============2029308853792544848==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2029308853792544848==--
