From: Olaf Hering <olaf@aepfle.de>
Subject: Re: [PATCH v2] xen: avoid crash in disable_hotplug_cpu
Date: Thu, 6 Sep 2018 22:31:45 +0200
Message-ID: <20180906223145.37f7009b.olaf__48671.2118647576$1536265846$gmane$org@aepfle.de>
References: <20180906063712.28639-1-olaf@aepfle.de>
 <b7306d7f-e827-6556-e1bb-4b934a162e46@oracle.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============9102452813074348899=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=y5ed=lu=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1fy0we-0000BV-9I
 for xen-devel@lists.xenproject.org; Thu, 06 Sep 2018 20:32:04 +0000
In-Reply-To: <b7306d7f-e827-6556-e1bb-4b934a162e46@oracle.com>
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

--===============9102452813074348899==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/tskpqat.bDZCNZqA9o0sYsv"; protocol="application/pgp-signature"

--Sig_/tskpqat.bDZCNZqA9o0sYsv
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Thu, 6 Sep 2018 14:45:57 -0400
schrieb Boris Ostrovsky <boris.ostrovsky@oracle.com>:

> On 09/06/2018 02:37 AM, Olaf Hering wrote:
> > The command 'xl vcpu-set 0 0', issued in dom0, will crash dom0:

> > This happens because handle_vcpu_hotplug_event is called twice. In the
> > first iteration cpu_present is still true, in the second iteration
> > cpu_present is false which causes get_cpu_device to return NULL.
> > In case of cpu#0, cpu_online is apparently always true.

> I think we should check both this and num_online_cpus() !=3D 0.

This can not possibly help. cpu#0 is the first one that goes offline.
IF cpu0_hotpluggable is broken, then only "if (!cpu) return;" can help.

Olaf

--Sig_/tskpqat.bDZCNZqA9o0sYsv
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCW5GOsQAKCRBdQqD6ppg2
floXAKCrnwaC4KbLH/1h4SPHYTIFty1K1QCgqtpEYxNU7utPdsHHHNjNKGFbODU=
=6dXi
-----END PGP SIGNATURE-----

--Sig_/tskpqat.bDZCNZqA9o0sYsv--


--===============9102452813074348899==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============9102452813074348899==--
