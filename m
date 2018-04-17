From: Olaf Hering <olaf@aepfle.de>
Subject: Re: [RFC PATCH 2/3] xen: Refactor migration
Date: Tue, 17 Apr 2018 10:06:27 +0200
Message-ID: <20180417100627.29acbec0.olaf@aepfle.de>
References: <20180411122518.26270-1-george.dunlap@citrix.com>
 <20180411122518.26270-3-george.dunlap@citrix.com>
 <b7df732fe16bd1fa91608837371a37cc2233f5ec.camel@suse.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8734337051666025673=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=amig=hg=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1f8LdQ-0005va-Dm
 for xen-devel@lists.xenproject.org; Tue, 17 Apr 2018 08:06:41 +0000
In-Reply-To: <b7df732fe16bd1fa91608837371a37cc2233f5ec.camel@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Dario Faggioli <dfaggioli@suse.com>
Cc: xen-devel@lists.xenproject.org, George Dunlap <george.dunlap@citrix.com>
List-Id: xen-devel@lists.xenproject.org

--===============8734337051666025673==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/R587UXRNLCXveqnk4veZ4nk"; protocol="application/pgp-signature"

--Sig_/R587UXRNLCXveqnk4veZ4nk
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Tue, 17 Apr 2018 09:20:33 +0200
schrieb Dario Faggioli <dfaggioli@suse.com>:

> And I guess we can add a 'Tested-by: Olaf Hering', as he actually did
> that, what do you say Olaf?

Yes, that is true. I have tested these three patches with staging.

Tested-by: Olaf Hering <olaf@aepfle.de>

Olaf

--Sig_/R587UXRNLCXveqnk4veZ4nk
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCWtWrAwAKCRBdQqD6ppg2
flfBAJ92XeNQWvxDGDJ8kzLJWCz4x9ohwACfdXA1ohHxgDLg+5edbYCt0SJmILg=
=M/MU
-----END PGP SIGNATURE-----

--Sig_/R587UXRNLCXveqnk4veZ4nk--


--===============8734337051666025673==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8734337051666025673==--
