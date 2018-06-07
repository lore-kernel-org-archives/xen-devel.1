From: Olaf Hering <olaf@aepfle.de>
Subject: Re: [PATCH v9] new config option vtsc_tolerance_khz to
 avoid TSC emulation
Date: Thu, 7 Jun 2018 15:47:43 +0200
Message-ID: <20180607154743.0c8a808e.olaf@aepfle.de>
References: <20180607130829.18811-1-olaf@aepfle.de>
 <5B1933AE02000078001C91DA@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0285124461647402497=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5B1933AE02000078001C91DA@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Marek Marczykowski <marmarek@invisiblethingslab.com>, xen-devel@lists.xen.org, Julien Grall <julien.grall@arm.com>
List-Id: xen-devel@lists.xenproject.org

--===============0285124461647402497==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/Ntl2AX1.GAsBwtSOLqDIk0A"; protocol="application/pgp-signature"

--Sig_/Ntl2AX1.GAsBwtSOLqDIk0A
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Thu, 07 Jun 2018 07:31:26 -0600
schrieb "Jan Beulich" <JBeulich@suse.com>:

> Hmm, I find this description concerning. Is the field reliably zero when
> coming from older Xen, or is it not?

It depends on how old.
If the other sending side has write_tsc_info from 4.6+, then _res1 is zero.
If it is older, the XC_SAVE_ID_TSC_INFO is eventually not handled anymore.
At least I could not find the relevant code, even in staging-4.6.
But then, it is unlikely that migration from 4.5 to 4.6 did not work.

Also, in general the input comes from "remote". So it is untrusted.

Olaf

--Sig_/Ntl2AX1.GAsBwtSOLqDIk0A
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCWxk3fwAKCRBdQqD6ppg2
fs9pAKCGmJKEtpRtZOWiPZlmc2NP5j7Q1QCgiahF92nFXcGCHJv4mrwMLVBJDdA=
=o7Gd
-----END PGP SIGNATURE-----

--Sig_/Ntl2AX1.GAsBwtSOLqDIk0A--


--===============0285124461647402497==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0285124461647402497==--
