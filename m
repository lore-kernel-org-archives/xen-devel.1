From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH] libxl: allow libxl_domain_suspend to simply
 suspend a domain, without saving it
Date: Fri, 23 Feb 2018 21:03:26 +0100
Message-ID: <20180223200326.GI2023@mail-itl>
References: <20180208231404.3857-1-marmarek@invisiblethingslab.com>
 <20180223184757.5iwsch7sf4p5tvcg@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0049565659784265640=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180223184757.5iwsch7sf4p5tvcg@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Marcus of Wetware Labs <marcus@wetwa.re>, Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org


--===============0049565659784265640==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="QDd5rp1wjxlDmy9q"
Content-Disposition: inline


--QDd5rp1wjxlDmy9q
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 23, 2018 at 06:47:57PM +0000, Wei Liu wrote:
> On Fri, Feb 09, 2018 at 12:14:03AM +0100, Marek Marczykowski-G=C3=B3recki=
 wrote:
> > When fd=3D-1, no savefile will be written, but the domain will still be
> > suspended (but not destroyed). The main reason for this functionality is
> > to suspend the host while some domains are running, potentially holding
> > PCI devices. This will give a chance to a driver in such a domain to
> > properly suspend device.
> >=20
> > It would be better to have separate function for this, but in fact it
> > should be named libxl_domain_suspend, then the current one renamed to
> > libxl_domain_save. Since that would break API compatibility, keep it in
> > the same function.
> >=20
> > Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblething=
slab.com>
> > Signed-off-by: Marcus of Wetware Labs <marcus@wetwa.re>
>=20
> The basic idea seems sensible.
>=20
> Please add a comment to libxl.h to specify the new semantics.

Hmm, while I'm looking at it, maybe better idea would be to use flags
for that? I'd call it LIBXL_SUSPEND_SUSPEND, but it looks stupid, any
better idea?

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--QDd5rp1wjxlDmy9q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAlqQc6cACgkQ24/THMrX
1ywcBAf+OBuzAznpegjcHyELkC/Gq05ljw1HzYAQSER0xBXFI4mYpeoUAyncVx1o
FZrwdqjNo8PBIjeeWMoEAYNmSuv3GGsf9KwjiUFGlkW2P+TZBkkUVRT71KaokG0u
WFXRuuVXNf9lUrJtmxb5z4iJ5GbWLgwxj+vt5QJvDrVEcRNRlxvreqKkMgF0VCAi
hs8DKC8KU4oZFfIH2L4ZrJXy+vvYrHl7I83PNkejzCmGcpMahVBEsc5FdCFJJdIq
vi+pxwUZAznZ8D4dy3BZkpf2pu4XQiCi4/un5f5V6m07ZDusDrPONSDMNK4HTtC5
QAUKQPdukfdSFbPl9YDPxjTtW8nk4g==
=7Rjh
-----END PGP SIGNATURE-----

--QDd5rp1wjxlDmy9q--


--===============0049565659784265640==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0049565659784265640==--
