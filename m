From: Olaf Hering <olaf@aepfle.de>
Subject: Re: [PATCH v3] xen: avoid crash in disable_hotplug_cpu
Date: Fri, 7 Sep 2018 11:24:51 +0200
Message-ID: <20180907112451.442b46fe.olaf__16859.5114061192$1536312240$gmane$org@aepfle.de>
References: <20180907063023.16913-1-olaf@aepfle.de>
 <c26bfbe1-9032-468c-d4d0-c05eda8af762@suse.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8020498207384561115=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=fjkp=lv=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1fyD0o-0000PN-EX
 for xen-devel@lists.xenproject.org; Fri, 07 Sep 2018 09:25:10 +0000
In-Reply-To: <c26bfbe1-9032-468c-d4d0-c05eda8af762@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, open list <linux-kernel@vger.kernel.org>
List-Id: xen-devel@lists.xenproject.org

--===============8020498207384561115==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/UeViPe4cDLalinr9AGThlP2"; protocol="application/pgp-signature"

--Sig_/UeViPe4cDLalinr9AGThlP2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Fri, 7 Sep 2018 09:48:28 +0200
schrieb Juergen Gross <jgross@suse.com>:

> On 07/09/18 08:30, Olaf Hering wrote:
> > +	if (cpu_online(cpu))
> > +		return;
> >  	if (cpu_present(cpu))
> >  		xen_arch_unregister_cpu(cpu); =20

> Could you merge the two if conditions?
> if (!cpu_online(cpu) && cpu_present(cpu))
> 	xen_arch_unregister_cpu(cpu);

Is that any different, beside being wrong, from what the patch actually doe=
s?
It would still clear the present bit later on.

Olaf

--Sig_/UeViPe4cDLalinr9AGThlP2
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCW5JD4wAKCRBdQqD6ppg2
fgKUAJ9qUyfX87dZMcfGNMva1zc/zA/GxgCfTLOAZ5oxZ3BAHwMQr9339Cupsd0=
=hFzS
-----END PGP SIGNATURE-----

--Sig_/UeViPe4cDLalinr9AGThlP2--


--===============8020498207384561115==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8020498207384561115==--
