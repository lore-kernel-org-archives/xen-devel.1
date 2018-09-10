From: Olaf Hering <olaf@aepfle.de>
Subject: Re: [PATCH v4] xen: avoid crash in disable_hotplug_cpu
Date: Mon, 10 Sep 2018 17:58:25 +0200
Message-ID: <20180910175825.683476d9.olaf__14498.4984225177$1536595081$gmane$org@aepfle.de>
References: <20180907143135.29608-1-olaf@aepfle.de>
 <4f623671-e1aa-1804-449c-a26b0c4b9ce9@oracle.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5025736265100205223=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=b1bd=ly=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1fzOaK-0007Jt-W1
 for xen-devel@lists.xenproject.org; Mon, 10 Sep 2018 15:58:45 +0000
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

--===============5025736265100205223==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/k.0Y+4kv1lXOeXrHWw+B8V0"; protocol="application/pgp-signature"

--Sig_/k.0Y+4kv1lXOeXrHWw+B8V0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Am Fri, 7 Sep 2018 12:56:37 -0400
schrieb Boris Ostrovsky <boris.ostrovsky@oracle.com>:

> I was hoping you'd respond to my question about warning.
>=20
> root@haswell> xl vcpu-set 3 0 =20
> and in the guest
>=20
> [root@vm-0238 ~]# [=C2=A0=C2=A0 32.866955] ------------[ cut here ]------=
------
> [=C2=A0=C2=A0 32.866963] spinlock on CPU0 exists on IRQ1!
> [=C2=A0=C2=A0 32.866984] WARNING: CPU: 0 PID: 14 at arch/x86/xen/spinlock=
.c:90
> xen_init_lock_cpu+0xbf/0xd0

This happens to work for me, on X5550. Please send your .config.

Olaf

--Sig_/k.0Y+4kv1lXOeXrHWw+B8V0
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCW5aUoQAKCRBdQqD6ppg2
fv4NAKDxmj1J4eiqtj+VLauAAw3K6V3DwQCcDaB3WRE4Rp47xUF8BAX+rr+o4Q4=
=Z+iq
-----END PGP SIGNATURE-----

--Sig_/k.0Y+4kv1lXOeXrHWw+B8V0--


--===============5025736265100205223==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5025736265100205223==--
