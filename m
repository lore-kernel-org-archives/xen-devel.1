From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [RFC PATCH 12/12] PM / hibernate: update the resume
 offset on SNAPSHOT_SET_SWAP_AREA
Date: Thu, 14 Jun 2018 21:45:15 +0200
Message-ID: <20180614194515.GE17808__19334.6169697636$1529005451$gmane$org@amd>
References: <20180612205619.28156-1-anchalag@amazon.com>
 <20180612205619.28156-13-anchalag@amazon.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2257589055555536601=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=9fo/=ja=ucw.cz=pavel@srs-us1.protection.inumbo.net>)
 id 1fTYBL-0000yn-KO
 for xen-devel@lists.xenproject.org; Thu, 14 Jun 2018 19:45:19 +0000
In-Reply-To: <20180612205619.28156-13-anchalag@amazon.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anchal Agarwal <anchalag@amazon.com>
Cc: jgross@suse.com, len.brown@intel.com, kamatam@amazon.com, eduval@amazon.com, vallish@amazon.com, netdev@vger.kernel.org, fllinden@amazon.com, x86@kernel.org, rjw@rjwysocki.net, linux-kernel@vger.kernel.org, guruanb@amazon.com, cyberax@amazon.com, mingo@redhat.com, hpa@zytor.com, linux-pm@vger.kernel.org, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com, tglx@linutronix.de, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org


--===============2257589055555536601==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5Mfx4RzfBqgnTE/w"
Content-Disposition: inline


--5Mfx4RzfBqgnTE/w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> From: Aleksei Besogonov <cyberax@amazon.com>
>=20
> The SNAPSHOT_SET_SWAP_AREA is supposed to be used to set the hibernation
> offset on a running kernel to enable hibernating to a swap file.
> However, it doesn't actually update the swsusp_resume_block variable. As
> a result, the hibernation fails at the last step (after all the data is
> written out) in the validation of the swap signature in
> mark_swapfiles().
>=20
> Before this patch, the command line processing was the only place where
> swsusp_resume_block was set.

Are you saying that suspend-to-file was broken, even on
non-virtualized systems?

If so, we may this to go in first...
								Pavel
							=09
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--5Mfx4RzfBqgnTE/w
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlsixcsACgkQMOfwapXb+vLC3wCfX4tTCT4FWhC5Eamk0GflW7HU
XwQAoJSlWbWAf4T9Kkoe+rMuMl+uDnkz
=yswn
-----END PGP SIGNATURE-----

--5Mfx4RzfBqgnTE/w--


--===============2257589055555536601==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2257589055555536601==--
