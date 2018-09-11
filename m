From: Olaf Hering <olaf@aepfle.de>
Subject: Re: [PATCH v4] xen: avoid crash in disable_hotplug_cpu
Date: Tue, 11 Sep 2018 09:52:58 +0200
Message-ID: <20180911095258.5ed9e9b7.olaf__42796.6649797328$1536652319$gmane$org@aepfle.de>
References: <20180907143135.29608-1-olaf@aepfle.de>
 <4f623671-e1aa-1804-449c-a26b0c4b9ce9@oracle.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7070636971738417274=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=lvjd=lz=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1fzdU3-0002dz-Ph
 for xen-devel@lists.xenproject.org; Tue, 11 Sep 2018 07:53:16 +0000
In-Reply-To: <4f623671-e1aa-1804-449c-a26b0c4b9ce9@oracle.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org, open list <linux-kernel@vger.kernel.org>
List-Id: xen-devel@lists.xenproject.org

--===============7070636971738417274==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/CPClJ/MMcjkzZUX9ZJc226I"; protocol="application/pgp-signature"

--Sig_/CPClJ/MMcjkzZUX9ZJc226I
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Am Fri, 7 Sep 2018 12:56:37 -0400
schrieb Boris Ostrovsky <boris.ostrovsky@oracle.com>:

> I was hoping you'd respond to my question about warning.

It looks like CONFIG_BOOTPARAM_HOTPLUG_CPU0=3Dy is the reason for the warni=
ng.
As J=C3=BCrgen suggested in another mail, Xen should probably disable hotpl=
ugging
for cpu#0 in the generic setup code. Then cpu_is_hotpluggable(cpu) would
do the right thing.

Do you want me to merge that extra change into this patch?

Olaf

--Sig_/CPClJ/MMcjkzZUX9ZJc226I
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCW5d0WgAKCRBdQqD6ppg2
flNNAKCxtgFIZPAviAgZkf3DXwrkLC/2EQCg751qjqAtbIv/pXtyiEZ23CD7CA8=
=J0Xp
-----END PGP SIGNATURE-----

--Sig_/CPClJ/MMcjkzZUX9ZJc226I--


--===============7070636971738417274==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7070636971738417274==--
