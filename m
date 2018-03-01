From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH 5/6] xen/domain: Call sched_destroy_domain()
 in the domain_create() error path
Date: Thu, 01 Mar 2018 14:25:57 +0100
Message-ID: <1519910757.9145.19.camel@suse.com>
References: <1519827268-18199-1-git-send-email-andrew.cooper3@citrix.com>
 <1519827268-18199-6-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2943530624678005741=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1519827268-18199-6-git-send-email-andrew.cooper3@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Jan Beulich <JBeulich@suse.com>, Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org


--===============2943530624678005741==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-Ubxgni+R7ejCcNp1n1Oz"


--=-Ubxgni+R7ejCcNp1n1Oz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2018-02-28 at 14:14 +0000, Andrew Cooper wrote:
> If domain_create() fails, complete_domain_destroy() doesn't get
> called,
> meaning that sched_destroy_domain() is missed.  In practice, this can
> only
> fail because of exceptional late_hwdom_init() issues at the moment.
>=20
> Make sched_destroy_domain() idempotent, and call it in the fail path.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>
Reviewed-by: Dario Faggioli <dfaggioli@suse.com>

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/
--=-Ubxgni+R7ejCcNp1n1Oz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlqX/2UACgkQFkJ4iaW4
c+5nuhAA5ZYlmG5MkqkkhfvZVEOo4Ez0DJtL2kGdgKicEcOgJJC5GqMVD0Twvuez
7me5hcp5+qL6IK6SWYDCXvyvNRsZZigSYrxzxxFnpKXNT3fVgKQy0oWZ8ZGVCNAn
Qab1HkGc0+f2sV+6yQaJ4zRIq3OD3JmNKjulgdAH6CxnB3LNSoF2LthNrxBLv66Z
N6j7d79RiypEycgPxa0U0SmAXe97G2W7+AYq6tU9dplOig4RyI5+GePG/P1JXDtc
cVjx3YiJoKwRm9yOzrjr5wL6zpmR868ZAFwTWNZrGSxi8qxq5UJrhOmyxBiJ5iTd
baCY3xXAzlqrknf1Esk2UT8hTiexJUI/t84yDK7RA18g5nuOe6CaVwMoz7/pH+7R
h1Fs0vEyUasbWMnVllug7/YybMhEw0g4YOVOiK1U3REh718uKs9i981l0d1lyQ1i
3pXyOpGt1JZNOiFQ7cNH1PpVouc14Ut8P0ISUI6v8sE8+al+QdsFyqTKXoYNvdsq
L1IkxIjMIbuMVAXpesV0LAHGvAJY4OIZt3DxHsmYYFSlrjZ3tvom/llnTD8BFoKD
mEY1HiMGT51DnU2KzkKcLTOje1QlUY7p1FVPbVof+nISN/DUwOgwPFxz7rrVYQz+
lpQc5eBSGn/GmEXEC7VxmL5qCn9pXKVgv5OS83H5nRqgl3uzLks=
=qBJg
-----END PGP SIGNATURE-----

--=-Ubxgni+R7ejCcNp1n1Oz--



--===============2943530624678005741==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2943530624678005741==--
