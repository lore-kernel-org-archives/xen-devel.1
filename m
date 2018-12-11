From: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [RFC 1/3] pvh: Add x86/HVM direct boot ABI header
 file
Date: Tue, 11 Dec 2018 14:01:24 +0000
Message-ID: <20181211140124.GA23460@stefanha-x1.localdomain>
References: <1544049446-6359-1-git-send-email-liam.merwick@oracle.com>
 <1544049446-6359-2-git-send-email-liam.merwick@oracle.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6005589342263656223=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6Yfv=OU=redhat.com=stefanha@srs-us1.protection.inumbo.net>)
 id 1gWibK-0001QT-Vb
 for xen-devel@lists.xenproject.org; Tue, 11 Dec 2018 14:01:31 +0000
In-Reply-To: <1544049446-6359-2-git-send-email-liam.merwick@oracle.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Liam Merwick <liam.merwick@oracle.com>
Cc: ehabkost@redhat.com, mst@redhat.com, maran.wilson@oracle.com, qemu-devel@nongnu.org, xen-devel@lists.xenproject.org, pbonzini@redhat.com, rth@twiddle.net, sgarzare@redhat.com
List-Id: xen-devel@lists.xenproject.org


--===============6005589342263656223==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LQksG6bCIzRHxTLp"
Content-Disposition: inline


--LQksG6bCIzRHxTLp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 05, 2018 at 10:37:24PM +0000, Liam Merwick wrote:
> From: Liam Merwick <Liam.Merwick@oracle.com>
>=20
> The x86/HVM direct boot ABI permits Qemu to be able to boot directly
> into the uncompressed Linux kernel binary without the need to run firmwar=
e.
>=20
> 	https://xenbits.xen.org/docs/unstable/misc/pvh.html
>=20
> This commit adds the header file that defines the start_info struct
> that needs to be populated in order to use this ABI.
>=20
> Signed-off-by: Maran Wilson <Maran.Wilson@oracle.com>
> Signed-off-by: Liam Merwick <Liam.Merwick@oracle.com>
> Reviewed-by: Konrad Rzeszutek Wilk <Konrad.Wilk@oracle.com>
> ---
>  include/hw/xen/start_info.h | 146 ++++++++++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 146 insertions(+)
>  create mode 100644 include/hw/xen/start_info.h

Does it make sense to bring in Linux
include/xen/interface/hvm/start_info.h via QEMU's
include/standard-headers/?

QEMU has a script in scripts/update-linux-header.sh for syncing Linux
headers into include/standard-headers/.  This makes it easy to keep
Linux header files up-to-date.  We basically treat files in
include/standard-headers/ as auto-generated.

If you define start_info.h yourself without using
include/standard-headers/, then it won't be synced with Linux.

--LQksG6bCIzRHxTLp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJcD8M0AAoJEJykq7OBq3PIOlMH/0Xf2zqEnnYKUyPXmya3wH6y
LNjfD5I10PacQClqAaM/ZMBEjX3GNd2fppFZXCdv6ELktHx0Ix5HFTDa0P/ABCMs
M3HT+tJ4J11rZwh1U0CZod7xbavQnoIMWJhQuPy367KsrscIRCEpoV3eO/4lu4gb
3vkl+t+4e2GCegs0CWLPCHfv+Qs084prHK/0BoURzQGNLB7il/O5g6FGG1LmZlse
gKkboRKnN/MiG6ct+Z1RQZhp16+u4s94MYGy+hgtSVI6Q5cNFYZ6UbzA8f5+FTFQ
rqOQZ+LHqMV2dZ/yRugRkjbvld1AGSPyp3AkiAkDdOC89TVSTSx91+2YQg2i1GQ=
=Wifw
-----END PGP SIGNATURE-----

--LQksG6bCIzRHxTLp--


--===============6005589342263656223==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6005589342263656223==--
