From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs work in the xen-tip tree
Date: Wed, 16 Jan 2019 08:06:20 +1100
Message-ID: <20190116080620.4c2c143f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/4IYe9d_Dvvr_jnwqXDMiwhV"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Juergen Gross <jgross@suse.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Xen Devel <Xen-devel@lists.xensource.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Wen Yang <wen.yang99@zte.com.cn>, Paul Gortmaker <paul.gortmaker@windriver.com>
List-Id: xen-devel@lists.xenproject.org

--Sig_/4IYe9d_Dvvr_jnwqXDMiwhV
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  786e1048e7f4 ("pvcalls-front: fix potential null dereference")

has a malformed Fixes tag:

  Fixes: 9f51c05dc41a ("pvcalls-front: Avoid get_free_pages(GFP_KERNEL)
  under spinlock")

It should not be split over 2 lines.

--=20
Cheers,
Stephen Rothwell

--Sig_/4IYe9d_Dvvr_jnwqXDMiwhV
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlw+S0wACgkQAVBC80lX
0GxqOwf/UnZo2vpgBTaU3aSs7Iv6kCTE67ggBAJ/mNpcWALc7y/C0aOYcbzKxgYu
0999RqxHy6nxkVlJiAsYtR0ctAF2JH2y8pY5TJB5w9mGlmlMW2dkRN40BE6h6IbD
gqXUYz+5t/C2hNrrx9C7pGeAk3larJztaQvoNG6wa8US90h6nFNe7Pgzr9rJn17j
18vw44Ai6sGNdVTgccT3BNUb9PdYAeqQ/TdYPvEdXHmuLQ1AjSa7zgE4Mlvj0ue3
IDZml9hyCyjcLbyIuXrCXVUJp5V5ZNv7byDpvT8tE2JBHf1qW9Ea1NAV+RRNgBsB
f5x2snqafEUTcUlBKRGH18Qha1zzjg==
=J/wc
-----END PGP SIGNATURE-----

--Sig_/4IYe9d_Dvvr_jnwqXDMiwhV--
