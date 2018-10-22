From: Konrad Rzeszutek Wilk <konrad@darnok.org>
Subject: [GIT PULL] (xen-swiotlb) stable/for-linus-4.20
Date: Mon, 22 Oct 2018 15:33:06 -0400
Message-ID: <20181022193304.GC20677__42792.6302225844$1540236715$gmane$org@dhcp-10-175-29-12.vpn.oracle.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6154926622998879675=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xen.org, linux-kernel@vger.kernel.org, torvalds@linux-foundation.org
Cc: joe.jin@oracle.com
List-Id: xen-devel@lists.xenproject.org


--===============6154926622998879675==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="aVD9QWMuhilNxW9f"
Content-Disposition: inline


--aVD9QWMuhilNxW9f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

Please git pull the following branch:

 git://git.kernel.org/pub/scm/linux/kernel/git/konrad/swiotlb.git stable/for-linus-4.20

which has one tiny fix for the Xen SWIOTLB mechanism that occasionally happened with
devices that didn't allocate size in power of two but rather some odd
sizes. We neglected to make the memory coherent leading to all kinds of fun crashes.

Thank you!

 drivers/xen/swiotlb-xen.c | 6 ++++++
 1 file changed, 6 insertions(+)

Joe Jin (1):
      xen-swiotlb: use actually allocated size on check physical continuous


--aVD9QWMuhilNxW9f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJbziXwAAoJEFKlDoTx2wm/3h0P/08jrW+pGUKUgQcj2iatRAQN
ch6VpHK1zY8xbsDYojvT2o9QOhOCS8ucoyDp3JeVtG8A/7G1Qw9KrBkF9cyahYDX
vNp4C9+BL2gAWxmvr/4K8PMdxe3JEA9lI4PvNlqPVzS1pMj/dildzMj11RWR4eFM
QGdGC/EVoqA9mQKAifEH/RYM28UchTzjVoxk9gPydm7ecaPM6dpC1a9g/RvrvtiN
ewcnO0esqScBoD0+RlU7Rt0iE2VgDMeLpx2gO8wF64qjUPIy88Y2tG8a0cLxjFjV
EIVPaDR/mgKcJgAxs4f09KPiVrcuYcNXyQEtUpv/G0I9kps+irwJJhdkuwNmYohb
Jb9JyG4Bb4NtoB8wWZs/fV+EAS0Oht/ogo62edU5/lMQHoL7JTdz2+9yO09E4tCF
ezuOUAkFrNVkUAHd1Z1Slw6CCNvIzsQXPMaTfSBzb/mfPHWu13xT39wSO0swdUWk
wogXX0Uy97b/EEUFlQRyy0vYPMZIB1OwGdTZGY22X1mCbZpsh+Eban0rTWmCAZqi
UHLK5Ba7KlxJaERpA3wfR6TLtdItByZY+OKjeBf/PK4xA49H1rzSCYXt9ApQyoQ0
Cioja2GaXyTjRPy33cRfqkGrh1qUE2RGNSVXkrzVnUJm4mWgZr95aJ2G6oeX6XZZ
owofkeKq2rWu8tazFvRD
=DCw6
-----END PGP SIGNATURE-----

--aVD9QWMuhilNxW9f--


--===============6154926622998879675==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6154926622998879675==--
