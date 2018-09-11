From: Olaf Hering <olaf@aepfle.de>
Subject: Re: [PATCH v4] xen: avoid crash in disable_hotplug_cpu
Date: Tue, 11 Sep 2018 12:48:08 +0200
Message-ID: <20180911124808.18dfe8bf.olaf__47362.8799933524$1536662822$gmane$org@aepfle.de>
References: <20180907143135.29608-1-olaf@aepfle.de>
 <4f623671-e1aa-1804-449c-a26b0c4b9ce9@oracle.com>
 <20180911095258.5ed9e9b7.olaf@aepfle.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0910630454025761449=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=lvjd=lz=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1fzgDV-0007p0-Nm
 for xen-devel@lists.xenproject.org; Tue, 11 Sep 2018 10:48:22 +0000
In-Reply-To: <20180911095258.5ed9e9b7.olaf@aepfle.de>
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

--===============0910630454025761449==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/Sfd2.ijTAWqtljGsgLZh_Oj"; protocol="application/pgp-signature"

--Sig_/Sfd2.ijTAWqtljGsgLZh_Oj
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Am Tue, 11 Sep 2018 09:52:58 +0200
schrieb Olaf Hering <olaf@aepfle.de>:

> As J=C3=BCrgen suggested in another mail, Xen should probably disable hot=
plugging
> for cpu#0 in the generic setup code. Then cpu_is_hotpluggable(cpu) would
> do the right thing.

The relevant code is all private to arch/x86/kernel/topology.c.
There is no way to set .hotpluggable prior to register_cpu.
I guess you need to work that out with the x86 maintainers.

Olaf

--Sig_/Sfd2.ijTAWqtljGsgLZh_Oj
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCW5edaAAKCRBdQqD6ppg2
fjWwAKCrFv/vHuKzbfIPZpQl9g2/TGaUigCg5UQ5+KRUfGnXJOUk7MH2kT2H6uo=
=QfE0
-----END PGP SIGNATURE-----

--Sig_/Sfd2.ijTAWqtljGsgLZh_Oj--


--===============0910630454025761449==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0910630454025761449==--
