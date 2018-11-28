From: Joey Pabalinas <joeypabalinas@gmail.com>
Subject: Re: [PATCH] xen: xlate_mmu: add missing header to fix
 'W=1' warning
Date: Wed, 28 Nov 2018 07:38:40 -1000
Message-ID: <20181128173840.wdulfu75d3mwdd2i__44355.1845536151$1543470142$gmane$org@gmail.com>
References: <1543328607-10546-1-git-send-email-boddepalli.srikanth@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2741811124107174676=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ucsu=oh=gmail.com=joeypabalinas@srs-us1.protection.inumbo.net>)
 id 1gS3nR-0006jq-FP
 for xen-devel@lists.xenproject.org; Wed, 28 Nov 2018 17:38:45 +0000
Received: by mail-pl1-x632.google.com with SMTP id k8so7077565pls.11
 for <xen-devel@lists.xenproject.org>; Wed, 28 Nov 2018 09:38:44 -0800 (PST)
In-Reply-To: <1543328607-10546-1-git-send-email-boddepalli.srikanth@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Srikanth Boddepalli <boddepalli.srikanth@gmail.com>
Cc: jgross@suse.com, sstabellini@kernel.org, linux-kernel@vger.kernel.org, Joey Pabalinas <joeypabalinas@gmail.com>, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com
List-Id: xen-devel@lists.xenproject.org


--===============2741811124107174676==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ctfnzmxuhvk5aoiq"
Content-Disposition: inline


--ctfnzmxuhvk5aoiq
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 27, 2018 at 07:53:27PM +0530, Srikanth Boddepalli wrote:
> Add a missing header otherwise compiler warns about missed prototype:
>=20
> drivers/xen/xlate_mmu.c:183:5: warning: no previous prototype for 'xen_xl=
ate_unmap_gfn_range?' [-Wmissing-prototypes]
>   int xen_xlate_unmap_gfn_range(struct vm_area_struct *vma,
>       ^~~~~~~~~~~~~~~~~~~~~~~~~

Reviewed-by: Joey Pabalinas <joeypabalinas@gmail.com>

--=20
Cheers,
Joey Pabalinas

--ctfnzmxuhvk5aoiq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEENpTlWU2hUK/KMvHp2rGdfm9DtVIFAlv+0p8ACgkQ2rGdfm9D
tVIzGRAAm1uz+/E+KPd+YrX2tYdQn1FmmnwD1cOGubXDLjs1g/ongTN7MzEFgjta
GukfJQN/94bdqTwOmKQCouwk+s8AMa8wrUbVPYUKb4kwglnJon46msXrfvNjzIwm
/jpwWePXP6h+HGem90zaxAXI626bojLMI1PcyMrBockXs/qY8bj/8Y5HCfwbRgWI
6xaWmr/oMoaWaFDl2IcsfpiMEvOuAub9XRzVLJmG5n574dRaLDwEf3ozDEE+da+a
Rk6Ti+6Hy6RFz22LjwU2xrEP5yrnHl6rnNFX1/4XdDEcwuFPaDaNjrCmduWMVqjJ
+D6TjETS+IUrO/E9w3YcqpsCot/z05BODx8OI2d0PFlArK2MTXnG27NyrVkmCL8L
5F5ypIPocgG/2fWhPq7u8ImbxVocvZXoaIKzNoRf2HK80WlTbYpVdgXB/dljZAee
kNVnEh+5nXhp8+4F0ked7z32Tskqwe6CfOkdNYsv0UfnmlMHLdCYvcYynMtYdxIi
5lw8+qZA4h4Mzx+NmuE/gPHqEdDL2zm0CY3JnF1lncTtQunFvHOo6OPPixuFuON8
V83LoB+0PVVrM5FEWrMcL5YSl5Sa6nZcah/v2MZpRav1Rc9OoJpS2iaGDwAGnJD1
tzjtLM4peKZNjU1M2R0X3CrTZf8x/Ulpds9HiyAap3PU3xZNq0c=
=WeLl
-----END PGP SIGNATURE-----

--ctfnzmxuhvk5aoiq--


--===============2741811124107174676==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2741811124107174676==--
