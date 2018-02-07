From: Olaf Hering <olaf@aepfle.de>
Subject: Re: qemu-xen fails to build in staging
Date: Wed, 7 Feb 2018 11:13:22 +0100
Message-ID: <20180207111322.48639c54.olaf@aepfle.de>
References: <20180207081808.GA28102@aepfle.de>
 <5A7ADB7702000078001A5F4B@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0182584530179019217=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5A7ADB7702000078001A5F4B@prv-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

--===============0182584530179019217==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/NeyW3N+b25YHJ_adpAh_9cS"; protocol="application/pgp-signature"

--Sig_/NeyW3N+b25YHJ_adpAh_9cS
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Wed, 07 Feb 2018 02:56:55 -0700
schrieb "Jan Beulich" <JBeulich@suse.com>:

> I think I had seen this too, and only then I realized that now I need
> to set up the respective submodule in the qemu tree.

Yes, it looks like qemu has now submodules which are required for build. Ne=
ither configure nor 'git archive' does not take that into account, as a res=
ult the "checkout" is incomplete. Great...

/xen-staging $ find -name .git
./.git
./tools/firmware/seabios-dir-remote/.git
./tools/qemu-xen-traditional-dir-remote/.git
./tools/qemu-xen-dir-remote/.git
./tools/qemu-xen-dir-remote/capstone/.git
./tools/qemu-xen-dir-remote/dtc/.git
./tools/qemu-xen-dir-remote/ui/keycodemapdb/.git

Olaf

--Sig_/NeyW3N+b25YHJ_adpAh_9cS
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCWnrRQgAKCRBdQqD6ppg2
foArAKD159NfgguzC+h2NVAfjIZHB0OJ3ACgvvJAYaN1OFfkIAkoKc7ZRrQ2+N4=
=68Vm
-----END PGP SIGNATURE-----

--Sig_/NeyW3N+b25YHJ_adpAh_9cS--


--===============0182584530179019217==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0182584530179019217==--
